
describe 'User Interface', type: :feature do

  before do
    visit('/bookmarks')
  end
  
  context 'I want to see a list of bookmarks' do
    
    it 'shows bookmarks' do
      expect(page).to have_content("http://www.google.com")
      expect(page).to have_content("http://www.destroyallsoftware.com")
      expect(page).to have_content("http://www.makersacademy.com")
    end

  end

  context 'I would like to add bookmarks' do

    it 'checks that new data added to the database renders on screen' do
      click_button('Add Bookmark')
      fill_in('url', :with => 'www.instagram.com')
      click_button('Submit')
      expect(page).to have_content("www.instagram.com")
    end

  end
  

end