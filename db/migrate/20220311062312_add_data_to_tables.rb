class AddDataToTables < ActiveRecord::Migration[7.0]
  def change
    Author.create(first_name:"Deep", last_name: "garach", dob: "Fri, 15 Aug 2008", email: "depu@gmail.com")
    Author.create(first_name: "preksha", last_name: "garach", dob: "Sat, 16 Aug 2008", email: "peka@cadila.com")   
    Book.create(book_name: "You are not you",book_price: "500.0", author_id: 1)
    Book.create(book_name: "I am not you",book_price: "600.0", author_id: 1)
    Book.create(book_name: "We are one",book_price: "700.0", author_id: 1)
    Book.create(book_name: "science",book_price: "200.0", author_id: 2)
    Book.create(book_name: "maths",book_price: "100.0", author_id: 3)
    Book.create(book_name: "arts",book_price: "500.0", author_id: 4)
  end
end
