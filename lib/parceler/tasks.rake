namespace :parcel do
    desc 'Launches a Parcel process for proactive compilation'
    task watch: :environment do
        Parceler.engine.execute(:watch)
    end

    desc 'Builds a production-ready asset package using Parcel'
    task build: :environment do
        Parceler.engine.execute(:build)
    end
end

Rake::Task['assets:precompile'].enhance do
    Rake::Task['parcel:compile'].invoke
end

Rake::Task['assets:clobber'].enhance do
    Rake::Task['parcel:clobber'].invoke
end