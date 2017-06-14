require 'json'
require 'uri'

module HetznerGeminabox
  module RubygemsDependency

    class << self

      def for(*gems)

        url = [
          rubygems_uri,
          '?gems=',
          gems.map(&:to_s).join(',')
        ].join
        body = HetznerGeminabox.http_adapter.get_content(url)
        Marshal.load(body)
      rescue Exception => e
        return [] if HetznerGeminabox.allow_remote_failure
        raise e
      end

      def rubygems_uri
        URI.join(HetznerGeminabox.bundler_ruby_gems_url, '/api/v1/dependencies')
      end

    end
  end
end

