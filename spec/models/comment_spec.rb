require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿ができる場合' do
      it "contentが存在していれば投稿できる" do
        expect(@comment).to be_valid
      end
    end
    context "コメント投稿ができない場合" do
      it "userが紐付いていないと投稿できない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it "learnが紐付いていないと投稿できない" do
        @comment.learn = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Learn must exist")
      end
    end
  end
end
