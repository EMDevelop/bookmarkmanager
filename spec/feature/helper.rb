def fill_urls
  connection = PG.connect :dbname => ENV['DB_TEST_NAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
  connection.exec("TRUNCATE bookmarks;")
  Bookmark.add( url: 'http://www.makersacademy.com', title: 'Makers Academy')
  Bookmark.add( url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
  Bookmark.add( url: 'http://www.google.com', title: 'Google')
end

def select_all_from(table:, id:) 
  connection = PG.connect :dbname => ENV['DB_TEST_NAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end