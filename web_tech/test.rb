require 'webrick'#calls library installed with the gem
server = WEBrick::HTTPServer.new({ # webrcik instance created and stored in local vriable
  :DocumentRoot => '.', #domain setting of web appliction
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,#location of the ruby program to translate program
  :Port => '3000', # express entrance and exit of info on web program
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'try.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/quality.cgi', WEBrick::HTTPServlet::CGIHandler, 'quality.rb')
server.mount('/give_for.cgi', WEBrick::HTTPServlet::CGIHandler, 'give_for.rb')
server.start
