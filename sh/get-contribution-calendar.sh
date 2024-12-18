#!/bin/bash

AUTH="Authorization: bearer $$$"

curl -i -H 'Content-Type: application/json' -H "$AUTH" -X POST -d '{"variables":{"login":"caiocampos"},"query":"query ($login: String!) { user(login: $login) { contributionsCollection { contributionCalendar { weeks { contributionDays { contributionCount contributionLevel weekday date } } } } } } "}' https://api.github.com/graphql
