def fill_urls
    connection = PG.connect :dbname => ENV['DB_TEST_NAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
    connection.exec("TRUNCATE bookmarks;")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
end