# @author Bryce Davis
module Markwiki
  class Configuration
    attr_reader :name, :files, :subdirs

    def initialize(name: "markwiki",
                   files: ["index.html", ".markwiki.cfg"],
                   folders: {
                     "css" => {"dir_name" => "css", "files" => ["styles.css"]},
                     "js" => {"dir_name" => "js", "files" => ["scripts.js"]},
                     "img" => {"dir_name" => "img", "files" => []}
                   })
      @name = name
      @files = files
      @folders = folders
    end

    def [](key)
      return @name if key.eql? "name"
      return @files if key.eql? "files"
      return @folders if key.eql? "folders"

      return nil
    end
  end
end
