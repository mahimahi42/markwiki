require 'spec_helper'

describe Markwiki::Configuration do
  it 'can be created' do
    config = Markwiki::Configuration.new
    expect(config).not_to eq(nil)
  end

  describe 'default configuration' do
    before :each do
      @config = Markwiki::Configuration.new
    end

    after :each do
      @config = nil
    end

    it 'has the default name' do
      expect(@config["name"]).to eq("markwiki")
    end

    describe 'default top-level files' do
      it 'has the default index page' do
        expect(@config["files"].include? "index.html").to eq(true)
      end

      it 'has the default configuration file' do
        expect(@config["files"].include? ".markwiki.cfg").to eq(true)
      end
    end

    describe 'default subdirectories' do
      before :all do
        @css = {"dir_name" => "css", "files" => ["styles.css"]}
        @js =  {"dir_name" => "js", "files" => ["scripts.js"]}
        @img = {"dir_name" => "img", "files" => []}
      end

      it 'has the default css folder' do
        expect(@config["folders"].include? @css).to eq(true)
      end      

      it 'has the default js folder' do
        expect(@config["folders"].include? @js).to eq(true)
      end

      it 'has the default img folder' do
        expect(@config["folders"].include? @js).to eq(true)
      end
    end
  end
end
