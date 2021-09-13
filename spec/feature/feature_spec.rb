describe 'User Interface', type: :feature do

  before do 
    visit('/')
    visit('/bookmarks')
  end

  context 'I want to see a list of bookmarks' do

    it 'shows bookmarks' do
      expect(page).to have_content("bookmark_one")
      expect(page).to have_content("bookmark_two")
    end

  end

end