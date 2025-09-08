return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            model = "claude-sonnet-4",
            tools = nil,
            resources = "selection",
            sticky = nil,
            language = "Spanish",
            temperature = 0.1,
            headless = false,
            callback = nil,
            remember_as_sticky = true,

            window = {
                layout = "vertical",
                width = 0.5,
                height = 0.5,
                relative = "editor",
                border = "single",
                title = "Copilot Chat",
                zindex = 1,
                blend = 0,
            },

            show_help = true,
            show_folds = true,
            auto_fold = false,
            highlight_selection = true,
            highlight_headers = false,
            auto_follow_cursor = true,
            auto_insert_mode = false,
            insert_at_end = false,
            clear_chat_on_new_prompt = false,
            stop_on_function_failure = false,

            debug = true,
            log_level = "debug",
            proxy = nil,
            allow_insecure = false,

            selection = "visual",
            chat_autocomplete = true,

            log_path = vim.fn.stdpath("state") .. "/CopilotChat.log",
            history_path = vim.fn.stdpath("data") .. "/copilotchat_history",

            headers = {
                user = "## User ",
                assistant = "## Copilot ",
                tool = "## Tool ",
            },

            separator = "───",

            -- Aquí van tus funciones personalizadas
            functions = {
                file = {
                    group = "copilot",
                    uri = "file://{path}",
                    description = "Reads content from a specified file path",
                    schema = {
                        type = "object",
                        required = { "path" },
                        properties = {
                            path = {
                                type = "string",
                                description = "Path to file to include in chat context.",
                                enum = function(source)
                                    local chat_winid = vim.api.nvim_get_current_win()
                                    local async = require("plenary.async")
                                    local fn = async.wrap(function(callback)
                                        local telescope = require("telescope.builtin")
                                        local actions = require("telescope.actions")
                                        local action_state = require("telescope.actions.state")

                                        telescope.find_files({
                                            cwd = source.cwd(),
                                            attach_mappings = function(prompt_bufnr)
                                                actions.select_default:replace(function()
                                                    actions.close(prompt_bufnr)
                                                    local selection = action_state.get_selected_entry()

                                                    -- Devuelve el foco al chat
                                                    if vim.api.nvim_win_is_valid(chat_winid) then
                                                        vim.api.nvim_set_current_win(chat_winid)
                                                        vim.cmd("normal! a")
                                                    end

                                                    vim.schedule(function()
                                                        callback(selection)
                                                    end)
                                                end)
                                                return true
                                            end,
                                        })
                                    end, 1)

                                    return fn()
                                end,
                            },
                        },
                    },
                    resolve = function(input, source)
                        local utils = require("CopilotChat.utils")
                        local resources = require("CopilotChat.resources")

                        -- Hacer path absoluto si es relativo
                        local full_path = input.path
                        if not vim.startswith(full_path, "/") then
                            full_path = source.cwd() .. "/" .. input.path
                        end

                        utils.schedule_main()
                        local data, mimetype = resources.get_file(full_path)
                        if not data then
                            error("File not found: " .. input.path)
                        end

                        return {
                            {
                                uri = "file://" .. input.path, -- Mantiene path relativo en URI
                                mimetype = mimetype,
                                data = data,
                            },
                        }
                    end,
                },

                gitmain = {
                    group = "copilot",
                    description = "Get diff against main branch",
                    uri = "gitmain://diff",
                    schema = {
                        type = "object",
                        required = {},
                        properties = {},
                    },
                    resolve = function()
                        local utils = require("CopilotChat.utils")
                        utils.schedule_main()
                        local cmd = "git diff main HEAD && git diff"
                        local output = vim.fn.system(cmd)
                        return {
                            {
                                uri = "gitmain://diff",
                                mimetype = "text/x-diff",
                                data = output,
                            },
                        }
                    end,
                },
            },

            keys = {
                {
                    "<leader>at",
                    "<cmd>CopilotChatToggle<cr>",
                    desc = "Toggle Copilot Chat",
                    mode = { "n", "v" },
                },

            },
        },
    },
}
