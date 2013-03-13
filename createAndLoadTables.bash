#! /bin/bash

echo 'Creating DB schema starts'
mysql --password='ta0163' --user=ataylor  < warboardDBSchema.sql
echo 'Creating DB schema ends'

for dataFile in   buildings.sql rooms.sql cart.sql cart_type.sql cart_equipment.sql employee.sql delivery.sql; do
    echo "Poplulating table $(echo $dataFile | sed 's/\.sql//')."
    mysql --password='ta0163' --user=ataylor  < $dataFile
    echo "Poplulating table $(echo $dataFile | sed 's/\.sql//') completed."
done
    python ./populate_faculty_members.py
    python ./populate_courses.py
    
## The above loop can be replace by these statements.
## mysql --password='yourMySQLpassword' --user=yourMySQLloginName  < employee.sql
## mysql --password='yourMySQLpassword' --user=yourMySQLloginName  < project.sql
## mysql --password='yourMySQLpassword' --user=yourMySQLloginName  < dependent.sql
## mysql --password='yourMySQLpassword' --user=yourMySQLloginName  < worksOn.sql
## mysql --password='yourMySQLpassword' --user=yourMySQLloginName  < deptLocation.sql
## mysql --password='yourMySQLpassword' --user=yourMySQLloginName  < department.sql