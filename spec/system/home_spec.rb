require 'rails_helper.rb'

RSpec.describe 'Homepage' do
  it 'shows heading' do
    visit root_path
    expect(page).to have_content 'List of Events In Town'
  end
end