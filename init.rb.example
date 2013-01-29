$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))
require 'rubygems'
begin
  require ".bundle/environment"
rescue LoadError
  require "bundler/setup"
end

require "integrity"

# Uncomment as appropriate for the notifier you want to use
# = Email
require "integrity/notifier/email"
# = Campfire
# require "integrity/notifier/campfire"
# = TCP
# require "integrity/notifier/tcp"
# = HTTP
# require "integrity/notifier/http"
# = Notifo
# require "integrity/notifier/notifo"
# = AMQP
# require "integrity/notifier/amqp"

Integrity.configure do |c|
  c.username     = "yourlogin"
  c.password     = "yourpassowrd"
  c.database     = "sqlite3:integrity.db"
  c.directory    = "builds"
  c.base_url     = "http://example.com"
  c.log          = "integrity.log"
  c.github_token = "SECRET"
  c.build_all    = false
  c.builder      = :threaded, 5
  c.project_default_build_count = 50
end
