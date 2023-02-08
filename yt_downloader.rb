# Description: Download videos from youtube using youtube-dl and ruby
# Author: @RumanKazi
# Date: 2015-01-01
# Version: 1.0
# Usage: ruby yt_downloader.rb

require 'youtube-dl'
require 'progressbar'

class YoutubeDownloader
    def initialize(url)
        @url = url
    end

    def Download
        puts "Downloading video and audio from #{@url}"

        video_options = {
            output: 'video.%(ext)s',
            format: 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best',
    }
    audio_options = {
            output: 'audio.%(ext)s',
            format: 'bestaudio/best',
    }

    video = YoutubeDl.download(@url, video_options)
    audio = YoutubeDl.download(@url, audio_options)

    puts "Video and audio saved to #{File.dirname(video)}"
    end
end

if $POGRAM_NAME == __FILE__
    puts "Enter youtube url: "
    url = gets.chomp
    YoutubeDownloader.new(url).Download
end