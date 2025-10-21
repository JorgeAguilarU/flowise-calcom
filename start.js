const concurrently = require('concurrently');

concurrently([
  {
    command: 'npm run start',
    name: 'flowise',
    cwd: '/app/flowise',
  },
  {
    command: 'npm run start',
    name: 'calcom',
    cwd: '/app/cal',
  }
], {
  prefix: 'name',
  killOthers: ['failure', 'success'],
  restartTries: 3
});