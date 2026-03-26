function Div(el)
  if el.classes:includes("focus-list") then
    return pandoc.walk_block(el, {
      BulletList = function(list)
        for i, item in ipairs(list.content) do
          local attr = { class = "fragment fade-in-then-semi-out" }
          -- Wrap list item content in a Div
          list.content[i] = { pandoc.Div(item, attr) }
        end
        return list
      end
    })
  end
end
