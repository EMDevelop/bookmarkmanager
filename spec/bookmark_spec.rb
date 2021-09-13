require 'bookmark'
describe Bookmark do

  context 'I want to see a list of bookmarks' do
    
    it 'stores an array of bookmarks' do
      expect(described_class.all).to eq ['bookmark_one', 'bookmark_two']
    end
    
  end

end