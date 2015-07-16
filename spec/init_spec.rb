require 'spec_helper'

describe "Init" do
    before :all do
        @json = '{"files":["index.html",".markwiki.cfg"],"css":{"dir_name":"css","files":["styles.css"]},"js":{"dir_name":"js","files":["scripts.js"]},"img":{"dir_name":"img","files":[]}}'
        @pjson = "{\n  \"files\": [\n    \"index.html\",\n    \".markwiki.cfg\"\n  ],\n  \"css\": {\n    \"dir_name\": \"css\",\n    \"files\": [\n      \"styles.css\"\n    ]\n  },\n  \"js\": {\n    \"dir_name\": \"js\",\n    \"files\": [\n      \"scripts.js\"\n    ]\n  },\n  \"img\": {\n    \"dir_name\": \"img\",\n    \"files\": [\n\n    ]\n  }\n}"
        @yaml = "---\nname: my-cool-site\nfiles:\n- index.html\n- 404.html\ncss:\n  dir_name: styles\n  files:\n  - styles.css\njs:\n  dir_name: scripts\n  files:\n  - scripts.js\nimg:\n  dir_name: images\n  files: []\n"
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

    describe "creating directory structure" do
        before :all do
            @name = "testsite"
        end

        after :each do
            FileUtils.rm_rf(@name)
        end

        it "can create the site directory" do
            Markwiki::Init.init_site(@name)

            expect(Dir.exists? @name).to eq(true)
        end

        it "can create the css subdirectory" do
            Markwiki::Init.init_site(@name)
            expect(Dir.exists? "#{@name}/css").to eq(true)
        end

        it "can create the js subdirectory" do
            Markwiki::Init.init_site(@name)
            expect(Dir.exists? "#{@name}/js").to eq(true)
        end

        it "can create the img subdirectory" do
            Markwiki::Init.init_site(@name)
            expect(Dir.exists? "#{@name}/img").to eq(true)
        end

        it "can create the index page" do
            Markwiki::Init.init_site(@name)
            expect(File.exists? "#{@name}/index.html").to eq(true)
        end

        it "can create the configuration page" do
            Markwiki::Init.init_site(@name)
            expect(File.exists? "#{@name}/.markwiki.cfg").to eq(true)
        end

        it "can create the CSS file" do
            Markwiki::Init.init_site(@name)
            expect(File.exists? "#{@name}/css/styles.css").to eq(true)
        end

        it "can create the JavaScript file" do
            Markwiki::Init.init_site(@name)
            expect(File.exists? "#{@name}/js/scripts.js").to eq(true)
        end
        
        describe "custom configurations" do
            before :all do
                @name = "my-cool-site"
                @config = Markwiki::Init.generate_config(
                                                name: @name,
                                                files: ["index.html", "404.html"],
                                                css: "styles",
                                                js: "scripts",
                                                img: "images"
                                                )
            end

            it "can create the site directory" do
                Markwiki::Init.init_site(@name)

                expect(Dir.exists? @name).to eq(true)
            end

            it "can create the css subdirectory" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(Dir.exists? "#{@name}/styles").to eq(true)
            end

            it "can create the js subdirectory" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(Dir.exists? "#{@name}/scripts").to eq(true)
            end

            it "can create the img subdirectory" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(Dir.exists? "#{@name}/images").to eq(true)
            end

            it "can create the index page" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(File.exists? "#{@name}/index.html").to eq(true)
            end

            it "can create the 404 page" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(File.exists? "#{@name}/404.html").to eq(true)
            end

            it "can create the configuration page" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(File.exists? "#{@name}/.markwiki.cfg").to eq(true)
            end

            it "can create the CSS file" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(File.exists? "#{@name}/styles/styles.css").to eq(true)
            end

            it "can create the JavaScript file" do
                Markwiki::Init.init_site(@name, config: @config)
                expect(File.exists? "#{@name}/scripts/scripts.js").to eq(true)
            end
        end
    end
end
