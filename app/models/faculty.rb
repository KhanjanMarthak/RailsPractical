class Faculty < ApplicationRecord
  validates :fac_first_name, :fac_last_name, presence: true
  validates :fac_dob, comparison: { less_than: Date.today+1, message: "birthdate can't be in future" }
  validates :email, confirmation:true , format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true, presence:true
  validates :designation, inclusion: {in: %w(Asst.Prof Prof), message: "can't be %{value}, it has to be Asst.Prof or Prof "}
  validates :designation, exclusion: {in: %w(HOD Sr.Prof), message: "designation can't be HOD or Sr.Prof "}
  validates :phone_number, :presence => true, :numericality => true,  :length => { :is=>10, message: "should be 10 Digit Mobile Number" }

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
  after_validation :after_DOB
    

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
    puts "the object is deleted "
  end


  def after_DOB
    puts "this is callback called after validating dob"
  end  

end
