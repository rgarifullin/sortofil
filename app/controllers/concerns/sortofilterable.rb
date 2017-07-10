# Sort and filter
module Sortofilterable
  extend ActiveSupport::Concern

  private

  def filter_params
    []
  end

  def sort_params
    %i[sort_by direction]
  end

  def pagination_params
    %i[page]
  end

  def set_default_sort_opts
    set_default_sort_field
    set_default_sort_direction
  end

  def set_default_sort_field
    @default_sort_field = { nil => :id }
  end

  def set_default_sort_direction
    @default_sort_direction = { nil => :asc }
  end

  def sort_field(scope = nil)
    params.dig(scope, :sort_by) || params[:sort_by] ||
      @default_sort_field[scope]
  end

  def sort_direction(scope = nil)
    params.dig(scope, :direction) || params[:direction] ||
      @default_sort_direction[scope]
  end

  def permit_params
    @permitted_params = params.permit(sort_params, filter_params,
                                      pagination_params)
  end
end
