# LRU (Least recently used) cache

- This type of cache discards least-recently-used items first.0
- This algorithm requires keeping track of what was used and when.

## How it works

![LRU Cache](https://miro.medium.com/v2/resize:fit:753/1*bUJkQw-fNIkQvuRVtI8jlg@2x.jpeg)

## Requirements

- The cache should have a capacity.
- The latest element read from the cache should be the most-recently-use item in the cache.
- The `get` function must run in O(1) average time complexity.

## How to run the project

```sh
$ bundle install # Install the dependencies

$ rake # Run the tests
```
