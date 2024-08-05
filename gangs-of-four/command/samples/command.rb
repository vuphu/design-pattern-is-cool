class Command
    def execute
        raise NotImplementedError, 'Subclasses must implement the execute method'
    end
end

class MusicPlayer
    def play
        puts "Music is playing"
    end

    def stop
        puts "Music stopped"
    end

    def pause
        puts "Music paused"
    end
end

class PlayMusicCommand < Command
    def initialize(player: MusicPlayer)
        @player = player
    end

    def execute
        @player.play
    end
end

class StopMusicCommand < Command
    def initialize(player: MusicPlayer)
        @player = player
    end

    def execute
        @player.stop
    end
end

class PauseMusicCommand < Command
    def initialize(player: MusicPlayer)
        @player = player
    end

    def execute
        @player.pause
    end
end

class RemoteControl
    def initialize
        @command = nil
    end

    def set_command(command)
        @command = command
    end

    def press_button
        @command.execute
    end
end

if __FILE__ == $PROGRAM_NAME
    player = MusicPlayer.new

    play_music = PlayMusicCommand.new(player: player)
    stop_music = StopMusicCommand.new(player: player)
    pause_music = PauseMusicCommand.new(player: player)

    remote = RemoteControl.new

    remote.set_command(play_music)
    remote.press_button

    remote.set_command(pause_music)
    remote.press_button

    remote.set_command(stop_music)
    remote.press_button
end
  