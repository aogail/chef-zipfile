require 'serverspec'
require 'digest'

set :backend, :exec

current_path = ''
%w(/tmp/to_extract to_extract test integration extract serverspec).each do |path_part|
  current_path = ::File.join(current_path, path_part)
  describe file(current_path) do
    it { is_expected.to exist }
    it { is_expected.to be_directory }
  end
end

describe file(::File.join(current_path, 'extract_spec.rb')) do
  it { is_expected.to exist }
  it { is_expected.to be_file }
  its(:sha256sum) { is_expected.to eq(Digest::SHA256.file(__FILE__).to_s) }
end
