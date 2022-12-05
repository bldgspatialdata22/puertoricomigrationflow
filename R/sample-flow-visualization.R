library(mapdeck)

sanjuan_inflow <-
  get_flows(
  geography = "county",
  state = "PR",
  county = "San Juan Municipio",
  geometry = TRUE
) %>%
  filter(variable == "MOVEDIN") %>%
  na.omit() %>%
  arrange(desc(estimate))

# FIXME:
# Sign up for a MapBox account: https://account.mapbox.com/auth/signup/
# Get the token: https://account.mapbox.com/access-tokens/
# Run the following once to install your token
# mapboxapi::mb_access_token("<Your token goes here>" install = TRUE)

sanjuan_inflow %>%
  slice_max(estimate, n = 30) %>%
  mutate(weight = estimate / 500) %>%
  mapdeck(token = mapboxapi::get_mb_access_token()) %>%
  add_arc(origin = "centroid2",
          destination = "centroid1",
          stroke_width = "weight",
          update_view = FALSE) 
