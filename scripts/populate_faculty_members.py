#!/usr/bin/python
# open file
import sys
import csv
import MySQLdb as mdb

f = open ("./course_schedule.txt","r")

#Read whole file into data
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

def format_emplid(number):
    outString = str(number);
    print len(outString)
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
        cur.execute("SELECT VERSION()")

        data = cur.fetchone()
    
        print "Database version : %s " % data
        print "Droping faculty_member table"
   
        cur.execute("DELETE FROM faculty_member;")
    
        employeeNumber = 1
        with open('randomNames.csv', 'rb') as f:
            reader = csv.reader(f)
            for row in reader:
                print row[0:2]
                emplString = format_emplid(employeeNumber)
                employeeNumber = 1 + employeeNumber
                cur.execute("""INSERT INTO faculty_member (first_name, last_name, employee_id)                                                
                                    VALUES (%s,%s,%s)""",
                                    (row[0], row[1], emplString))
                
 
  

    except mdb.Error, e:
        print "Error %d: %s" % (e.args[0],e.args[1])
        sys.exit(1)
    
    
    f.close()
    
    
if __name__ == "__main__":
    sys.exit(main())