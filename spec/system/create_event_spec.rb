require 'rails_helper.rb'

RSpec.describe 'Creating an event', type: :system do
  context 'with valid inputs' do
    it "shows the user's page with the name of the event listed" do
      user = User.create(name: 'Jimbob', email: 'test@example.com', password: '123456')
      sign_in user
      visit root_url
      click_on 'My Events'
      click_on 'Create New Event'
      fill_in 'Event Name', with: 'STUDY GROUP TEST'
      fill_in 'Location', with: 'My Crib'
      click_on 'Create a New One'
      expect(page).to have_content 'I host the following events:'
      expect(page).to have_link 'STUDY GROUP TEST'
    end
  end
end

