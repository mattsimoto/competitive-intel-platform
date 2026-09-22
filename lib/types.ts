export interface Company {
  id: string;
  name: string;
  website_url: string | null;
  description: string | null;
  company_type_id: string | null;
  competitive_score: number | null;
  confidence_score: number | null;
  intelligence_status: string;
  status: string;
  linkedin_url: string | null;
  x_url: string | null;
  youtube_url: string | null;
  facebook_url: string | null;
  original_import_reference: string | null;
  last_verified_at: string | null;
  last_material_change_at: string | null;
}

export interface Product {
  id: string;
  name: string;
  description: string | null;
  product_url: string | null;
  current_price_min: number | null;
  current_price_max: number | null;
  currency: string | null;
  pricing_unit: string | null;
  confidence_score: number | null;
  intelligence_status: string;
}
