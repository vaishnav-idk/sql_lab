import pymongo
from pymongo import MongoClient
client = pymongo.MongoClient('mongodb://localhost:27017/')

# Access database
mydb = client['college']

# Access collection of the database
mycollection=mydb['studlist']

print("********Female students********")
for i in mycollection.find({"gender":"female"}):
    print("Name: ",i["name"]["fname"],i["name"]["lname"])
    print("Mark: ",i["mark"],"\n")



print("********Male students with A+********")
for i in mycollection.find({"gender":"male" , "grade":"A+"}):
    print("Name: ",i["name"]["fname"],i["name"]["lname"])
    print("Address: ",i["address"]["house_name"],i["address"]["city"])
    print("Gender: ",i["gender"])
    print("Course: ",i["course"])
    print("Mark: ",i["mark"])
    print("Grade: ",i["grade"])
    print("Phone: ",i["phone"]["no"],"\n")

# print("********Topper********")
# mark=0
# for i in mycollection.find({}):
# 	if (i["mark"]>mark):
# 		mark = i["mark"]
# 		j=i

# print(j)

print("********Topper in MCA********")
for i in mycollection.find({'course':'MCA'}).sort('mark',-1).limit(1):
    print("Name: ",i["name"]["fname"],i["name"]["lname"])
    print("Address: ",i["address"]["house_name"],i["address"]["city"])
    print("Gender: ",i["gender"])
    print("Mark: ",i["mark"])
    print("Grade: ",i["grade"])
    print("Phone: ",i["phone"]["no"],"\n")

print("********Top 3 performers in Mechanical********")    
for i in mycollection.find({'course':'Mechanical'}).sort('mark',-1).limit(3):
    print("Name: ",i["name"]["fname"],i["name"]["lname"])
    print("Address: ",i["address"]["house_name"],i["address"]["city"])
    print("Gender: ",i["gender"])
    print("Mark: ",i["mark"])
    print("Grade: ",i["grade"])
    print("Phone: ",i["phone"]["no"],"\n")

print("********Female students with grade above 90********")    
for i in mycollection.find({"gender":"female"}):
    if (i["mark"]>90):
            print("Name: ",i["name"]["fname"],i["name"]["lname"])
            print("Mark: ",i["mark"])
            print("Grade: ",i["grade"])
            print("Phone: ",i["phone"]["no"],"\n")  

print("********Students with grade between 80 and 90********")    
for i in mycollection.find({}):
    if (i["mark"]<90 and i["mark"]>80):
            print("Name: ",i["name"]["fname"],i["name"]["lname"])
            print("Address: ",i["address"]["house_name"],i["address"]["city"])
            print("Gender: ",i["gender"])
            print("Mark: ",i["mark"])
            print("Grade: ",i["grade"])
            print("Phone: ",i["phone"]["no"],"\n")
            

print("********Students Whose name starts with V********")
for i in mycollection.find({}):
    if(i['name']['fname']).startswith("V"):
                print("Name: ",i["name"]["fname"],i["name"]["lname"])
                print("Address: ",i["address"]["house_name"],i["address"]["city"])
                print("Gender: ",i["gender"])
                print("Course: ",i["course"])
                print("Mark: ",i["mark"])
                print("Grade: ",i["grade"])
                print("Phone: ",i["phone"]["no"],"\n")
                

print("********Students from Kollam********")
for i in mycollection.find({}):
    if(i['address']['city']) == "Kollam":
                print("Name: ",i["name"]["fname"],i["name"]["lname"])
                print("Address: ",i["address"]["house_name"],i["address"]["city"])
                print("Gender: ",i["gender"])
                print("Course: ",i["course"])
                print("Mark: ",i["mark"])
                print("Grade: ",i["grade"])
                print("Phone: ",i["phone"]["no"],"\n")
                
print("********Students neither from Kollam nor Thiruvananthapuram********")
for i in mycollection.find({}):
    if(i['address']['city']) != "Kollam" and (i['address']['city']) != "Thiruvananthapuram":
                print("Name: ",i["name"]["fname"],i["name"]["lname"])
                print("Address: ",i["address"]["house_name"],i["address"]["city"])
                print("Gender: ",i["gender"])
                print("Course: ",i["course"])
                print("Mark: ",i["mark"])
                print("Grade: ",i["grade"])
                print("Phone: ",i["phone"]["no"],"\n")
                
print("********Students either from Kollam or Thiruvananthapuram********")
for i in mycollection.find({}):
    if(i['address']['city']) == "Kollam" or (i['address']['city']) == "Thiruvananthapuram":
                print("Name: ",i["name"]["fname"],i["name"]["lname"])
                print("Address: ",i["address"]["house_name"],i["address"]["city"])
                print("Gender: ",i["gender"])
                print("Course: ",i["course"])
                print("Mark: ",i["mark"])
                print("Grade: ",i["grade"])
                print("Phone: ",i["phone"]["no"],"\n")