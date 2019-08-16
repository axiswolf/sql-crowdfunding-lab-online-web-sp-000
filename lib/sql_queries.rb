# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT pr.title AS title, SUM(pl.amount) AS amount FROM pledges AS pl
  LEFT JOIN projects AS pr ON pl.project_id = pr.id
  GROUP BY pr.id
  ORDER BY title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT us.name AS user_name, us.age, SUM(pl.amount) AS amount FROM pledges as pl
  LEFT JOIN users AS us ON pl.user_id = us.id
  GROUP BY us.id
  ORDER BY user_name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, (projects.funding_goal - SUM(pledges.amount)) * -1 AS over_goal FROM projects
    INNER JOIN pledges
      ON projects.id = pledges.project_id
    GROUP BY projects.title
    HAVING over_goal >= 0;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT users.name, SUM(pledges.amount) AS summed_amount from users
  INNER JOIN pledges
    ON users.id = pledges.user_id
    GROUP BY users.name
    ORDER by summed_amount"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount FROM projects
    INNER JOIN pledges
      ON projects.id = pledges.project_id
    WHERE category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, SUM(pledges.amount) FROM projects
    INNER JOIN pledges
      ON projects.id = pledges.project_id
    WHERE category = 'books'"
end
