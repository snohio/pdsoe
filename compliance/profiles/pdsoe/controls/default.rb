# copyright: 2022, Mike Butler

title 'Progress Developer Studio - Compliance Profile'

control 'pdsoe - prerequisits' do
  impact 0.7
  title 'PDS OE Prerequisites' 

  describe chocolatey_package('chocolatey') do
    it { should be_installed }
    its('version') { should cmp > '0.11' }
  end

  describe chocolatey_package('openjdk') do
    it { should be_installed }
    its('version') { should cmp > '18.0.0' }
  end
end
