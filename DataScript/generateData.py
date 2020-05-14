from bs4 import BeautifulSoup as BS
from urllib.parse import urlparse
from PIL import Image
import requests
import pathlib
import os
import re
import math
import urllib3
import json

# Links
artLink    = "https://nookipedia.com/wiki/Art"
bugLink  = "https://animalcrossing.fandom.com/wiki/Bugs_(New_Horizons)"
fishLink = "https://animalcrossing.fandom.com/wiki/Fish_(New_Horizons)"
fossilLink    = "https://animalcrossing.fandom.com/wiki/Fossils_(New_Horizons)"


# Set Up Output
basePath = pathlib.Path(__file__).parent.absolute()

artPath    = "Images/Artwork"
bugPath    = "Images/Bugs"
fishPath   = "Images/Fishes"
fossilPath = "Images/Fossils"

pathlib.Path(os.path.join(basePath, "Results", artPath)).mkdir(parents=True, exist_ok=True)
pathlib.Path(os.path.join(basePath, "Results", bugPath)).mkdir(parents=True, exist_ok=True)
pathlib.Path(os.path.join(basePath, "Results", fishPath)).mkdir(parents=True, exist_ok=True)
pathlib.Path(os.path.join(basePath, "Results", fossilPath)).mkdir(parents=True, exist_ok=True)


def createTimeBitMask(timeRanges):
    mask = 0

    processedTimeRanges = []

    for timeRange in timeRanges:
        #It's all day so just return 24 high bits
        if timeRange.lower() == 'all day':
            return int(0xFFFFFF)

        start, end = timeRange.split('-')

        startHour = re.findall(r'\d+', start)[0]
        endHour   = re.findall(r'\d+', end)[0]

        startPM = re.findall(r'(am|pm)', start.lower())[0] == 'pm'
        endPM   = re.findall(r'(am|pm)', end.lower())[0] == 'pm'

        start = int(startHour) + (12 if startPM else 0)
        end   = int(endHour) + (12 if endPM else 0)

        # we assume that this is a wrap around and not someone messing up
        if end < start:
            processedTimeRanges.append((start, 23))
            processedTimeRanges.append((0, end))
        else:
            processedTimeRanges.append((start, end))

    for start, end in processedTimeRanges:
        currentMask = int(math.pow(2, end-start+1)) - 1
        currentMask = currentMask << 23 - end

        mask = mask | currentMask

    return mask

def createMonthBitMask(monthList):
    if len(monthList) != 12:
        raise Exception(f"A Year has 12 months not {len(monthList)}")

    mask = 0
    for month in monthList:
        mask = mask << 1
        mask += 0 if month == '-' else 1

    return mask

def downloadImage(link, outputFile):
    http = urllib3.PoolManager()
    r = http.request('GET', link, preload_content=False)

    with open(outputFile, 'wb') as out:
        while True:
            data = r.read(2**16)
            if not data:
                break
            out.write(data)

    r.release_conn()

def getFandomList(link):
    r = requests.get(link)
    parser = BS(r.text, "html.parser")

    table = parser.find("table", class_="sortable")

    rows = table.find_all("tr")
    data = []
    for row in rows:
        cols = row.find_all('td')
        if not cols:
            continue #First tr is a header

        imgLink = cols[1].find("img")["data-src"]
        cols = [ele.text.strip() for ele in cols]
        cols[1] = imgLink[:imgLink.find('/revision')]
        data.append(cols)
    
    return data

def getFandomSouthList(link):
    r = requests.get(link)
    parser = BS(r.text, "html.parser")

    table = parser.find("div", {"title": "Southern Hemisphere"}).find("table", class_="sortable")

    rows = table.find_all("tr")
    data = []
    for row in rows:
        cols = row.find_all('td')
        if not cols:
            continue #First tr is a header

        imgLink = cols[1].find("img")["data-src"]
        cols = [ele.text.strip() for ele in cols]
        cols[1] = imgLink[:imgLink.find('/revision')]
        data.append(cols)
    
    return data

