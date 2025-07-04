import axios from "axios";

const API_BASE_URL =
  process.env.NEXT_PUBLIC_API_BASE_URL || "http://localhost:3001/api";

class ApiService {
  private baseURL: string;

  constructor() {
    this.baseURL = API_BASE_URL;
  }

  private async request<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<T> {
    const url = `${this.baseURL}${endpoint}`;

    const config: RequestInit = {
      headers: {
        "Content-Type": "application/json",
        ...options.headers,
      },
      ...options,
    };

    try {
      const response = await fetch(url, config);

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      return await response.json();
    } catch (error) {
      console.error("API request failed:", error);
      throw error;
    }
  }

  async get<T>(endpoint: string): Promise<T> {
    return this.request<T>(endpoint, { method: "GET" });
  }

  async post<T>(endpoint: string, data?: unknown): Promise<T> {
    return this.request<T>(endpoint, {
      method: "POST",
      body: data ? JSON.stringify(data) : undefined,
    });
  }

  async put<T>(endpoint: string, data?: unknown): Promise<T> {
    return this.request<T>(endpoint, {
      method: "PUT",
      body: data ? JSON.stringify(data) : undefined,
    });
  }

  async delete<T>(endpoint: string): Promise<T> {
    return this.request<T>(endpoint, { method: "DELETE" });
  }

  // Authentication endpoints
  async login(email: string, password: string) {
    return this.post<{ token: string; user: unknown }>("/v1/login", {
      email,
      password,
    });
  }

  async register(
    name: string,
    email: string,
    password: string,
    passwordConfirmation: string
  ) {
    return this.post<{ token: string; user: unknown }>("/v1/register", {
      name,
      email,
      password,
      password_confirmation: passwordConfirmation,
    });
  }
}

export const apiService = new ApiService();
export default apiService;

export async function loginUser(email: string, password: string) {
  const response = await axios.post(
    "http://localhost:3000/api/v1/login", // Update with your Rails API URL
    { user: { email, password } },
    { headers: { "Content-Type": "application/json" } }
  );
  return response.data; // Should include JWT token if successful
}
