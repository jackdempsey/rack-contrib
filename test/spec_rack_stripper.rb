require 'test/spec'
require 'rack/mock'

require 'rack/contrib/stripper'

context "Rack::Stripper" do

  specify "should strip whitespace off param values" do
    app = lambda { |env| [200, {'Content-Type' => 'text/plain'}, Rack::Request.new(env).POST] }
    env = env_for_post_with_headers('/', {'Content_Type'.upcase => 'application/json'}, {:body => "asdf  "})
    body = Rack::Stripper.new(app).call(env).last
    body['body'].should.equal "asdf"
  end
end

def env_for_post_with_headers(path, headers, body)
  Rack::MockRequest.env_for(path, {:method => "POST", :input => body}.merge(headers))
end
