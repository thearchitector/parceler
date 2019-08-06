namespace :parceler do
    desc 'Installs the Parcel dependency with Yarn'
    task install: :environment do
        exec("yarn add parcel-bundler --dev")
    end

    desc 'Launches a Parcel process for proactive compilation'
    task watch: :environment do
        Parceler.engine.execute(:watch)
    end

    desc 'Builds a production-ready asset package using Parcel'
    task build: :environment do
        Parceler.engine.execute(:build)
    end
end

if Rake::Task.task_defined?('assets:precompile')
    Rake::Task['assets:precompile'].enhance do
        Rake::Task['parceler:compile'].invoke
    end
end

if Rake::Task.task_defined?('assets:clobber')
    Rake::Task['assets:clobber'].enhance do
        Rake::Task['parceler:clobber'].invoke
    end
end