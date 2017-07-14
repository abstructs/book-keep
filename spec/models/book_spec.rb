require "rails_helper"

RSpec.describe Book, :type => :model do
  before(:each) do
    @book1 = Book.create!(title: "Harry Potter", author: "JK Rowling", rating: 0)
    @book2 = Book.create!(title: "Iron John", author: "Robert Bly", rating: 0)
    @invalid_book1 = Book.new(title: "Harry Potter", author: "JK Rowling", rating: 11)
    @invalid_book2 = Book.new(title: "Harry Potter", author: "JK Rowling", rating: -1)
  end
  it "gets all books" do
    expect(Book.order(:title)).to eq([@book1, @book2])
  end

  it "gets book by title" do
    expect(Book.find_by(title: @book1.title)).to eq(@book1)
    expect(Book.find_by(title: @book2.title)).to eq(@book2)
  end

  it "Creates a new book" do
    expect(@book1).to eq(Book.find_by(title: @book1.title))
  end

  it "Only allows ratings from 0-10" do
    expect(@invalid_book1.save).to eq(false)
    expect(@invalid_book2.save).to eq(false)
  end
end