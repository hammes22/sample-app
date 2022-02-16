require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Aplicativo de amostra do tutorial Ruby on Rails'
  end

  # test 'should get root' do
  #   get FILL_IN 
  #   assert_response FILL_IN 
  # end

  test 'should get home' do
    get static_pages_home_url
    assert_response :success
    assert_select 'title', "Aplicativo de amostra do tutorial Ruby on Rails"
  end

  test 'should get help' do
    get static_pages_help_url
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"
  end

  test 'should get about' do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end

  test 'shoud get contact' do
    get static_pages_contact_url
    assert_response :success
    assert_select 'title', "Contact | #{@base_title}"
  end
end