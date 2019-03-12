require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'Valid password' do
    user = User.create(nickname: 'Hello', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    assert(user.valid_password?('password123'))
  end

  test 'Create user and count users' do
    User.create(nickname: 'Helloe', email: 'testg@example.com', password: 'password123', password_confirmation: 'password123')
    assert_equal 2, User.all.count
  end

  test 'Create user and assert data' do
    User.create(nickname: 'Helloew', email: 'testfg@example.com', password: 'password123', password_confirmation: 'password123')
    assert_equal 'testfg@example.com', User.all.second[:email]
  end

  test 'Create 2 users with same email and count. Should be two users.' do
    User.create(nickname: 'Heloew', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    User.create(nickname: 'Hegloew',email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    assert_equal 2, User.all.count
  end

  test 'Create user with incorrect email and count. Should be one user.' do
    User.create(nickname: 'Heloew', email: 'ghgh', password: 'password123', password_confirmation: 'password123')
    assert_equal 1, User.all.count
  end

  test 'Create user without email and count and nickname. Should be one user.' do
    User.create(password: 'password123', password_confirmation: 'password123')
    assert_equal 1, User.all.count
  end

  test 'Password and confirmation are different.  Should be one user.' do
    User.create(nickname: 'Heloew', email: 'test@example.com', password: 'password123', password_confirmation: 'passord123')
    assert_equal 1, User.all.count
  end
end

