@echo off

rem ����д�˲��ֵ�ֵ
rem sys �û�������
set sysPassword=password

rem Oracle �����ݿ���
set domain=orcl

rem �û����ڱ�ռ�
set tablespace=USERS

rem ���û���
set createUserName=user123
rem ���û�����
set password=user123
rem ����д�˲��ֵ�ֵ

set createusersql=createuser/createuser.sql

echo create user %createUserName% identified by %password%; > %createusersql%
echo alter user %createUserName% default tablespace %tablespace% quota unlimited on %tablespace%; >> %createusersql%
echo alter user %createUserName% quota unlimited on %tablespace%; >> %createusersql%
echo alter user %createUserName% temporary tablespace temp; >> %createusersql%
echo grant create trigger to %createUserName%; >> %createusersql%
echo grant create session to %createUserName%; >> %createusersql%
echo grant create sequence to %createUserName%; >> %createusersql%
echo grant create synonym to %createUserName%; >> %createusersql%
echo grant create table to %createUserName%; >> %createusersql%
echo grant create view to %createUserName%; >> %createusersql%
echo grant create procedure to %createUserName%; >> %createusersql%
echo grant alter session to %createUserName%; >> %createusersql%
echo grant create job to %createUserName%; >> %createusersql%
echo grant dba to %createUserName%; >> %createusersql%
echo exit >> %createusersql%

echo.
echo [��Ϣ] �����û��ű��Ѿ����ɡ�
echo [��Ϣ] �������ִ�����ݿ�ű���
echo.
pause

sqlplus sys/%sysPassword%@%domain% as sysdba  @%createusersql%

echo.
echo [��Ϣ] ִ����ɡ�
echo.
pause
