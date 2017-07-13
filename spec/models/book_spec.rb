require "rails_helper"

RSpec.describe Book, :type => :model do
  it "gets all books" do
    book1 = Book.create!(title: "Harry Potter", author: "JK Rowling")
    book2 = Book.create!(title: "Iron John", author: "Robert Bly")

    expect(Book.order(:title)).to eq([book1, book2])
  end

  it "gets book by title" do
    book1 = Book.create!(title: "Harry Potter", author: "JK Rowling")
    book2 = Book.create!(title: "Iron John", author: "Robert Bly")

    expect(Book.find_by(title: "Harry Potter")).to eq(book1)
    expect(Book.find_by(title: "Iron John")).to eq(book2)
  end
end