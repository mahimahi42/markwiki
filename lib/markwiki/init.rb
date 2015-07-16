require 'json' # For JSON parsing

module Markwiki
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

    class Markwiki::Init
        def self.init_site(site_name)
            
        end

        def self.generate_json_config
            Markwiki::CONFIG.to_json
        end

        def self.generate_pretty_json_config
            JSON.pretty_generate Markwiki::CONFIG
        end
    end
end
