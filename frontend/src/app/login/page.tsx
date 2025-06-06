"use client";

import { useForm } from "react-hook-form";
import { loginUser } from "@/lib/api";
import { useState } from "react";

type LoginFormInputs = {
  email: string;
  password: string;
};

export default function LoginPage() {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<LoginFormInputs>();
  const [error, setError] = useState<string | null>(null);

  const onSubmit = async (data: LoginFormInputs) => {
    try {
      const result = await loginUser(data.email, data.password);
      // Save JWT token to localStorage or cookie
      localStorage.setItem("token", result.jwt);
      setError(null);
      // Redirect or update UI as needed
    } catch {
      setError("Invalid email or password");
    }
  };

  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-50">
      <form
        onSubmit={handleSubmit(onSubmit)}
        className="bg-white p-8 rounded-lg shadow-md w-full max-w-md space-y-6"
      >
        <h2 className="text-2xl font-bold text-gray-900 text-center mb-4">
          Sign in to your account
        </h2>
        <div>
          <input
            type="email"
            placeholder="Email"
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            {...register("email", { required: true })}
          />
          {errors.email && (
            <span className="text-red-500 text-sm">Email is required</span>
          )}
        </div>
        <div>
          <input
            type="password"
            placeholder="Password"
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            {...register("password", { required: true })}
          />
          {errors.password && (
            <span className="text-red-500 text-sm">Password is required</span>
          )}
        </div>
        <button
          type="submit"
          className="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition-colors font-semibold"
        >
          Login
        </button>
        {error && <div className="text-red-500 text-center">{error}</div>}
      </form>
    </div>
  );
}
