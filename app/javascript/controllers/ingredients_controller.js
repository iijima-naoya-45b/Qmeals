import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fields"];

  addIngredient(event) {
    event.preventDefault();
  
    const field = document.createElement('div'); // 新しいingredient-fieldを作成
    field.classList.add('ingredient-field');
  
    // 新しいtext_fieldを追加
    const ingredientNameInput = document.createElement('input');
    ingredientNameInput.type = 'text';
    ingredientNameInput.name = 'recipe_form[ingredients_attributes][ingredient_name]';  // Strong Parameters の設定に合わせる // 望む形式のname属性を設定
    ingredientNameInput.placeholder = '材料名を入力してください';

    const unitUnitInput = document.createElement('input');
    unitUnitInput.type = 'text';
    unitUnitInput.name = 'recipe_form[ingredients_attributes][unit_unit]'; // 望む形式のname属性を設定
    unitUnitInput.placeholder = '400g、大さじ1杯など';
      
    // ボタンを作成
    const addBtn = document.createElement('button');
    addBtn.textContent = '材料を追加';
    addBtn.dataset.action = 'click->ingredients#addIngredient';
  
    const removeBtn = document.createElement('button');
    removeBtn.textContent = '材料を削除';
    removeBtn.dataset.action = 'click->ingredients#removeIngredient';
  
    // ボタンをfieldに追加
    field.appendChild(addBtn);
    field.appendChild(removeBtn);
    
    // text_fieldをfieldに追加
    field.appendChild(ingredientNameInput);
    field.appendChild(unitUnitInput);
  
    // fieldsTargetに新しいingredient-fieldを追加
    this.fieldsTarget.appendChild(field);
  }

  removeIngredient(event) {
    event.preventDefault();

    const fields = this.fieldsTarget.children;
    if (fields.length > 4) {
      fields[fields.length - 1].remove();
    }
  }
}
