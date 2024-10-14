# Ruby on Rails Starter Kit with Unkey API Authentication

This Ruby on Rails starter kit demonstrates how to implement API key authentication with [Unkey](https://www.unkey.com/). Learn to protect public and private routes easily and authenticate users quickly.

**Note:** This application uses the [Unkey API](https://www.unkey.com/docs/api-reference/overview) directly since there is currently no official SDK available for Ruby on Rails, allowing for a hands-on approach to API integration.

## Prerequisites

This project is built using Ruby 3.2.2 and Rails 7.2.1. Check the [Rails documentation](https://api.rubyonrails.org/) for more details on version compatibility.

## Quickstart

### Create a root key

1. Go to [settings.root-keys](https://app.unkey.com/settings/root-key) and click on the "Create New Root Key" button.
2. Enter a name for the key.
3. Select the following workspace permissions: `create_key`, `read_key`, `encrypt_key` and `decrypt_key`.
4. Click "Create".

### Create your API

1. Go to [apis](https://app.unkey.com/apis) and click on the "Create New API" button.
2. Give it a name.
3. Click "Create".

### Create your first API key

1. Click "Create Key" in the top right corner.
2. Feel the form with any key information you want or leave it empty.
3. Click "Create"
4. Copy the key and save it somewhere safe.

### Set up the example

1. Clone the repository to your local machine:

   ```bash
   git clone git@github.com:unrenamed/unkey-rails
   cd unkey-rails
   ```

2. Create a `.env` file in the root directory and populate it with the following environment variables:

   ```env
   UNKEY_API_ID=your-unkey-api-id
   ```

   Ensure you replace `your-unkey-api-id` with your actual Unkey credentials.

3. Start the server:

   ```bash
   rails server
   ```

   The server will start and listen on the `3000` port.

4. Test the public route as a guest:

   ```bash
   curl http://localhost:3000/public
   ```

5. Test the public route as an authorized user by passing the API key in the header:

   ```bash
   curl http://localhost:3000/public -H "Authorization: Bearer <YOUR_API_KEY>"
   ```

6. Test the protected route, which requires valid authorization:

   ```bash
   curl http://localhost:3000/protected -H "Authorization: Bearer <YOUR_API_KEY>"
   ```
