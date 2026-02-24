-- ============================================================
-- Fiorsaoirse — Leads Table
-- ============================================================
-- Target: FCA Supabase project (kidgcrqxrfcbsaeguwop)
-- Paste into Supabase SQL Editor and run.
-- ============================================================

CREATE TABLE IF NOT EXISTS leads (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT,
  email TEXT,
  phone TEXT,
  interest TEXT,
  source TEXT DEFAULT 'website',
  conversation_summary TEXT,
  notes TEXT,
  status TEXT DEFAULT 'new' CHECK (status IN ('new', 'contacted', 'qualified', 'converted', 'closed')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for quick lookups
CREATE INDEX IF NOT EXISTS idx_leads_email ON leads(email);
CREATE INDEX IF NOT EXISTS idx_leads_status ON leads(status);
CREATE INDEX IF NOT EXISTS idx_leads_created ON leads(created_at DESC);

-- No RLS — inserts come from n8n (server-side) only
-- ============================================================
