# GoSlip v0.2.0 Lite

GoSlip is a tiny static web app for Typeform-style forms and digital permission slips.

This version keeps the project simple:

- `index.html` — the whole app.
- `supabase-schema.sql` — database tables, v0.2.0 upgrades, and security rules.
- `README.md` — setup notes.

## What's new in v0.2.0

- Typeform-style one-question-at-a-time public forms.
- Regular forms, not just permission slips.
- Templates:
  - Permission slip
  - General signup form
  - Interest form
  - Feedback form
  - Blank form
- Field types:
  - Short answer
  - Long answer
  - Email
  - Phone
  - Number
  - Date
  - Dropdown
  - Multiple choice
  - Checkboxes
  - Consent checkbox
  - Typed signature
- Form category labels.
- Form preview before saving.
- Editable saved forms.
- Better response dashboard.
- Dynamic CSV export.

## Free hosting

Use Cloudflare Pages.

1. Create a Supabase project.
2. Open Supabase SQL Editor.
3. Run `supabase-schema.sql`.
4. In Supabase, copy your Project URL and anon public key.
5. Open `index.html` and replace:
   - `YOUR_SUPABASE_URL`
   - `YOUR_SUPABASE_ANON_KEY`
6. Upload the folder to Cloudflare Pages.
7. Build command: leave blank.
8. Output folder: `/`.

## Updating from v0.1.1

You can run the new `supabase-schema.sql` in your existing Supabase project. It uses `add column if not exists`, so it should preserve your current forms and submissions.

Then replace your old `index.html` with the new one and redeploy on Cloudflare Pages.

## Notes

GoSlip uses typed signatures and consent checkboxes. It is good for simple program forms, permission slips, signups, and records. Do not advertise it as a certified legal contract/e-signature platform.
