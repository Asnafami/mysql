mysql> DELIMITER $$
mysql> CREATE FUNCTION
    -> AddTwoNumbers(a Int, b Int)
    -> returns Int
    -> deterministic
    -> BEGIN
    -> return a+b;
    -> END $$
Query OK, 0 rows affected (0.14 sec)
mysql> select AddTwoNumbers(2,3)as SUM;
    -> $$
+------+
| SUM  |
+------+
|    5 |
+------+
1 row in set (0.00 sec)
