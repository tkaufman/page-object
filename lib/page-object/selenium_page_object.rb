require 'page-object/elements'

module PageObject
  class SeleniumPageObject
    def initialize(browser)
      @browser = browser
    end

    def navigate_to(url)
      @browser.navigate.to url
    end
    
    def text
      @browser.find_element(:tag_name, 'body').text
    end

    def html
      @browser.page_source
    end

    def title
      @browser.title
    end
    
    def text_field_value_for(identifier)
      how, what = TextField.selenium_identifier_for identifier
      @browser.find_element(how, what).value
    end
    
    def text_field_value_set(identifier, value)
      how, what = TextField.selenium_identifier_for identifier
      @browser.find_element(how, what).send_keys(value)
    end
    
    def click_link_for(identifier)
      how, what = Link.selenium_identifier_for identifier
      @browser.find_element(how, what).click
    end
  end
end
