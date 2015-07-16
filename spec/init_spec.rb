require 'spec_helper'

describe "Init" do
    before :all do
        @json = '{"files":["index.html",".markwiki.cfg"],"css":{"dir_name":"css","files":["styles.css"]},"js":{"dir_name":"js","files":["scripts.js"]},"img":{"dir_name":"img","files":[]}}'
        @pjson = "{\n  \"files\": [\n    \"index.html\",\n    \".markwiki.cfg\"\n  ],\n  \"css\": {\n    \"dir_name\": \"css\",\n    \"files\": [\n      \"styles.css\"\n    ]\n  },\n  \"js\": {\n    \"dir_name\": \"js\",\n    \"files\": [\n      \"scripts.js\"\n    ]\n  },\n  \"img\": {\n    \"dir_name\": \"img\",\n    \"files\": [\n\n    ]\n  }\n}"
        @default_config = {
            "name" => "markwiki",
            "files" => ["index.html", ".markwiki.cfg"],
            "css" => {
                "dir_name" => "css",
                "files" => ["styles.css"]
            },
            "js" => {
                "dir_name" => "js",
                "files" => ["scripts.js"]
            },
            "img" => {
                "dir_name" => "img",
                "files" => []
            }
        }
        @config = {
            "name" => "my-cool-site",
            "files" => ["index.html", "404.html", ".markwiki.cfg"],
            "css" => {
                "dir_name" => "styles",
                "files" => ["styles.css"]
            },
            "js" => {
                "dir_name" => "scripts",
                "files" => ["scripts.js"]
            },
            "img" => {
                "dir_name" => "images",
                "files" => []
            }
        }
    end
    
    it "can generate a json configuration" do
        expect(Markwiki::Init.generate_json_config).to eq(@json)
    end

    it "can generate a pretty json configuration" do
        expect(Markwiki::Init.generate_pretty_json_config).to eq(@pjson)
    end

    it "can generate a default configuration hash" do
        expect(Markwiki::Init.default_config).to eq(@default_config)
    end

    it "can generate a configuration hash" do
        expect(Markwiki::Init.generate_config(
            name: "my-cool-site",
            files: ["index.html", "404.html"],
            css: "styles",
            js: "scripts",
            img: "images"
            )).to eq(@config)
    end

    it "can load the default configuration file" do
        expect(Markwiki::Init.load_default_config).to eq(@default_config)
    end
end
