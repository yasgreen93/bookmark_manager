feature 'User signup' do

  scenario 'User signs up with matching passwords' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome! whatever@gmail.com')
    expect(User.first.address).to eq('whatever@gmail.com')
  end

  scenario 'No user is created when passwords do not match' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'User cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Address must not be blank')
  end

  scenario 'Cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Address has an invalid format')
  end

  scenario 'Cannot sign up with an already registered address' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Address is already taken')
  end
end
