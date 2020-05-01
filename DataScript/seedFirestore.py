from google.oauth2 import service_account
from google.cloud import firestore
import os
import sys
import json

if len(sys.argv) < 2:
    print("Must Pass keyfile as parameter")
    exit(1)

jsonFile = sys.argv[1]

creds = service_account.Credentials.from_service_account_file(
    jsonFile,
    scopes=["https://www.googleapis.com/auth/cloud-platform"])

db = firestore.Client(credentials=creds, project=creds.project_id)

with open('./Results/data.json', 'r') as fp:
    jsonData = json.load(fp)


for art in jsonData['Art']:
    doc = db.collection('art').document(art['name'])
    try:
        price = int(art["price"])
    except:
        price = 0

    doc.set({
        "name": art["name"],
        "imgLocation": art["imgLocation"],
        "original": art["originalPiece"],
        "artist": art["artist"],
        "price": price,
        "isPainting": art["isPainting"],
        "width": art["width"]
    })

for bug in jsonData['Bugs']:
    doc = db.collection('bugs').document(bug['name'])
    try:
        price = int(bug["price"])
    except:
        price = 0

    doc.set({
        "name": bug["name"],
        "imgLocation": bug["imgLocation"],
        "price": price,
        "location": bug["location"],
        "timeLabel": bug["timeLabel"],
        "timeMask": int(bug["timeMask"]),
        "northMonths": int(bug["northMonths"]),
        "southMonths": int(bug["southMonths"])
    })

for fish in jsonData['Fish']:
    doc = db.collection('fish').document(fish['name'])
    try:
        price = int(fish["price"])
    except:
        price = 0

    doc.set({
        "name": fish["name"],
        "imgLocation": fish["imgLocation"],
        "price": price,
        "location": fish["location"],
        "shadowSize": fish["shadowSize"],
        "timeLabel": fish["timeLabel"],
        "timeMask": int(fish["timeMask"]),
        "northMonths": int(fish["northMonths"]),
        "southMonths": int(fish["southMonths"])
    })

for fossil in jsonData['Fossils']:
    doc = db.collection('fossils').document(fossil['name'])

    try:
        price = int(fossil["price"].replace(',',''))
    except:
        price = 0

    doc.set({
        "name": fossil["name"],
        "imgLocation": fossil["imgLocation"],
        "price": price
    })