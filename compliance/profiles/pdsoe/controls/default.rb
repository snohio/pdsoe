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

control 'OpenEdge 12.2 Install' do
  impact 0.7
  title 'OpenEdge 12.2 Should be Installed'

  describe package('OpenEdge 12.2 (64-bit)') do
    it { should be_installed }
    its('version') { should cmp > '12' }
  end

  describe file('c:\Progress\OpenEdge\version') do
    its('content') { should include '12.2.9' }
  end
end
