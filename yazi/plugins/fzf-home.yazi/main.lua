local M = {}

function M:entry()
    local permit = ui.hide()

    -- fd finds directories under home
    local child, err = Command("fd")
        :arg({
            "--type", "d",
            "--hidden",
            "--exclude", ".git",
            "--exclude", "node_modules",
            "--exclude", ".cache",
            "--max-depth", "6",
            ".",
            os.getenv("HOME")
        })
        :stdout(Command.PIPED)
        :spawn()

    if not child then
        permit:drop()
        return ya.notify {
            title = "fzf-home",
            content = "Failed to start fd: " .. tostring(err),
            timeout = 5,
            level = "error"
        }
    end

    local dirs = child:wait_with_output()
    if not dirs or dirs.stdout == "" then
        permit:drop()
        return ya.notify {
            title = "fzf-home",
            content = "No directories found",
            timeout = 3,
            level = "warn"
        }
    end

    -- fzf with modal-like styling matching kitty theme
    local fzf, err = Command("fzf")
        :arg({
            "--height=40%",
            "--layout=reverse",
            "--border=rounded",
            "--margin=15%,25%",
            "--padding=1",
            "--prompt=» ",
            "--header=Change directory",
            "--header-first",
            "--no-scrollbar",
            "--color=bg+:#2A2340,bg:#201A2F",
            "--color=fg:#FFF7F9,fg+:#FFF7F9",
            "--color=hl:#D7AFFF,hl+:#D7AFFF",
            "--color=header:#FF91C3:bold",
            "--color=pointer:#D7AFFF",
            "--color=spinner:#FF91C3,info:#D7AFFF",
            "--color=border:#6B5B8A,prompt:#D7AFFF",
            "--color=query:#FFF7F9,label:#FFF7F9"
        })
        :stdin(Command.PIPED)
        :stdout(Command.PIPED)
        :spawn()

    if not fzf then
        permit:drop()
        return ya.notify {
            title = "fzf-home",
            content = "Failed to start fzf: " .. tostring(err),
            timeout = 5,
            level = "error"
        }
    end

    fzf:write_all(dirs.stdout)
    fzf:flush()

    local output, err = fzf:wait_with_output()
    permit:drop()

    if output and output.status.success then
        local target = output.stdout:gsub("\n$", "")
        if target ~= "" then
            local parent = target:match("(.+)/[^/]+$") or os.getenv("HOME")
            ya.emit("cd", { parent, raw = true })
            ya.emit("reveal", { target, raw = true })
        end
    end
end

return M
