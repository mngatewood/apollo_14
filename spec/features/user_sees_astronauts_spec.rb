require 'rails_helper'

describe 'As a visitor' do

  describe 'when I visit astronauts index' do

    before(:each) do
      @astronaut_1 = Astronaut.create(name: "Joe", age: 21, job: "Astronaut")
      @astronaut_1 = Astronaut.create(name: "David", age: 22, job: "Astronaut")
      @astronaut_1 = Astronaut.create(name: "John", age: 23, job: "Astronaut")
      @mission_1 = @astronaut_1.missions.create(name: "Megadeth")
      @mission_2 = @astronaut_1.missions.create(name: "Metallica")
      @mission_3 = @astronaut_1.missions.create(name: "Slayer")
      @mission_4 = @astronaut_2.missions.create(name: "Antrhax")
      @mission_5 = @astronaut_2.missions.create(name: "Testament")
      @mission_6 = @astronaut_2.missions.create(name: "Judas Priest")
      @mission_7 = @astronaut_3.missions.create(name: "Black Sabbath")
      @mission_8 = @astronaut_3.missions.create(name: "Iron Maiden")
      @mission_9 = @astronaut_3.missions.create(name: "Rainbow")
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

    it 'should display all missions for each astronaut' do

      visit '/astronauts'

      within('body') do
        expect(page).to have_content("Megadeth")
        expect(page).to have_content("Metallica")
        expect(page).to have_content("Slayer")
        expect(page).to have_content("Antrhax")
        expect(page).to have_content("Testament")
        expect(page).to have_content("Judas Priest")
        expect(page).to have_content("Black Sabbath")
        expect(page).to have_content("Iron Maiden")
        expect(page).to have_content("Rainbow")
      end

    end
  end
end