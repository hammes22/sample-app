require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(
      name: 'Example User', email: 'user@example.com',
      password: 'foobar', password_confirmation: 'foobar'
    )
  end

  test 'deve ser válido' do
    assert @user.valid?
  end

  test 'nome deve estar presente' do
    @user.nome = '   '
    assert_not @user.valid?
  end

  test 'o e-mail deve estar presente' do
    @user.email = '  '
    assert_not @user.valid?
  end

  test 'o email não deve ser muito longo' do
    @user.email = 'a' * 244 + '@exemplo.com'
    assert_not @user.valid?
  end

  test 'validação de e-mail deve aceitar endereços válidos' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} deve ser válido"
    end
  end
  test 'a validação de email deve rejeitar testes invalidos' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@exemple.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} deve ser invalido"
    end
  end

  test 'endereço de email deve ser exclusivo' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  test 'endereços de e-mail devem ser salvos em letras minúsculas' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'a senha deve estar presente (não em branco)' do
    @user.password @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'a senha deve ter um comprimento mínimo' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
