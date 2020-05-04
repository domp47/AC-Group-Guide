import json

ART_TYPE    = 1
BUG_TYPE    = 2
FISH_TYPE   = 3
FOSSIL_TYPE = 4


def insert(tableName, columnNames, valueNames):
    columns = ', '.join('"{0}"'.format(w) for w in columnNames)
    output = f"INSERT INTO \"{tableName}\" ({columns})\n    "
    output+= f"VALUES ({', '.join(valueNames)});"

    print(output, end="\n\n")


# Seed Roles
print("/** Seeding User Roles  **/")
insert("acRoles", ["id", "label"], ["1", "'User'"])
insert("acRoles", ["id", "label"], ["2", "'Admin'"])

# Seed Types
print("\n/** Seeding Collectable Types  **/")
insert("collectableTypes", ["id", "type"], ["1", "'Art'"])
insert("collectableTypes", ["id", "type"], ["2", "'Bug'"])
insert("collectableTypes", ["id", "type"], ["3", "'Fish'"])
insert("collectableTypes", ["id", "type"], ["4", "'Fossil'"])


with open('./Results/data.json', 'r') as fp:
    # Need to escape any single quotes in the data
    dataStr = fp.read()
    dataStr = dataStr.replace("'", "''")
    jsonData = json.loads(dataStr)

print("\n/** Seeding Artwork  **/")
for art in jsonData['Art']:
    try:
        price = int(art["price"])
    except:
        price = 0

    columns = ["displayName", "imgLocation", "typeId", "price", "original", "artist"]
    data = [f"'{art['name']}'", f"'{art['imgLocation']}'", f"{ART_TYPE}", f"{price}", f"'{art['originalPiece']}'", f"'{art['artist']}'"]

    if "imgLocationAlt" in art:
        columns.append("imgLocationAlt")
        data.append(f"'{art['imgLocationAlt']}'")

    insert("collectables", columns, data)


print("\n/** Seeding Bugs  **/")
for bug in jsonData['Bugs']:
    try:
        price = int(bug["price"])
    except:
        price = 0

    columns = ["displayName", "imgLocation", "typeId", "price", "spawnLocation", "timeLabel", "timeMask", "northMask", "southMask", "northLabel", "southLabel"]
    data = [f"'{bug['name']}'", f"'{bug['imgLocation']}'", f"{BUG_TYPE}", f"{price}", f"'{bug['location']}'", f"'{bug['timeLabel']}'", f"{int(bug['timeMask'])}", f"{int(bug['northMonths'])}", f"{int(bug['southMonths'])}", f"'{bug['northMonthLabel']}'", f"'{bug['southMonthLabel']}'"]

    insert("collectables", columns, data)


print("\n/** Seeding Fish  **/")
for fish in jsonData['Fish']:
    try:
        price = int(fish["price"])
    except:
        price = 0

    columns = ["displayName", "imgLocation", "typeId", "price", "shadowSize", "spawnLocation", "timeLabel", "timeMask", "northMask", "southMask", "northLabel", "southLabel"]
    data = [f"'{fish['name']}'", f"'{fish['imgLocation']}'", f"{FISH_TYPE}", f"{price}", f"'{fish['shadowSize']}'", f"'{fish['location']}'", f"'{fish['timeLabel']}'", f"{int(fish['timeMask'])}", f"{int(fish['northMonths'])}", f"{int(fish['southMonths'])}", f"'{fish['northMonthLabel']}'", f"'{fish['southMonthLabel']}'"]

    insert("collectables", columns, data)


print("\n/** Seeding Fossils  **/")
for fossil in jsonData['Fossils']:
    try:
        price = int(fossil["price"].replace(',',''))
    except:
        price = 0

    columns = ["displayName", "imgLocation", "typeId", "price"]
    data = [f"'{fossil['name']}'", f"'{fossil['imgLocation']}'", f"{FOSSIL_TYPE}", f"{price}"]

    insert("collectables", columns, data)