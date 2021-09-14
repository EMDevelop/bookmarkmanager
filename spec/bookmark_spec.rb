require 'bookmark'
describe Bookmark do

  context 'I want to see a list of bookmarks' do
    
    it 'stores an array of bookmarks' do
      expect(described_class.all).to eq ['http://www.google.com', 'http://www.destroyallsoftware.com',"http://www.makersacademy.com"]
    end
    
  end

end