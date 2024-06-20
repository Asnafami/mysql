mysql> DELIMITER //
mysql> CREATE TRIGGER save_mobileno
    -> AFTER UPDATE
    -> ON phonebook
    -> FOR EACH ROW
    -> BEGIN
    -> INSERT INTO del_phonebook(pname,mobuileno,modified_date)values(OLD.pname,OLD.mobileno,sysdate());
    -> END;
    -> //
Query OK, 0 rows affected (0.19 sec)

mysql> UPDATE phonebook SET pname="renna" where pname="aysha";
    -> select * from del_phonebook;
    -> //
Query OK, 1 row affected (0.14 sec)
Rows matched: 1  Changed: 1  Warnings: 0

+-------+------------+---------------+
| pname | mobuileno  | modified_date |
+-------+------------+---------------+
| kavya | 9598456789 | 2024-06-20    |
| aysha | 1234567890 | 2024-06-20    |
+-------+------------+---------------+
2 rows in set (0.14 sec)

mysql> select * from phonebook;
    -> //
+--------+------------+
| pname  | mobileno   |
+--------+------------+
| asna   | 9948569854 |
| asna   | 9789456123 |
| fami   | 5588996633 |
| renna  | 1234567890 |
| lubina | 9948523694 |
+--------+------------+
5 rows in set (0.00 sec)
