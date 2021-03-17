require 'spec_helper'

describe 'apache' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_class('apache::install') }
      it { is_expected.to contain_class('apache::config') }
      it { is_expected.to contain_class('apache::service') }
      it { is_expected.to compile }

      case os_facts[:osfamily]
      when 'Debian'
        it { is_expected.to contain_package('apache2').with_ensure('present') }
        it { is_expected.to contain_service('apache2').with(ensure: 'running', enable: true, hasrestart: true)}
      when 'RedHat'
        it { is_expected.to contain_package('httpd').with_ensure('present') }
        it { is_expected.to contain_service('httpd').with(ensure: 'running', enable: true, hasrestart: true)}
      end
    end
  end
end
