# 薄雪人狼 DevOps環境

Kubernetes環境マネージャRancherを使って薄雪人狼(*)のDevOps環境を構築します

(*) `https://github.com/cranch-crown/edelweiss`

## 初期構築

1. Rancher Chart(Helm Chart)の追加

    `Rancher Home` > `Cluster選択` > `プロジェクト/名前空間` > `Apps` > `Manage Catalogs` > `カタログ追加`  

    下記を入力してカタログを追加する。

    |||
    |-|-|  
    |名前|`edelweiss-devops`|  
    |URL|`https://github.com/yasshi2525/edelweiss-devops`|  
    |||  

1. Rancher Chartのリリース(環境構築)

    `Apps` > `起動` > `edelweiss-devops`

    フォームを入力し、カタログからChartをリリースする。

1. CI/CD スクリプトの追加

    `リソース` > `Pipelines` > `Configure Repositories`

    以下のリポジトリを有効化する。

    `https://github.com/yasshi2525/edelweiss-devops.git`

1. 薄雪人狼 Dockerイメージをビルドする

    `edelweiss-devops` ジョブを `Run` する。


## 運用時

* 薄雪人狼のソースPush後は、`Pipelines` > `edelweiss-devops` ジョブを実行し、Dockerイメージを更新する。

    * `https://github.com/cranch-crown/edelweiss`  

  その後、`デプロイメント` > `edelweiss-devops` をリデプロイすると、コンテナが更新されて立ち上がる  
   
* CI/CD スクリプトを更新する際は、本リポジトリの `.rancher-pipeline.yaml` を更新する。Pushすると自動的にジョブが走る

* Rancher Chart(Helm Chart)を更新する際は、本リポジトリを修正する。Push後、`Apps` > `edelweiss-devops` > `アップグレード` で更新が反映される