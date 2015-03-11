# coding: ISO8859-1

# 
#  Licensed Materials - Property of IBM
#
#  (c) Copyright IBM Corp. 2008,2009
#

class TestIbmDb < Test::Unit::TestCase

  def test_clob_special_chars
  assert_expect do
    conn = IBM_DB::connect db,username,password
    drop_sql = "DROP table clob_test"
    IBM_DB::exec(conn,drop_sql)
    create_sql = "CREATE table clob_test(id INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 100) PRIMARY KEY,special_col CLOB)"
    IBM_DB::exec(conn,create_sql)
    insert_sql = "INSERT INTO clob_test (special_col) VALUES (?)"
    insert_stmt = IBM_DB::prepare conn,insert_sql
    if IBM_DB::execute insert_stmt,["I am a normal value"]
      puts "Insert statement execution for value with normal characters is successful"
    else
      puts "Insert statement execution for value with normal characters failed due to: #{IBM_DB::stmt_errormsg}"
    end 
    if IBM_DB::execute insert_stmt,["Special character is �"]
      puts "Insert statement execution for value with special characters is successful"
    else
      puts "Insert statement execution for value with special characters failed due to: #{IBM_DB::stmt_errormsg}"
    end
    select_sql = "select * from clob_test"
    stmt = IBM_DB::exec conn,select_sql
    while (row = IBM_DB::fetch_assoc(stmt))
      puts "special_col value is #{row['SPECIAL_COL']}"
    end
  end
  end
end  


__END__
__LUW_EXPECTED__
Insert statement execution for value with normal characters is successful
Insert statement execution for value with special characters is successful
special_col value is I am a normal value
special_col value is Special character is �
__ZOS_EXPECTED__
Insert statement execution for value with normal characters is successful
Insert statement execution for value with special characters is successful
special_col value is I am a normal value
special_col value is Special character is �
__SYSTEMI_EXPECTED__
Insert statement execution for value with normal characters is successful
Insert statement execution for value with special characters is successful
special_col value is I am a normal value
special_col value is Special character is �
__IDS_EXPECTED__
Insert statement execution for value with normal characters is successful
Insert statement execution for value with special characters is successful
special_col value is I am a normal value
special_col value is Special character is �
