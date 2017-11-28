class AddReferenceLearnSessionIdToWords < ActiveRecord::Migration[5.1]
  def change
    add_reference :words, :learning_session, foreign_key: true, null: true
  end
end
