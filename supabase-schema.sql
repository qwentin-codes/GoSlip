create extension if not exists "pgcrypto";

create table if not exists forms (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  description text,
  consent_text text,
  media_release boolean default false,
  status text default 'active',
  created_at timestamptz default now()
);

create table if not exists submissions (
  id uuid primary key default gen_random_uuid(),
  form_id uuid not null references forms(id) on delete cascade,
  student_name text not null,
  guardian_name text not null,
  guardian_email text,
  guardian_phone text,
  emergency_contact text,
  media_ok boolean default false,
  signature text not null,
  created_at timestamptz default now()
);

alter table forms enable row level security;
alter table submissions enable row level security;

create policy "Users can manage their own forms"
on forms for all
using (auth.uid() = owner_id)
with check (auth.uid() = owner_id);

create policy "Anyone can read active public forms"
on forms for select
using (status = 'active');

create policy "Anyone can submit a public form"
on submissions for insert
with check (
  exists (
    select 1 from forms
    where forms.id = submissions.form_id
    and forms.status = 'active'
  )
);

create policy "Form owners can read submissions"
on submissions for select
using (
  exists (
    select 1 from forms
    where forms.id = submissions.form_id
    and forms.owner_id = auth.uid()
  )
);
