# @author Bryce Davis
module Markwiki
  class Configuration
    attr_reader :name, :files, :subdirs

    def initialize(name: "markwiki",
                   files: ["index.html", ".markwiki.cfg"])
      @name = name
      @files = files
    end

    def [](key)
      return @name if key.eql? "name"
      return @files if key.eql? "files"

      return nil
    end
  end
end
