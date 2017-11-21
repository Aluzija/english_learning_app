class ChangeNameSynonimsToSynonymsInWords < ActiveRecord::Migration[5.1]
  def change
    rename_column :words, :english_synonims, :english_synonyms
    rename_column :words, :polish_synonims, :polish_synonyms
  end
end
