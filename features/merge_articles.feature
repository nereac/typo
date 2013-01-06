Feature: merge of similar articles

  As a blog administrator
  As multiple users can write similar articles
  I want be able merge similar articles

  Background: Users, articles and comments in database

    Given the blog is set up

    Given the following users exist:
    | id  | login | password |      email    | name |
    | 2   | pepe  |  111111  | pepe@mail.com | Pepe |
    | 3   | paco  |  222222  | paco@mail.com | Paco |

    Given the following articles exist:
    | id |   title  | author | user_id |   body   |      published_at    | 
    | 3  | Article1 |  pepe  |    2    | Content1 |  2012-10-10 10:10:00 | 
    | 4  | Article2 |  paco  |    3    | Content2 |  2012-09-09 09:09:00 |

    Given the following comments exist:
    | id | author |    body   | article_id | user_id |     created_at      |
    | 1  |  pepe  |  Comment1 |     3      |    2    | 2012-11-11 11:11:00 |
    | 2  |  paco  |  Comment2 |     4      |    3    | 2012-12-12 12:12:00 |



