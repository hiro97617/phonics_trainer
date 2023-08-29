require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する'
    end
    context 'フォームが未入力' do
      it 'ログイン処理が失敗する'
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する'
    end
  end
end
