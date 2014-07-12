json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :customernetid, :customermavid, :customername, :customerphone, :customeremail, :problem, :category, :resolution, :notes
  json.url ticket_url(ticket, format: :json)
end
