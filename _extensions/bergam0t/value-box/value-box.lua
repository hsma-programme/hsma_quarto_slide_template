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
    local html_open = string.format(
      '<div class="value-box %s%s" style="width:%s; text-align:%s;"%s>',
      color, fragment_class, width, align, index_data
    )

    -- ADD ICON (if it exists)
    if icon ~= "" then
      html_open = html_open .. string.format('<i class="icon %s"></i>', icon)
    end

    -- ADD VALUE (if it exists)
    if value ~= "" then
      html_open = html_open .. string.format('<div class="value">%s</div>', value)
    end

    -- Open the details wrapper for the inner text
-- Build the full HTML string
    local html_open = string.format(
      '<div class="value-box %s%s" style="width:%s; text-align:%s;"%s>',
      color, fragment_class, width, align, index_data
    )

    if icon ~= "" then
      html_open = html_open .. string.format('<i class="icon bi %s"></i>', icon)
    end

    if value ~= "" then
      html_open = html_open .. string.format('<div class="value">%s</div>', value)
    end

    html_open = html_open .. '<div class="details">'
    local html_close = '</div></div>'

    -- THE CRITICAL CHANGE: Use el.content instead of el
    local result = pandoc.List({pandoc.RawBlock("html", html_open)})
    result:extend(el.content)
    result:insert(pandoc.RawBlock("html", html_close))

    return result
  end
end
