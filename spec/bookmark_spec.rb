require 'bookmark'
describe Bookmark do

  context 'I want to see a list of bookmarks' do
    
    it 'stores an array of bookmarks' do
      expect(described_class.all).to be_kind_of(Array)
    end

    it 'checks add method exists' do
      expect(described_class).to respond_to(:add)
    end

  end

  context 'I would like to add bookmarks' do

    bookmark = Bookmark.add(url: 'www.instagram.com', title: 'Instagram')

    it 'checks .add can take 2 params' do
      expect(bookmark.url).to eq 'www.instagram.com'
    end

  end

end