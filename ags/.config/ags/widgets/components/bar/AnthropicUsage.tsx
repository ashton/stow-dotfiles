import { createPoll } from "ags/time"
import GLib from "gi://GLib?version=2.0"

interface UsageData {
  error: string | null
  tl: number  // tokens limit (per window)
  tr: number  // tokens remaining
  rl: number  // requests limit
  rr: number  // requests remaining
  reset: string
}

const DEFAULT: UsageData = { error: null, tl: 0, tr: 0, rl: 0, rr: 0, reset: "" }

const HOME = GLib.get_home_dir()
const SCRIPT = `${HOME}/.config/ags/scripts/anthropic_usage.sh`
const POLL_INTERVAL = 5 * 60 * 1000  // 5 minutes

const data = createPoll<UsageData>(
  DEFAULT,
  POLL_INTERVAL,
  SCRIPT,
  (out: string): UsageData => {
    try {
      return JSON.parse(out.trim())
    } catch {
      return { ...DEFAULT, error: "parse_error" }
    }
  }
)

const labelText = data(d => {
  if (d.error === "no_api_key") return "󱙿 –"
  if (d.error) return "󱙿 !"
  if (d.tl === 0) return "󱙿 …"
  const pct = Math.round(((d.tl - d.tr) / d.tl) * 100)
  return `󱙿 ${pct}%`
})

const tooltipText = data(d => {
  if (d.error === "no_api_key")
    return "Anthropic: set ANTHROPIC_API_KEY or save key to\n~/.config/ags/cache/anthropic_key"
  if (d.error)
    return `Anthropic: ${d.error}`
  if (d.tl === 0)
    return "Anthropic: loading…"
  const tokUsed = d.tl - d.tr
  const reqUsed = d.rl - d.rr
  const pct = Math.round((tokUsed / d.tl) * 100)
  return [
    `Tokens: ${tokUsed.toLocaleString()} / ${d.tl.toLocaleString()} (${pct}%)`,
    `Requests: ${reqUsed} / ${d.rl}`,
    d.reset ? `Window resets: ${d.reset}` : "",
  ].filter(Boolean).join("\n")
})

export default () =>
  <button class="component anthropic-usage" tooltipText={tooltipText}>
    <label label={labelText} />
  </button>
