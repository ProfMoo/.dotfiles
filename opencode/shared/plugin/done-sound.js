// Plays a sound when the OpenCode session goes idle (i.e. the agent is done).
// Currently macOS-only; uses afplay with a built-in system sound.
export const DoneSoundPlugin = async ({ $ }) => {
  return {
    event: async ({ event }) => {
      if (event.type !== "session.idle") return;

      // macOS
      await $`afplay /System/Library/Sounds/Glass.aiff`;
    },
  };
};
