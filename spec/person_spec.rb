require './person'

describe Person do
  context 'testing Person class' do
    it 'should return false if there is no parent permission' do
      person1 = Person.new(1, 15, 'John', parent_permission: false)
      service = person1.can_use_services?

      expect(service).to eq(false)
    end

    it 'should return true if there is no parent permission but is of age' do
      person2 = Person.new(2, 20, 'Jack', parent_permission: false)
      service = person2.can_use_services?

      expect(service).to eq(true)
    end

    it 'should return the correct name' do
      person3 = Person.new(3, 17, 'Jane')
      correct = person3.correct_name

      expect(correct).to eq('Jane')
    end

    it 'should return if is of age' do
      person4 = Person.new(4, 11, 'Jessica')

      expect(person4.send(:of_age?)).to eq(false)
    end
  end
end
