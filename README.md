# web 勉強会

## 内容
　Ruby on Rails で簡易版twitterアプリを作ります。
　
### Railsアプリケーションの作成

 1. Railsのインストール

 アプリケーションを作成したいディレクトリで以下のコマンドを実行。
 bundler が入っていればgemfileが作成される。
 ```bash
 bundle init
 ```
 gemfileに以下を追加し、

 ```ruby
 gem "rails"
 ```
 以下のコマンドを実行。

 ```bash
 # カレントディレクトリのvendor/bundle 以下にgemをインストール
 bundle install --path vendor/bundle
 ```

 2. Railsアプリケーションの作成

 2.1 Railsアプリケーションを作成

 データベースはmysql指定

 ```bash
 bundle exec rails new . --database=mysql
 ```

 2.2 データベースの準備

 config/database.yml を編集。
 username, password, socketを編集。
 username, passwordについては、おそらく初期に設定している。
 僕はめんどくさいのでrootユーザでやってます。
 新しくユーザを作ると、権限管理がめんどくさいので今回はrootユーザでやりましょう。
 socketについては、以下のコマンドで調べられます。

 ```bash
 mysql_config --socket
 ```

 database.ymlの編集が終われば、データベースの作成をします。

 ```bash
  # bin/rails の場合は、プロジェクトのルートディレクトリでおこなってください。(gemfileがあるところ)
  bin/rails db:create または
  bundle exec rails db:create

  # 結果
  Created database 'twitter_development'
  Created database 'twitter_test'
 ```

データベースの作成が終了したら、一旦、サーバを起動します。
以下のコマンドを実行するとlocalhost:3000でサーバ起動します。

```bash
bin/rails server または
bundle exec rails server
```

ブラウザからlocalhost:3000にアクセスすると、以下の画面が表示されると成功です。


 3. モデルの作成

 3.1 スキーマの設計

 ```
 User
  - name varchar(255) default '' not null
  - id_name varchar(255) default '' not null uniqueness

 Tweet
  - content varchar(255)
  - user_id foreign_key(user)
 ```

 3.2 実装

 以下のコマンドを実行。

 ```bash
 bin/rails g migration create_users
 bin/rails g migration create_tweets
 ```

 db/migrate 以下のファイルがマイグレートファイルです。
 この中に制約を少し足しましょう。

 ```ruby
 # 変更前
 class CreateUsers < ActiveRecord::Migration[5.2]
   def change
    create_table :users do |t|
    end
　end
end
# 変更後
class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :name,     default: '', null: false
      t.string :id_name,  default: '', null: false
    end

    add_index :users, :id_name, unique: true
  end

  def down
    drop_table :users
  end
end
class CreateTweets < ActiveRecord::Migration[5.2]
  def up
    create_table :tweets do |t|
      t.string :content, default: '', null: false
      t.references :users, foreign_key: true, null: false
    end
  end

  def down
    drop_table :tweets
  end
end

 ```

 3.3 マイグレート

 変更が終了したら、以下のコマンドでマイグレートを実行

 ```bash
 bin/rails db:migrate

 # 以下のコマンドを実行すると現在のマイグレートの状況が確認できます。
 bin/rails db:migrate:status

 # 以下のコマンドで特定のマイグレートのみ実行、ロールバックできます
 bin/rails  db:migrate:up VERSION=MigrateID
 bin/rails  db:migrate:down VERSION=MigrateID
 ```


 4.心が折れました、これ以降は一緒に進めていきましょう
