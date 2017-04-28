class RenameFavoritedInAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :favorited?, :favorited
  end
end
