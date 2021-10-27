require './lib/student'

RSpec.describe Student do

  before(:each) do
    @student = Student.new({name: "Morgan", age: 21})
  end

  describe 'has default values' do
    it 'is a student' do
      expect(@student).to be_a(Student)
    end

    it 'has a name, age, and blank scores' do
      expect(@student.name).to eq("Morgan")
      expect(@student.age).to eq(21)
      expect(@student.scores).to be_empty
    end
  end

  describe '#log_score' do
    it 'adds new scores to the log' do
      @student.log_score(89)
      @student.log_score(78)

      expect(@student.scores).to eq([89, 78])
    end
  end

  describe '#grade' do
    it 'averages all the scores' do
      @student.log_score(89)
      @student.log_score(78)

      expect(@student.grade).to eq(83.5)
    end
  end
end
