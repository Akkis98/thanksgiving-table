# Thanksgiving table

A one-page sign-up for what everyone is bringing to Thanksgiving. Each entry lands as a plate on the table.

It is a single `index.html` served by GitHub Pages. The shared list lives in a free Supabase database.

## How the page is laid out

- **The invitation.** The top of the page is the family portrait (`montage.html`), filling the screen, with an arrow down to the sign-up. The Invitation button in the header scrolls back up to it.
- **The Feast** and **The Tree.** Two tabs for the two halves of the evening. Each has a scene (the table, the tree), a list by guest, and one button to add something. Tapping any entry lets you edit or remove it.
- **Design tokens.** Colors, fonts, spacing, radii and shadows are defined once at the top of the `<style>` block in `index.html`. The tree tab only swaps the accent color.

The database only allows adding and removing rows, so an edit saves the new version and then removes the old one.

## The database

The page is connected to a Supabase project named `thanksgiving-table` (the URL and publishable key are near the top of the script in `index.html`). The steps below are only needed to point it at a different project.

## Connect a database (one time, about five minutes)

1. Go to https://supabase.com, sign up, and create a new project (the free plan is enough).
2. Open **SQL Editor**, paste everything in `supabase.sql`, and press **Run**.
3. Open **Project Settings > API** (or **API Keys**). Copy the **Project URL** and the **publishable** key (older projects call it the **anon public** key). Never use the secret / service_role key.
4. Paste the two values into `SUPABASE_URL` and `SUPABASE_KEY` near the bottom of `index.html`, commit, and push.

Until step 4 is done the page runs in preview mode and saves entries only on the device that typed them.

## Sound and link preview

The music and sound effects are generated in the page, so there are no audio files. Music is on by default and starts as soon as the browser allows it (usually the guest's first tap); the Music button turns it off, and that choice is remembered. `og.png` is the picture shown when the link is shared.

## Change the details

The title, date line and `PARTY_DATE` are all in `index.html`.
