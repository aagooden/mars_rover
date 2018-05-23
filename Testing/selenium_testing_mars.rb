require 'selenium-webdriver'
require 'test/unit'
require_relative "../app.rb"
# require_relative 'functions_for_testing.rb'
load '../local_env.rb' if File.exist?('../local_env.rb')


class LoginTesting < Test::Unit::TestCase

  def setup
    caps = Selenium::WebDriver::Remote::Capabilities.chrome #(chromeOptions: { args: [ "--headless" ]})
    @driver = Selenium::WebDriver.for :chrome, desired_capabilities:caps
    @driver.manage.window.maximize
    @driver.navigate.to("http://localhost:4567")
    @wait = Selenium::WebDriver::Wait.new(:timeout => 13)
  end

  def teardown
    # sleep 10
    @driver.close
  end

  def test_page
    # sleep 10
    actualURL = @driver.current_url
    assert_equal('http://localhost:4567/', actualURL, 'URL Did not match')
    @driver.find_element(:xpath, '/html/body/div/form/input[1]')
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/input[1]').displayed?} #grid x value



    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/input[2]').displayed?} #grid y value


    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/input[4]').displayed?} #rover1 x value

    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/input[4]').displayed?} #rover1 y value
    assert @wait.until{@driver.find_element(:xpath, '//*[@id="rover1_moves"]').displayed?} #rover1 moves input
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/div[1]/button[1]').displayed?} # rover1 forward button
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/div[1]/button[2]').displayed?} #rover1 rotate left button
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/div[1]/button[3]').displayed?} #rover1 rotate right button
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/input[6]').displayed?} #rover2 x coordinate
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/input[7]').displayed?} #rover2 y coordinate
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/input[7]').displayed?} #rover2 moves
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/div[2]/button[1]').displayed?} #rover2 forward button
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/div[2]/button[2]').displayed?} #rover 2 rotate left button
    assert @wait.until{@driver.find_element(:xpath, '/html/body/div/form/div[2]/button[3]').displayed?} #rover 2 rotate right button
    @driver.find_element(:xpath, '/html/body/div/form/input[9]').click()
    # assert @wait.until{@driver.find_element(:xpath, '').displayed?}
    # assert @wait.until{@driver.find_element(:xpath, '').displayed?}
    # assert @wait.until{@driver.find_element(:xpath, '').displayed?}
    # assert @wait.until{@driver.find_element(:xpath, '').displayed?}


    # sleep 0.5
    # @driver.find_element(:xpath, '//*[@id="burgerDiv"]/div[1]/div[2]/a[3]').click()
    # actualURL = @driver.current_url
    # assert_equal("http://localhost:4567/", actualURL, "URL Did not match")
    # sleep 10
    # assert @wait.until{@driver.find_element(:xpath, '/html/body/div[2]/button[1]').displayed?}
    # assert @wait.until{@driver.find_element(:xpath, '/html/body/div[2]/button[2]').displayed?}
    # assert @wait.until{@driver.find_element(:xpath, '/html/body/div[2]/button[3]').displayed?}
    # assert @wait.until{@driver.find_element(:xpath, '/html/body/div[2]/button[4]').displayed?}
    # @driver.find_element(:xpath, '/html/body/div[2]/button[5]').click()
    # assert @wait.until{@driver.find_element(:xpath, '/html/body/div[2]/div[5]/table/tbody/tr[1]/th[1]').displayed?}
    #
	  # assert @wait.until{@driver.find_element(:xpath, '/html/body/div[2]/button[6]').displayed?}
    #
	  # assert @wait.until{@driver.find_element(:xpath, '/html/body/div[2]/button[7]').displayed?}
  end
end
