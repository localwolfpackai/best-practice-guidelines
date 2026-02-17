---
description: Guidelines and best practices for building applications with Beefree SDK, including installation, authentication, configuration, customization, and template management
---

# Beefree SDK

> Integration guide for [Beefree SDK](https://docs.beefree.io/beefree-sdk) — covering installation, authentication, configuration, customization, and template management.

---

## Installation

### Package Installation

```bash
npm install @beefree.io/sdk
# or
yarn add @beefree.io/sdk
```

### Dependencies

```json
{
  "dependencies": {
    "@beefree.io/sdk": "^9.0.2",
    "axios": "^1.10.0",
    "express": "^5.1.0",
    "cors": "^2.8.5",
    "dotenv": "^17.2.0"
  }
}
```

### Environment Setup

Create a `.env` file in your project root with your Beefree credentials:

```env
BEE_CLIENT_ID=your_client_id_here
BEE_CLIENT_SECRET=your_client_secret_here
```

## Authentication

### Proxy Server Setup

Always use a proxy server for authentication to protect your credentials. Never expose client secrets in frontend code.

```javascript
import express from 'express';
import cors from 'cors';
import axios from 'axios';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
const PORT = 3001;

app.use(cors());
app.use(express.json());

const BEE_CLIENT_ID = process.env.BEE_CLIENT_ID;
const BEE_CLIENT_SECRET = process.env.BEE_CLIENT_SECRET;

app.post('/proxy/bee-auth', async (req, res) => {
  try {
    const { uid } = req.body;

    const response = await axios.post(
      'https://auth.getbee.io/loginV2',
      {
        client_id: BEE_CLIENT_ID,
        client_secret: BEE_CLIENT_SECRET,
        uid: uid || 'demo-user'
      },
      { headers: { 'Content-Type': 'application/json' } }
    );

    res.json(response.data);
  } catch (error) {
    console.error('Auth error:', error.message);
    res.status(500).json({ error: 'Failed to authenticate' });
  }
});

app.listen(PORT, () => {
  console.log(`Proxy server running on http://localhost:${PORT}`);
});
```

### Authentication Process

- Use the V2 authentication endpoint: `https://auth.getbee.io/loginV2`
- Pass the **entire** API response to the Beefree SDK, not just the token

```typescript
const token = await fetch('http://localhost:3001/proxy/bee-auth', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ uid: 'demo-user' })
}).then(res => res.json());
```

## Container Setup

### HTML Container

```html
<div id="beefree-sdk-container"></div>
```

### CSS Styling

```css
#beefree-sdk-container {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 600px;
  width: 90%;
  margin: 20px auto;
  border: 1px solid #ddd;
  border-radius: 8px;
}
```

### React Container

```typescript
const containerRef = useRef<HTMLDivElement>(null);

return (
  <div
    id="beefree-react-demo"
    ref={containerRef}
    style={{
      height: '600px',
      width: '90%',
      margin: '20px auto',
      border: '1px solid #ddd',
      borderRadius: '8px'
    }}
  />
);
```

## Configuration

### Required Parameters

```typescript
const beeConfig = {
  container: 'beefree-sdk-container', // Required
  language: 'en-US'
};
```

### Optional Parameters

```typescript
const beeConfig = {
  container: 'beefree-sdk-container',
  language: 'en-US',
  specialLinks: [
    { type: "unsubscribe", label: "Unsubscribe", link: "http://[unsubscribe]/" },
    { type: "subscribe", label: "Subscribe", link: "http://[subscribe]/" },
  ],
  mergeTags: [
    { name: "First Name", value: "[first_name]" },
    { name: "Last Name", value: "[last_name]" },
    { name: "Email", value: "[email]" },
  ]
};
```

### Callback Functions

```typescript
const beeConfig = {
  container: 'beefree-sdk-container',
  onSave: function (jsonFile, htmlFile) {
    console.log("Template saved:", jsonFile);
  },
  onAutoSave: function (jsonFile) {
    localStorage.setItem("email.autosave", jsonFile);
  },
  onSend: function (htmlFile) {
    console.log("Email ready to send:", htmlFile);
  },
  onError: function (errorMessage) {
    console.error("Beefree SDK error:", errorMessage);
  }
};
```

