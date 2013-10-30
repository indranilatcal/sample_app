require 'spec_helper'

describe "Authentication" do

	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in') }
	end

	describe "sign in" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button 'Sign in' }

			it { should have_content('Sign in') }
			it { should have_error_message('Invalid') }

			describe "after visiting another page" do
				before { click_link "Home" }
				it { should_not have_error_message('Invalid') }
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before { valid_signin(user) }

			it { should have_title(user.name) }
			it { should have_breadcrumbs_after_signin(user) }
		end
	end
end
