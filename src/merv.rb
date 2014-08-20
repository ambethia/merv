class Merv
  PORT = '8000'

  def initialize
    @server = TCPServer.new(PORT)
    puts "Listening on port #{PORT}..."
  end

  def handle(socket)
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
  end

  def run
    while socket = @server.accept do
      begin
        handle socket
      rescue Exception => e
        puts "Error: #{e.message}"
        puts "> " + e.backtrace.join("\n> ")
      ensure
        socket.close
      end
    end
  end
end
