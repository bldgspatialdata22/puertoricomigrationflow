pr_counties <- tigris::counties(state = "PR", cb = TRUE)


# 2015
pr_counties_flows_2015 <-
  purrr::map_dfr(
    pr_counties$COUNTYFP,
    ~ get_flows(
      geography = "county",
      state = "PR",
      county = .x,
      year = 2015
    )
  )

pr_counties_flows_2015$year <- 2015


# 2016}
pr_counties_flows_2016 <-
  purrr::map_dfr(
    pr_counties$COUNTYFP,
    ~ get_flows(
      geography = "county",
      state = "PR",
      county = .x,
      year = 2016
    )
  )

pr_counties_flows_2016$year <- 2016


# 2017}
pr_counties_flows_2017 <-
  purrr::map_dfr(
    pr_counties$COUNTYFP,
    ~ get_flows(
      geography = "county",
      state = "PR",
      county = .x,
      year = 2017
    )
  )

pr_counties_flows_2017$year <- 2017

# 2018}
pr_counties_flows_2018 <-
  purrr::map_dfr(
    pr_counties$COUNTYFP,
    ~ get_flows(
      geography = "county",
      state = "PR",
      county = .x,
      year = 2018
    )
  )

pr_counties_flows_2018$year <- 2018


# 2019}
pr_counties_flows_2019 <-
  purrr::map_dfr(
    pr_counties$COUNTYFP,
    ~ get_flows(
      geography = "county",
      state = "PR",
      county = .x,
      year = 2019
    )
  )

pr_counties_flows_2019$year <- 2019

# FIXME: Combine the multiple years here
# pr_counties_flows_2015_2019 <-
# bind_rows(
#   
# )

readr::write_rds(pr_counties_flows_2015_2019, "data/pr_counties_flows_2015_2019.rds")


