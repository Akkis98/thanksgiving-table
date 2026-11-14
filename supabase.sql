-- Run this once in the Supabase SQL Editor (Database > SQL Editor > New query > Run).

create table public.dishes (
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(name) between 1 and 40),
  item text not null check (char_length(item) between 1 and 80),
  category text not null check (category in ('mains', 'sides', 'desserts', 'drinks', 'supplies', 'other', 'tree')),
  note text check (note is null or char_length(note) <= 140),
  photo text check (photo is null or (char_length(photo) <= 600 and photo ~ '^https://(thumb|upload)\.wikimedia\.org/')),
  created_at timestamptz not null default now()
);

alter table public.dishes enable row level security;

-- Anyone with the link can see the list, add to it, and remove an entry.
-- Nobody can edit an existing entry or touch anything else in the project.
create policy "anyone can read" on public.dishes for select to anon using (true);
create policy "anyone can add" on public.dishes for insert to anon with check (true);
create policy "anyone can remove" on public.dishes for delete to anon using (true);

grant select, insert, delete on public.dishes to anon;

-- Live updates: a new dish shows up on everyone's screen without a refresh.
alter publication supabase_realtime add table public.dishes;
