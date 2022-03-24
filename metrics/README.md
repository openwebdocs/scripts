This directory contains some scripts and data for generating metrics about the work of Open Web Docs.

It's got three subdirectories: *query*, *data*, and *analyse*.

## query

This contains a script that will fetch all PRs from mdn/content and just log them as a huge JSON array. It takes a few minutes to run. You will need a [personal access token from GitHub](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) to use this script.

Then you pass the token in like this:

```
 node query-prs.js MY-TOKEN-HERE
 ```

 It's (obviously) advisable not to run this again and again, but to run it once, then analyse the results at your leisure.

## data

This contains data scraped from GitHub using the `query` script ("prs.json") and another data file called "organizations.json".

The "organizations.json" file contains an object each of whose keys represents an organization. The key is the organization name. Each organization object lists the GitHub usernames for people in that organization for each month we are interested in.

## analyse

This contains a script that figures out, month by month, which PRs were files by members of a particular organization listed in "organizations.json".
