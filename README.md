# 專案說明


### 環境部屬
---

1. 資料庫 SQL Server
- 建立cloudService資料庫：

```sql
CREATE DATABASE cloudService
```

- 資料表設定: 執行/資料庫設定.sql
- 專案連線資料庫設定: /src/main/webapp/META-INF/context.xml

2. 運作環境
- Server: Tomcat v9.0 Server
- JDK: 11

### 實現功能
---

1. 新增待辦事項：使用**jQuery**判斷空值，若為空值會顯示錯誤訊息。
2. 使用Ajax傳值，新增資料並送出後，送出按鈕樣式變更為loading，且需等待Ajax完成後才能再新增資料。
3. 使用sweetAlert2 API ，於新增成功、確認刪除時會跳出通知訊息。
4. 待完成項目可執行 刪除/完成 動作，並計算待辦事項筆數。
5. 已完成項目依完成時間新到舊排序，完成時間則依目前時間顯示「剛剛」、「xx分鐘前」、「xx小時前」，完成超過24小時則顯示日期。
