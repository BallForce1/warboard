#!/usr/bin/python
import MySQLdb as mdb
import sys
import os
import time

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
    if time == "ARRANG" or time == '\n' or time == '':
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
def find_emplID(name, cur, linecount):
    if name == 'STAFF' or name == '':
        return 'NULL'
    if cur.execute("""SELECT * FROM faculty_member WHERE last_name=%s """, (name[2:])) == True:
        rows = cur.fetchall()
        #print rows
        #print name[0]
        if str(rows)[3] == name[0]:
            return str(rows)[-13:-5]
        else:
            print "facult member does not exist at line: ", linecount, "with name: ", name
            return 'NULL'
    else:
        print "facult member does not exist at line: ", linecount, "with name: ", name
        
        #print error_count
    
def main():
    #connect to database
    try:
        con = mdb.connect('localhost', 'ataylor', 
            'ta0163', 'warboard');
        
        cur = con.cursor()
        cur.execute("SELECT VERSION()")

        data = cur.fetchone()
    
        print "Database version : %s " % data
        print "Droping course table"
   
        cur.execute("DELETE FROM course;")
        line = "x"
        lineCount = 0
        while True:
            lineCount += 1
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
                start_time = set_time(line[91:97])
                end_time = set_time(line[98:104])
                #employee_id = find_emplID(line[116:-1], cur, lineCount)
                employee_id = '111222333'
                
                # print (course_number, subject_abbr, cat_number, section_number, course_title, 
                    # number_units, days_of_week, building_abbr, room_number, start_time,
                    # end_time, employee_id )
                cur.execute("""INSERT INTO course (course_number, subject_abbr, cat_number, 
                                                section_number, course_title, number_units, 
                                                days_of_week, building_abbr, room_number, 
                                                start_time, end_time, employee_id) 
                                                VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""",
                            (line[0:4], line[17:21], line[22:27], line[28:30],
                            line[39:70], line[71], line[83:88], line[105:109],
                            line[109:113], set_time(line[91:97]), set_time(line[98:104]), find_emplID(line[116:-1], cur, lineCount) ))
                    
    
    except mdb.Error, e:
  
        print "Error %d: %s" % (e.args[0],e.args[1])
        sys.exit(1)
    
    finally:           
        if con:    
            con.close()
		
    f.close()
    
if __name__ == "__main__":
    sys.exit(main())