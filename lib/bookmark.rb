require 'dotenv'
require 'pg'

class Bookmark

  Dotenv.load

  def self.all 
    assign_database
    begin
      con = PG.connect :dbname => @env, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
      result = con.exec("SELECT * FROM bookmarks;")
      result.map { |row| row["url"] }
    rescue PG::Error => e
      puts e.message 
    ensure
      con.close if con
    end
  end

  def self.add(url)
    assign_database
    begin
      con = PG.connect :dbname => @env, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
      result = con.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
    rescue PG::Error => e
      puts e.message 
    ensure
      con.close if con
    end
  end


  def self.assign_database
    @env = ENV['RACK_ENV'] == 'test' ? ENV['DB_TEST_NAME'] : ENV['DB_DEV_NAME']
  end
  
  private_class_method :assign_database

end