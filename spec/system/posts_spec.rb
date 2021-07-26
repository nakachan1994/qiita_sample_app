require 'rails_helper'

describe '投稿に関するテスト' do
  # FactoryBotのテストデータを使う
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }

  describe "投稿のテスト" do
    before do
      sign_in user
      visit new_post_path
    end

    context "投稿が成功したとき" do
      it "投稿成功後の遷移先が正しいか" do
        # contentのフォームにFakerでランダムな５文字の文字列を入れる
        fill_in 'post[content]', with: Faker::Lorem.characters(number: 5)
        # 投稿ボタンをクリック
        click_button "投稿"
        # 投稿成功後の遷移先が期待したパスになっているか
        expect(page).to have_current_path posts_path
      end
      it "投稿成功後の表示の確認" do
        # contentのフォームにFakerでランダムな５文字の文字列を入れる
        fill_in 'post[content]', with: Faker::Lorem.characters(number: 5)
        # 投稿ボタンをクリック
        click_button "投稿"
        # 投稿が成功して"投稿が成功しました"の文字があるか
        expect(page).to have_content "投稿に成功しました"
      end
    end

    context "投稿が失敗したとき" do
      it "投稿失敗後の遷移先が正しいか" do
        # contentのフォームを空にする
        fill_in 'post[content]', with: nil
        # 投稿ボタンをクリック
        click_button "投稿"
        # エラーが起きて選先が期待したパスになっているか
        expect(page).to have_current_path posts_path
      end
      it "投稿失敗後の表示の確認" do
        # contentのフォームを空にする
        fill_in 'post[content]', with: nil
        # 投稿ボタンをクリック
        click_button "投稿"
        # エラーが出てエラーメッセージが表示されているか
        expect(page).to have_content "入力してください"
      end
    end
  end

  describe "削除のテスト" do
    before do
      sign_in user
      visit posts_path
    end

    it "削除リンクが表示されているか" do
      # 削除のパスへのリンクがあるか
      expect(page).to have_link "", href: post_path(post)
    end
    it "削除されるか" do
      # 削除された時データベースから削除されているか
      expect { post.destroy }.to change(Post, :count).by(-1)
    end
  end
end