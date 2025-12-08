# Data Engineer Mini Data Hub Exercise (45 minutes)

## Context

VIA is building a Data Hub that combines search and booking data to enable analytics and reporting. This exercise evaluates your ability to:

- Design analytical data models
- Write SQL transformations
- Reason about data relationships and edge cases
- Design data pipelines
- Identify and handle data quality issues

## Task Overview

You have **45 minutes** to complete three parts:

1. **Model** a small analytical data hub (facts/dimensions)
2. **Write SQL** to compute conversion, revenue in USD, and optionally time-to-book
3. **Describe** a short pipeline design for daily ingestion and transformation

**Important:** Review the data files carefully. You may encounter data quality issues, missing values, or ambiguous relationships that require thoughtful handling.

---

## Part 1 — Data Modeling (10–15 min)

Propose an analytical model that addresses:

- **Fact tables** and **dimension tables** appropriate for this domain
- **Keys & relationships** — consider how searches relate to bookings (one-to-one? one-to-many?)
- **Derived fields** — what computed fields would be useful for analytics?
- **Data quality considerations** — what issues did you notice in the raw data?

**Questions to consider:**
- How should you handle searches with no bookings?
- What if a booking references a search_id that doesn't exist?
- How do you handle currency conversions when exchange rates change over time?
- Should cancelled bookings be included in revenue calculations?

**Output:** Document your model in `MODEL.md`, including any assumptions or design decisions.

---

## Part 2 — SQL Transformations (20–25 min)

All SQL answers go into `queries.sql`. **Handle edge cases appropriately.**

### Query 1: Conversion by day + channel
- Output: `day`, `channel`, `searches`, `confirmed_bookings`, `conversion_rate`
- Conversion rate = confirmed bookings / searches
- **Consider:** How do you handle days/channels with zero searches? What about division by zero?

### Query 2: Revenue in USD by day + origin + destination
- Output: `day`, `origin`, `destination`, `revenue_usd`
- **Consider:** What if a booking's currency doesn't exist in fx_rates? What if exchange rates are missing for certain dates?
- Should cancelled bookings be excluded? What about bookings with null prices?

### Query 3: (Optional) Average time-to-book
- Average minutes between `search_ts` → `booking_ts` for confirmed bookings
- **Consider:** What if booking_ts is before search_ts? How do you handle null timestamps?

---

## Part 3 — Pipeline / Architecture (5–10 min)

In `PIPELINE.md`, describe:

- **Raw → staging → mart** layers
- **Partitioning strategy** (by date, etc.)
- **Incremental loads** (how to process only new data)
- **Backfills** (how to reprocess historical data)
- **Data quality checks** (what to validate — be specific based on issues you found)
- **Batch or streaming** ingestion approach
- **Error handling** — what happens when data quality checks fail?

Use short bullet points.

---

## Data Files

The `data/` directory contains:

- `searches.csv` — Search events with origin, destination, channel, device, user
- `bookings.csv` — Booking records linked to searches, with price and currency
- `fx_rates.csv` — Currency exchange rates to USD

**Note:** Real-world data is messy. Review these files carefully and document any data quality issues you discover.

---

## Getting Started

1. **Explore** the data files in `data/` — look for inconsistencies, missing values, or unexpected patterns
2. **Design** your model → `MODEL.md` (document assumptions)
3. **Write** SQL queries → `queries.sql` (handle edge cases)
4. **Describe** pipeline → `PIPELINE.md` (include data quality strategy)

Good luck!

