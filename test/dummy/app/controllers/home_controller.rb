class HomeController < ApplicationController
  include Sortofilterable
  include UrlRestorable

  before_action :permit_params
  before_action :set_default_sort_opts
  before_action do
    restore_url_params(:artists_authors)
  end

  def index
    @artists = Artist.order(sort_field(:artists) => sort_direction(:artists))
    @authors = Author.order(sort_field(:authors) => sort_direction(:authors))
  end

  private

  def set_default_sort_field
    @default_sort_field = { artists: :first_name, authors: :last_name }
  end

  def set_default_sort_direction
    @default_sort_direction = { artists: :asc, authors: :desc }
  end

  def permit_params
    @permitted_params = params.permit({ artists: sort_params + filter_params,
                                        authors: sort_params + filter_params },
                                      pagination_params)
  end
end
