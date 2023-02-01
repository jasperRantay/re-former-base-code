Create a Post model and a Posts controller and a corresponding resource in your Routes file which allows the [:new, :create, :index] methods.
Atop your Posts Controller, use a #before_action to restrict access to the #new and #create methods to only users who are signed in.
For your Posts Controller, prepare your #new action.
Write a very simple form in the app/views/posts/new.html.erb view which will create a new Post.
Make your corresponding #create action build a post where the foreign key for the author (e.g. user_id) is automatically populated based on whichever user is signed in. Redirect to the Index view if successful.
Fill out the #index action of the PostsController and create the corresponding view. The view should show a list of every post.
Now add logic in your Index view to display the author’s name, but only if a user is signed in.
Sign in and create a few secret posts.
Test it out – sign out and go to the index page. You should see a list of the posts but no author names. Sign in and the author names should appear. Your secrets are safe!
