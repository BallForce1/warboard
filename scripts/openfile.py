#!/usr/bin/python
# open file
f = open ("coarse_schedule.txt","r")

#Read whole file into data
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False


line = "x"
while True:
    line = f.readline()

    #EOF TEST
    if line == "":
        break
    if is_number(line[0]):
        print line

# Close the file
f.close()