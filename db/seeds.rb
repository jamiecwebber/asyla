require 'date'

puts 'Cleaning database...'
Record.destroy_all
Task.destroy_all
Goal.destroy_all
Category.destroy_all
User.destroy_all

puts 'Creating users...'
category_employment = Category.create!(name: 'Employment', colour: 'blue')
category_legal = Category.create!(name: 'Legal', colour: 'orange')
category_medical = Category.create!(name: 'Medical', colour: 'green')


fouzia = User.create!(first_name: 'Fouzia', last_name: 'Al Hashish', age: 33, nationality: 'Syrian', language: 'Arabic', address: 'Chicago', email: 'f.al_hashish@yahoo.fr', password: 'f.al_hashish@yahoo.fr', photo: "https://res.cloudinary.com/dtmuylvrr/image/upload/v1551477743/dw3b7ohs5oybmfjkct5p.png")
nooshin = User.create!(first_name: 'Nooshin', last_name: 'Amineh', age: 25, nationality: 'Iranian', language: 'Persan', address: 'Chicago', email: 'n.amineh@hotmail.com', password: 'n.amineh@hotmail.com', photo: "https://res.cloudinary.com/dtmuylvrr/image/upload/v1551724911/Screenshot_2019-03-04_at_13.40.33.png")
axmed = User.create!(first_name: 'Axmed', last_name: 'Nuur', age: 39, nationality: 'Somalian', language: 'Arabic', address: 'Chicago', email: 'a.nuur@gmail.com', password: 'a.nuur@gmail.com', photo: "https://res.cloudinary.com/dtmuylvrr/image/upload/v1551724907/Screenshot_2019-03-04_at_13.41.37.png")

# Admin account
admin = User.create!(first_name: 'John', last_name: 'Doe', age: 99, nationality: 'Planet Earth', language: 'English', address: 'Planet Earth', email: 'admin@asyla.ca', password: 'lewagon', admin: true)

goal_employment_fouzia = Goal.create!(name: 'Employment', category: category_employment, user: fouzia, completed: false)
goal_employment_nooshin = Goal.create!(name: 'Employment', category: category_employment, user: nooshin, completed: false)
goal_employment_axmed = Goal.create!(name: 'Employment', category: category_employment, user: axmed, completed: false)
goal_legal_fouzia = Goal.create!(name: 'Legal', category: category_legal, user: fouzia, completed: false)
goal_legal_nooshin = Goal.create!(name: 'Legal', category: category_legal, user: nooshin, completed: false)
goal_legal_axmed = Goal.create!(name: 'Legal', category: category_legal, user: axmed, completed: false)
goal_medical_fouzia = Goal.create!(name: 'Medical', category: category_medical, user: fouzia, completed: false)
goal_medical_nooshin = Goal.create!(name: 'Medical', category: category_medical, user: nooshin, completed: false)
goal_medical_axmed = Goal.create!(name: 'Medical', category: category_medical, user: axmed, completed: false)



p date1 = DateTime.new(2019,3,8)
date2 = DateTime.new(2019,3,8)
date3 = DateTime.new(2019,3,8)
date4 = DateTime.new(2019,3,12)
date5 = DateTime.new(2019,3,2)
date6 = DateTime.new(2019,4,2)
date7 = DateTime.new(2019,4,5)




Goal.all.each do |goal|
  if goal.name == 'Employment'
    intake = Task.create!(goal: goal, title: 'Intake appointment', details: 'Client information', deadline: date1, completed: true, address: 'Chicago', user: goal.user)
    employment_enrollment = Task.create!(goal: goal, title: 'Employment appointment', details: 'Employment readiness assessment', deadline: date5, completed: false, address: 'Chicago', user: goal.user)
    # employment_card = Record.create!(task: employment_enrollment, user: goal.user, title: 'Employment Card', description: 'Employment Authorization Document (work permit)', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208651/Records/EAD_card.png')
    ss_card = Record.create!(task: employment_enrollment, user: goal.user, title: 'Social Security Number', description: 'Social Security Number', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208632/Records/SS_card.jpg')
    employment_card = Record.create!(task: employment_enrollment, user: goal.user, title: 'Employment Card', description: 'Employment Authorization Document (work permit)', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208651/Records/EAD_card.png')
    Notification.create(user_id: goal.user.id, task_id: intake.id, problem: false)
    Notification.create(user_id: goal.user.id, task_id: employment_enrollment.id, problem: true)

  elsif goal.name == 'Legal'
    ss = Task.create!(goal: goal, title: 'Social Security appointment', details: 'Social security application for social security card', deadline: date6, completed: false, address: 'Chicago', user: goal.user)
    dhs = Task.create!(goal: goal, title: 'DHS appointment', details: 'Department of Human Services', deadline: date7, completed: false, address: 'Chicago', user: goal.user)
    green_card = Record.create!(task: dhs, user: goal.user, title: 'Green Card', description: 'Permanent residency card', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208663/Records/green-card.jpg')

  elsif goal.name == 'Medical'
  health_screening = Task.create!(goal: goal, title: 'Health screening appointment', details: 'Medical assessment', deadline: date6, completed: true, address: 'Chicago', user: goal.user)
  medical_check_form = Record.create!(task: health_screening, user: goal.user, title: 'Medical Assessment', description: 'Medical history and health evaluation form', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208324/Records/Healthscreening_Form.jpg')
  immunization_record = Record.create!(task: health_screening, user: goal.user, title: 'Immunization Record', description: 'Proof of vaccinations', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208310/Records/immunization-record.gif')
  end
end


Task.create!(user_id: goal_employment_fouzia.user_id, goal_id: goal_employment_fouzia.id, title: 'DSH appointment', details: 'bljaljlfkjgla', deadline: date1, completed: false, address: '5333 Avenue Casgrain, Montréal, H2T 1X3')
Task.create!(user_id: goal_employment_nooshin.user_id, goal_id: goal_employment_axmed.id, title: 'Employment appointment', details: 'bljaljlfkjgla', deadline: date2, completed: false, address: '5333 Avenue Casgrain, Montréal, H2T 1X3')
Task.create!(user_id: goal_employment_axmed.user_id, goal_id: goal_employment_nooshin.id, title: 'Medical appointment', details: 'bljaljlfkjgla', deadline: date3, completed: true, address: '5333 Avenue Casgrain, Montréal, H2T 1X3')

#shift_schedules = Record.create!(task: 'employment_enrollment', user: goal.user, title: 'Work Schedule', description: 'Proof of employment', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208225/Records/shift-schedules.jpg')
#paycheck_taxes = Record.create!(title: 'Paycheck', description: 'Social Security and Medicare taxes deductions', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208239/Records/Paycheck_Taxes.png')
# health_screening = Record.create!(task: fouzia.tasks.first, user: fouzia, title: 'Health Screening', description: 'Medical history and health evaluation form', photo: 'https://res.cloudinary.com/dtmuylvrr/image/upload/v1551208324/Records/Healthscreening_Form.jpg')

puts 'Finished!'
