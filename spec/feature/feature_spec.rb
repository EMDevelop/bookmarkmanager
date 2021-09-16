
describe 'User Interface', type: :feature do

  before do
    visit('/bookmarks')
  end
  
  context 'I want to see a list of bookmarks' do

    it 'checks links' do
      save_and_open_page
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
      expect(page).to have_link('Google', href: 'http://www.google.com')
    end

  end

  context 'I would like to add bookmarks' do

    it 'checks that new data added to the database renders on screen' do
      click_button('Add Bookmark')
      fill_in('url', :with => 'www.instagram.com')
      fill_in('title', :with => 'Instagram')
      click_button('Submit')
      expect(page).to have_content("Instagram")
    end

    it 'confirms data added was correct' do
      # We're aiming for Bookmark.add to return a Bookmark instance (bookmark)
      # The return value from the return * will be tested against. 
      bookmark = Bookmark.add(url: 'test_url', title: 'test_title')
      check_database_stored_data = PG.connect(:dbname => ENV['DB_TEST_NAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']).query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
    
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq check_database_stored_data.first['id']
      expect(bookmark.title).to eq 'test_title'
      expect(bookmark.url).to eq 'test_url' 
    end

  end
  

end