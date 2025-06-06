"use client";

import { useForm } from "react-hook-form";
import { useState } from "react";
import apiService from "@/lib/api";

interface RegisterFormInputs {
  email: string;
  password: string;
  password_confirmation: string;
  name: string;
}

export default function RegisterPage() {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<RegisterFormInputs>();
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const onSubmit = async (data: RegisterFormInputs) => {
    setError(null);
    setSuccess(null);
    try {
      await apiService.register(
        data.name,
        data.email,
        data.password,
        data.password_confirmation
      );
      setSuccess(
        "Registration successful! Please check your email to confirm your account."
      );
    } catch (e: unknown) {
      if (e instanceof Error) {
        setError(e.message || "Registration failed");
      } else {
        setError("Registration failed");
      }
    }
  };

  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-50">
      <form
        onSubmit={handleSubmit(onSubmit)}
        className="bg-white p-8 rounded-lg shadow-md w-full max-w-md space-y-6"
      >
        <h2 className="text-2xl font-bold text-gray-900 text-center mb-4">
          Register a new account
        </h2>
        <div>
          <input
            type="text"
            placeholder="Name"
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            {...register("name", { required: true })}
          />
          {errors.name && (
            <span className="text-red-500 text-sm">Name is required</span>
          )}
        </div>
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
        <div>
          <input
            type="password"
            placeholder="Confirm Password"
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            {...register("password_confirmation", { required: true })}
          />
          {errors.password_confirmation && (
            <span className="text-red-500 text-sm">
              Password confirmation is required
            </span>
          )}
        </div>
        <button
          type="submit"
          className="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition-colors font-semibold"
        >
          Register
        </button>
        <div className="text-center">
          <a
            href="/login"
            className="text-blue-600 hover:underline text-sm mt-2 inline-block"
          >
            Already have an account? Login
          </a>
        </div>
        {error && <div className="text-red-500 text-center">{error}</div>}
        {success && <div className="text-green-600 text-center">{success}</div>}
      </form>
    </div>
  );
}
