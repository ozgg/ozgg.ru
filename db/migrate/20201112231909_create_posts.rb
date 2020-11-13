# frozen_string_literal: true

# Create posts component
class CreatePosts < ActiveRecord::Migration[6.0]
  def up
    BiovisionComponent.create(slug: Biovision::Components::PostsComponent.slug)
    create_posts unless Post.table_exists?
  end

  def down
    drop_table :posts if Post.table_exists?
    BiovisionComponent[Biovision::Components::PostsComponent.slug]&.destroy
  end

  private

  def create_posts
    create_table :posts do |t|
      t.uuid :uuid, null: false
      t.references :simple_image, foreign_key: { on_update: :cascade, on_delete: :nullify}
      t.timestamps
      t.boolean :featured, default: false, null: false
      t.string :title
      t.string :slug
      t.text :lead
      t.text :body, null: false
      t.jsonb :data, default: {}, null: false
    end

    execute "create index posts_created_at_month_idx on posts using btree (date_trunc('month', created_at));"
    execute %(
      create or replace function posts_tsvector(title text, lead text, body text)
        returns tsvector as $$
          begin
            return (
              setweight(to_tsvector('russian', title), 'A') ||
              setweight(to_tsvector('russian', coalesce(lead, '')), 'B') ||
              setweight(to_tsvector('russian', body), 'C')
            );
          end
        $$ language 'plpgsql' immutable;
    )
    execute "create index posts_search_idx on posts using gin(posts_tsvector(title, lead, body));"

    add_index :posts, :uuid, unique: true
    add_index :posts, :data, using: :gin
  end
end
