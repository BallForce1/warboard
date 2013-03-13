import os
import sys
import MySQLdb as mdb
import random

f = open('./course_schedule.txt', 'r')
o = open('./new_course.txt', 'wb')

#function used only to generate the names in the course text file
def random_teacher(line, cur):
    
    #grab number of faculty members
    cur.execute("""SELECT COUNT(*) FROM faculty_member; """)
    rows = str(cur.fetchall())    
    count = int(rows[2:5])
    
    print line
    print len(line)
    if len(line) < 116:
        length = len(line)
        o.write(line[0:-1])

        while length < 117:
            length += 1
            o.write(' ')
        
    else:
        o.write(line[0:116])

    
    #print line[0:116]
    #calculate random teacher
    randTeacherID = random.randint(0, count-1)
    
    #generate employee id as string
    strRandTeacher = str(randTeacherID)
    while (len(strRandTeacher) < 9):
        strRandTeacher = "0" + strRandTeacher  
    
    #query database for random faculty member
    cur.execute("""SELECT * FROM faculty_member WHERE employee_id=%s """, strRandTeacher)
    rows = cur.fetchall()
    for row in rows:
        #print "here"
        # print row
        #print row[0], row[1]
        o.write(row[0])
        o.write(' ')
        o.write(row[1])
        o.write('\n')
        #line
 
    
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

def main():
    con = None

    try:
        #connect to database
        con = mdb.connect('localhost', 'ataylor', 
            'ta0163', 'warboard');
        cur = con.cursor()
        lineCount = 0
        while True:
            lineCount += 1
            line = f.readline()

            #EOF TEST
            if line == "":
                break
            #insert data from lines into database
            if is_number(line[0]):
                random_teacher(line, cur)
                #print line
            
    #garbage collection
    except mdb.Error, e:
        print "Error %d: %s" % (e.args[0],e.args[1])
        sys.exit(1)
    
    finally:           
        if con:    
            con.close()
            
    o.close()
    f.close()


if __name__ == "__main__":
    sys.exit(main())