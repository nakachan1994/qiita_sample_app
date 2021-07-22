require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'モデルのテスト' do
    it "有効なuserの場合は保存されるか" do
      expect(build(:like)).to be_valid
    end
  end
  
  # qiitaの記事用
  it '1 + 1 は 2 になる' do
    expect(1 + 1).to eq 2
  end
end