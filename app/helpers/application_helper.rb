module ApplicationHelper
  def hsl_to_rgb(hsl)
    hsl_values = hsl.scan(/(\d+\.?\d*)/).flatten.map(&:to_f)
    h, s, l = hsl_values

    s /= 100.0
    l /= 100.0

    c = (1 - (2 * l - 1).abs) * s
    x = c * (1 - (h / 60.0 % 2 - 1).abs)
    m = l - c / 2.0

    r, g, b = case h
              when 0..60 then [c, x, 0]
              when 60..120 then [x, c, 0]
              when 120..180 then [0, c, x]
              when 180..240 then [0, x, c]
              when 240..300 then [x, 0, c]
              else [c, 0, x]
              end

    {
      r: ((r + m) * 255).round,
      g: ((g + m) * 255).round,
      b: ((b + m) * 255).round
    }
  end
end
