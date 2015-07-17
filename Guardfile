guard 'rspec', cmd: 'rspec --color --format progress --format doc --out output.rspec' do
    # watch /lib/ files
    watch(%r{^lib/(.+)\.rb$}) do |m|
        file = m[1].split("/")
        "spec/#{file.last}_spec.rb"
        #"spec"
    end

    # watch /spec/ files
    watch(%r{^spec/(.+)\.rb$}) do |m|
        "spec/#{m[1]}.rb"
    end
end
