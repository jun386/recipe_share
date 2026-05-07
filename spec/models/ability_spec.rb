require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe '#initialize' do
    context '管理者ユーザーのとき' do
      let(:user) { FactoryBot.create(:user, :admin) }

      it 'Rails Admin にアクセスできること' do
        expect(Ability.new(user).can?(:access, :rails_admin)).to be true
      end

      it '全リソースを manage できること' do
        expect(Ability.new(user).can?(:manage, User)).to be true
      end
    end

    context '一般ユーザーのとき' do
      let(:user) { FactoryBot.create(:user, admin: false) }

      it 'Rails Admin にアクセスできないこと' do
        expect(Ability.new(user).can?(:access, :rails_admin)).to be false
      end

      it '任意のモデルを manage できないこと' do
        expect(Ability.new(user).can?(:manage, User)).to be false
      end
    end

    context 'user が nil のとき' do
      it 'Rails Admin にアクセスできないこと' do
        expect(Ability.new(nil).can?(:access, :rails_admin)).to be false
      end
    end
  end
end
