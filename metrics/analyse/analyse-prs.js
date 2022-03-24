const fs = require('fs');

function initializeBuckets(json) {

  const buckets = {
    '2021-01': [],
    '2021-02': [],
    '2021-03': [],
    '2021-04': [],
    '2021-05': [],
    '2021-06': [],
    '2021-07': [],
    '2021-08': [],
    '2021-09': [],
    '2021-10': [],
    '2021-11': [],
    '2021-12': [],
    '2022-01': [],
    '2022-02': [],
    '2022-03': []
  }

  for (const pr of json) {
    const prefix = pr.created_at.slice(0, 7);
    const bucket = buckets[prefix];
    if (!bucket) continue;
    const creatorIndex = bucket.findIndex(contributor => contributor.name === pr.user.login);
    if (creatorIndex === -1) {
      bucket.push({
        name: pr.user.login,
        count: 1
      });
    } else {
      bucket[creatorIndex].count++;
    }
  }

  return buckets;
}

function analyse(buckets, organization) {

  for (const bucketName of Object.keys(buckets)) {
    const team = organization[bucketName];
    const users = buckets[bucketName].filter(user => team.includes(user.name));
    const contributions = users.reduce((previousValue, currentValue) => previousValue + currentValue.count, 0)
    console.log(`${bucketName}: ${contributions}`);
  }

}

const prJSON = fs.readFileSync('../data/prs.json', 'utf8');
const prs = JSON.parse(prJSON);

const buckets = initializeBuckets(prs);

const orgJSON = fs.readFileSync('../data/organizations.json', 'utf8');
const organizations = JSON.parse(orgJSON);

analyse(buckets, organizations['owd']);
