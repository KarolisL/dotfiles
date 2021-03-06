#!/usr/bin/env ruby

# Given .in(put) and .sol(ution) files, generate clojure tests

if ARGV.length == 0
    fn_name = "MY-FN"
else
    fn_name = ARGV[0]
end

in_fnames = Dir['./*.in']

prefixes = in_fnames.map { |f| f.to_s.gsub('.in', '') }

in_files = in_fnames.map { |fname| File.open fname.to_s, 'r' }
sol_files = prefixes.map { |fname| File.open "#{fname}.sol", 'r' }

in_files.zip(sol_files).each do |files|
    in_file, sol_file = files
    input = in_file.read
    output = sol_file.read

    puts "(is (= \"#{output.strip.gsub(/\n/, '\\n')}\" (#{fn_name} \"#{input.strip.gsub(/\n/, '\\n')}\")))"


    sol_file.close
    in_file.close
end

