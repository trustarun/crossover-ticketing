require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :title => "Title",
        :description => "MyText",
        :issuer_user_id => 1,
        :assigned_to_id => 2,
        :category_id => 3,
        :status_id => 4,
        :priority_id => 5
      ),
      Ticket.create!(
        :title => "Title",
        :description => "MyText",
        :issuer_user_id => 1,
        :assigned_to_id => 2,
        :category_id => 3,
        :status_id => 4,
        :priority_id => 5
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
