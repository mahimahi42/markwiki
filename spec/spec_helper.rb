require 'coveralls' # For Coveralls.io service
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'markwiki'
require 'fileutils' # For deleting directories
