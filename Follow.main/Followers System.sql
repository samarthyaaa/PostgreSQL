-- prevent self-follow
ALTER TABLE followers
	ADD CONSTRAINT chk_no_self_follow CHECK(leader_id <> follower_id);
CREATE INDEX idx_followers_leader_id ON followers(leader_id);
CREATE INDEX idx_followers_follower_id ON followers(follower_id);
-- follow
INSERT INTO followers (leader_id, follower_id) VALUES (2, 1);
-- unfollow
DELETE FROM followers WHERE leader_id = 2 AND follower_id = 1;
-- followers of a user
SELECT u.id, u.username
FROM followers f
JOIN users u ON u.id = f.follower_id
WHERE f.leader_id = 1;
-- users a user follows
SELECT u.id, u.username
FROM followers f
JOIN users u ON u.id = f.leader_id
WHERE f.follower_id = 1;
-- follower count
SELECT COUNT(*) AS followers FROM followers WHERE leader_id = 1;

-- following count
SELECT COUNT(*) AS following FROM followers WHERE follower_id = 1;

-- does user 1 follow user 2
SELECT EXISTS (
	SELECT 1 FROM followers WHERE leader_id = 2 AND follower_id = 1
) AS is_following;

-- mutual follows (friends) of a user
SELECT u.id, u.username
FROM followers f1
JOIN followers f2 ON f1.leader_id = f2.follower_id AND f1.follower_id = f2.leader_id
JOIN users u ON u.id = f1.leader_id
WHERE f1.follower_id = 1;

-- users I follow who don't follow me back
SELECT u.id, u.username
FROM followers f
JOIN users u ON u.id = f.leader_id
WHERE f.follower_id = 1
  AND f.leader_id NOT IN (SELECT follower_id FROM followers WHERE leader_id = 1);

-- followers I don't follow back
SELECT u.id, u.username
FROM followers f
JOIN users u ON u.id = f.follower_id
WHERE f.leader_id = 1
  AND f.follower_id NOT IN (SELECT leader_id FROM followers WHERE follower_id = 1);

-- users followed by both user 1 and user 2
SELECT leader_id FROM followers WHERE follower_id = 1
INTERSECT
SELECT leader_id FROM followers WHERE follower_id = 2;

-- follow suggestions (people followed by those I follow)
SELECT DISTINCT f2.leader_id
FROM followers f1
JOIN followers f2 ON f2.follower_id = f1.leader_id
WHERE f1.follower_id = 1
  AND f2.leader_id <> 1
  AND f2.leader_id NOT IN (SELECT leader_id FROM followers WHERE follower_id = 1);

-- feed from followed users
SELECT p.id, p.url, p.caption, p.created_at
FROM posts p
JOIN followers f ON f.leader_id = p.user_id
WHERE f.follower_id = 1
ORDER BY p.created_at DESC
LIMIT 50;

-- most followed users
SELECT leader_id, COUNT(*) AS follower_count
FROM followers
GROUP BY leader_id
ORDER BY follower_count DESC
LIMIT 10;

-- new followers in last 7 days
SELECT follower_id, created_at
FROM followers
WHERE leader_id = 1
  AND created_at > CURRENT_TIMESTAMP - INTERVAL '7 days';

-- users following nobody
SELECT id, username FROM users
WHERE id NOT IN (SELECT follower_id FROM followers);

-- users with no followers
SELECT id, username FROM users
WHERE id NOT IN (SELECT leader_id FROM followers);
