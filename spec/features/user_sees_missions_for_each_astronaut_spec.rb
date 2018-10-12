require 'rails_helper'

describe 'As a visitor' do

  describe 'when I visit astronauts index' do

    before(:each) do
      @astronaut_1 = Astronaut.create(name: "Joe", age: 21, job: "Astronaut")
      @astronaut_1 = Astronaut.create(name: "David", age: 22, job: "Astronaut")
      @astronaut_1 = Astronaut.create(name: "John", age: 23, job: "Astronaut")
    end

    it 'should display all astronauts' do

      visit '/astronauts'

      within('body') do

        expect(page).to have_content("All Astronauts")
        expect(page).to have_content("Joe")
        expect(page).to have_content("David")
        expect(page).to have_content("John")
        expect(page).to have_content(21)
        expect(page).to have_content(22)
        expect(page).to have_content(23)
        expect(page).to have_content("Astronaut")

      end
    end
  end
end