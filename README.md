# Thanksgiving table

A one-page sign-up for what everyone is bringing to Thanksgiving. Each entry lands as a plate on the table.

It is a single `index.html` served by GitHub Pages. The shared list lives in a free Supabase database.

## Connect the database (one time, about five minutes)

1. Go to https://supabase.com, sign up, and create a new project (the free plan is enough).
2. Open **SQL Editor**, paste everything in `supabase.sql`, and press **Run**.
3. Open **Project Settings > API** (or **API Keys**). Copy the **Project URL** and the **publishable** key (older projects call it the **anon public** key). Never use the secret / service_role key.
4. Paste the two values into `SUPABASE_URL` and `SUPABASE_KEY` near the bottom of `index.html`, commit, and push.

Until step 4 is done the page runs in preview mode and saves entries only on the device that typed them.

## Sound and link preview

The music and sound effects are generated in the page, so there are no audio files. `og.png` is the picture shown when the link is shared.

## Change the details

The title, date line and `PARTY_DATE` are all in `index.html`.
