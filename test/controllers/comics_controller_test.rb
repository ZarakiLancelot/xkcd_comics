require "test_helper"

class ComicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comic = comics(:one)
  end

  test "should get index" do
    get comics_url
    assert_response :success
  end

  test "should get new" do
    get new_comic_url
    assert_response :success
  end

  test "should create comic" do
    assert_difference("Comic.count") do
      post comics_url, params: { comic: { alt: @comic.alt, day: @comic.day, img: @comic.img, link: @comic.link, month: @comic.month, news: @comic.news, num: @comic.num, safe_title: @comic.safe_title, title: @comic.title, transcript: @comic.transcript, year: @comic.year } }
    end

    assert_redirected_to comic_url(Comic.last)
  end

  test "should show comic" do
    get comic_url(@comic)
    assert_response :success
  end

  test "should get edit" do
    get edit_comic_url(@comic)
    assert_response :success
  end

  test "should update comic" do
    patch comic_url(@comic), params: { comic: { alt: @comic.alt, day: @comic.day, img: @comic.img, link: @comic.link, month: @comic.month, news: @comic.news, num: @comic.num, safe_title: @comic.safe_title, title: @comic.title, transcript: @comic.transcript, year: @comic.year } }
    assert_redirected_to comic_url(@comic)
  end

  test "should destroy comic" do
    assert_difference("Comic.count", -1) do
      delete comic_url(@comic)
    end

    assert_redirected_to comics_url
  end
end
