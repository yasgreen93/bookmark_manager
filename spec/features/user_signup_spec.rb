feature 'User signup' do

  scenario 'User signs up with matching passwords' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome! whatever@gmail.com')
    expect(User.first.address).to eq('whatever@gmail.com')
  end

  scenario 'No user is created when passwords do not match' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario 'User cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'Cannot sign up withan invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end
end
