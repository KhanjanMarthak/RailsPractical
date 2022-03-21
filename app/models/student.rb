class Student < ApplicationRecord
  validates :stud_first_name, :stud_last_name, presence: true
  validates :stud_dob, comparison: { less_than: Date.today+1, message: "birthdate can't be in future" }
  validates :department, inclusion: {in: %w(IT CP), message: "Department can't be %{value}, It has to be IT or CP"}
  validates :term_of_service, acceptance: true, presence: { message: "You cannot proceed without accepting Terms of Usage" }

  after_initialize :object_initialisation 
  after_find :object_found

  # Creating an Object
  before_create :greeting_message
  after_create :created_method

  #Updating an Object
  before_update :will_update
  after_update :object_updated

  #Destroying an Object
  before_destroy :will_destroy
  after_destroy :object_destroyed

  #before_validation of DOB for student
  before_validation :before_DOB
    

  private
  def object_initialisation
    puts "object initialised"
  end

  def object_found
    puts "object found"
  end

  def greeting_message
    puts "the object is yet to be created"
  end

  def created_method
    puts "the object is created"
  end
  
  def will_update
    puts "the object will be updated soon"
  end

  def object_updated
    puts "the object is updated " 
  end

  def will_destroy
    puts "the object will be deleted soon"
  end

  def object_destroyed
    puts "the object is deleted"
  end


  def before_DOB
    puts "this is callback called before validating dob"
  end  

end
 