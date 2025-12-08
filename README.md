# Data Engineer Mini Data Hub Exercise (45 minutes)

## Context

VIA is building a Data Hub that combines search and booking data to enable analytics and reporting. This exercise evaluates your ability to:

- Design analytical data models
- Write SQL transformations
- Reason about data relationships
- Design data pipelines

## Task Overview

You have **45 minutes** to complete three parts:

1. **Model** a small analytical data hub (facts/dimensions)
2. **Write SQL** to compute conversion, revenue in USD, and optionally time-to-book
3. **Describe** a short pipeline design for daily ingestion and transformation

---

## Part 1 — Data Modeling (10–15 min)

Propose an analytical model containing:

- **Fact tables** (e.g., search events, booking events)
- **Dimension tables** (e.g., users, locations, channels)
- **Keys & derived fields** (e.g., `od_pair`, `booking_date`, `revenue_usd`)

**Output:** Document your model in `MODEL.md`

---

## Part 2 — SQL Transformations (20–25 min)

All SQL answers go into `queries.sql`.

### Query 1: Conversion by day + channel
- Output: `day`, `channel`, `searches`, `confirmed_bookings`, `conversion_rate`
- Must join `searches` + `bookings`
- Conversion rate = confirmed bookings / searches

### Query 2: Revenue in USD by day + origin + destination
- Output: `day`, `origin`, `destination`, `revenue_usd`
- Must join `bookings` with `fx_rates`
- Only include confirmed bookings (`status = 'confirmed'`)

### Query 3: (Optional) Average time-to-book
- Average minutes between `search_ts` → `booking_ts`
- Only for confirmed bookings

---

## Part 3 — Pipeline / Architecture (5–10 min)

In `PIPELINE.md`, describe:

- **Raw → staging → mart** layers
- **Partitioning strategy** (by date, etc.)
- **Incremental loads** (how to process only new data)
- **Backfills** (how to reprocess historical data)
- **Data quality checks** (what to validate)
- **Batch or streaming** ingestion approach

Use short bullet points.

---

## Data Files

The `data/` directory contains:

- `searches.csv` — Search events with origin, destination, channel, device, user
- `bookings.csv` — Booking records linked to searches, with price and currency
- `fx_rates.csv` — Currency exchange rates to USD

---

## Getting Started

1. Review the data files in `data/`
2. Design your model → `MODEL.md`
3. Write SQL queries → `queries.sql`
4. Describe pipeline → `PIPELINE.md`

Good luck!

