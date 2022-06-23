require 'rails_helper'

RSpec.describe Learn, type: :model do
  before do
    @learn = FactoryBot.build(:learn)
  end

  describe "記録投稿機能" do
    context '記録投稿ができるとき' do
      it "titleがあれば投稿できる" do
        @learn.title = 'test'
        @learn.valid?
        expect(@learn).to be_valid
      end
      it "descriptionがあれば投稿できる" do
        @learn.description = 'test'
        @learn.valid?
        expect(@learn).to be_valid
      end
      it "descriptionが空でも投稿できる" do
        @learn.description = ''
        @learn.valid?
        expect(@learn).to be_valid
      end
      it "subject_idがあれば投稿できる" do
        @learn.subject_id = 2
        @learn.valid?
        expect(@learn).to be_valid
      end
      it "study_hourがあれば投稿できる" do
        @learn.study_hour = '2'
        @learn.valid?
        expect(@learn).to be_valid
      end
      it "study_hourが空でも投稿できる" do
        @learn.study_hour = ''
        @learn.valid?
        expect(@learn).to be_valid
      end
      it "study_minutesがあれば投稿できる" do
        @learn.study_minutes = '30'
        @learn.valid?
        expect(@learn).to be_valid
      end
      it "study_minutesが空でも投稿できる" do
        @learn.study_minutes = ''
        @learn.valid?
        expect(@learn).to be_valid
      end
    end
    context '記録投稿ができない時' do
      it "titleが空では投稿できない" do
        @learn.title = ''
        @learn.valid?
        expect(@learn.errors.full_messages).to include("Title can't be blank")
      end
      it "subject_idが空では投稿できない" do
        @learn.subject_id = 1
        @learn.valid?
        expect(@learn.errors.full_messages).to include("Subject can't be blank")
      end
      it "descriptionとimageが空では投稿できない" do
        @learn.description = ''
        @learn.image = nil
        @learn.valid?
        expect(@learn.errors.full_messages).to include("Description can't be blank")
      end
      it "userが紐付いていないと投稿できない" do
        @learn.user = nil
        @learn.valid?
        expect(@learn.errors.full_messages).to include("User must exist")
      end
    end
  end
end
