require_relative 'base_page'

class HomePage < BasePage

  HOME_PAGE_MODAL = { css: '[id="monetate_lightbox_contentMap"] > [href="#close"]' }
  HOME_PAGE_NAV_MENU = { storage: { css: 'ul a[href="/shop/storage"]' } }

  def initialize driver
    super
    visit '/welcome.htm'
    clear_modal_if_displayed HOME_PAGE_MODAL
    expect(driver.title).to eql('The Container Store - The Original Storage and Organization Store®')
  end

  def page_title
    title
  end

  def click_nav locator
    click HOME_PAGE_NAV_MENU[locator]
  end
  
  private
  def clear_modal_if_displayed locator
    close(locator) if is_displayed? locator
  end

end