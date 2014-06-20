try_rails_presentation
======================

Check out the "create-a-rails-app" branch for a version of this site which has been turned into a project with detailed instructions for the user to recreate the whole site!

to get into that branch go to the terminal and use the command:
    git checkout create-a-rails-app
    
the code in your try_rails presentation directory will now, through the magic of git, be the project version. Read the readme file in that directory for instructions on how to get started on the project.

## Steps to get your new rails app all nice and good. 
(Based on my experience getting environments up on my ubuntu box).
See below for Windows setup instuctions.

1) Have a computer

2) Have ruby (I recommend installing rubies through rvm)
to get rvm use the command :
        curl -sSL https://get.rvm.io | bash -s stable
followed by 
        rvm install ruby 2.1.1
and 
        rvm use ruby 2.1.1
          
          
3) Have git (if you use linux type the following in the command line:)
        sudo apt-get install git
if you're a Mac user, figure it out yourslef ya hipster! Basically just grab it with homebrew
Best of luck brave warrior.
        
        
        
4) in the command line : 
    git clone https://github.com/Andrew-Max/try_rails_presentation.git
    cd try_rails_presentation
    gem install bundler
    bundle
    rake db:migrate
    
If all of these have succeeded you can go to the url 'localhost:3000' (note: no www or http:// just type that exactly)in your browsser and the app will be up and running

If you get failures at any point along the way, copy and paste the error messages you get into google for tips on how to resolve the issue.
    
This is far from an exhaustive list of steps but its aproximately what you'll need

If you are looking for more detailed instructions the first chapter of http://www.railstutorial.org/book is a fantastic and detailed resource for setting up rails environments

=== Windows Setup

1) Install Ruby 1.9.3 from http://rubyinstaller.org/downloads/
- Install to C:\\Ruby193
- Make sure to check the box, "Add ruby executables to your path"

2) Install the ruby dev kit from http://rubyinstaller.org/downloads/
- Extract it to C:\\RubyDev
- Open a new command prompt and run
    cd c:\RubyDev
    ruby dk.rb init
    ruby dk.rb install
    
3) Install bundler
    gem install bundler

4) Install git from http://git-scm.com/download/win
- Make sure to select the option, "Use git from the Windows Command Prompt" to add the binaries to your path.

5) Open a command prompt and run
    git clone git@github.com:Andrew-Max/fresh_rails_4.1.1.git
    cd fresh_rails_4.1.1/
    bundle

6) Make sure it works
    rails server
Navigate to http://localhost:3000/

