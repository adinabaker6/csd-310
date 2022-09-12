import pymongo
from pymongo import MongoClient

url="mongodb+srv://admin:admin@cluster0.vjitute.mongodb.net/pytech"
client = MongoClient(url)
db = client.pytech
pytech = db["PyTech"]

records = [
    {
        "student_id": "1007",
        "first_name": "Alex",
        "last_name": "Marcus"
    },
    {
        "student_id": "1008",
        "first_name": "Seth",
        "last_name": "Golding"
    },
    {
        "student_id": "1009",
        "first_name": "Eli",
        "last_name": "Miller"
    }
]

for record in records:
    new_student_Id = pytech.insert_one(record).inserted_id
    print(new_student_Id)

docs = pytech.find()

for doc in docs:
    print(doc)

print(pytech.find_one({"student_id": "1008"}))

input('End of program, press any key to exit...')
