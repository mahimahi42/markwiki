require 'spec_helper'

describe "Init" do
    it "can generate a json configuration" do
        json = '{"files":["index.html",".markwiki.cfg"],"css":{"dir_name":"css","files":["styles.css"]},"js":{"dir_name":"js","files":["scripts.js"]},"img":{"dir_name":"img","files":[]}}'
        expect(Markwiki::Init.generate_json_config).to eq(json)
    end
end
