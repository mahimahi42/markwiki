# @author Bryce Davis <me@bryceadavis.com>
require "markwiki/version"
require "markwiki/init"
require "jewel"

# Main driver for Markwiki
module Markwiki
	# Topmost API for Markwiki
	class Markwiki
		# Create a new Markwiki site
		def init_site(name)
			Markwiki::Init.init_site(name)
		end
	end
end
