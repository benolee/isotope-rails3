namespace :db do
  desc 'Create users'
  task :create_users => :environment do
    users = [
      ["Laird", "Foret", "principle", "laird@isotope11.com", "Laird Foret Founder and CEO Laird Foret has over 22 years of experience in the IT industry and is responsible for the day-to-day operations and administration of isotope11, inc. Prior to founding isotope11 in 2005, he started and ran many various companies and considers himself a serial entrepreneur. He graduated from Millsaps College in Computer Science and has a minor in accounting."],
      ["Josh", "Adams", "principle", "josh@isotope11.com", "Josh Adams is a developer and architect with over nine years of professional experience building production-quality software and managing projects. Josh is Isotope Eleven's lead architect, and is responsible for overseeing architectural decisions and translating customer requirements into working software. Josh graduated from the University of Alabama at Birmingham (UAB) with Bachelor of Science degrees in both Mathematics and Philosophy. In his free time (ha!) Josh is currently providing Technical Review to Apress for a book on programming with the Arduino microprocessor. When he's not working, Josh enjoys spending time with his family."],
      ["James", "Cook", "senior developer", "james@isotope11.com", "James Cook is a Senior Developer at Isotope Eleven - a rubyist fueled by coffee and bananas. In his spare time, he reads Reddit and plays video games."],
      ["Nick", "Fine", "developer", "nick@isotope11.com", "Nick spent the better part of a decade working in systems and networking support until discovering that developing software, particularly in Ruby, was a much more entertaining and satisfying career choice. He lives with his wife and pets in Birmingham and enjoys excessive amounts of coffee, contemporary literature, and music that's too loud."],
      ["Adam", "Dill", "senior developer", "adam@isotope11.com", "With over 14 years of experience, Adam Dill is a web application developer currently specializing in Ruby development. He is a regular speaker across the southeast at conferences and user groups on a variety of subjects including web standards, 508 compliance, automated testing, and project management. Before joining Isotope Eleven, Adam ran a successful development company and worked with over a dozen technology based startups, leading development for many of them."],
      ["Robby", "Clements", "developer", "rclements@isotope11.com", "Robby Clements is an understudy Ruby on Rails developer for Isotope Eleven. He has a long history of tech support and network services. He was invited to work as a Rails developer by Isotope Eleven and his growing knowledge of Ruby and Rails is being nurtured by some of the best Rails developers on the east coast."],
      ["Mike", "Heitzke", "designer", "mike@isotope11.com", "Even with educational roots based in the print design, Mike really found his place in designing for the web. Hailing from Connecticut and then Texas, Mike found his way to the south for school and ended up finding his home here designing at Isotope Eleven. Proud Texan and a fan of automobiles of the hatchback variety."],
      ["Adam", "Gamble", "developer", "agamble@isotope11.com", "Adam has been a professional developer for almost 10 years. He started web development with PHP, and has since moved on to Ruby on Rails and hasn't looked back. He has worked on projects for both the educational and financial fields."],
      ["Bradley", "Price", "developer", "bradley@isotope11.com", "Bradley comes from a background in systems administration. He enjoys working with technology and startups. His biggest joy comes from helping people find solutions using technology. Outside of work, his hobbies include spending time with his son (Alex), watching movies, and hanging out with friends."]
    ]

    users.each do |user|
     some_user = User.create(
        :first_name => user[0],
        :last_name => user[1],
        :position => user[2],
        :email => user[3],
        :bio => user[4],
        :password => "123456",
        :password_confirmation => "123456"
      )
    end
  end
end
