document.addEventListener("DOMContentLoaded", function() {
  const addButton = document.querySelector('[data-action="form#addIngredient"]');
  const container = document.querySelector("#ingredient-fields-container");

  if (addButton && container) {
    addButton.addEventListener("click", function(event) {
      event.preventDefault();

      const lastField = container.lastElementChild;
      const clonedField = lastField.cloneNode(true);

      // クローンされたフィールドの入力値をリセットする
      const inputFields = clonedField.querySelectorAll("input[type=text]");
      inputFields.forEach(function(input) {
        input.value = "";
        // 新しいフィールドに一意の名前を付ける
        const uniqueName = `recipe_form[ingredient_name_${Date.now()}]`;
        input.name = uniqueName;
        input.id = uniqueName.replace(/\[|\]/g, '_'); // IDに使用可能な文字に変換
      });

      container.appendChild(clonedField);
    });
  }
});
