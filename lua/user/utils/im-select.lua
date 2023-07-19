-- 输入法自动切换插件配置

local M = {}
local Windows = {}
local Mac = {}

-- 定义已有的输入法
-- 中文输入法: 搜狗
local sougouIM = "com.sogou.inputmethod.sogou.pinyin"
-- 英文输入法: 系统输入法
local defaultIM = "com.apple.keylayout.ABC"

-- 设置要切换的中英文 使用什么输入法
Mac.zhCN = sougouIM
Mac.en = defaultIM

Windows.pingyinIM = "2052"
Windows.englishIM = "1033"
Windows.leaveVimIM = Windows.englishIM

-- 判断当前是什么模式, 并且自动设置指定的输入法模式
local getChangeIM = function()
  -- 获取当前模式
  local mode = vim.fn.mode()
  -- 判断模式
  if mode == "n" then
    -- 当前是 normal 模式,切换为英文输入法
    return Mac.en
  elseif mode == "i" then
    -- 当前是 insert 模式,切换为英文输入法
    return Mac.en
  elseif mode == "v" then
    -- 当前是 visual 模式,切换为英文输入法
    return Mac.en
  else
    -- 当前不是 normal、insert 或 visual 模式
    return Mac.en
  end
end

M.macFocusGained = function() vim.cmd(":silent :!im-select" .. " " .. getChangeIM()) end

M.macFocusLost = function() vim.cmd(":silent :!im-select" .. " " .. Mac.zhCN) end

M.macInsertLeave = function() vim.cmd(":silent :!im-select" .. " " .. Mac.en) end

--M.macInsertEnter = function() vim.cmd(":silent :!im-select" .. " " .. Mac.zhCN) end
M.macInsertEnter = function() vim.cmd(":silent :!im-select" .. " " .. getChangeIM()) end

M.windowsFocusGained = function() vim.cmd(":silent :!~/.config/nvim/im-select.exe" .. " " .. Windows.leaveVimIM) end

M.windowsFocusLost = function()
  Windows.leaveVimIM = vim.cmd ":silent :!~/.config/nvim/im-select.exe 1033"
  vim.cmd ":silent :!~/.config/nvim/im-select.exe 1033"
end

M.windowsInsertLeave = function() vim.cmd ":silent :!~/.config/nvim/im-select.exe 1033" end

M.windowsInsertEnter = function() vim.cmd ":silent :!~/.config/nvim/im-select.exe 2052" end
return M
