module ElevatorMedia
    class Streamer
        def initialize(options = {})
            @video_list = { rickroll: 'dQw4w9WgXcQ' }
        end
        def getContent(video_name)
            "<iframe id='player' type='text/html' width='640' height='390' style='position: relative; left: 28%;'
  src='http://www.youtube.com/embed/#{@video_list[video_name]}?enablejsapi=1&origin=http://example.com'
  frameborder='0'></iframe>"
        end
    end

    NewStreamer = Streamer.new
end
