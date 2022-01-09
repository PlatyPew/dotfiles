function _G.install_javadebug()
    local installation_path = vim.fn.stdpath("data") .. "/dapinstall/"

    if vim.fn.isdirectory(installation_path) == 0 then
        vim.fn.mkdir(installation_path)
    end

    installation_path = installation_path .. "/java-debug"
    vim.fn.mkdir(installation_path)

    local git_url = "https://github.com/microsoft/java-debug"

    vim.fn.system({ "git", "clone", git_url, installation_path })

    vim.cmd(
        "split | terminal cd "
            .. installation_path
            .. " && JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home ./mvnw clean install"
    )
end
