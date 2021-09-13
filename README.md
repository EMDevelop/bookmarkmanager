## Bookmark Manager

### Intro

This project will allow users to interact with Bookmarks on the website. It will include:

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

### User Story / Domain Model

```
As a User
So that I can see which bookmarks exist
I want to see a list of bookmarks
```

`Bookmark`
|attributes|methods |
|----------|---------|
| name: String | |
| description: String | |

`BookmarkManager`
|attributes|methods |
|----------|---------|
| bookmarks: Array | list_bookmarks() |
| | |
