RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_breadcrumbs_after_signin do |user|
  match do |page|
  	expect(page).to have_link('Users')
    expect(page).to have_link('Profile', href: user_path(user))
    expect(page).to have_link('Settings')
    expect(page).to have_link('Sign out', href: signout_path)
  end
end

RSpec::Matchers.define :show_signup_validation_errors do
  match do |page|
  	expect(page).to have_content('Sign up')
    expect(page).to have_error_message('errors')
  	expect(page).to have_content("Name can't be blank")
  	expect(page).to have_content("Email can't be blank")
  	expect(page).to have_content("Email is invalid")
  	expect(page).to have_content("Password can't be blank")
  	expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end