require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Aplicativo de amostra do tutorial Ruby on Rails'
  end

  # test 'should get root' do
  #   get FILL_IN 
  #   assert_response FILL_IN 
  # end

  test 'deve ser home' do
    get root_path
    assert_response :success
    assert_select 'title', "Aplicativo de amostra do tutorial Ruby on Rails"
  end

  test 'deve ser  help' do
    get help_path
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"
  end

  test 'deve ser sobre' do
    get about_path
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end

  test 'deve ser contato' do
    get contact_path
    assert_response :success
    assert_select 'title', "Contact | #{@base_title}"
  end
end
