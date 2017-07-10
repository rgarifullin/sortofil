# Restore url query params between requests
module UrlRestorable
  extend ActiveSupport::Concern

  private

  def restore_url_params(key_prefix)
    key = "#{key_prefix}_url_params"
    if @permitted_params
      params_wo_paging = @permitted_params.reject do |k, _|
        pagination_params.include?(k.to_sym)
      end
    end
    all_params = params_wo_paging || params.permit(filter_params + sort_params)

    if params[:reset_url]
      if params[:reset_url] == 'all'
        session[key] = nil
      else
        session[key] = Rack::Utils.parse_nested_query(session[key])
                                  .except(params[:reset_url]).to_query
      end
    elsif session[key].blank?
      session[key] = all_params.to_h.to_query
    end

    return if session[key].blank?

    new_params = Rack::Utils.parse_nested_query(session[key])
                            .merge(deep_transform(all_params.to_h))
    session[key] = new_params.to_query
    params.merge!(new_params)
  end

  def deep_transform(hash)
    hash.transform_values do |val|
      val.is_a?(String) ? val : val.transform_values { |vv| vv }
    end
  end
end
