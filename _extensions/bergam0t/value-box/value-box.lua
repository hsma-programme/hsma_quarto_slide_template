function Div(el)
  if el.classes:includes("value-box") then

    -- Existing attributes
    local icon  = el.attributes["icon"] or ""
    local color = el.attributes["color"] or "bg-light-blue"
    local title = el.attributes["title"] or ""
    local value = el.attributes["value"] or ""
    local width = el.attributes["width"] or "100%"
    local align = el.attributes["align"] or "left"

    -- Fragment logic
    local fragment_attr = el.attributes["fragment"]
    local fragment_class = ""
    if fragment_attr then
      fragment_class = " fragment " .. (fragment_attr == "true" and "fade-in-then-semi-out" or fragment_attr)
    end

    -- NEW: Fragment Index logic
    local index_attr = el.attributes["index"]
    local index_data = ""
    if index_attr then
      -- In Reveal.js, we use the data-fragment-index attribute
      index_data = string.format(' data-fragment-index="%s"', index_attr)
    end

    -- Build opening HTML with the new index_data
    local html_open = pandoc.RawBlock("html", string.format(
      '<div class="value-box %s%s" style="width:%s; text-align:%s;"%s><div class="details">',
      color, fragment_class, width, align, index_data
    ))

    -- (The rest remains the same)
    local html_close = pandoc.RawBlock("html", '</div></div>')
    local result = pandoc.List({html_open})
    result:extend(el.content)
    result:insert(html_close)
    return result
  end
end
