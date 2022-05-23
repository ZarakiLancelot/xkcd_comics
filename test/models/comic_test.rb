# == Schema Information
#
# Table name: comics
#
#  id         :integer          not null, primary key
#  month      :string
#  num        :integer
#  link       :string
#  year       :string
#  news       :string
#  safe_title :string
#  transcript :text
#  alt        :text
#  img        :string
#  title      :string
#  day        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ComicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
