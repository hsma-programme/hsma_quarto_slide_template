function Div(el)
  -- Check if this Div block has the 'value-box' class
  if el.classes:includes("value-box") then

    -- Extract attributes (with fallbacks if missing)
    local icon  = el.attributes["icon"] or ""
    local color = el.attributes["color"] or "bg-light-blue"
    local title = el.attributes["title"] or ""
    local value = el.attributes["value"] or ""
    local width = el.attributes["width"] or "100%"
    local align = el.attributes["align"] or "left"

    -- Build the HTML snippets
    local icon_html  = icon  ~= "" and ('<div class="icon"><i class="bi ' .. icon .. '"></i></div>') or ""
    local title_html = title ~= "" and ('<div class="title">'  .. title .. '</div>') or ""
    local value_html = value ~= "" and ('<div class="value">'  .. value .. '</div>') or ""

    -- Create the opening HTML (RawBlock)
    local html_open = pandoc.RawBlock("html", string.format(
      '<div class="value-box %s" style="width:%s; text-align:%s;">%s%s%s<div class="details">',
      color, width, align, icon_html, title_html, value_html
    ))

    -- Create the closing HTML (RawBlock)
    local html_close = pandoc.RawBlock("html", '</div></div>')

    -- Sandwich the original Markdown content between our new HTML tags
    local result = pandoc.List()
    result:insert(html_open)
    result:extend(el.content)
    result:insert(html_close)

    return result
  end
end
