require './person'

describe Decorator do
  context 'Test the decorator class' do
    it 'test if decorator renders the correct name' do
      person = Person.new(6, 14, 'Kibrewossen')
      deco = Decorator.new(person)
      name = deco.correct_name

      expect(name).to eq('Kibrewossen')
    end
  end
end

describe CapitalizeDecorator do
  context 'Test the Capitalize Decorator Class' do
    it 'test if the name is capitalized' do
      person = Person.new(6, 14, 'kibrewossen')
      capital = CapitalizeDecorator.new(person)
      name = capital.correct_name

      expect(name).to eq('Kibrewossen')
    end
  end
end

describe TrimmerDecorator do
  context 'Test the Trimmed Decorator Class' do
    it 'test if the name is trimmed' do
      person = Person.new(6, 14, 'Kibrewossen')
      trim = TrimmerDecorator.new(person)
      name = trim.correct_name

      expect(name).to eq('Kibrewosse')
    end
  end
end
