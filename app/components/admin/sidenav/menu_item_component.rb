module Admin
  class Sidenav::MenuItemComponent < ViewComponent::Base
    def initialize(title:, url:)
      @title = title
      @url = url
    end

    def call
      link_to @title, @url, class: "#{current_page?(@url) ? 'is-active' : ''}"
    end
  end
end
