- service.json
  - name: TaskDefinitionの名前を指定
  - image: リポジトリのURL
  - cpu: CPUユニットの数を指定する
  - memoryReservation: コンテナ用に予約するメモリの制限を指定する
  - essential: このコンテナが何らかの理由で停止した場合他のコンテナを停止するか設定する
  - portMappings: ポートマッピングを指定する
  - command: コンテナが実行するコマンドを配列で指定する
  - logConfiguration: ログをどこに出力するか設定する。awslogsを設定しCloudWatchLogsに出力するようにしている