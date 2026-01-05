# 🤖 AI Assistant Setup Guide

This guide helps you set up the OpenAI-powered natural language assistant for the AIX simulation.

## Prerequisites

✅ OpenAI API account  
✅ Internet connection  
✅ `curl` and `jq` installed (pre-installed in most environments)

## Step-by-Step Setup

### 1. Get Your OpenAI API Key

1. Go to [OpenAI Platform](https://platform.openai.com/api-keys)
2. Sign in or create an account
3. Click "Create new secret key"
4. Copy your API key (you won't be able to see it again!)

### 2. Set Up Your API Key

#### Option A: Temporary (Current Session Only)
```bash
export OPENAI_API_KEY='sk-your-actual-api-key-here'
```

#### Option B: Permanent (Recommended)
```bash
# Add to your .bashrc
echo 'export OPENAI_API_KEY="sk-your-actual-api-key-here"' >> ~/.bashrc

# Reload your bashrc
source ~/.bashrc
```

### 3. Verify Setup

Start the simulation and check the AI assistant status:

```bash
source ./aix_simulation.sh
```

You should see:
```
🤖 AI Assistant: ENABLED - Type 'ask <question>' for help
```

### 4. Test It Out

Try asking a question:

```bash
ask how do I check disk space?
```

## Usage Examples

### Basic Questions
```bash
ask what is the AIX version command?
ask how do I list physical volumes?
ask show me all running processes
```

### Comparing Commands
```bash
ask what's the difference between lspv and lsvg?
ask Linux uses df -h, what does AIX use?
```

### Complex Scenarios
```bash
ask how do I monitor system performance in real-time?
ask what command shows network interface statistics?
ask how to check for system errors?
```

### Getting Command Details
```bash
ask explain the topas command
ask what flags does lspv support?
ask how to use vmstat?
```

## Commands Reference

| Command | Description |
|---------|-------------|
| `ask <question>` | Ask any AIX-related question in natural language |
| `aixhelp` | Show AI assistant help and current status |

## Troubleshooting

### "API key not set" Error
```bash
# Check if the key is exported
echo $OPENAI_API_KEY

# If empty, export it again
export OPENAI_API_KEY='your-key'
```

### "API Error" Messages
- **Invalid authentication**: Check your API key is correct
- **Rate limit**: You've exceeded your API quota, wait or upgrade your plan
- **Network error**: Check your internet connection

### "jq: command not found"
```bash
# Install jq
sudo apt-get install jq  # Ubuntu/Debian
```

## API Usage & Costs

- The assistant uses OpenAI's GPT-4 model
- Each question costs approximately $0.01-0.03
- Monitor your usage at [OpenAI Usage Dashboard](https://platform.openai.com/usage)

## Privacy & Security

⚠️ **Important Security Notes:**
- Never commit your API key to version control
- Don't share your API key publicly
- Rotate your key if it's exposed
- Questions are sent to OpenAI's API for processing

## Tips for Better Results

1. **Be specific**: "how do I check disk space?" is better than "disk"
2. **Ask about tasks**: "how to monitor performance" works better than just "performance"
3. **Compare**: "what's the AIX equivalent of Linux's top?" helps you learn
4. **Request examples**: "show me examples of using lsvg"

## Disabling the AI Assistant

Simply don't set the API key, or unset it:

```bash
unset OPENAI_API_KEY
```

The simulation will still work perfectly without the AI assistant - you just won't have natural language query support.

---

**Happy Learning with AI! 🎓**
