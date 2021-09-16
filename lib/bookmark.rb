require 'dotenv'
require 'pg'

class Bookmark

  Dotenv.load

  def self.all 
    assign_database
    begin
      con = PG.connect :dbname => @env, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
      result = con.exec("SELECT * FROM bookmarks;")
      result.map { |row| Bookmark.new(id: row['id'], title: row['title'], url: row['url'] ) }
    rescue PG::Error => e
      puts e.message 
    ensure
      con.close if con
    end
  end

  def self.add(url:, title:)
    assign_database
    begin
      con = PG.connect :dbname => @env, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
      result = con.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
      Bookmark.new(id: result[0]['id'], title:result[0]['title'], url:result[0]['url'])
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

   attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

end