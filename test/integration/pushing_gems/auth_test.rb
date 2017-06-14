require_relative '../../test_helper'

class AuthTest < HetznerGeminabox::TestCase
  url "http://foo:bar@localhost/"

  app do
    use Rack::Auth::Basic do |username, password|
      username == "foo" and password == "bar"
    end

    run HetznerGeminabox::Server
  end

  should_push_gem
end
