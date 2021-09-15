require 'bookmark'
describe Bookmark do

  context 'I want to see a list of bookmarks' do
    
    it 'stores an array of bookmarks' do
      expect(described_class.all).to be_kind_of(Array)
    end

    it 'checks add method exists' do
      expect(described_class).to respond_to(:add).with(1).argument
    end
    
  end

end