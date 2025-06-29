module ApplicationHelper
    def simple_format_without_blank_lines(text)
    return "" if text.blank?
    # 空白行を除去
    filtered = text.lines.reject { |line| line.strip.blank? }.join
    simple_format(filtered)
  end
end
