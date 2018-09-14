# require 'rails_helper'
#
# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
#
#   subject(:user) do
#     FactoryBot.build(:user,
#       email: "jonathan@fakesite.com",
#       password: "good_password")
#   end
#   it { should validate_presence_of(:email) }
# end
require 'rails_helper'

describe User do
  subject(:user) {User.new(email: "jonathan@fakesite.com",password: "good_password")}


        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password_digest) }

end
