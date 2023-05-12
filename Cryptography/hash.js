const { createHash } = require('crypto');

// Create a string hash

function hash(input) {
  return createHash('sha256').update(input).digest('hex');
}

// Compare two hashed passwords

let password = 'hello';
const hash1 = hash(password);
const hash2 = hash(password);
const match = hash1 === hash2
console.log(match ? 'good password' : 'passwords do not match');
