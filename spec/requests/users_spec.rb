require 'spec_helper'

describe "Users" do
  describe "signup" do

    describe "failure" do

      it "should not make a new user" do
        visit register_path
        fill_in "Last Name",         :with => ""
        fill_in "Email",        :with => ""
        fill_in "Password",     :with => ""
        fill_in "Confirmation", :with => ""
        click_button
        response.should render_template('users/new')
        response.should have_selector("div#error_explanation")
      end
    end

    describe "success" do

      it "should make a new user" do
        lambda do
          visit register_path
          fill_in :user_first_name,    :with=>"Ima"
          fill_in "Last Name",         :with => "stinky"
          fill_in "Email",        :with => "ray@baha.com"
          fill_in "Password",     :with => "randy99"
          fill_in "Confirmation", :with => "randy99"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)

      end
    end
  end

end
