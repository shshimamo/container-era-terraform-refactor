VPC関連のリソースを保存

- "aws_db_subnet_group"
  - "main":                             サブネットグループ
- "aws_internet_gateway"
  - "internet_gateway":                 インターネットゲートウェイ
- "aws_route"
  - "public_route":                     ルート(パブリックルートテーブルのリソース)
- "aws_route_table"
  - "public_route_table":               ルートテーブル(パブリック)
- "aws_route_table_association"
  - "public_1_route_table_association": パブリックルートテーブルとパブリックサブネット1の紐付け
  - "public_2_route_table_association": パブリックルートテーブルとパブリックサブネット2の紐付け
- "aws_subnet"
  - "public_subnet_1":                  パブリックサブネット1
  - "public_subnet_2":                  パブリックサブネット2
  - "private_subnet_1":                 プライベートサブネット1
  - "private_subnet_2":                 プライベートサブネット2
- "aws_vpc"
  - "vpc":                              VPC
