require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Methods' do

    it 'should return average age of all astronauts' do

      astronaut_1 = Astronaut.create(name: "Joe", age: 20, job: "Astronaut")
      astronaut_1 = Astronaut.create(name: "David", age: 22, job: "Astronaut")
      astronaut_1 = Astronaut.create(name: "John", age: 23, job: "Astronaut")
      average_age = Astronaut.average_age

      expect(average_age).to eq(21.7)

    end
  end
end
