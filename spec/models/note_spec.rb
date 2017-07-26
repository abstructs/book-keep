require 'rails_helper'

RSpec.describe Note, type: :model do
  before(:each) do 
    @book1 = Book.create!(title: "Harry Potter", author: "JK Rowling", rating: 0)
    @book2 = Book.create!(title: "Iron John", author: "Robert Bly", rating: 0)
    @note1 = @book1.notes.create!(body: "Great book, loved that one part")
    @note2 = @book2.notes.create!(body: "Okay book. Definitely readable.")
  end
    it "Saves text to the database" do
      expect(@note1).to eq(Book.find_by(title: @book1.title).notes.find(1))
  end
end
