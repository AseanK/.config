local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	local dashboard = require("alpha.themes.dashboard")

	local function button(sc, txt, keybind, keybind_opts)
		local b = dashboard.button(sc, txt, keybind, keybind_opts)
		b.opts.hl_shortcut = "Include"
		return b
	end

	dashboard.section.header.val = {
		[[                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠴⠛⠛⠉⠉⠩⠥⠤⠤⠤⠄⢀⣉⣛⣷⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⢊⡡⠖⠚⠦⣤⡄⠖⠂⠀⠀⠀⠀⠀⠀⢹⣏⠉⠛⢻⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠀⠀⠀⡠⢊⡵⠊⠁⢀⣀⣤⠾⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⢤⣈⡻⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⢀⣰⣯⠴⠉⠀⠉⠉⠉⠛⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣦⡀⠈⠉⢻⣿⣿⣿⠿⣿⣦⡀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⢠⠿⣿⠃⠀⠀⣤⠀⠀⢀⣤⣶⠶⣶⣶⣦⣄⢀⣠⠀⠀⠀⠀⠈⣿⠉⠙⢶⡄⠈⠻⣿⣍⠀⠀⠻⣷⡀⠀⠀⠀                     ]],
		[[                        ⠀⠀⢠⠎⡴⠁⠀⠀⣠⠏⠀⣠⡿⣫⠴⠛⠉⠉⠉⢿⣿⡇⠀⠀⠀⠀⠀⠘⠁⠀⠈⡇⠀⠀⠈⢻⡀⠀⠀⠸⣿⣆⠀⠀                     ]],
		[[                        ⠀⢀⠏⡼⠀⠀⠀⠐⠁⠀⣠⡟⠼⠁⠀⠀⠀⠀⠀⠈⠻⠋⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⢣⠀⣶⣶⣿⣿⡆⠀                     ]],
		[[                        ⢀⡎⣼⡇⠀⡀⠀⠀⠀⠻⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⢸⡏⠹⣿⣿⠀                     ]],
		[[                        ⣼⢰⣿⡇⢠⣷⢤⡀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠤⡀⠀⠀⢀⠀⣀⠈⢇⠀⣿⣿⣆                     ]],
		[[                        ⡇⣾⡿⠀⣿⠁⠀⠀⠀⠀⠀⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢞⠀⢈⠃⠈⣿⣿⣿⢹                     ]],
		[[                        ⣇⣿⠁⠀⠹⡶⠖⠀⠀⠀⠀⠀⠹⣷⣦⣤⣔⣶⡶⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢤⣾⠀⢀⢸⣿⣿⣾                     ]],
		[[                        ⢹⣿⠀⠀⠀⠀⠀⠀⠛⠂⠀⠀⠀⠀⠀⠀⠙⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠐⠊⠁⠀⠘⠃⠀⣿⣾⣿⣿⡟                     ]],
		[[                        ⠸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠤⠼⠟⠻⣿⣿⡇                     ]],
		[[                        ⠀⢿⣇⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠏⠀⡀⠀⠀⢀⣿⣿⠀                     ]],
		[[                        ⠀⠘⣿⡀⠸⡀⠀⠀⢠⠃⠀⠀⠀⡀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀⣾⠃⠀⣼⠃⠀⣤⣼⣿⠇⠀                     ]],
		[[                        ⠀⠀⠘⣷⠀⠱⡄⠀⡆⣀⠴⠒⠉⠀⠀⢠⣤⠴⠞⠛⠳⣤⠀⠀⠀⠀⠀⠳⢦⣄⡀⠀⢀⣀⣄⠰⣿⣤⢞⣿⣿⠏⠀⠀                     ]],
		[[                        ⠀⠀⠀⠘⢷⡄⠿⣾⣾⠁⠀⠀⠀⠀⠀⢸⡃⠀⠀⠀⢀⡘⣧⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣀⣉⣵⠟⣡⠏⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠈⢿⣆⣻⡛⢦⣀⠀⠀⠀⠀⠀⠳⢦⣄⠠⠞⠛⠁⠀⠀⠀⣠⣴⣤⣤⣴⣾⣿⠟⣿⣿⣿⣯⠞⠁⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠀⠀⠙⠻⣿⣦⣙⠳⣄⡀⠀⣄⡀⠀⠙⠄⠀⠀⣀⣀⠄⠚⠛⠻⣿⣿⡿⠋⣡⣾⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣷⣆⡉⠓⠦⠄⣀⠀⠐⠛⠉⠉⠁⢀⣀⣤⣶⣿⣩⣴⣾⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠿⣶⣴⣾⣷⣶⣾⣿⣿⠾⠿⠟⢛⣛⣻⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                     ]],
		[[                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠛⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                     ]],
		[[████████  ██████      ████████ ██   ██ ███████     ███    ███  ██████   ██████  ███    ██]],
		[[   ██    ██    ██        ██    ██   ██ ██          ████  ████ ██    ██ ██    ██ ████   ██]],
		[[   ██    ██    ██        ██    ███████ █████       ██ ████ ██ ██    ██ ██    ██ ██ ██  ██]],
		[[   ██    ██    ██        ██    ██   ██ ██          ██  ██  ██ ██    ██ ██    ██ ██  ██ ██]],
		[[   ██     ██████         ██    ██   ██ ███████     ██      ██  ██████   ██████  ██   ████]],
	}

	dashboard.section.buttons.val = {
		button("f", "Find file", ":Telescope find_files <CR>"),
		button("n", "New file", ":ene <BAR> startinsert <CR>"),
		button("p", "Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
		button("r", "Recent files", ":Telescope oldfiles <CR>"),
		button("t", "Find text", ":Telescope live_grep <CR>"),
		button("c", "Config", ":e ~/.config/nvim/init.lua <CR>"),
		button("q", "Quit", ":qa<CR>"),
	}
	local function footer()
		return "Krean"
	end

	dashboard.section.footer.val = footer()

	dashboard.section.header.opts.hl = "Keyword"
	dashboard.section.buttons.opts.hl = "Include"
	dashboard.section.footer.opts.hl = "Type"

	dashboard.opts.opts.noautocmd = true
	require("alpha").setup(dashboard.opts)
end

return M
