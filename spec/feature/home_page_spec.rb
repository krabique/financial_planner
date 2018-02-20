require 'rails_helper'

describe "the home page", :type => :feature do
  it "prints 'Hello, world!'" do
    visit root_path

    expect(page).to have_content 'Hello, world!'
  end
end
