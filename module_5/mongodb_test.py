from pymongo import MongoClient

url = 'mongodb+srv://admin:admin@cluster0.vjitute.mongodb.net/pytech'

client = MongoClient(url)

db = client.pytech

print(db.list_collection_names)

input("End of program, press any key to exit...")

