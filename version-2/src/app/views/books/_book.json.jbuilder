json.extract! book, :id, :call_number, :title, :author, :lender, :lender_other, :date_due, :renew, :reminder, :created_at, :updated_at
json.url book_url(book, format: :json)
