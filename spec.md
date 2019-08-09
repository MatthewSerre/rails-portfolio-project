# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - Clients and users have many notes and caseloads have many clients.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Notes belong to clients and users and caseloads belong to users.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - Users have many clients through notes and clients have many users through notes.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - Users have many clients through notes and clients have many users through notes.
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - Users can CRUD notes, which is the join table between users and clients.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - Each model has basic presence validations and the user has more rigorous validations to ensure uniqueness and good data.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Client has a class method def self.unassigned accessible at /clients/unassigned that returns a list instances of itself where the caseload_id attribute is equal to nil (i.e. does not belong to a caseload and therefore is unassigned to user, or case manager's, caseload).
- [x] Include signup (how e.g. Devise) - Sign up (i.e. registration) is handled primarily in the UsersController for individuals signing up with the native signup form and partially by the SessionsController for individuals signing in using Google.
- [x] Include login (how e.g. Devise) - The SessionsController handles login (i.e. signing in).
- [x] Include logout (how e.g. Devise) - The SessionsController handles logout (i.e. signing out).
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Users can sign in with Google.
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - For example, users can view a list of all notes for a client at /clients/:id/notes/:id.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - For example, users create a new note for a client at /clients/:id/notes/new.
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - Forms display full error messages when an action cannot be completed for authorization and/or validation issues.

Confirm:
- [x] The application is pretty DRY - Maybe...
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate - Several forms or lists are extracted to partials.
