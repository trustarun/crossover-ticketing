require 'capybara/rspec'

module CapybaraExtension
  def drag_by(right_by, down_by)
    base.drag_by(right_by, down_by)
  end
end

module CapybaraSeleniumExtension
  def drag_by(right_by, down_by)
    driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform
  end
end

::Capybara::Selenium::Node.send :include, CapybaraSeleniumExtension
::Capybara::Node::Element.send :include, CapybaraExtension

Capybara.default_driver = :selenium
Capybara.javascript_driver = :webkit
Capybara.app_host = 'http://localhost:3030'
Capybara.server_host = 'localhost'
Capybara.server_port = '3030'
Capybara.default_max_wait_time = 10

def set_selenium_window_size(width, height)
  window = Capybara.current_session.driver.browser.manage.window
  window.resize_to(width, height)
end

Capybara.add_selector(:name) do
  xpath { |name| XPath.descendant[XPath.attr(:name).contains(name)] }
end
