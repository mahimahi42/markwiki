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

    class Init
        def self.init_site(site_name)
            
        end

        def generate_json_config
            Markdown::CONFIG.to_json
        end
    end
end
