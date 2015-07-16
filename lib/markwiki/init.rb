# @author Bryce Davis <me@bryceadavis.com>
require 'json' # For JSON parsing
require 'yaml' # For YAML parsing
require 'jewel' # For access to static resources

module Markwiki
    # The default Markwiki skeleton, to be converted to JSON.
    # Custom skeletons/configurations can be defined as Ruby Hashes
    # or JSON
    CONFIG = {
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

    # Wrapper class for Markwiki initialization
    class Init < Jewel::Gem
        root "../.."

        # Creates the Markwiki directory structure from a
        # configuration.
        #
        # @param site_name [String] the name of Markwiki site
        # @param config [Hash] a Markwiki configuration Hash
        def self.init_site(site_name, config: self.load_default_config)
            Dir.mkdir(site_name)

            # Create the directories
            config.each_key do |key|
                if config[key].is_a? Hash
                    Dir.mkdir(File.join(site_name, config[key]["dir_name"]))
                end
            end

            # Create the files
            config.each_key do |key|
                # We have top-level files
                if config[key].is_a? Array and key.eql? "files"
                    config[key].each do |file|
                        unless file.eql? ".markwiki.cfg"
                            #puts File.join(site_name, file)
                            FileUtils.touch(File.join(site_name, file))
                        end
                    end
                end

                # We have a subdirectory
                if config[key].is_a? Hash
                    config[key].each_key do |subdiropt|
                        if config[key][subdiropt].is_a? Array and subdiropt.eql? "files"
                            config[key][subdiropt].each do |file|
                                #puts File.join(site_name, config[key]["dir_name"], file)
                                FileUtils.touch(File.join(site_name, config[key]["dir_name"], file))
                            end
                        end
                    end
                end
            end

            # Path to default configuration
            if config.eql? self.load_default_config
                path = self.root.static(".markwiki.cfg").to_s
                FileUtils.cp(path, "#{site_name}")
            else
                File.open("#{site_name}/.markwiki.cfg", "w") do |file| 
                    file.write(self.generate_yaml_config(config))
                end
            end
        end

        def self.generate_yaml_config(config)
            YAML.dump(config)
        end

        # Generate a JSON String representation of a Markwiki
        # site.
        #
        # @return [String] the Markwiki configuration as a JSON String
        def self.generate_json_config
            CONFIG.to_json
        end

        # Generate a prettified JSON String representation of a
        # Markwiki site.
        #
        # @return [String] the Markwiki configuration as a JSON String
        def self.generate_pretty_json_config
            JSON.pretty_generate CONFIG
        end

        # Get a Hash representation of a default Markwiki
        # configuration
        #
        # @return [Hash] the default Markwiki configuration
        def self.default_config
            self.generate_config
        end

        # Get a Hash representation of an arbitrary Markwiki
        # configuration
        #
        # @param files [Array<String>] an Array of top-level filenames
        # @param css [String] the name of the CSS folder
        # @param css_files [Array<String>] an Array of CSS files
        # @param js [String] the name of the JavaScript folder
        # @param js_files [Array<String>] an Array of JavaScript files
        # @param img [String] the name of the images folder
        # @param img_files [Array<String>] an Array of image files
        # @return [Hash] a new Markwiki configuration Hash
        def self.generate_config(
            name: "markwiki",
            files: ["index.html"],
            css: "css",
            css_files: ["styles.css"],
            js: "js",
            js_files: ["scripts.js"],
            img: "img",
            img_files: [])
            {
                "name" => name,
                "files".to_s => files + [".markwiki.cfg"],
                "css".to_s => {
                    "dir_name" => css,
                    "files" => css_files
                },
                "js".to_s => {
                    "dir_name" => js,
                    "files" => js_files
                },
                "img".to_s => {
                    "dir_name" => img,
                    "files" => img_files
                }
            }
        end

        # Load the default Markwiki configuration file
        #
        # @return [Hash] the default configuration as a Hash
        def self.load_default_config
            config = nil
            path = self.root.static(".markwiki.cfg").to_s
            file = File.open(path, "r") { |file| 
                config = YAML.load(file)
            }
            config
        end
    end
end
