#!/usr/bin/python
import MySQLdb as mdb
import sys
import os

con = None


os.getenv("HOME")
from os.path import expanduser
home = expanduser("~")

#open file
f = open ("~/home/ataylor/scripts/course_schedule.txt","r")

#test to determine if a charecter is a number
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

#funtion to search for employee_id given a name
def find_emplID():		
    return "111222333"

#connect to database
try:
    con = mdb.connect('localhost', 'ataylor', 
        'ta0163', 'warboard');
		
    cur = con.cursor()
    cur.execute("SELECT VERSION()")

    data = cur.fetchone()
    
    print "Database version : %s " % data
    print "Droping course table"
    # for sql_line in open(../):
        # cursor.execute(sql_line)
    cur.execute("DELETE FROM course;")
    line = "x"
    while True:
        line = f.readline()

        #EOF TEST
        if line == "":
            break
        #put data fromline into variables
        if is_number(line[0]):
            course_number = line[0:4]
            subject_abbr = line[17:21]
            cat_number = line[22:27]
            section_number = line[28:30]
            course_title = line[39:70]
            number_units = line[71]
            days_of_week = line[83:88]
            building_abbr = line[105:109]
            room_number = line[109:113]
            employee_id = find_emplID()
            print (course_number, subject_abbr, cat_number, section_number, course_title, 
                   number_units, days_of_week, building_abbr, room_number, employee_id )
            cur.execute("""INSERT INTO course VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""",
                        (line[0:4], line[17:21], line[22:27], line[28:30],
                         line[39:70], line[71:73], line[83:88], line[105:109],
                         line[109:113], find_emplID() ))

    
except mdb.Error, e:
  
    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)
    
finally:           
    if con:    
        con.close()
		
f.close()