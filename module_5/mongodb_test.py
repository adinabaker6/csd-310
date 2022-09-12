import pymongo
from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.vjitute.mongodb.net/pytech"
client = MongoClient(url)
db = client.pytech

heading = "--Pytech Collection List--"
print(heading)
print(db.list_collection_names())

input("End of program. Press any key to exit...")
