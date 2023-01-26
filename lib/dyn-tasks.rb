require 'filewatcher'
#if RUBY_VERSION >= "2.4"
class FileWatcher < Filewatcher
end
#end


module DynTasks

def DynTasks.home
	dyntask_home = File.join(ENV['HOME'],'dyntask')
	dyntask_home = File.read(File.join(ENV['HOME'],'.dyntask_home')).strip if File.exist? File.join(ENV['HOME'],'.dyntask_home')
	dyntask_home = File.expand_path(dyntask_home)
	#puts "dyntask_home: "+ dyntask_home
	dyntask_home
end

def DynTasks.home=(value)
	File.open(File.join(ENV['HOME'],'.dyntask_home'),"w") do |f|
		f << value.strip
	end
end


def DynTasks.filewatcher(cfg={}) #cfg

	dyntasks_root= File.join(DynTasks.home, "reactzone")
	FileUtils.mkdir_p dyntasks_root

	puts "watching tasks inside "+ dyntasks_root
	::FileWatcher.new(dyntasks_root).watch() do |filename, event|
	  ##DEBUG: 
	  puts filename + "->" + event.to_s+"\n"
	  if [:changed,:updated,:new].include? event 
		case File.extname(filename)
		when ".rb"
			system("/usr/bin/env ruby "+filename)
		when ".sh"
			system("/usr/bin/env bash "+filename)
		end

	  end
	end
end
end