use_inline_resources

def whyrun_supported
  true
end

action :extract do
  install_rubyzip_gem
  Zip.on_exists_proc = new_resource.overwrite
  converge_by "Extracting #{new_resource.from} into #{new_resource.into}" do
    ::Zip::File.open(new_resource.from) do |zip|
      zip.each do |zipentry|
        folder = ::File.join(new_resource.into, ::File.dirname(zipentry.name))
        unless ::Dir.exist?(folder)
          ::FileUtils.mkpath folder
        end
        destination = ::File.join(new_resource.into, zipentry.name)
        zip.extract(zipentry, destination)
      end
    end
  end
end

private

def install_rubyzip_gem
  chef_gem 'rubyzip' do
    action :install
    compile_time true
  end
  require 'zip'
  require 'fileutils'
end
