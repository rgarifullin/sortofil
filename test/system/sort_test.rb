require 'application_system_test_case'

class SortTest < ApplicationSystemTestCase
  test 'sorts by id asc by default' do
    visit authors_path

    within(:xpath, './/table/tbody') do
      authors = Author.order(:id)
      authors.zip(all(:css, 'tr')).each do |author, element|
        element.find(:xpath, 'td[1]').assert_text author.id
      end
    end
  end

  test 'it can sort by other field and direction' do
    visit authors_path(sort_by: :birth_year, direction: :desc)

    within(:xpath, './/table/tbody') do
      authors = Author.order(birth_year: :desc)
      authors.zip(all(:css, 'tr')).each do |author, element|
        element.find(:xpath, 'td[1]').assert_text author.id
      end
    end
  end

  test 'table column headers are clickable' do
    visit authors_path

    within(:xpath, './/table/thead') do
      click_on('First name')
    end

    within(:xpath, './/table/tbody') do
      authors = Author.order(first_name: :desc)
      authors.zip(all(:css, 'tr')).each do |author, element|
        element.find(:xpath, 'td[1]').assert_text author.id
      end
    end
  end
end