def getNookpediaList(link):
    r = requests.get(link)
    parser = BS(r.text, "html.parser")

    table = parser.find("table", class_="sortable")
    table_body = table.find('tbody')

    rows = table_body.find_all('tr')
    data = []
    for row in rows:
        cols = row.find_all('td')
        if not cols:
            continue #First tr is a header

        #This is sketchy but might just work
        imgSrc = cols[2].find("img")["src"]
        imgSrc = imgSrc[:imgSrc.find("/64px")]
        imgSrc = imgSrc.replace("thumb/", "")
        imgLink = f"https://nookipedia.com/{imgSrc}"

        cols = [ele.text.strip() for ele in cols]
        cols[2] = imgLink
        data.append(cols)
    
    return data

def getMonthRanges(mask, monthToStart):
    ranges = []
    active = False
    curStart = -1
    for i in range(0, 12):
        month = (monthToStart + i) % 12

        prevMonth = (monthToStart + i - 1)
        if prevMonth < 0:
            prevMonth += 12

        bit = 1 << (11 - month)
        
        # This month is off but prev month was on so end the current streak
        if not mask & bit and active:
            ranges.append((curStart, prevMonth))
            active = False
        # This month is on but previous month was off so start a streak
        elif mask & bit and not active:
            curStart = month
            active = True

    if active:
        prevMonth = (monthToStart - 1)
        if prevMonth < 0:
            prevMonth += 12
        ranges.append((curStart, prevMonth))

    return ranges
def getMonthStr(mask):
    monthMap = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
    for i in range(0, 12):
        bit = 1 << (11 - i)

        #This bit isn't set so start searching here
        if not mask & bit:
            ranges = getMonthRanges(mask, i)

            monthStr = ""
            for start, end in ranges:
                if start == end:
                    monthStr += f"& {monthMap[start]} "
                else:
                    monthStr += f"& {monthMap[start]} - {monthMap[end]} "

            return monthStr[1:].strip()

    return "All year"


### Fish ###
class Fish:
    def __init__(self, northData, southData):
        self.name = northData[0]
        self.imgLocation = os.path.join(fishPath, f"{self.name}.png")
        self.price = northData[2]
        self.location = northData[3]
        self.shadowSize = northData[4]
        self.timeLabel = northData[5]
        self.timeMask = createTimeBitMask(northData[5].split('&'))
        self.northMonths = createMonthBitMask(northData[6:])
        self.southMonths = createMonthBitMask(southData[6:])
        self.northMonthLabel = getMonthStr(self.northMonths)
        self.southMonthLabel = getMonthStr(self.southMonths)

        downloadImage(northData[1], os.path.join(basePath, "Results", fishPath, f"{self.name}.png"))


northFish = getFandomList(fishLink)
southFish = getFandomSouthList(fishLink)

fishList = []

print("Retrieved Fish.")

for nFish, sFish in zip(northFish, southFish):
    fishList.append(Fish(nFish, sFish))

print("Parsed Fish")


### Bugs ###
class Bug:
    def __init__(self, northData, southData):
        self.name = northData[0]
        self.imgLocation = os.path.join(bugPath, f"{self.name}.png")
        self.price = northData[2]
        self.location = northData[3]
        self.timeLabel = northData[4]
        self.timeMask = createTimeBitMask(northData[4].split('&'))
        self.northMonths = createMonthBitMask(northData[5:])
        self.southMonths = createMonthBitMask(southData[5:])
        self.northMonthLabel = getMonthStr(self.northMonths)
        self.southMonthLabel = getMonthStr(self.southMonths)

        downloadImage(northData[1], os.path.join(basePath, "Results", bugPath, f"{self.name}.png"))

northBugs = getFandomList(bugLink)
southbugs = getFandomSouthList(bugLink)

bugList = []

print("Retrived Bugs")

for nBug, sBug in zip(northBugs, southbugs):
    bugList.append(Bug(nBug, sBug))

print("Parsed Bugs")

