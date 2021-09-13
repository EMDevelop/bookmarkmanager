describe 'User Interface', type: :feature do

  context 'I want to see a list of bookmarks' do

    it 'shows bookmarks' do
      visit('/bookmarks')
      # expect(page).to have_content("bookmark")
    end

  end

end