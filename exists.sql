mysql> select * from emp;
+------+-------+------+------------+--------+
| id   | name  | age  | place      | salary |
+------+-------+------+------------+--------+
|    1 | ajay  |   21 | palakkad   |  40000 |
|    2 | rosy  |   22 | wayanad    |  50000 |
|    3 | koshy |   23 | malappuram |  10000 |
|    4 | ram   |   24 | kozhikode  |  60000 |
|    5 | sam   |   25 | palakkad   |  70000 |
+------+-------+------+------------+--------+
5 rows in set (0.02 sec)

mysql> select * from odr;
+---------+--------+----------+------------+
| orderid | custid | custname | orderdate  |
+---------+--------+----------+------------+
|      11 |    100 | asna     | 2020-02-05 |
|      12 |    101 | arya     | 2024-03-15 |
|      14 |    103 | mirza    | 2002-11-25 |
|      15 |    104 | hena     | 2001-12-14 |
|      16 |    105 | hasna    | 2011-10-20 |
|      17 |    106 | anagha   | 2012-05-16 |
|      18 |    107 | kavya    | 2011-11-02 |
|      19 |    108 | aysha    | 2001-12-18 |
|      20 |    109 | shahana  | 2009-08-22 |
+---------+--------+----------+------------+
mysql> select orderid,custname from odr o where exists(select * from product p where o.orderid=p.orderid);
+---------+----------+
| orderid | custname |
+---------+----------+
|      11 | asna     |
|      12 | arya     |
|      14 | mirza    |
|      15 | hena     |
|      16 | hasna    |
+---------+----------+
