# Todo List #

### RoR ###

* Clean up Gemfile
* Put together README.md

### Features ###

* Email address signup verification
* Password resets
* Notifications
* Search bar
* Other-user discovery process
* Full admin functionality
    * specific admin accounts (with custom styling so it's obvious)
* User preferences
* Imageable user avatars and posts
* Post title automagic

### Features to discuss (future dev?) ###

* Unique usernames
* RSS feeds
* API for third-party developers
* Trending posts display
* Refactor subselect for scaling
* Alternate user authentication options:
    * OpenID
    * LaunchKey
    * Twitter
    * Namecoin?
* User authentication refactor with Devise gem (http://devise.plataformatec.com.br)

### Style ###

* Complete overhaul of styling

### Views ###

* Add timestamps (in words) to posts
* Show next to post
    * number of total comments
    * number of comments since last visit
    * number of users invited
* Add wrapper for long words helper to feed


### Flow ###

#### User adds another user ####

1. Signed-in user1 wants to add another user.
1. User1 navigates to "add another user" page.

    The page contains a single text field with with a submit button.

1. Upon submission, monkfish sanitizes and applies regex logic to determine
   whether text is one of:

    * email address
    * monkfish username

1. If email address, offers user1 to send an email invitation for monkfish
   to potential user2 on user1's behalf.

    Confirm and send email inviting potential user2 to monkfish.

    Send user1 a notification if and when user2 joins.

1. If monkfish username, user1 is flashed a "user2 has been invited to see
   and share content with you" message. Redirect user1 to /

    Send user2 a notification that user1 wants to see and share content.

    If user2 accepts, user1 is notified.

    If user2 declines, user1 is not notified.