require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test 'can not create char without login' do
    get '/chars/new'
    follow_redirect!
    assert_equal '/users/sign_in', path
  end

  test 'register and surf website' do
  # При создании юзера я сразу вхожу в систему за него
    post '/users', params: { user: {nickname:'Example', email: 'hello@123.com', password: '123456', password_confirmation: '123456'} }
  # Проверяем, что теперь можно добавлять персонажа
  # В отличие от предыдущего теста
    get '/chars/new'
    assert_response :success
    assert_equal '/chars/new', path
  # Мы также можем смотреть имеющихся у нас персонажей
    get '/chars'
    assert_response :success
    assert_equal '/chars', path

  # Проверяем, что теперь можно сравнить персонажей
    get '/compare/input'
    assert_response :success
    assert_equal '/compare/input', path

  # Проверяем, что теперь можно посмотреть персонажей другого игрока
    get '/lookchar/input'
    assert_response :success
    assert_equal '/lookchar/input', path

  end

  test 'cant login, if user us not exist' do
  # Неудачная попытка входа. Такого юзера не существует.
    post '/users/sign_in', params: { user: { nickname:'rwtrtw', email: 'dfbdfbjhbjh@fjfj.com', password: 'ffjhfffff' }, commit: 'Login' }
    assert_response :success
    assert_equal '/users/sign_in', path
# По-прежнему не можем зайти в игру
    get '/chars/new'
    follow_redirect!
    assert_equal '/users/sign_in', path
  end

  test 'sucsessful login' do
  # Создаем юзера, но не заходим в систему.
    user = User.new(nickname: 'Hello', email: 'f@f.com', password: 'ffffff', password_confirmation: 'ffffff')
    user.save
  # Входим
    post '/users/sign_in', params: { user: { email: 'f@f.com', password: 'ffffff' }, commit: 'Login' }
  # Проверяем, что теперь можно добавлять персонажа
  # В отличие от предыдущего теста
    get '/chars/new'
    assert_response :success
    assert_equal '/chars/new', path
  # Мы также можем смотреть имеющихся у нас персонажей
    get '/chars'
    assert_response :success
    assert_equal '/chars', path

  # Проверяем, что теперь можно сравнить персонажей
    get '/compare/input'
    assert_response :success
    assert_equal '/compare/input', path

  # Проверяем, что теперь можно посмотреть персонажей другого игрока
    get '/lookchar/input'
    assert_response :success
    assert_equal '/lookchar/input', path
  end

  test 'unsucsessful login (wrong password)' do
  # Создаем юзера, но не заходим в систему.
    user = User.new(nickname: 'Hellou', email: 'f@f.com', password: 'ffffff', password_confirmation: 'ffffff')
    user.save
  # Входим
    post '/users/sign_in', params: { user: { email: 'f@f.com', password: 'fffvuidfvhfff' }, commit: 'Login' }
  # Проверяем, что мы не можем добавить персонажа
    get '/chars/new'
    follow_redirect!
    assert_equal '/users/sign_in', path
  end

  test 'unsucsessful login (wrong email)' do
  # Создаем юзера, но не заходим в систему.
    user = User.new(nickname: 'Hellou', email: 'f@f.com', password: 'ffffff', password_confirmation: 'ffffff')
    user.save
  # Входим
    post '/users/sign_in', params: { user: { email: 'f@fkdfjkf.com', password: 'fffvuidfvhfff' }, commit: 'Login' }
  # Проверяем, что мы не можем добавить персонажа
    get '/chars/new'
    follow_redirect!
    assert_equal '/users/sign_in', path
  end

end