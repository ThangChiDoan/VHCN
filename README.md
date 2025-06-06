# Fullstack Application

A modern fullstack web application built with Ruby on Rails API backend, Next.js frontend, and PostgreSQL database.

## Tech Stack

- **Backend**: Ruby on Rails 7.1 (API-only mode)
- **Frontend**: Next.js 15 with TypeScript and Tailwind CSS
- **Database**: PostgreSQL
- **Authentication**: Ready for implementation
- **CORS**: Configured for cross-origin requests

## Project Structure

```
├── backend/          # Rails API backend
│   ├── app/
│   ├── config/
│   ├── db/
│   └── ...
├── frontend/         # Next.js frontend
│   ├── src/
│   ├── public/
│   └── ...
└── README.md
```

## Prerequisites

Make sure you have the following installed:

- Ruby 3.1.2 or higher
- Node.js 18+ and npm
- PostgreSQL
- Git

## Getting Started

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd VHCN
```

### 2. Backend Setup (Rails API)

```bash
cd backend

# Install dependencies
bundle install

# Set up environment variables
cp .env.example .env
# Edit .env with your database credentials

# Create and setup database
rails db:create
rails db:migrate
rails db:seed

# Start the Rails server (runs on port 3001)
rails server
```

The Rails API will be available at: `http://localhost:3001`

### 3. Frontend Setup (Next.js)

```bash
cd frontend

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env.local
# Edit .env.local if needed (default settings should work)

# Start the development server (runs on port 3000)
npm run dev
```

The Next.js app will be available at: `http://localhost:3000`

## Environment Variables

### Backend (.env)

```bash
# Database configuration
DATABASE_URL=postgresql://localhost:5432/backend_development
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=backend_development

# Rails configuration
RAILS_ENV=development
SECRET_KEY_BASE=your_secret_key_base_here

# Server configuration
PORT=3001
```

### Frontend (.env.local)

```bash
# API Configuration
NEXT_PUBLIC_API_URL=http://localhost:3001
NEXT_PUBLIC_API_BASE_URL=http://localhost:3001/api

# App Configuration
NEXT_PUBLIC_APP_NAME=Fullstack App
```

## API Endpoints

### Health Check

- `GET /api/v1/health` - API health status

## Development

### Running Both Servers

You'll need two terminal windows:

**Terminal 1 - Backend:**

```bash
cd backend
rails server
```

**Terminal 2 - Frontend:**

```bash
cd frontend
npm run dev
```

### Database Operations

```bash
cd backend

# Create migration
rails generate migration CreateTableName

# Run migrations
rails db:migrate

# Rollback migration
rails db:rollback

# Reset database
rails db:reset
```

### Adding New API Endpoints

1. Generate controller: `rails generate controller Api::V1::ControllerName`
2. Add routes in `config/routes.rb`
3. Implement controller actions
4. Update CORS settings if needed

## Testing the Connection

Visit `http://localhost:3000` and you should see an API connection status widget that tests the connection between the frontend and backend.

## Deployment

### Backend (Rails API)

- Configure production environment variables
- Set up PostgreSQL database
- Deploy to platforms like Heroku, Railway, or DigitalOcean

### Frontend (Next.js)

- Update `NEXT_PUBLIC_API_URL` to production API URL
- Deploy to Vercel, Netlify, or other platforms

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
