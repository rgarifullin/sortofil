require 'application_system_test_case'

class FilterRestoreTest < ApplicationSystemTestCase
  test 'it saves filter options between requests' do
    visit authors_path(sort_by: :last_name)

    visit authors_path
    params = evaluate_script('location.search')[1..-1]
    assert_equal 'sort_by=last_name', params

    within(:xpath, './/table/tbody') do
      authors = Author.order(:last_name)
      authors.zip(all(:css, 'tr')).each do |author, element|
        element.find(:xpath, 'td[1]').assert_text author.id
      end
    end
  end

  test 'it resets all saved filter options if reset_url is :all' do
    visit authors_path(sort_by: :last_name)

    visit authors_path(reset_url: 'all')
    params = evaluate_script('location.search')[1..-1]
    assert_equal 'reset_url=all', params
  end

  test 'it resets only scoped filter options if reset_url is not :all' do
    visit root_path(artists: { sort_by: :id, direction: :desc },
                    authors: { sort_by: :birth_year, direction: :asc })

    visit root_path(reset_url: 'authors')

    within(:xpath, ".//table[@id='artists']/tbody") do
      artists = Artist.order(id: :desc)
      artists.zip(all(:css, 'tr')).each do |artist, element|
        element.find(:xpath, 'td[1]').assert_text artist.id
      end
    end
    # default sort
    within(:xpath, ".//table[@id='authors']/tbody") do
      authors = Author.order(last_name: :desc)
      authors.zip(all(:css, 'tr')).each do |author, element|
        element.find(:xpath, 'td[1]').assert_text author.id
      end
    end
  end
end
