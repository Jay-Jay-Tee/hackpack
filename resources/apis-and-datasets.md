# APIs and datasets that make demos feel real

> The fastest way to a "wow" is a real API that returns something visual. Pick one of these instead of inventing a fake one.

## APIs you can call in 5 minutes (no approval)

| API | What it gives you | Auth |
| --- | --- | --- |
| **Open-Meteo** | Weather, forecasts, historical | None |
| **REST Countries** | Country data, flags | None |
| **TheCatAPI / Dog CEO** | Cat/dog photos | None or free key |
| **PokeAPI** | Pokémon data + sprites | None |
| **Jikan** | Anime/manga data | None |
| **Open Library** | Books, covers | None |
| **Wikipedia REST** | Summaries, images | None |
| **CoinGecko** | Crypto prices | None (rate-limited) |
| **Frankfurter** | Exchange rates | None |
| **Nominatim (OSM)** | Geocoding | None (be polite) |
| **Sunrise-Sunset** | Sun times | None |
| **Quotable** | Quotes | None |
| **Data.gov.sg** | Singapore open data (weather, transport, HDB) | Free key |

## APIs that need a key but are free

| API | Use |
| --- | --- |
| **Google AI Studio (Gemini)** | Text, vision, image understanding |
| **Groq** | Very fast LLM inference |
| **Hugging Face Inference** | Image gen, classification, speech |
| **OpenWeather** | Weather (free tier) |
| **NewsAPI** | Headlines |
| **Spotify Web API** | Music data, playlists |
| **TMDB** | Movies, posters |
| **Mapbox** | Maps (generous free tier) |
| **Twilio** | SMS/voice (trial credit) |
| **Stripe** | Test-mode payments, no real money |
| **Resend / Postmark** | Transactional email |
| **UploadThing / Cloudinary** | File & image uploads |

## APIs that need approval (plan around them)

- **Twitter/X**, **Meta/Instagram**, **LinkedIn** — OAuth review can take days. Not for a weekend.
- **Google Maps** beyond the free tier — needs billing enabled.
- **Banking / healthcare** — forget it.
- Most **enterprise** APIs — unless a sponsor hands you keys at the event.

**Rule:** if it needs approval, mock it. Label it as mocked. Swap it in if approval arrives.

---

## Where to find a dataset fast

| Source | Good for |
| --- | --- |
| **Kaggle** | Anything tabular; also free GPUs/notebooks |
| **Hugging Face Datasets** | Text, images, audio, multilingual |
| **data.gov.sg** | Singapore-specific (great for local tracks) |
| **data.gov** (US) | US public data |
| **Our World in Data** | Clean CSVs on global issues |
| **Google Dataset Search** | Meta-search |
| **Awesome Public Datasets** (GitHub) | Curated list |
| **Common Crawl / The Pile** | If you're doing something NLP-heavy |

**Hackathon dataset rules:**
1. Download it **before** the event starts, or you'll spend 3 hours on a dead link.
2. Check the licence — some are non-commercial only.
3. Sample it down. You don't need 40 GB to demo.
4. Clean it once, save the clean CSV, commit *that* (if small) so teammates don't redo it.

---

## Patterns that win points

**Use the sponsor's API in the core loop.** "Best use of X" prizes are the least competitive because most teams ignore them.

**Have a fake-data fallback.** Every external API has a rate limit and a bad day. Wrap it:

```ts
async function getWeather(city: string) {
  try {
    const res = await fetch(`https://api.open-meteo.com/v1/forecast?...`);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return await res.json();
  } catch (err) {
    console.warn("weather api failed, using fixture", err);
    return FIXTURE_WEATHER;   // demo never dies
  }
}
```

**Cache the expensive call.** If your LLM takes 8 seconds, call it once during setup, store the result, and stream it back during the demo.

**Label your mocks.** In the README and, if asked, in the pitch. Judges respect a team that knows exactly what's real.

---

## Cheap "AI" wins that aren't LLM wrappers

Judges are tired of chat interfaces. These feel more impressive:

- **Image classification** on a webcam feed (MediaPipe / TensorFlow.js, runs in-browser, no key)
- **Speech-to-text** with the Web Speech API (free, built into browsers)
- **OCR** with Tesseract.js
- **Pose detection** with MediaPipe
- **Semantic search** over your own docs with embeddings
- **A recommendation system** on a small dataset — explainability beats a black box

Back to → [README](../README.md)
