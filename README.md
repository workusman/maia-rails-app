# Maia

Maia is a candidate re-marketing platform for employers. We capture people who visit career sites but don’t apply for jobs, then automatically engage them with the employer. Maia improves advertising ROI by helping employers hire candidates they normally lose.

# How to test
Maia backend api is hosted at https://maia-rails-app.herokuapp.com/
For testing, please use these two pages. The Maia Pop-up is integrated here and working as expected:
1) http://my-maia.surge.sh/
2) http://maia-feel.surge.sh/

# Following are the steps to get Maia up and running on your Local Env

* Run `bundle install`

* Run `rake db:create`

* Run `rake db:migrate`

* Run `rails s`

# Assumptions
1. Maia Stores The email address of a visitor in Browser Local Storage for future use.
2. No Authentication is required for now for clients.
3. By leaving client site, it means a visitor is moving outside the DOM (Browser Page).

# Integration
Steps to integrate maia widget to any site

* Add Javascript
    -> <script src="https://maia-rails-app.herokuapp.com/v1/assets/javascripts/maia.js"> </script>

* Add CSS
    -> <link rel="stylesheet" href="https://maia-rails-app.herokuapp.com/v1/assets/stylesheets/maia.css">
    
You can find these files at `/public/v1/assets/javascripts/maia.js` and `/public/v1/assets/stylesheets/maia.css`


Here is the link to the Gist that can be shared with developers for integration.
https://gist.github.com/workusman/b7d0fa6486e7626b036f34efe1576aee#file-readme-txt
