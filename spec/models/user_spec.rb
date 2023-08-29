require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'is invalid without name' do
      user_without_name = build(:user, name: "")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors).to be_added(:name, :blank)
    end

    it 'is invalid without role' do
      user_without_role = build(:user, role: nil)
      expect(user_without_role).to be_valid
      expect(user_without_role.errors).to be_empty
    end
    it 'is invalid without email' do
      user_without_email = build(:user, email: "")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors).to be_added(:email, :blank)
    end
    it 'is invalid without password' do
      user_without_password = build(:user, password: "")
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors).to be_added(:password, :too_short, count: 6)
    end

    it 'is invalid with too short password' do
      user_with_short_password = build(:user, password: "a")
      expect(user_with_short_password).to be_invalid
      expect(user_with_short_password.errors).to be_added(:password, :too_short, count: 6)
    end
    it 'is invalid without password_confirmation' do
      user_without_password_confirmation = build(:user, password_confirmation: "")
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors).to be_added(:password_confirmation, :blank)
    end
    it 'is invalid with a duplicate email' do
      user_email = create(:user)
      duplicate_email = build(:user, email: user_email.email)
      expect(duplicate_email).to be_invalid
      expect(duplicate_email.errors.of_kind?(:email, :taken)).to be_truthy
    end
    it 'is valid with another email' do
      user_a = build(:user, email: "a@example.com")
      user_b = build(:user, email: "b@example.com")
      expect(user_b).to be_valid
      expect(user_b.errors).to be_empty
    end
    it 'is valid with avatar' do
      user = build(:user)
      user.avatar = "#{Rails.root}/spec/fixtures/sample.jpg"
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

  end
end