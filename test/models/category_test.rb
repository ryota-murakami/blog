require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
   test "categoy update and delete" do
     @post = Post.find_by_title('MyPost1')

     # fixtureで自動に割り当てられたカテゴリのPRIMARY KEYを取得
     cat_id_1, cat_id_2 = @post.categories[0]['id'], @post.categories[1]['id']

     #カテゴリ1の名前を更新
     @post.update(categories_attributes: {id: cat_id_1, name: 'updated'})

     #カテゴリ1の名前が更新されているか?
     assert @post.categories.find(cat_id_1).name == 'updated'

     #カテゴリ2を削除
     @post.update(categories_attributes: {id: cat_id_2, _destroy: 1})

     #カテゴリ2が削除されているか?
     assert_not @post.categories.exists?(id: cat_id_2)
   end
end
