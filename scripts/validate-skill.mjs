import { existsSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const expected = JSON.parse(
  readFileSync(join(root, "tests", "expected-files.json"), "utf8")
);

const missing = expected.required.filter((relativePath) => {
  return !existsSync(join(root, relativePath));
});

const skill = readFileSync(join(root, "skill", "SKILL.md"), "utf8");
const requiredReferences = [
  "wallet-connection.md",
  "transaction-signing.md",
  "mobile-wallet-adapter.md",
  "error-playbook.md",
  "review-checklist.md"
];

const unlinked = requiredReferences.filter((name) => !skill.includes(name));

if (missing.length || unlinked.length) {
  console.error("Skill validation failed.");
  if (missing.length) console.error("Missing files:", missing.join(", "));
  if (unlinked.length) console.error("Unlinked references:", unlinked.join(", "));
  process.exit(1);
}

console.log("Skill validation passed.");
