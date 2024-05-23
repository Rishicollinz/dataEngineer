**SQL NOTES**
**References:**
- [Tutorials Point](https://www.tutorialspoint.com/sql/index.htm)
- [w3schools](https://www.w3schools.com/sql/sql_intro.asp)
---
**Definition:**
- SQL stands for structured query language
- It is a query language used to manage data in relational database such as ms sql server,oracle, ibm db2, mysql, microsoft access.
- The data in RDBMS is stored in database objects called tables. A table is a collection of related data entries and it consists of columns and rows.

---
**RDBMS Concepts:**
[RDBMS Concepts](https://www.tutorialspoint.com/sql/sql-rdbms-concepts.htm)
- Definition
- Table
- Field
- Record or Row
- Column
- Null Value
- Constraints:
    - NOT NULL
    - DEFAULT
    - UNIQUE KEY
    - PRIMARY KEY
    - FOREIGN KEY
    - CHECK
    - INDEX
- Data Integrity
    - Entity Integrity
    - Domain Integrity
    - Referential Integrity
    - User-Defined Integrity
- Database Normalization
---
**SQL Basic Commands:**
![SQL Commands](image.png)
[SQL Commands](https://www.javatpoint.com/dbms-sql-command)

**SQL Database:**
- MySQL
- MS SQL Server
- ORACLE
- MS ACCESS
- PostgreSQL
- SQLite

**SQL-Syntax:**
- Not case-sensitive
- Mysql table name is case-sensitive
- SELECT - extracts data from a database
- UPDATE - updates data in a database
- DELETE - deletes data from a database
- INSERT INTO - inserts new data into a database
- CREATE DATABASE - creates a new database
- ALTER DATABASE - modifies a database
- CREATE TABLE - creates a new table
- ALTER TABLE - modifies a table
- DROP TABLE - deletes a table
- CREATE INDEX - creates an index (search key)
- DROP INDEX - deletes an index

**Datatypes:**
- String
- Numeric
- Date and Time

**String datatypes:**
- char(size=1) [0-255]
- varchar(size) [0-65535]
- binary(size=1):
    - It is equal to char() but stores binary byte strings.
- varbinary(size):
    - Used for the binary byte strings.
    usecases: hash

- Text:
    - tinytext
    - longtext
    - text(size)
    - mediumtext

- Blob:
    - tinyblob
    - blob(size)
    - mediumblob
    - longblob
    usecase: used for storing images

- ENUM:
    - It is like a kind of constraint where we can only insert data from the allowed values. and only accepts one insert value.

    ```sql
    CREATE TABLE Orders (
    OrderID INT NOT NULL,
    Status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') NOT NULL
    );

    INSERT INTO Orders (OrderID, Status) VALUES (1, 'Pending');
    ```

- Set:
    - It is similar to Enum but allows multiple values during insertion

    ```sql
    CREATE TABLE UserPreferences (
    UserID INT NOT NULL,
    Preferences SET('News', 'Updates', 'Offers', 'Alerts') NOT NULL
    );
    INSERT INTO UserPreferences (UserID, Preferences) VALUES (1, 'News,Offers');
    INSERT INTO UserPreferences (UserID, Preferences) VALUES (2, 'Updates,Alerts');
    ```

**Numeric Data types:**
- Int:
    - Tinyint
    - Smallint
    - Bigint
    - Mediumint
- Float(M,D)
- Double(M,D)
- Decimal(M,D)

**Mysql-DateandTime:**
- Date
- Datetime
- Timestamp
- Time
- Year(M)

**Sql operators:**
- Arithmetic Operator:
    - "+,-,*,/,%"
- Sql comparison operator:
    - "=,!=,<>,>,<,<=,>=,!<,!>
- Logical Operators:
    - It can be unknown if value is none but comparison operator returns only true or false;
    - "ALL, AND, ANY, BETWEEN, EXISTS, IN, LIKE, NOT, OR, IS NULL, SOME, UNIQUE"

**SQL Expression:**
- Combination of one or more values, operators and sql functions that are all evaluated to a value.
- Expressions are used in where clause of an sql query.
- Three types:
    - Boolean Expression:
    ```sql
    SELECT column1, column2, columnN 
    FROM table_name 
    WHERE BOOLEAN EXPRESSION;
    ```
    - Numerical Expression:
    ```sql
    SELECT column1, column2, columnN 
    FROM table_name 
    WHERE NUMERICAL EXPRESSION;
    ```
    - Date Expression:
    ```sql
    SELECT column_name(s)
    FROM table_name
    WHERE DATE EXPRESSION ;
    SELECT * FROM ORDERS WHERE DATE < '2008/06/01';
    ```

### SQL Database:

**Create Database:**
- CREATE DATABASE db_name; (you need admin previleges)
- SHOW DATABASES;
- USE db_name; (to use a specific database for the next commands).

**Drop Database:**
- DROP DATABASE Db_name;
- DROP DATABASE IF EXISTS db_name; (it only deletes if a database is available)
- DROP DATABASE db1,db2; (to delete multiple database);

**Select Database:**
- USE db_name (to select a database)
- If a db is not available, then it will show unknown db error

**Rename Database:**
- ALTER DATABASE OldDatabaseName MODIFY NAME = NewDatabaseName;
- This doesn't work on mysql database;
- we have to use this for mysql db:
    - $ mysqldump -u root -p"password" -R testDB > testDB.sql
    - '-R' to copy stored procedures and functions along with data.
    - $mysqladmin -u root -p"password" create tutorialsDB;
    - $mysql -u root -p"password" tutorialsDB < testDB.sql

**Backup database:**
- MySQL:
    - mysqldump -u root -p"password" -R testDB>testDB.sql
    - mysqladmin -u root -p"password" CREATE tutorialsDB
    - mysql -u root -p"password" tutorialsDB < testDB.sql

-MS SQL Server:
    - BACKUP DATABASE testDB \n TO DISK = 'D:\testDB.bak' \n GO
    - RESTORE DATABASE db_name FROM DISK = 'D:\testDB.bak' \n WITH REPLACE \n GO

---
### SQL Tables:

**Create table:**
1. Normal Creation:
    - ```sql
        CREATE TABLE table_name(
        column1 datatype,
        column2 datatype,
        column3 datatype,
        .....
        columnN datatype,
        PRIMARY KEY( one or more columns )
        );
        ```

2. If not exists:
    - ```sql
        CREATE TABLE IF NOT EXISTS table_name(
        column1 datatype,
        column2 datatype,
        column3 datatype,
        .....
        columnN datatype,
        PRIMARY KEY( one or more columns )
        );
    ``` 

3. From existing tables:
    - ```sql
        CREATE TABLE NEW_TABLE_NAME AS
        SELECT [column1, column2...columnN]
        FROM EXISTING_TABLE_NAME
        WHERE Condition;
    ```

4. Structure of the table:
    - ```sql 
        DESC tablename;
    ```

**Show tables:**
- show tables;
- select * from sys.tables;

**Rename table:**
- Rename table current_table_name to new_table_name;
- Alter table table_name Rename as|to new_table_name;

**Truncate table:**
- truncate will delete all the data entries but prevents the structure.
- truncate table table_name;

**cloning table:**
1. Simple cloning:
    - ```sql
        create table new_tb_name select * from Old_table_name;
    ```
    - Here only data is copied and indexes and auto increments are not copied
2. Shallow cloning:
    - ```sql
        create table new_tb_name like old_table_name;
    ```
    - Here only the structure of the table is copied and the datae are not copied.

3. Deep cloning:
    - ```sql
        create table new_table_name like old_table_name;
        Insert into new_table_name select * from old_table_name;
    ```

**Temporary tables:**
1. Syntax:
    - ```sql
        create temporary table tablename(cols);
    ```
2. Drop:
    - Temporary tables are dropped, once the connection is closed or the session is terminated;
    - ```sql
        drop temporary table tablename;
    ```
3. Local temp table:
    - while creation use single hash '#'

4. Global temp table:
    - while creation use double hash '##'
    ```sql
        CREATE TABLE ##CUSTOMERS(
        ID   INT              NOT NULL,
        NAME VARCHAR (20)     NOT NULL,
        AGE  INT              NOT NULL,
        ADDRESS  CHAR (25) ,
        SALARY   DECIMAL (18, 2),
        PRIMARY KEY (ID)
        );
    ```

**Sql Alter table:**
1. Add column:
    - `Alter table table_name add column column_name datatype constraints`
2. Drop column:
    - `Alter table table_name drop column column_name`
3. Add index:
    - `Alter table table_name add index index_name[index_type]`
4. Drop index:
    - `Alter table table_name drop index index_name[type]`
5. Add constraint:
    - `add constraint constraint_name primary key(cols)`
6. Drop constraint:
    - `drop constraint constraint_name`
7. To find constraint_name/ key_name:
    - `show index from table_name`
8. Rename column:
    - `rename column old to new`
9. Datatype change:
    - `modify column col_name datatype constraint`

**Sql drop table:**
1. `drop table table_name`
2. `drop table if exits table_name`
3. `drop temporary table table_name`

**Sql delete:**
1. `delete from table_name where`

**Sql constraints:**
1. NOT NULL
2. UNIQUE KEY
3. PRIMARY KEY
4. FOREIGN KEY
5. DEFAULT 'def value'
6. CHECK(CONDITION)
7. INDEX

---
### SQL Queries:
**Insert Query:**
- For same order:
    - `INSERT INTO TABLE_NAME VALUES (value1,value2...valueN);`

- For custom order:
    - `INSERT INTO TABLE_NAME (column1, column2...columnN) VALUES (value1, value2...valueN);`

- Insert...select :
    - ```sql
        INSERT INTO first_table_name [(column_name(s))]
        SELECT column1, column2, ...columnN
        FROM second_table_name
        [WHERE condition];
    ```

- Insert...table:
    - `INSERT INTO first_table_name TABLE second_table_name;`

**Select Query:**
- `select * from table_name where condition;`
- `select concat(name,' ',age) as details,address from tablename;`
**Select into:**
- ```sql
    SELECT *
    INTO NameStartsWith_K
    FROM CUSTOMERS
    WHERE NAME LIKE 'k%';
    ```

**Insert into select:**
- ```sql
    INSERT INTO table_new 
    SELECT (column1, column2, ...columnN) 
    FROM table_old where condition limit no order by condition asc;
    ```
**Update query:**
- ```sql
    UPDATE table_name
    SET column1 = value1, column2 = value2,..., columnN = valueN
    WHERE [condition];
    ```

**Delete query:**
- `delete from tablename where condition`

**Order by:**
- ```sql
    SELECT column-list 
    FROM table_name 
    [WHERE condition] 
    [ORDER BY column1, column2, .. columnN] [ASC | DESC];
    ```
- Custom order:
    - ```sql
        SELECT * FROM CUSTOMERS
        ORDER BY ( CASE ADDRESS
        WHEN 'DELHI' 	 THEN 1
        WHEN 'BHOPAL' 	 THEN 2
        WHEN 'KOTA' 	 THEN 3
        WHEN 'AHMEDABAD' THEN 4
        WHEN 'Hyderabad' 	THEN 5
        ELSE 100 END) ASC, ADDRESS DESC;
        ```
    - Case is used to assign priority.

### SQL Views:
1. Create Views:
    - `create view view_name as select statement`
    - with check option:
        - It retains the check option from the original table.
        - `create view ... with check option`
2. Update views:
    - ```sql
        UPDATE view_name
        SET column1 = value1, column2 = value2...., columnN = valueN
        WHERE [condition];
        ```

3. Drop views:
    - ```sql
        DROP VIEW [IF EXISTS] view_name;
        ```
4. Delete:
    - ```sql
        Delete from view_name where condition;
        ```
5. Rename Views:
    - `Rename table current_view to new_view;`

### SQL Joins:
1. Inner join:
    - ```sql
        SELECT column_name(s)
        FROM table1
        INNER JOIN table2
        ON table1.column_name = table2.column_name;
        ```
2. Left Join:
    - ```sql
        SELECT column_name(s)
        FROM table1
        LEFT JOIN table2
        ON table1.column_name = table2.column_name;
        ```
3. Right Join:
    - ```sql
        SELECT table1.column1, table2.column2...
        FROM table1
        RIGHT JOIN table2
        ON table1.common_field = table2.common_field;
        ```
4. Full outer Join: 
    - ```sql
        SELECT column_name(s)
        FROM table1
        FULL JOIN table2
        ON table1.column_name = table2.column_name;
        ```
5. Cross Join:
    - ```sql
        SELECT column_name(s)
        FROM table1CROSS 
        JOIN table2;
        ```
6. self join:
    - ```sql
        SELECT column_name(s)
        FROM table1 a, table1 b
        WHERE a.common_field = b.common_field;
        ```
7. Delete using join:
    - ```sql
        DELETE table(s)
        FROM table1 JOIN table2
        ON table1.common_field = table2.common_field;
        ```
8. Update using join:
    - ```sql
        UPDATE table(s)
        JOIN table2 ON table1.join_column = table2.join_column
        SET table1.column1 = table2.new_value1, 
            table1.column2 = table2.new_value2;
        ```
9. UNION: 
    - Union is used for only two tables with same number of columns and same datatype.

### SQL INDEX:
- When Records are large, it takes time for data retrieval, so use indexing concept to index a column or a database.
- SQL Indexes are special lookup tables that are used to speed up the process of data retrieval.

- Unique Indexes:
    - Create Unique Index index_name on table_name(col);
- Single column Index:
    - Create Index index_name on table_name(col);
- Composite column Index:
    - Create index index_name on table_name(col1,col2);

**Drop Index:**
- drop index index_name on table_name;

**Show Index:**
- SHOW INDEX FROM table_name;

**Clustered Index:**
- CREATE CLUSTERED INDEX index_name 
ON table_name (column_name);

**Non clustered Index:**
- CREATE NONCLUSTERED INDEX index_name 
ON table_name (column_name);

### SQL KEYS:
**Primary Key:**
- Primary key is used to uniquely identify each data entries in a column.
- It is unique and not null
    - ```sql
        CREATE TABLE table_name(
        column1 datatype,
        column2 datatype,
        column3 datatype,
        .....
        columnN datatype,
        PRIMARY KEY(column_name)
        );
        ```
- When a primary key is created on multiple fields of a table, it is called a Composite Key.


**Foreign Key:**
- In SQL, a Foreign Key is a column in one table that matches a Primary Key in another table, allowing the two tables to be connected together.

- ```sql
    CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    CONSTRAINT fk_name 
	FOREIGN KEY (column_name) 
	REFERENCES referenced_table(referenced_column)
    );
    ```

**Unique Key:**
- Unique Key is checks that the values are unique in a column.
- ```sql
    CREATE TABLE table_name(
    column1 datatype UNIQUE KEY,
    column2 datatype UNIQUE KEY,
    .....
    .....
    columnN datatype
    );
    ```
- Alter:
    - Alter table tb_name add constraint uq_key_name unique(cols);

- Drop:
    - Alter table tb_name drop constraint uq_key_name

**Composite key:**
- When more than one column is used to uniquely identify a table data is known as composite key.
- Composite key can defined as one or more primary key.
- ```sql
    CREATE TABLE table_name(
   column1 datatype,
   column2 datatype,
   column3 datatype,
   .....
   columnN datatype,
   CONSTRAINT composite_key_name,
   PRIMARY KEY(column_name)
    );
    ```
**Summary:**
- Super Key: A set of one or more columns that can uniquely identify a row.
- Candidate Key: A minimal super key, without any unnecessary columns.
- Primary Key: A selected candidate key used to uniquely identify rows in a table.
### Stored Procedure:

**IN Parameter:**
1. For retrieving data with IN keyword:
```sql
USE `trial`;
DROP procedure IF EXISTS `getStudentsGrade`;

DELIMITER $$
USE `trial`$$
CREATE PROCEDURE `getStudentsGrade` (IN pGrade int)
BEGIN
	select * from Students where grade < pGrade;
END$$


DELIMITER ;
```
2. For inserting data with IN keyword:
```sql
USE `trial`;
DROP procedure IF EXISTS `insertData`;

USE `trial`;
DROP procedure IF EXISTS `trial`.`insertData`;
;

DELIMITER $$
USE `trial`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertData`(in pName varchar(255),in pAge int,in pGrade int)
begin
	insert into Students(name,age,grade) values (pName,pAgse,pGrade);
end$$

DELIMITER ;
```
**OUT Parameter**

1. Getting data from procedure:
- Syntax:
```sql
delimiter $$
use `trial`$$
create procedure getCount(OUT total int)
begin
	select count(*) into total from Students;
end$$
delimiter ;
```
- Usage:
```sql
call getCount(@total);
select @total as No_of_entries;
```

**IN OUT Parameter:**
- Using in out, the attributes inside stored procedure are made mutable. Normal "in" is not mutable and we can only write into "out".
- It is usable for getting a value from db and update it and send it to db again.
```sql 
delimiter $$
use `trial`$$
create procedure updateData(IN pId int,IN pName varchar(255),INOUT pAge int,INOUT pGrade int)
begin
	select grade,age into pGrade,pAge from Students where id = pId;
    set pGrade = pGrade + 1;
    set pAge=pAge+1;
    update Students set name=pName, age=pAge, grade=pGrade where id=pId;
end$$
delimiter ;
``` 
- usage:
```sql
use trial;
select * from Students;
call updateData(5,'Sri',@age,@grade);
select @age,@grade;
```
```sql

```
**PIVOT:**
```sql
SELECT [Date] AS 'Day',
[Sammich], [Pickle], [Apple], [Cake]
FROM (
    SELECT [Date], FoodName, AmountEaten FROM FoodEaten
) AS SourceTable
PIVOT (
    MAX(AmountEaten)
    FOR FoodName IN ([Sammich], [Pickle], [Apple], [Cake])
) AS PivotTable
```
### DCL:
**create user:**
- CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
**Grant:**
- GRANT ALL PRIVILEGES ON books.authors  TO 'tolkien'@'localhost';
- GRANT ALL PRIVILEGES ON %.% TO 'user'@'ip';
**Revoke:**
REVOKE privilege_type ON database_name.* FROM 'username'@'host';
**save**
- FLUSH PRIVILEGES;

### Cursor:

**Syntax:**
```sql
DELIMITER //
CREATE PROCEDURE FetchCustomers()
BEGIN
   DECLARE done INT DEFAULT FALSE;
   DECLARE customer_id INT;
   DECLARE customer_name VARCHAR(255);
   DECLARE auto_id INT; 

   -- Declare cursor
   DECLARE MY_CURSOR CURSOR FOR
   SELECT id, name FROM CUSTOMERS;

   -- Declare exit handler
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

   -- Open cursor
   OPEN MY_CURSOR;

   -- Fetch and insert rows
   read_loop: LOOP
      FETCH MY_CURSOR INTO customer_id, customer_name;
      IF done = 1 THEN
         LEAVE read_loop;
      END IF;

      -- Insert the fetched data into the backup table
      INSERT INTO customers_backup VALUES (customer_id, customer_name);
		        
      -- Get the last auto-generated ID used in the insertion
      SET auto_id = LAST_INSERT_ID();

   END LOOP;
	
    -- Close cursor
    CLOSE MY_CURSOR;
END //
DELIMITER ;
```
