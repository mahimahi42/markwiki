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

        # @todo Finish site initialization
        def self.init_site(site_name)
            
        end

        # Generate a JSON String representation of a Markwiki
        # site.
        #
        # @return [String] the Markwiki configuration as a JSON String
        def self.generate_json_config
            Markwiki::CONFIG.to_json
        end

        # Generate a prettified JSON String representation of a
        # Markwiki site.
        #
        # @return [String] the Markwiki configuration as a JSON String
        def self.generate_pretty_json_config
            JSON.pretty_generate Markwiki::CONFIG
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
            files: ["index.html"],
            css: "css",
            css_files: ["styles.css"],
            js: "js",
            js_files: ["scripts.js"],
            img: "img",
            img_files: [])
            {
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
