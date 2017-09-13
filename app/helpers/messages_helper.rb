module MessagesHelper
  def render_table_head q
    head_str = ""
    Message.statuses.each{|k, v| head_str << Message.statuses_i18n[k] if q.status_eq == v }
    Message.showables.each{|k, v| head_str << "/#{Message.showables_i18n[k]}" if q.showable_eq == v }
    return head_str
  end
end
