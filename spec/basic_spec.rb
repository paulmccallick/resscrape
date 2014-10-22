require 'chefspec'

describe 'what is up' do
  let(:chef_run) { ChefSpec::Runner.new(step_into: ['resscrape_parent'], log_level: :info).converge('resscrape::default','resscrape::nefault') }

  it 'creates the template' do
    expect(chef_run).to create_template('iisconfig')
    expect(chef_run).to render_file('iisconfig').with_content(/^hi there(.+)$/)
  end

end
