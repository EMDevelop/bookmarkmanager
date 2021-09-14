describe 'User Interface', type: :feature do

  before do 
    visit('/bookmarks')
  end

  context 'I want to see a list of bookmarks' do

    it 'shows bookmarks' do
      save_and_open_page
      expect(page).to have_content("http://www.google.com")
      expect(page).to have_content("http://www.destroyallsoftware.com")
      expect(page).to have_content("http://www.makersacademy.com/")
    end

  end

end