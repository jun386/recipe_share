require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  let(:user) { FactoryBot.create(:user1) }
  let(:other_user) { FactoryBot.create(:user2) }
  let(:prefecture) { FactoryBot.create(:prefecture) }
  
  before { allow(helper).to receive(:current_user).and_return(user) }

  describe '#current_user?' do
    context '与えられたuserが、current_userの時' do
      it 'trueを返すこと' do
        expect(helper.current_user?(user)).to be_truthy
      end
    end

    context '与えられたuserが、current_userでない時' do
      it 'falseを返すこと' do
        expect(helper.current_user?(other_user)).to be_falsey
      end
    end
  end

  describe '#prefecture_name' do
    context 'idが存在する時' do
      it 'prefectureの名前を返すこと' do
        expect(helper.prefecture_name(prefecture.id)).to eq(prefecture.name)
      end
    end

    context 'idが存在しない時' do
      it '「設定されていません」を返すこと' do
        expect(helper.prefecture_name(nil)).to eq('設定されていません')
      end
    end
  end

  describe '#gender_name' do
    context 'genderが存在する時' do
      it 'genderの名前を返すこと' do
        expect(helper.gender_name('m')).to eq('男性')
        expect(helper.gender_name('f')).to eq('女性')
        expect(helper.gender_name('o')).to eq('その他')
      end
    end

    context 'genderが存在しない時' do
      it '「性別が設定されていません」を返すこと' do
        expect(helper.gender_name(nil)).to eq('性別が設定されていません')
      end
    end
  end

  describe '#following_check' do
    before do
      user.follow!(other_user)
      other_user.follow!(user)
    end

    context 'current_userと与えられたuserが相互フォローしている時' do
      it 'trueを返すこと' do
        expect(helper.following_check(other_user.id)).to be_truthy
      end
    end

    context 'current_userと与えられたuserが相互フォローしていない時' do
      it 'falseを返すこと' do
        other_user.unfollow!(user)
        expect(helper.following_check(other_user.id)).to be_falsey
      end
    end
  end
end
