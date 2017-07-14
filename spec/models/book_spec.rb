require "rails_helper"

RSpec.describe Book, :type => :model do
  it "gets all books" do
    book1 = Book.create!(title: "Harry Potter", author: "JK Rowling", rating: 0)
    book2 = Book.create!(title: "Iron John", author: "Robert Bly", rating: 0)

    expect(Book.order(:title)).to eq([book1, book2])
  end

  it "gets book by title" do
    book1 = Book.create!(title: "Harry Potter", author: "JK Rowling", rating: 0)
    book2 = Book.create!(title: "Iron John", author: "Robert Bly", rating: 0)

    expect(Book.find_by(title: "Harry Potter")).to eq(book1)
    expect(Book.find_by(title: "Iron John")).to eq(book2)
  end

  it "Creates a new book" do
    book1 = Book.create!(title: "Woop woop", author: "Andrew Wilson", rating: 0)

    expect(book1).to eq(Book.find_by(title: "Woop woop"))
  end

  it "Only allows ratings from 0-10" do
    book1 = Book.new(title: "Harry Potter", author: "JK Rowling", rating: 11)
    
    expect(book1.save).to eq(false)
  end
end