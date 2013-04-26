def login(user)
  visit root_path
  fill_in 'login_email', with: user.email
  fill_in 'login_password', with: '123'
  click_button 'Login'
end
