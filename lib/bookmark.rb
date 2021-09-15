require 'dotenv'
require 'pg'

class Bookmark

  Dotenv.load

  def self.all 
    database = ENV['RACK_ENV'] == 'test' ? ENV['DB_TEST_NAME'] : ENV['DB_DEV_NAME']
    p "The database is #{database}"
    begin
      con = PG.connect :dbname => database, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
      result = con.exec("SELECT * FROM bookmarks;")
      result.map { |row| row["url"] }
    rescue PG::Error => e
      puts e.message 
    ensure
      con.close if con
    end
  end

end