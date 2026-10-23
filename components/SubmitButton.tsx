"use client";
import { useFormStatus } from "react-dom";

type Props = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  /** Optional label shown while the form is submitting (defaults to the children). */
  pendingText?: string;
};

/**
 * Submit button for server-action forms. Keeps whatever classes the caller
 * passes (so each button looks the same) but adds the feedback those buttons
 * were missing: a press/dim on click, a disabled state, and a spinner while the
 * enclosing <form>'s action is running (via useFormStatus). Must live inside a
 * <form>. For a form with several submit buttons, all of them show pending.
 */
export function SubmitButton({ children, className = "", pendingText, ...props }: Props) {
  const { pending } = useFormStatus();
  return (
    <button
      type="submit"
      {...props}
      disabled={pending || props.disabled}
      aria-busy={pending || undefined}
      className={`inline-flex items-center justify-center gap-1.5 transition active:translate-y-px active:brightness-95 disabled:cursor-not-allowed disabled:opacity-60 ${className}`}
    >
      {pending && (
        <svg className="h-3.5 w-3.5 shrink-0 animate-spin" viewBox="0 0 24 24" fill="none" aria-hidden="true">
          <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
          <path className="opacity-90" fill="currentColor" d="M4 12a8 8 0 0 1 8-8v4a4 4 0 0 0-4 4H4z" />
        </svg>
      )}
      <span>{pending && pendingText ? pendingText : children}</span>
    </button>
  );
}
