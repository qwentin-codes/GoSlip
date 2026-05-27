# GoSlip v0.1.1 Lite

A condensed one-file MVP for digital permission slips.

## Files

- `index.html` — the whole app: landing page, login, dashboard, form builder, public submission page, and CSV export.
- `supabase-schema.sql` — database tables and security rules.
- `README.md` — setup notes.

## Free hosting

Use Cloudflare Pages.

1. Create a Supabase project.
2. Open Supabase SQL Editor and run `supabase-schema.sql`.
3. In Supabase, copy your Project URL and anon public key.
4. Open `index.html` and replace:
   - `YOUR_SUPABASE_URL`
   - `YOUR_SUPABASE_ANON_KEY`
5. Upload the folder to GitHub.
6. Connect the repo to Cloudflare Pages.
7. Build command: leave blank.
8. Output folder: `/`.

## Notes

This MVP uses typed guardian signatures. It is meant for simple program permission slips, not complex legal contracts.
