require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) {build(:post)}

  it 'is valid' do
    expect(post).to be_valid
  end

  it 'should have title' do
    post.title = ''
    expect(post).to_not be_valid
  end

  it 'should have body' do
    post.body = ''
    expect(post).to_not be_valid
  end

  it 'should have category' do
    post.category = ''
    expect(post).to_not be_valid
  end
end
