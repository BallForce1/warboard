#!/usr/bin/python
import MySQLdb as mdb
import sys
import os
import time
import random
import shlex
import warnings

warnings.filterwarnings('ignore')
con = None


#open file
f = open ("./course_schedule.txt","r")

#test to determine if a charecter is a number
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False
	
def set_time(time):
    if time == "ARRANG" or time == '\n' or time == '' or is_number(time[0]) == False:
        return 'NULL'
    if time[5] == "A":
        newTime = time[0:2] 
        newTime +=  ':'
        newTime +=  time[3:5] 
        newTime += ':' 
        newTime += '00'
        return newTime
        
    if time[5] == "P":
        t = int(time[0:2]) + 12
        newTime = str(t) 
        newTime +=  ':'
        newTime +=  time[3:5] 
        newTime += ':' 
        newTime += '00'
        return newTime
        
    return 'NULL'


    
#funtion to search for employee_id given a name
def find_emplID(name, cur, linecount, line):
    name = str.split(name)

    if cur.execute("""SELECT * FROM faculty_member WHERE last_name=%s AND first_name=%s """, (name[1], name[0])) == True:
        rows = cur.fetchall()
        return str(rows)[-13:-4]
        
    else:
        print "facult member does not exist at line: ", linecount
        return 'NULL'
        
def main():
    #connect to database
    try:
        #connect to database
        con = mdb.connect('localhost', 'ataylor', 
            'ta0163', 'warboard');
        cur = con.cursor()

        print "Populating table course."   
        cur.execute("DELETE FROM course;")
        
        lineCount = 0
        while True:
            lineCount += 1
            line = f.readline()

            #EOF TEST
            if line == "":
                break
            #insert data from lines into database
            if is_number(line[0]):
                #employee_id = find_emplID(line[116:-1], cur, lineCount)
                cur.execute("""INSERT INTO course (course_number, subject_abbr, cat_number, 
                                                section_number, course_title, number_units, 
                                                days_of_week, building_abbr, room_number, 
                                                start_time, end_time, faculty_id) 
                                                VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""",
                            (line[0:4], line[17:21], line[22:27], line[28:30],
                            line[39:70], line[71], line[83:88], line[105:109],
                            line[109:113], set_time(line[91:97]), set_time(line[98:104]),
                            find_emplID(line[116:], cur, lineCount, line) ))
        
        print "Populating table course completed."   
                    
    
    except mdb.Error, e:
  
        print "Error %d: %s" % (e.args[0],e.args[1])
        sys.exit(1)
    
    finally:           
        if con:    
            con.close()
	#garbage collection
    f.close()
    
if __name__ == "__main__":
    sys.exit(main())