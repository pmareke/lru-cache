# LRU (Least recently used) cache [![test](https://github.com/pmareke/lru-cache/actions/workflows/test.yml/badge.svg)](https://github.com/pmareke/lru-cache/actions/workflows/test.yml)

- This type of cache discards least-recently-used items first.0
- This algorithm requires keeping track of what was used and when.

## How it works

![LRU Cache](https://miro.medium.com/v2/resize:fit:753/1*bUJkQw-fNIkQvuRVtI8jlg@2x.jpeg)

## Requirements

- The cache should have a capacity.
- The latest element read from the cache should be the most-recently-use item in the cache.
- The `get` function must run in O(1) average time complexity.

## Components

- `Node`: basic unit of information with the value, next and previous.
- `DoubleLinkedList`: a list with nodes connected in a double way (previuos and next).
- `LRUCache`: main component, it has a `DoubleLinkedList` and hash to stores the `Nodes`.

## How to run the project

```sh
$ bundle install # Install the dependencies

$ rake # Run the tests
```
