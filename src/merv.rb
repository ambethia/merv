class Merv
  HOST = 'localhost' # TODO: load these from config
  PORT = '8000'

  def initialize
    @server = TCPServer.new(HOST, PORT)
    puts "Listening on #{HOST}:#{PORT}..."
  end

  def run
    while socket = @server.accept do
      begin
        puts socket.gets
        response = "Hello World!\n"
        socket.print [
          "HTTP/1.1 200 OK",
          "Content-Type: text/plain",
          "Content-Length: #{response.bytesize}",
          "Connection: close",
          "",
          response
        ].join("\r\n")
      rescue Exception => e
        puts "Error: #{e.message}"
        puts "> " + e.backtrace.join("\n> ")
      ensure
        socket.close
      end
    end
  end
end
