document.addEventListener("DOMContentLoaded", () => {
  const deleteBtn = document.querySelector(".item-destroy");

  if (deleteBtn) {
    deleteBtn.addEventListener("click", async (e) => {
      e.preventDefault();
      if (!confirm("本当に削除しますか？")) return;

      const itemId = deleteBtn.dataset.id;
      console.log("削除対象 ID:", itemId); // 確認用

      try {
        const response = await fetch(`/items/${itemId}`, {
          method: "DELETE",
          headers: {
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
            "Accept": "application/json"
          }
        });

        if (response.ok) {
          window.location.href = "/";
        } else {
          alert("削除に失敗しました");
        }
      } catch (error) {
        console.error("削除エラー:", error);
        alert("エラーが発生しました");
      }
    });
  }
});