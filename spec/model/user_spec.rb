require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a name" do
    first_user = User.create(name: '', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(first_user).to_not_be_valid
  end
end