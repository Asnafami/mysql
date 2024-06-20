mysql> create database asna;
Query OK, 1 row affected (0.29 sec)

mysql> use asna;
Database changed
mysql> create table phonebook(pname varchar(25),mobileno varchar(10));
Query OK, 0 rows affected (0.61 sec)

mysql> create table del_phonebook(pname varchar(25),mobuileno varchar(10),modified_date date);
Query OK, 0 rows affected (0.34 sec)

mysql> desc phonebook;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| pname    | varchar(25) | YES  |     | NULL    |       |
| mobileno | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.14 sec)

mysql> desc del_phonebook;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| pname         | varchar(25) | YES  |     | NULL    |       |
| mobuileno     | varchar(10) | YES  |     | NULL    |       |
| modified_date | date        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
mysql> insert into phonebook values("asna","9948569854");
Query OK, 1 row affected (0.32 sec)

mysql> insert into phonebook values("asna","9789456123");
Query OK, 1 row affected (0.08 sec)

mysql> insert into phonebook values("fami","5588996633");
Query OK, 1 row affected (0.06 sec)

mysql> insert into phonebook values("aysha","1234567890");
Query OK, 1 row affected (0.13 sec)

mysql> insert into phonebook values("kavya","9598456789");
Query OK, 1 row affected (0.04 sec)
mysql> insert into phonebook values("lubina","9948523694");
Query OK, 1 row affected (0.07 sec)

mysql> select * from phonebook;
+--------+------------+
| pname  | mobileno   |
+--------+------------+
| asna   | 9948569854 |
| asna   | 9789456123 |
| fami   | 5588996633 |
| aysha  | 1234567890 |
| kavya  | 9598456789 |
| lubina | 9948523694 |
+--------+------------+
6 rows in set (0.00 sec)
mysql> DELIMITER //
mysql> CREATE TRIGGER save_old_mob AFTER DELETE ON phonebook FOR EACH ROW
    -> BEGIN
    -> INSERT INTO del_phonebook(pname,mobuileno,modified_date)values(OLD.pname,OLD.mobileno,sysdate());
    -> END;
    -> //
Query OK, 0 rows affected (0.10 sec)

mysql> desc phonebook;
    -> delete from phonebook where pname="kavya";
    -> select * from phonebook;
    -> //
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| pname    | varchar(25) | YES  |     | NULL    |       |
| mobileno | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)
Query OK, 1 row affected (0.14 sec)

+--------+------------+
| pname  | mobileno   |
+--------+------------+
| asna   | 9948569854 |
| asna   | 9789456123 |
| fami   | 5588996633 |
| aysha  | 1234567890 |
| lubina | 9948523694 |
+--------+------------+
5 rows in set (0.14 sec)

mysql> select * from del_phonebook;
   -> //
+-------+------------+---------------+
| pname | mobuileno  | modified_date |
+-------+------------+---------------+
| kavya | 9598456789 | 2024-06-20    |
+-------+------------+---------------+
1 row in set (0.00 sec)
