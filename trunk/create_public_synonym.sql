declare
  cursor c_t is select table_name from user_tables;
  szSql varchar2(2048);
  username varchar2(1000);
begin
 select user into username from dual;
  for rec in c_t loop 
    szSql := 'create or replace public synonym '||rec.table_name||' for '||username||'.'||rec.table_name||';';
    dbms_output.put_line(szSql);
  end loop;
end;
/