class UpDownReversible < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :authors, :sex, :string
        add_column :books, :pages, :integer
        Author.create(first_name:"Beep", last_name: "Beep", dob: "Fri, 15 Aug 2008", email: "bepu@gmail.com")
      end
      dir.down do
        remove_column :authors, :sex, :string
        remove_column :books, :pages, :integer
        Author.where(first_name:"Beep").destroy_all 
      end
    end
  end
end
