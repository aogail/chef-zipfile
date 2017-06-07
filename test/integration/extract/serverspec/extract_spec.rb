require 'serverspec'
require 'digest'

is_windows = RUBY_PLATFORM =~ /mswin|cygwin|wince|mingw/

if is_windows
  set :backend, :cmd
  set :os, family: 'windows'
else
  set :backend, :exec
end

%w(/tmp/to_extract /tmp/to_extract_overwrite /tmp/into/nonexistent_parent/a/b/c/d/e/f).each do |into_dir|
  current_path = ''
  %W(#{into_dir} to_extract test integration extract serverspec).each do |path_part|
    current_path = ::File.join(current_path, path_part)
    describe file(current_path) do
      it {is_expected.to exist} unless is_windows
      it {is_expected.to be_directory}
    end
  end

  describe file(::File.join(current_path, 'extract_spec.rb')) do
    it {is_expected.to exist} unless is_windows
    it {is_expected.to be_file}
    its(:sha256sum) {is_expected.to eq(Digest::SHA256.file(__FILE__).to_s)} unless is_windows
  end
end
