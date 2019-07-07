require 'posix/spawn'

module Parceler
	class Railtie < ::Rails::Railtie
		railtie_name :parceler

		rake_tasks do
			load 'parceler/tasks.rake'
		end

		# Parcel's HMR server should only be used in development mode, so we restrict it
		if Rails.env.development? && defined?(Rails::Server)
			initializer "parceler.start_hmr" do |app|
				app.config.after_initialize do
					puts "\033[36m~~~ Launching a Parcel server for hot compliation ~~~\033[0m"

					if Parceler.engine.nil?
						Parceler.configure do |c|
							puts "\033[31m -> No configuration found. Falling back to defaults...\033[0m"
						end
					end

					pid = POSIX::Spawn::spawn(Parceler.engine.getcmd(:watch))

					# Wait for the parent (Rails server) to die, and then kill the child process
					#
					# NOTE: We cannot use Signal.trap here because it does not automatically respect
					# previously defined handlers, and thus Rails does not pass the event onto Parceler.
					at_exit do
						puts "\033[1m~~~ Gracefully stopping the Parcel watch server ~~~\033[0m"
						Process.kill("SIGKILL", pid)
						Process.waitpid(pid)
						puts "=== parceler shutdown: #{Time.now.strftime("%Y-%m-%d %H:%M:%S %z")} ==="
						puts "\033[36mAu revoir!\033[0m"
						exit
					end
				end
			end
		end
	end
end