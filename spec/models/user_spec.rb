describe User do
  let(:user) do
    User.create(address: 'email@email.com',
                password: '1234',
                password_confirmation: '1234')
  end

  it 'authenticates when given a valid address and password on sign in' do
    authenticated_user = User.authenticate(user.address, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given invalid details on sign in' do
    expect(User.authenticate(user.address, 'wrong')).to be_nil
  end
end
