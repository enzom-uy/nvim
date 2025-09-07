return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            model = 'claude-sonnet-4', -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
            tools = nil,               -- Default tool or array of tools (or groups) to share with LLM (can be specified manually in prompt via @).
            resources = 'selection',   -- Default resources to share with LLM (can be specified manually in prompt via #).
            sticky = nil,              -- Default sticky prompt or array of sticky prompts to use at start of every new chat (can be specified manually in prompt via >).
            language = 'Spanish',      -- Default language to use for answers

            temperature = 0.1,         -- Result temperature
            headless = false,          -- Do not write to chat buffer and use history (useful for using custom processing)
            callback = nil,            -- Function called when full response is received
            remember_as_sticky = true, -- Remember config as sticky prompts when asking questions

            -- default window options
            window = {
                layout = 'vertical',    -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
                width = 0.5,            -- fractional width of parent, or absolute width in columns when > 1
                height = 0.5,           -- fractional height of parent, or absolute height in rows when > 1
                -- Options below only apply to floating windows
                relative = 'editor',    -- 'editor', 'win', 'cursor', 'mouse'
                border = 'single',      -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
                row = nil,              -- row position of the window, default is centered
                col = nil,              -- column position of the window, default is centered
                title = 'Copilot Chat', -- title of chat window
                footer = nil,           -- footer of chat window
                zindex = 1,             -- determines if window is on top or below other floating windows
                blend = 0,              -- window blend (transparency), 0-100, 0 is opaque, 100 is fully transparent
            },

            show_help = true,                 -- Shows help message as virtual lines when waiting for user input
            show_folds = true,                -- Shows folds for sections in chat
            auto_fold = false,                -- Automatically non-assistant messages in chat (requires 'show_folds' to be true)
            highlight_selection = true,       -- Highlight selection
            highlight_headers = false,        -- Highlight headers in chat
            auto_follow_cursor = true,        -- Auto-follow cursor in chat
            auto_insert_mode = false,         -- Automatically enter insert mode when opening window and on new prompt
            insert_at_end = false,            -- Move cursor to end of buffer when inserting text
            clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
            stop_on_function_failure = false, -- Stop processing prompt if any function fails (preserves quota)

            -- Static config starts here (can be configured only via setup function)

            debug = false,                                                   -- Enable debug logging (same as 'log_level = 'debug')
            log_level = 'info',                                              -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
            proxy = nil,                                                     -- [protocol://]host[:port] Use this proxy
            allow_insecure = false,                                          -- Allow insecure server connections

            selection = 'visual',                                            -- Selection source
            chat_autocomplete = true,                                        -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)

            log_path = vim.fn.stdpath('state') .. '/CopilotChat.log',        -- Default path to log file
            history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history

            headers = {
                user = '## User ',         -- Header to use for user questions
                assistant = '## Copilot ', -- Header to use for AI answers
                tool = '## Tool ',         -- Header to use for tool calls
            },

            separator = '───', -- Separator to use in chat
        },
    },
}
