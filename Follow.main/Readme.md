Followers System
1. What Our Subsystem Does
It allows users to follow and unfollow other users. It supports follower and following lists, counts, mutual follows, follow suggestions, and a feed of posts from the users someone follows, while maintaining the relationships between users and their followers.
2. Table-by-Table Explanation
Table	Purpose	Key Columns
Users	Stores user information.	id (PK), username
Posts	Stores posts created by users. Used to build the feed.	id (PK), user_id (FK), url, caption, created_at
Followers	Stores who follows whom. Each row means one user follows another.	leader_id (FK), follower_id (FK), created_at

Terminology:

leader: the user being followed
follower: the user who follows the leader

A row (leader_id = 2, follower_id = 1) means user 1 follows user 2.

3. Relationships
The leader_id foreign key in the Followers table establishes a one-to-many (1:M) relationship between Users and Followers: one user can have many followers.
The follower_id foreign key in the Followers table establishes a one-to-many (1:M) relationship between Users and Followers: one user can follow many users.
Together, these two keys make Followers a junction table that creates a self-referencing many-to-many (M:N) relationship on Users.
The user_id foreign key in the Posts table establishes a one-to-many (1:M) relationship between Users and Posts, which is what lets us build a feed from followed users.
A CHECK (leader_id <> follower_id) constraint ensures a user cannot follow themselves.
4. Design Choice

We used a separate junction table (followers) with a self-referencing relationship on Users, instead of storing follower lists inside the Users table (for example as arrays or comma-separated values), because a user can have many followers and can follow many users.

Storing each follow as its own row keeps the schema normalized, makes follow and unfollow a simple INSERT and DELETE, and lets us answer questions like mutual follows, follow-backs, and suggestions with plain joins.

5. Indexing

We created indexes on the foreign keys to improve data retrieval performance:

Index	Purpose
followers.leader_id	Retrieve and count the followers of a particular user.
followers.follower_id	Retrieve and count the users a particular user follows.
