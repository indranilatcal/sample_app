include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def fill_signupinfo(userattributes = {})
	fill_in "Name", with: userattributes[:name]
	fill_in "Email", with: userattributes[:email]
	fill_in "Password", with: userattributes[:password]
	fill_in "Confirmation", with: userattributes[:password_confirmation]
end