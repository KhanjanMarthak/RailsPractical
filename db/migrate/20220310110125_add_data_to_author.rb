class AddDataToAuthor < ActiveRecord::Migration[7.0]
  def change
     Author.create(first_name:"Chitrak", last_name: "Bhatt", dob: "Fri, 15 Aug 2008", email: "chitrakbhatt@gmail.com")
     Author.create(first_name: "Rutik", last_name: "Bhati", dob: "Sat, 16 Aug 2008", email: "chitrabhati@gmail.com")     
  end
end