### Fossils ###
class Fossil:
    def __init__(self, data):
        self.name = data[0]
        self.imgLocation = os.path.join(fossilPath, f"{self.name}.png")
        self.price = data[2].replace("Bells", "")

        downloadImage(data[1], os.path.join(basePath, "Results", fossilPath, f"{self.name}.png"))

def uri_validator(x):
    try:
        result = urlparse(x)
        return all([result.scheme, result.netloc, result.path])
    except:
        return False

def getFandomFossilList(link):
    r = requests.get(link)
    parser = BS(r.text, "html.parser")

    tables = parser.find_all("table", class_="sortable")

    data = []
    for table in tables:
        rows = table.find_all("tr")
        for row in rows:
            cols = row.find_all('td')
            if not cols:
                continue #First tr is a header

            imgLink = cols[1].find("img")["src"]
            if not uri_validator(imgLink): #Sometimes the links in src. sometimes it's in data-src...
                imgLink = cols[1].find("img")["data-src"]
            cols = [ele.text.strip() for ele in cols]
            cols[1] = imgLink[:imgLink.find('/revision')]
            data.append(cols)
    
    return data

fossils = getFandomFossilList(fossilLink)

fossilList = []

print("Retrived Fossils")

for fossil in fossils:
    fossilList.append(Fossil(fossil))

print("Parsed Fossils")

### Art ###
class Art:
    def __init__(self, data, isPainting):
        self.name = data[0][0]
        self.originalPiece = data[1]
        self.artist = data[2]
        self.price = data[3]
        self.value = data[4]
        self.width = data[0][2]

        imgName = self.name
        fullSize = self.name

        if isPainting:
            imgName += ".jpg"
            fullSize += ".fullsize.jpg"

            self.imgLocationAlt = os.path.join(artPath, fullSize)
            downloadLocation = os.path.join(basePath, "Results", artPath, fullSize)
            downloadImage(data[0][1], downloadLocation)

            self.imgLocation = os.path.join(artPath, imgName)
            image = Image.open(downloadLocation)
            image.thumbnail((150, 160))
            image.save(os.path.join(basePath, "Results", artPath, imgName))
        else:
            imgName += ".png"
            fullSize += ".png"

            self.imgLocation = os.path.join(artPath, imgName)
            downloadLocation = os.path.join(basePath, "Results", artPath, imgName)
            downloadImage(data[0][1], downloadLocation)

def parseArtTable(table):
    table_body = table.find('tbody')
    rows = table_body.find_all('tr')

    data = []
    for row in rows:
        cols = row.find_all('td')
        if not cols:
            continue #First tr is a header

        #This is sketchy but might just work
        imgSrc = cols[0].find("img")["src"]
        width = 0
        if "thumb" in imgSrc:
            indx = imgSrc.find("/80px")
            width = 100
            if indx == -1:
                width = 80
                indx = imgSrc.find("/60px")
            if indx == -1:
                raise Exception(f"Don't recognize img src format '{imgSrc}'")
            imgSrc = imgSrc[:indx]
            imgSrc = imgSrc.replace("thumb/", "")
        imgLink = f"https://nookipedia.com/{imgSrc}"

        cols = [ele.text.strip() for ele in cols]
        cols[0] = (cols[0], imgLink, width)
        data.append(cols)

    return data


artList = []

r = requests.get(artLink)
parser = BS(r.text, "html.parser")

artTable = parser.find(id="List_of_Paintings_in_New_Horizons").parent.findNext("table")
sculptureTable = parser.find(id="List_of_Sculptures_in_New_Horizons").parent.findNext("table")

artData = parseArtTable(artTable)
sculpData = parseArtTable(sculptureTable)

print("Retrived Art")

for art in artData:
    artList.append(Art(art, True))

for sculp in sculpData:
    artList.append(Art(sculp, False))

print("Parsed Art")

importData = {
    "Art": artList,
    "Bugs": bugList,
    "Fish": fishList,
    "Fossils": fossilList
}

def serialize(obj):
    return obj.__dict__

with open(os.path.join(basePath, "Results", "data.json"), 'w') as fp:
    json.dump(importData, fp, default=serialize)