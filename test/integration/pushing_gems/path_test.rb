require_relative '../../test_helper'

class PathTest < HetznerGeminabox::TestCase
  url "http://localhost/foo"

  app do
    map "/foo" do
      run HetznerGeminabox::Server
    end
  end

  should_push_gem
end

class PathWithTrailingSlashTest < HetznerGeminabox::TestCase
  url "http://localhost/foo/"

  app do
    map "/foo" do
      run HetznerGeminabox::Server
    end
  end

  should_push_gem
end
