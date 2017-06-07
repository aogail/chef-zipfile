require 'chefspec'
require 'chefspec/berkshelf'

describe 'zipfile_test::extract' do
  [['windows', '2012'], ['centos', '5.10']].each do |platform, version|
    context "on #{platform}" do
      subject(:chef_run) do
        ChefSpec::SoloRunner.new(platform: platform,
                                 version: version) do |node|
          node.normal['extract']['from'] = zip_path
          node.normal['extract']['into'] = output_path
          node.normal['overwrite']['from'] = zip_path
          node.normal['overwrite']['into'] = output_path
        end.converge(described_recipe)
      end

      let(:zip_path) { '/tmp/my_stuff.zip' }
      let(:output_path) { '/tmp/my_stuff' }

      it { is_expected.to extract_zipfile(zip_path)
                              .with_into(output_path) }
    end
  end
end
