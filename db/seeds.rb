# frozen_string_literal: true

Article.destroy_all

Article.create(
  [
    {
      title: 'Article 1',
      body: 'This is Article 1'
    },
    {
      title: 'Article 2',
      body: 'This is Article 2'
    },
    {
      title: 'Article 3',
      body: 'This is Article 3'
    }
  ]
)

p "Created #{Article.count} articles..."
