describe 'User Interface', type: :feature do

  before do 
    visit('/bookmarks')
  end

  context 'I want to see a list of bookmarks' do

    it 'shows bookmarks' do
      p "I am being run"
      expect(page).to have_content("bookmark")
    end

  end

end