require 'spec_helper'

describe Markwiki do
  before :all do
    @name = "markwiki"
  end

  it 'has a version number' do
    expect(Markwiki::VERSION).not_to be nil
  end

  describe 'creating a new Markwiki site' do
    before :all do
      Markwiki::Markwiki.init_site(@name)
    end

    after :all do
      FileUtils.rm_rf(@name)
    end
    
    it 'creates the top-level directory' do
      expect(Dir.exists? @name).to eq(true)
    end

    it 'creates the index page' do
      expect(File.exists? "#{@name}/index.html").to eq(true)
    end

    it 'creates the Markwiki configuration file' do
      expect(File.exists? "#{@name}/.markwiki.cfg").to eq(true)
    end
  end
end