## SDK Initialization

### Basic Initialization

```typescript
async function initializeBeefree(authResponse) {
  try {
    const bee = new BeefreeSDK(authResponse);
    bee.start(beeConfig, {});
  } catch (error) {
    console.error('Failed to initialize Beefree SDK:', error);
  }
}
```

### React Integration

```typescript
useEffect(() => {
  async function initializeEditor() {
    const beeConfig = {
      container: 'beefree-react-demo',
      language: 'en-US',
      onSave: (pageJson: string, pageHtml: string) => {
        console.log('Saved!', { pageJson, pageHtml });
      },
      onError: (error: unknown) => {
        console.error('Error:', error);
      }
    };

    const token = await fetch('http://localhost:3001/proxy/bee-auth', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ uid: 'demo-user' })
    }).then(res => res.json());

    const bee = new BeefreeSDK(token);
    bee.start(beeConfig, {});
  }

  initializeEditor();
}, []);
```

## Template Loading

### Loading Templates

```typescript
const selectedTemplate = JSON.parse(localStorage.getItem('currentEmailData'));

if (selectedTemplate) {
  beefreeSDKInstance.start(selectedTemplate);
} else {
  beefreeSDKInstance.start();
}
```

### Template Storage

```typescript
// Save
localStorage.setItem('currentEmailData', JSON.stringify(templateData));
localStorage.setItem('currentEmailName', emailName);

// Load
const emailData = localStorage.getItem('currentEmailData');
const emailName = localStorage.getItem('currentEmailName');
```

### Autosave

```typescript
onAutoSave: function (jsonFile) {
  localStorage.setItem("email.autosave", jsonFile);
}
```

## HTML Import

### HTML Importer API

