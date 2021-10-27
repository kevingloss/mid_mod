require './lib/student'
require './lib/course'

RSpec.describe Course do

  before(:each) do
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
  end

  describe 'has default values' do
    it 'is a course' do
      expect(@course).to be_a(Course)
    end

    it 'has a name and capacity' do
      expect(@course.name).to eq("Calculus")
      expect(@course.capacity).to eq(2)
    end

    it 'starts with no students' do
      expect(@course.students).to be_empty
    end
  end

  describe '#enroll' do
    it 'can add students to a class' do
      @course.enroll(@student1)
      @course.enroll(@student2)

      expect(@course.students).to eq([@student1, @student2])
    end
  end
  
  describe '#full?' do
    it 'can check if the capacity has been reached' do
      expect(@course.full?).to be(false)

      @course.enroll(@student1)
      @course.enroll(@student2)

      expect(@course.full?).to be(true)
    end
  end
end
