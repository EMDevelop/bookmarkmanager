require 'bookmark'
describe Bookmark do

  context 'I want to see a list of bookmarks' do
    
    it 'stores an array of bookmarks' do
      expect(described_class.all).to be_kind_of(Array)
    end
  end

end