require 'rails_helper'

RSpec.describe 'tickets/edit', type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
                                title: 'MyString',
                                description: 'MyText',
                                issuer_user_id: 1,
                                assigned_to_id: 1,
                                category_id: 1,
                                status_id: 1,
                                priority_id: 1
    ))
  end

  it 'renders the edit ticket form' do
    render

    assert_select 'form[action=?][method=?]', ticket_path(@ticket), 'post' do
      assert_select 'input#ticket_title[name=?]', 'ticket[title]'

      assert_select 'textarea#ticket_description[name=?]', 'ticket[description]'

      assert_select 'input#ticket_issuer_user_id[name=?]', 'ticket[issuer_user_id]'

      assert_select 'input#ticket_assigned_to_id[name=?]', 'ticket[assigned_to_id]'

      assert_select 'input#ticket_category_id[name=?]', 'ticket[category_id]'

      assert_select 'input#ticket_status_id[name=?]', 'ticket[status_id]'

      assert_select 'input#ticket_priority_id[name=?]', 'ticket[priority_id]'
    end
  end
end
