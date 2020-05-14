from google.oauth2 import service_account
from google.cloud import firestore
import os
import sys
import json

def getUserItems(db, uid, map):
    user_items = db.collection('users').document(uid).get().to_dict()['itemsCaught']

    user_ids = []

    for item in user_items:
        user_ids.append(map[item])

    return user_ids

def getSqlInsert(uid, items):
    items = list(set(items))
    insertStr = "INSERT INTO public.collected_items(\n\tuser_id, collectable_id) VALUES"

    for item in items:
        insertStr += f"\n\t('{uid}', {item}),"

    insertStr = insertStr[:-1]
    insertStr += ";"

    print(insertStr)

if len(sys.argv) < 2:
    print("Must Pass keyfile as parameter")
    exit(1)

data = {}

with open("items", 'r') as fp:
    for line in fp.readlines():
        id_str, name = line.strip().split(',')

        name = name.strip()
        item_id = int(id_str)

        data[name] = item_id

jsonFile = sys.argv[1]

creds = service_account.Credentials.from_service_account_file(
    jsonFile,
    scopes=["https://www.googleapis.com/auth/cloud-platform"])

db = firestore.Client(credentials=creds, project=creds.project_id)
