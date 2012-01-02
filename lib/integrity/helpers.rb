require "integrity/helpers/authorization"
require "integrity/helpers/breadcrumbs"
require "integrity/helpers/pretty_output"
require "integrity/helpers/rendering"
require "integrity/helpers/resources"
require "integrity/helpers/urls"

module Integrity
  module Helpers
    include Authorization, Breadcrumbs, PrettyOutput,
      Rendering, Resources, Urls

    include Rack::Utils
    alias :h :escape_html
    
    
    def build_time(build)
      
      (build.completed_at.to_i - build.started_at.to_i)
    end
    
    def show_login?
      Integrity.config.protected? && !authorized?
    end
  end
end
