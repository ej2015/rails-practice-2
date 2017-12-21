require 'rails_helper'

RSpec.describe PostPresenter, type: :presenter do
  let!(:post) { create(:post, body: "first line\r\nsecond line") }
  let!(:view_context) { ActionView::Base.new }
  let!(:post_presenter) { described_class.new(post, view_context) }

  describe  "#body" do
    it "returns formated post body" do
      expect(post_presenter.body).to eq "<p>first line\n<br />second line</p>"
    end
  end
 
end
