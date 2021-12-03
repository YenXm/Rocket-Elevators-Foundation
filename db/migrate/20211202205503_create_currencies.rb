class CreateCurrencies < ActiveRecord::Migration[5.2]
    def change
        create_table :currencies do |t|
            t.integer :currency_ID
            t.string :currency_short_name
            t.string :fullname
            t.string :currency_symbol, null: true
            t.string :major
            t.string :is_crypto
            t.integer :countryID

        end
    end
end
