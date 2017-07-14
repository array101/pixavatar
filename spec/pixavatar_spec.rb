require 'spec_helper'

describe Pixavatar do	
  before do
    @pixavatar = Pixavatar.new('hello')
  end
	
  context 'instantiate' do
    it "assigns color RGB hash" do
      expect(@pixavatar.avatar).to have_key(:color)
    end
    
    it "assigns grid value" do
      expect(@pixavatar.avatar).to have_key(:grid)
    end
  end

end
