class Bookmark


  Dotenv.load
  
  def self.all 
        begin
      con = PG.connect :dbname => ENV['DBNAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
      connection.exec("SELECT * FROM bookmarks;")
    rescue PG::Error => e
      puts e.message 
    ensure
      con.close if con
    end
  end

end