- Endpoint: `https://api.getbee.io/v1/conversion/html-to-json`
- Reference: [HTML Importer API Documentation](https://docs.beefree.io/beefree-sdk/apis/html-importer-api/import-html)

```javascript
const response = await fetch('https://api.getbee.io/v1/conversion/html-to-json', {
  method: 'POST',
  headers: {
    "Authorization": "Bearer YOUR_API_KEY",
    "Content-Type": "text/html"
  },
  body: "<html><body><h1>Hello World</h1></body></html>"
});
const data = await response.json();
```

### Loading Imported Templates

```typescript
const importedTemplate = await importHtmlTemplate(htmlContent);
beefreeSDK.start(importedTemplate);
```

## Error Handling

### onError Callback

Always implement the `onError` callback:

```typescript
onError: function (errorMessage) {
  console.error("Beefree SDK error:", errorMessage);
  document.getElementById('beefree-sdk-container').innerHTML =
    '<div class="error">Error loading editor: ' + errorMessage.message + '</div>';
}
```

### Authentication Error Handling

```typescript
function getBeeToken(callback) {
  fetch('/api/beefree/auth', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      client_id: 'your_client_id',
      client_secret: 'your_client_secret',
      uid: beeConfig.uid
    })
  })
  .then(response => {
    if (!response.ok) throw new Error('Auth failed: ' + response.status);
    return response.json();
  })
  .then(data => callback(data))
  .catch(error => {
    console.error('Error getting Beefree token:', error);
  });
}
```

## Template Change Tracking

Use the `onChange` callback to track template changes:

```typescript
onChange: function (jsonFile, response) {
  console.log('Template changed:', response);
}
```

Reference: [Track Message Changes Documentation](https://docs.beefree.io/beefree-sdk/getting-started/tracking-message-changes)

## Customization

### UI Customization

- [Customized Themes](https://docs.beefree.io/beefree-sdk/other-customizations/appearance/themes)
- [Custom CSS](https://docs.beefree.io/beefree-sdk/other-customizations/appearance/custom-css)

### Language

```typescript
const beeConfig = {
  container: 'beefree-sdk-container',
  language: 'en-US', // or 'es-ES', 'fr-FR', etc.
};
```

### Merge Tags and Special Links

```typescript
const beeConfig = {
  container: 'beefree-sdk-container',
  mergeTags: [
    { name: "First Name", value: "[first_name]" },
    { name: "Last Name", value: "[last_name]" },
    { name: "Email", value: "[email]" },
    { name: "Company", value: "[company]" }
  ],
  specialLinks: [
    { type: "unsubscribe", label: "Unsubscribe", link: "http://[unsubscribe]/" },
    { type: "subscribe", label: "Subscribe", link: "http://[subscribe]/" },
    { type: "webview", label: "View in Browser", link: "http://[webview]/" }
  ]
};
```

Reference the official [Beefree SDK technical documentation](https://docs.beefree.io/beefree-sdk) for all available customizations.

## Best Practices

### Performance

- Initialize the SDK only when needed
- Clean up SDK resources when navigating away or closing the editor
- Handle errors gracefully to prevent application crashes

### Security

- Never expose client credentials in frontend code
- Always use a secure backend or proxy server for authentication
- Validate and sanitize all user inputs before passing them to the SDK

### User Experience

- Show loading indicators while the SDK initializes
- Display clear error messages when something goes wrong
- Implement autosave to prevent data loss

### Code Organization

- Keep SDK configuration separate from initialization logic
- Use TypeScript for type safety
- Implement error handling throughout the integration

## Examples

### Complete React Component

Reference: [beefree-react-demo](https://github.com/BeefreeSDK/beefree-react-demo)

```typescript
import { useEffect, useRef } from 'react';
import BeefreeSDK from '@beefree.io/sdk';

export default function BeefreeEditor() {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    async function initializeEditor() {
      const beeConfig = {
        container: 'beefree-react-demo',
        language: 'en-US',
        onSave: (pageJson: string, pageHtml: string) => {
          console.log('Saved!', { pageJson, pageHtml });
        },
        onError: (error: unknown) => {
          console.error('Error:', error);
        }
      };

      const token = await fetch('http://localhost:3001/proxy/bee-auth', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ uid: 'demo-user' })
      }).then(res => res.json());

      const bee = new BeefreeSDK(token);
      bee.start(beeConfig, {});
    }

    initializeEditor();
  }, []);

  return (
    <div
      id="beefree-react-demo"
      ref={containerRef}
      style={{
        height: '600px',
        width: '90%',
        margin: '20px auto',
        border: '1px solid #ddd',
        borderRadius: '8px'
      }}
    />
  );
}
```

### Complete HTML Implementation

Reference: [multiple-versions-concept](https://github.com/BeefreeSDK/beefree-sdk-simple-schema/tree/main/multiple-versions-concept)

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Beefree SDK - Email Builder</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
      #beefree-sdk-container {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
      }
    </style>
  </head>
  <body>
    <div id="beefree-sdk-container"></div>
    <script src="https://app-rsrc.getbee.io/plugin/BeefreeSDK.js"></script>
    <script>
      const beeConfig = {
        container: 'beefree-sdk-container',
        uid: 'demo-user-' + Date.now(),
        language: 'en-US',
        onSave: function (jsonFile, htmlFile) {
          console.log("Template saved:", jsonFile);
        },
        onError: function (errorMessage) {
          console.error("Beefree SDK error:", errorMessage);
        }
      };

      function getBeeToken(callback) {
        fetch('/api/beefree/auth', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            client_id: 'your_client_id',
            client_secret: 'your_client_secret',
            uid: beeConfig.uid
          })
        })
        .then(response => response.json())
        .then(data => callback(data))
        .catch(error => console.error('Error getting Beefree token:', error));
      }

      function initializeBeefree(authResponse) {
        BeefreeSDK.create(authResponse, beeConfig, function (beefreeSDKInstance) {
          beefreeSDKInstance.start();
        });
      }

      getBeeToken(initializeBeefree);
    </script>
  </body>
</html>
```

---

*Related: [Creative Standards](creative-standards.md) | [Templating Standards](templating-standards.md)*
