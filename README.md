# Beginner Teaching Plugin

A Claude Code plugin for beginners who want real explanations, not oversimplified ones.

## Who This Is For

You're new to programming but not new to learning. Maybe you're coming from science, design, finance, or another field. You want to understand the code, not just copy it.

## What It Does

When enabled, this plugin shapes how Claude teaches:

- **Analogies that fit**: Connects new concepts to things you already know
- **Incremental building**: Small chunks of code, one concept at a time
- **Prediction before explanation**: "What do you think this does?"
- **Hands-on practice**: TODO(learner) markers for exercises
- **Real terminology**: Proper terms from the start, explained when introduced
- **Debugging as learning**: Errors are puzzles to solve

## Installation

### Option 1: From a GitHub repository

If this plugin is hosted on GitHub:

```bash
# Add the repository as a marketplace
/plugin marketplace add YOUR_USERNAME/beginner-teacher-plugin

# Install the plugin
/plugin install beginner-teacher
```

### Option 2: Local installation

1. Clone or download this plugin to your machine
2. In Claude Code, run:

```bash
/plugin marketplace add /path/to/beginner-teacher-plugin
/plugin install beginner-teacher
```

### Option 3: Copy to plugins directory

Copy the entire `beginner-teacher-plugin` folder to `~/.claude/plugins/`:

```bash
cp -r beginner-teacher-plugin ~/.claude/plugins/beginner-teacher
```

Then enable it:
```bash
/plugin install beginner-teacher
```

## Usage

Once installed, the plugin activates automatically at the start of each session. No commands needed—just start coding with your learner!

### Example Session

```
You: Let's build a navigation component

Claude: Let's start with the structure. Here's a basic nav:

<nav>
  <a href="/">Home</a>
  <a href="/about">About</a>
</nav>

Looking at this, what do you think the <nav> element does semantically?

[After they reason through it...]

Right—it's a *semantic* element. The browser and screen readers understand
this is navigation, not just a generic container. The <a> tags are *anchor*
elements—they create hyperlinks.

<!-- TODO(learner): Add a third link to a contact page
     Reference: Notice the pattern—<a href="path">Label</a> -->
```

## Customization

To modify the teaching instructions, edit `TEACHING_INSTRUCTIONS.md`. This is a standard markdown file that gets injected into Claude's context at session start.

The shell script (`hooks/session-start.sh`) reads this file and formats it as JSON—you shouldn't need to touch it.

Common customizations:
- Add more analogies specific to your learner's background
- Adjust the TODO format
- Add or remove teaching rules

## Disabling

```bash
# Temporarily disable (keeps plugin installed)
/plugin disable beginner-teacher

# Completely uninstall
/plugin uninstall beginner-teacher
```

## How It Works

This plugin uses a `SessionStart` hook that fires when:
- A new session starts (`startup`)
- A session is resumed (`resume`)
- The context is cleared (`clear`)

The hook reads `TEACHING_INSTRUCTIONS.md` and injects it into Claude's context, shaping how it interacts for the entire session.

**File structure:**
```
beginner-teacher-plugin/
├── .claude-plugin/
│   └── plugin.json           # Plugin metadata
├── hooks/
│   ├── hooks.json            # Hook configuration
│   └── session-start.sh      # Reads instructions and outputs JSON
├── TEACHING_INSTRUCTIONS.md  # ← Edit this to change behavior
└── README.md
```

## Credits

Inspired by Anthropic's Claude for Education—adapted for learners who are new to code but not new to learning.

## License

MIT - Feel free to modify and share!
