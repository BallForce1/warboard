#!/usr/bin/python
# open file
import sys
import csv
import MySQLdb as mdb


#Read whole file into data
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

def format_emplid(number):
    outString = str(number);
    while (len(outString) < 9):
        outString = "0" + outString
    return outString
    
def main():
    line = "x"
    con = None

    try:

        con = mdb.connect('localhost', 'ataylor', 
            'ta0163', 'warboard');

        cur = con.cursor()
 
<<<<<<< HEAD
        print "Poplulating table faculty_member."
=======
        print "Populating table faculty_member."
>>>>>>> e5485b03e3061492ad528e8332b9d2f8682f0f52
   
        cur.execute("DELETE FROM faculty_member;")
    
        employeeNumber = 1
        with open('teacherNames.csv', 'rb') as f:
            reader = csv.reader(f)
            for row in reader:
                emplString = format_emplid(employeeNumber)
                employeeNumber = 1 + employeeNumber
                cur.execute("""INSERT INTO faculty_member (first_name, last_name, faculty_id)                                                
                                    VALUES (%s,%s,%s)""",
                                    (row[0], row[1], emplString))
                
 
  
<<<<<<< HEAD
        print "Poplulating table faculty_member completed."
=======
        print "Populating table faculty_member completed."
>>>>>>> e5485b03e3061492ad528e8332b9d2f8682f0f52

    except mdb.Error, e:
        print "Error %d: %s" % (e.args[0],e.args[1])
        sys.exit(1)
    
    
    f.close()
    
    
if __name__ == "__main__":
    sys.exit(main())