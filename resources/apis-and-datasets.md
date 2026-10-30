# APIs and datasets

## No key needed

- **Open-Meteo**: weather forecasts and history
- **REST Countries**: country data and flags
- **PokeAPI**: Pokémon data and sprites
- **Open Library**: books and covers
- **Wikipedia REST API**: article summaries and images
- **Frankfurter**: exchange rates
- **CoinGecko**: crypto prices (rate limited)
- **Nominatim (OpenStreetMap)**: geocoding; keep request volume low

## Free with a key

- **data.gov.sg**: Singapore open data (weather, transport, housing)
- **Google AI Studio (Gemini)**, **Groq**, **Hugging Face**: LLMs and other models
- **TMDB**: films and posters
- **Spotify Web API**: music metadata
- **Mapbox**: maps
- **Stripe** (test mode): payments without real money
- **Resend**: email
- **Cloudinary**: image upload and processing

## Plan around these

Twitter/X, Instagram, LinkedIn and most banking or health APIs need approval that takes days. Unless a sponsor gives you access at the event, mock them and say so in the README.

## Datasets

- **Kaggle**: mostly tabular, plus free notebooks with GPUs
- **Hugging Face Datasets**: text, images, audio
- **data.gov.sg**: Singapore data
- **Our World in Data**: cleaned CSVs on global topics
- **Google Dataset Search**: search across many sources

Download datasets before the event, check the licence, and cut them down to what you need for the demo.

## Fallbacks

External APIs can rate-limit you or go down during the demo. Wrapping calls with a fallback avoids that:

```ts
async function getWeather(city: string) {
  try {
    const res = await fetch(`https://api.open-meteo.com/v1/forecast?...`);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return await res.json();
  } catch (err) {
    console.warn("weather API failed, using saved response", err);
    return SAVED_WEATHER;
  }
}
```

## Things that run in the browser

These need no API key and work offline:

- MediaPipe or TensorFlow.js for image classification and pose detection from a webcam
- The Web Speech API for speech-to-text
- Tesseract.js for OCR
