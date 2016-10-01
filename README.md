Thumbtack
=========

Thumbtack is an open source narrative mapping tool that solves the problem of
falsified, dubious, and contradictory stories as well as helps with information
overload by providing an "overview interface" that corroborates narratives
across multiple sources and formats. 

### Core Concepts

- Data collection
- Data search / viewing / readability (in different forms- incl constructing
narratives/stories)
- Human data contribution / analysis- lowering barriers, aggregating, including
different narratives
- Fact verifiability
- Data use- building towards concrete impact

### Core Components

- Timeline visualization
- Fact checking / ties to narratives
- Collaborative investigation
- Data loading from open sources
- Crowdsourcing frameworks

**Timeline Visualization**

Showing in chronological order (perhaps both horizontal and vertical?)
Expanding/contracting levels of detail

**Fact Checking / Ties to Narratives**

Categorizing of facts by narratives
Check/X depending on if it matches narratives

**Collaborative Investigation**

1. User Accounts: Accounts for tracking points, contributions. Can be tied to
social media accounts.
2. Collection of Contributions from Social Media: Anything with a certain
hashtag denoting the project and the relevant topic/fact is added. Develop a
notation for adding dates and other metadata.
3. Point System: Get points for adding data- links, comments, search terms,
voting, etc. Maybe some sort of badges by topic eventually, but keep it simple
at first.
4. Gamified Data Entry: Flexible system for entering data- forms that can be
integrated into many apps. Want it to both be ever-present, but also enable a
sense of flow and continous adding of data if needed.
5. Voting/Impact System: Ability to up vote/down vote contributions on many
apps- this results in more points for the poster. Also track impact- other
pieces of data that link to that fact, etc. and award points based on that

**Software Components**

1. Central data storage app: app for storing user accounts, data added, etc. and
API for updating it. Single, central app at first, but then make decentralized
version. Also should have a dashboard for managing topics- but this may
integrate with the overall TT app
2. Components that can be integrated into broader apps: Includes user
auth/linking, forms for data entry that report entered data and related objects,
voting systems, possibly notifications/status bar

**Crowdsourcing Frameworks**

- [Pybossa][1]

### Data Impact Tracking

- Endorsements- upvotes, comments, etc
- Spread- views, links, retweets, etc
- Other linked pieces of data- data about same person, company, etc)
- Linked outcomes- a court case that uses the data, a story that uses the
data, a politician who steps down due to the data, etc. could be structurally
the same as linked data, but with different scores

### Data Loading from Open Sources

- Load in from social media
- Load in news stories
- Load in from RSS feeds
- Load in any document with a date field- keep adding to Harvester
- Extract dates from documents and load in

---

Previously, this repo was a simple Ruby gem that generated data for
[TimelineJS][2] library. Bigger plans are in the works, but you can still use
that Ruby gem if you like :)

### TimelineJS Converter Gem

To install the TimelineGen JSON generator gem do:

```
gem install timelinegen
```

To use TimelineGen put the following in your Ruby code:

```
require 'timelinegen'

t = TimelineGen.new(json input, "name of fields to pull headlines from", 
	"name of field for main text", "name of field for start date", 
	"name of field for end date", "timeline title")

t.timeline
```

If you want multiple fields from the JSON to show up in a single field on the
timeline, just put a comma between the field names.


**Example**

The following generates a timeline with data from the email.json file.  The
subject of the emails is the headline, the sender, recipient, and email body are
the main text on the timeline, the start date is the send date, and there is no
end date.  The whole timeline will be labeled Email Timeline.

```
t = TimelineGen.new(File.read("emails.json"), 
	"subject", "to, from, body", "date", nil, "Email Timeline")

t.timeline
```

[1] http://pybossa.com "Pybossa"
[2] http://timeline.knightlab.com "TimelineJS"
