It's always been a pain in the butt to get a new app up to speed with my
preferred stuff, especially as I keep learning what my preferred stuff is.

No more.

This is my opinionated template for starting a new Rails 4.1 application with Ruby 2.1.
I'll change things up as my opinions change.

Instructions TBD. Will include:
* If you want to start on the GitHub side (recommended),
  [fork the repo and clone the new repo](https://guides.github.com/activities/forking/)
* If not
  * `git clone https://github.com/andycox/rails-template.git <your-app-directory>`
  * `git remote rename origin upstream`
  * To share your code later, create a new remote repository (on GitHub or elsewhere)
  * Follow the directions to push an existing repository from the command line
* Customize your new application
  * Remove or modify `LICENSE` as desired
  * `script/bootstrap`
    * Replace `rails-template-` with your application
    * Pick a port in `script/bootstrap`
  * `script/cibuild`
    * Replace `rails_template_` with your application
  * `config/database.yml`
    * Replace `rails[_-]template[_-]` with your application
    * Replace `RAILS_TEMPLATE_` with your application
  * `config/application.rb`
    * Replace `RailsTemplate` with your application in CamelCase
  * `app/views/layouts/application.html.erb`
    * Change default application title if desired
  * `config/initializers/session_store.rb`
    * Replace `rails-template` with your application q
  * **TODO: AUTOMATE THESE**
* Get your PG running with the right permissions (Homebrew on OS X)
* `script/bootstrap`
* Code away!
