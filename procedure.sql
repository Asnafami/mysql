mysql> create table customer(id int,name varchar(20),country varchar(10),address varchar(20),city varchar(20));
    -> insert into customer values(1,"asna","India","gdyfgdhjk","calicut");
    -> insert into cutomer values(2,"lubina","India","abcd","malappuram");
    -> insert into cutomer values(3,"aysha","europe","efgh","kannur");
    -> insert into cutomer values(4,"nafiya","france","hij","idukki");
    -> insert into cutomer values(5,"fami","germany","hij","kollam");
    -> insert into cutomer values(6,"hena","egypt","hij","palakkad");
    -> //
Query OK, 0 rows affected (0.44 sec)

Query OK, 1 row affected (0.53 sec)
mysql> select * from customer;
    -> //
+------+--------+---------+-----------+------------+
| id   | name   | country | address   | city       |
+------+--------+---------+-----------+------------+
|    1 | asna   | India   | gdyfgdhjk | calicut    |
|    2 | lubina | India   | abcd      | malappuram |
|    3 | aysha  | europe  | efgh      | kannur     |
|    4 | nafiya | france  | hij       | idukki     |
|    5 | fami   | germany | hij       | kollam     |
|    6 | hena   | egypt   | hij       | palakkad   |
+------+--------+---------+-----------+------------+
6 rows in set (0.00 sec)
mysql> DELIMITER $$
mysql> CREATE PROCEDURE GetCustomersByCountry(IN country_name VARCHAR(30))
    -> BEGIN
    -> SELECT name from customer WHERE country=country_name;
    -> END$$
Query OK, 0 rows affected (0.07 sec)
mysql> CALL GetCustomersByCountry('germany');
    -> select * from cutomer;
    -> $$
+------+
| name |
+------+
| fami |
+------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.02 sec)
