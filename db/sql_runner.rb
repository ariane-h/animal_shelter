require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect( {dbname: 'deq6t5eisnk40r',
      host: 'ec2-52-86-73-86.compute-1.amazonaws.com',
      port: 5432, user: 'ezmacprfgeutxu', password: '79694ba0bb36c40633e0856ddd10e232f80539e9e24a205b7fabd7e117bd1590'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
