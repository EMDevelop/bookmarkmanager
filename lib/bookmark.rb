require 'dotenv'
require 'pg'

class Bookmark

  Dotenv.load

  def self.all 
    # begin
      con = PG.connect :dbname => ENV['DBNAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
      result = con.exec("SELECT * FROM bookmarks;")
      result.map { |row| row["url"] }
    # rescue PG::Error => e
    #   puts e.message 
    # ensure
    #   con.close if con
    # end
  end

end