# spec/features/add_book_spec.rb

require 'rails_helper'

RSpec.describe "Adding a book", type: :feature do
  it "creates a new book and displays a success flash notice" do
    visit new_book_path
    fill_in "Title", with: "Sample Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: 19.99
    fill_in "Published date", with: Date.today
    click_button "Create Book"

    expect(page).to have_text("Book was successfully created.")
    expect(page).to have_content("Sample Book")
  end

  it "displays an error flash notice when title is blank" do
    visit new_book_path
    fill_in "Title", with: ""
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: 19.99
    fill_in "Published date", with: Date.today
    click_button "Create Book"

    expect(page).to have_text("Title can't be blank")
  end

  it "displays an error flash notice when author is blank" do
    visit new_book_path
    fill_in "Title", with: "Sample Book"
    fill_in "Author", with: ""
    fill_in "Price", with: 19.99
    fill_in "Published date", with: Date.today
    click_button "Create Book"

    expect(page).to have_text("Author can't be blank")
  end

  it "displays an error flash notice when price is blank" do
    visit new_book_path
    fill_in "Title", with: "Sample Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: ""
    fill_in "Published date", with: Date.today
    click_button "Create Book"

    expect(page).to have_text("Price can't be blank")
  end

  it "displays an error flash notice when published_date is blank" do
    visit new_book_path
    fill_in "Title", with: "Sample Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: 19.99
    fill_in "Published date", with: ""
    click_button "Create Book"

    expect(page).to have_text("Published date can't be blank")
  end
end
