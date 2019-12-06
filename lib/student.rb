class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |starr|
      self.new(starr)
    end
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    self
  end
  
  def scrape_index_page(name, location, profile_url)
    
    student_hash = {} 
    
    student_hash.send("name=", student_hash[:name])
    student_hash.send("location=", student_hash[:location])
    student_hash.send("profile_url=", student_hash[:profile_url]))
  end

  def self.all
    @@all
  end
end
