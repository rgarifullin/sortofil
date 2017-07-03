class AuthorsController < ApplicationController
  include Sortofilterable
  include UrlRestorable

  before_action :permit_params
  before_action :set_default_sort_opts
  before_action do
    restore_url_params(:authors)
  end

  def index
    @authors = Author.order(sort_field => sort_direction)
  end
end
