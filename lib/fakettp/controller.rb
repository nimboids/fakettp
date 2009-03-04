require 'sinatra'
Sinatra::Default.set :run, false
Sinatra::Default.set :environment, ENV['RACK_ENV']

error do
  request.env['sinatra.error'].inspect
end

post '/expect' do
  Fakettp::Simulator << request.body.read
  content_type 'text/plain'
  "Expect OK\n"
end

post '/reset' do
  Fakettp::Simulator.reset
  content_type 'text/plain'
  "Reset OK\n"
end

get '/verify' do
  content_type 'text/plain'
  if Fakettp::Simulator.verify
    "Verify OK\n"
  else
    throw :halt, [500, Fakettp::Simulator.list_errors]
  end
end

[:get, :post, :put, :delete, :head].each do |method|
  send method, '/**' do
    begin
      Fakettp::Simulator.handle_request
    rescue Fakettp::Expectation::Error => e
      Fakettp::Simulator.record_error e
      content_type 'text/plain'
      throw :halt, [500, "Simulator received mismatched request\n"]
    end
  end
end