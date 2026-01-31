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

    -- fzf with modal-like styling
    local fzf, err = Command("fzf")
        :arg({
            "--height=40%",
            "--layout=reverse",
            "--border=rounded",
            "--margin=15%,25%",
            "--padding=1",
            "--prompt=   ",
            "--pointer=▶",
            "--header=  Change Directory",
            "--header-first",
            "--no-scrollbar",
            "--color=spinner:#f4dbd6,hl:#ed8796",
            "--color=fg:#cad3f5,header:#8aadf4,info:#c6a0f6,pointer:#f4dbd6",
            "--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796",
            "--color=border:#6e738d,label:#cad3f5,query:#cad3f5"
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
            ya.emit("cd", { target, raw = true })
        end
    end
end

return M
