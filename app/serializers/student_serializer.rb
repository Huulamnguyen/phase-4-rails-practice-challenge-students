class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :major, :age, :instructor
  belongs_to :instructor

  def instructor
    "#{object.instructor.name}"
  end
end
