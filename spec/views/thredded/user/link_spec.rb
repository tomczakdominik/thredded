require 'spec_helper'

RSpec.describe 'partial: thredded/users/link' do
  def render_partial(user)
    render partial: 'thredded/users/link', locals: { user: user }
  end

  it 'renders a link to the user' do
    render_partial build_stubbed(:user, name: 'joel')
    expect(rendered).to eq(<<-HTML.strip_heredoc)
      <a href="/u/joel">joel</a>
    HTML
  end

  it 'with null user' do
    user = Thredded::NullUser.new
    render_partial user
    expect(rendered).to eq <<-HTML.strip_heredoc
      #{user}
    HTML
  end

  it 'with nil user' do
    render_partial nil
    expect(rendered).to eq <<-HTML.strip_heredoc
      <em>Deleted user</em>
    HTML
  end
end