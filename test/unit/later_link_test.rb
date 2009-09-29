require 'test_helper'

class LaterLinkTest < ActiveSupport::TestCase
  should "return longest task for no time limit" do
    assert_equal LaterLink.find_largest_next_unfinished, later_links(:future_lazy_search)
  end

  should "allows for 30-minute task with a 30 minute time limit" do
    assert_equal LaterLink.find_largest_next_unfinished(30), later_links(:future_lazy_search)
  end

  should "degrade to 20-minute task for 29 minute time limit" do
    assert_equal LaterLink.find_largest_next_unfinished(29), later_links(:future_small_hosting_change)
  end

  should_not_allow_values_for :url, "crap", "not valid URL"
  should_not_allow_values_for :estimated_duration, 0, -1
  should_allow_values_for :estimated_duration, 5, 15, 30, 90, 300
end
