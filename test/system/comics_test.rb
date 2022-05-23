require "application_system_test_case"

class ComicsTest < ApplicationSystemTestCase
  setup do
    @comic = comics(:one)
  end

  test "visiting the index" do
    visit comics_url
    assert_selector "h1", text: "Comics"
  end

  test "should create comic" do
    visit comics_url
    click_on "New comic"

    fill_in "Alt", with: @comic.alt
    fill_in "Day", with: @comic.day
    fill_in "Img", with: @comic.img
    fill_in "Link", with: @comic.link
    fill_in "Month", with: @comic.month
    fill_in "News", with: @comic.news
    fill_in "Num", with: @comic.num
    fill_in "Safe title", with: @comic.safe_title
    fill_in "Title", with: @comic.title
    fill_in "Transcript", with: @comic.transcript
    fill_in "Year", with: @comic.year
    click_on "Create Comic"

    assert_text "Comic was successfully created"
    click_on "Back"
  end

  test "should update Comic" do
    visit comic_url(@comic)
    click_on "Edit this comic", match: :first

    fill_in "Alt", with: @comic.alt
    fill_in "Day", with: @comic.day
    fill_in "Img", with: @comic.img
    fill_in "Link", with: @comic.link
    fill_in "Month", with: @comic.month
    fill_in "News", with: @comic.news
    fill_in "Num", with: @comic.num
    fill_in "Safe title", with: @comic.safe_title
    fill_in "Title", with: @comic.title
    fill_in "Transcript", with: @comic.transcript
    fill_in "Year", with: @comic.year
    click_on "Update Comic"

    assert_text "Comic was successfully updated"
    click_on "Back"
  end

  test "should destroy Comic" do
    visit comic_url(@comic)
    click_on "Destroy this comic", match: :first

    assert_text "Comic was successfully destroyed"
  end
end
