require 'date'

feature BirthdayGreeter do
  scenario 'When I land on the home page I want to be greeted' do
    visit '/'
    expect(page).to have_content "Hello there!"
  end

  scenario 'When I land on the home page I want to be wished happy birthday' do
    visit '/'
    fill_in 'name', with: "Chris"
    fill_in 'day', with: (Date.today).day
    fill_in 'month', with: (Date.today).month
    click_button 'Go!'
    expect(page).to have_content "Happy Birthday Chris!"
  end

  scenario 'When I land on the home page I want to know how many days to my birthday' do
    visit '/'
    fill_in 'name', with: "Chris"
    fill_in 'day', with: (Date.today + 65).day
    fill_in 'month', with: (Date.today + 65).month
    click_button 'Go!'
    expect(page).to have_content "Your birthday will be in 65 days, Chris"
  end

  scenario 'When I land on the home page I want to know how many days to my birthday' do
    visit '/'
    fill_in 'name', with: "Chris"
    fill_in 'day', with: (Date.today - 65).day
    fill_in 'month', with: (Date.today - 65).month
    click_button 'Go!'
    expect(page).to have_content "Your birthday will be in 300 days, Chris"
  end
end
