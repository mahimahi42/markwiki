require 'spec_helper'

describe "Init" do
    before :all do
        @json = '{"files":["index.html",".markwiki.cfg"],"css":{"dir_name":"css","files":["styles.css"]},"js":{"dir_name":"js","files":["scripts.js"]},"img":{"dir_name":"img","files":[]}}'
        @pjson = "{\n  \"files\": [\n    \"index.html\",\n    \".markwiki.cfg\"\n  ],\n  \"css\": {\n    \"dir_name\": \"css\",\n    \"files\": [\n      \"styles.css\"\n    ]\n  },\n  \"js\": {\n    \"dir_name\": \"js\",\n    \"files\": [\n      \"scripts.js\"\n    ]\n  },\n  \"img\": {\n    \"dir_name\": \"img\",\n    \"files\": [\n\n    ]\n  }\n}"
    end
    
    it "can generate a json configuration" do
        expect(Markwiki::Init.generate_json_config).to eq(@json)
    end

    it "can generate a pretty json configuration" do
        expect(Markwiki::Init.generate_pretty_json_config).to eq(@pjson)
    end
end
