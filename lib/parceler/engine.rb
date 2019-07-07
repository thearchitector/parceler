module Parceler
    class Engine
        def initialize(config)
            @args = [config.entry_point, "--out-dir", config.destination]
            @args.append("--cache-dir") if config.cache.present?
            @args.append("--no-source-maps") if !config.source_maps
            @args.append("--no-content-hash") if !config.content_hashing
            @args.append("--no-autoinstall") if !config.autoresolve
            @args.append("--no-minify") if !config.minify
            @args.append("--experimental-scope-hoisting") if config.tree_shaking
        end

        def getcmd(cmd = '')
            return "yarn run parcel #{cmd} #{@args.join(' ')}"
        end

        def execute(cmd = '')
            exec(self.getcmd(cmd))
        end
    end
end