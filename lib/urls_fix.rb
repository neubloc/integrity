# we will ignore port (use always default 80) and http://


module UrlsFix
  # Copyright (MIT) Eric Kidd -- http://github.com/emk/sinatra-url-for
  #
  # Construct a link to +url_fragment+, which should be given relative to
  # the base of this Sinatra app.  The mode should be either
  # <code>:path_only</code>, which will generate an absolute path within
  # the current domain (the default), or <code>:full</code>, which will
  # include the site name and port number.  (The latter is typically
  # necessary for links in RSS feeds.)  Example usage:
  #
  #   url_for "/"            # Returns "/myapp/"
  #   url_for "/foo"         # Returns "/myapp/foo"
  #   url_for "/foo", :full  # Returns "http://example.com/myapp/foo"
  #--
  # See README.rdoc for a list of some of the people who helped me clean
  # up earlier versions of this code.
  def url_for url_fragment, mode=:path_only
    case mode
    when :path_only
      base = request.script_name
    when :full
      base = "http://#{request.host}#{request.script_name}"
    else
      raise TypeError, "Unknown url_for mode #{mode}"
    end
    "#{base}#{url_fragment}"
  end
end

Integrity::App.send(:include, UrlsFix)