# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :rvm => %w(1.8.7 1.9.2 rbx) do

  watch(%r{^lib/(.+)\.rb$})           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/(.+)\.rb$})  { "spec" }
  watch('spec/spec_helper.rb')        { "spec" }

end
