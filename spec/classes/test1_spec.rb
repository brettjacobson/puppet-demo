require 'spec_helper'

describe 'testdemo::test1' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { "service {'test2svc':}"}
      let(:params) do
        {
          notifications: [ref('Service', 'test2svc')]
        }
      end

      it { is_expected.to compile }
      it { is_expected.to contain_exec('sample-exec').that_notifies('Service[test2svc]') }
    end
  end
end
