// app/javascript/controllers/form_controller.js
import { Controller } from 'stimulus';

export default class extends Controller {
  addIngredient(event) {
    event.preventDefault();

    const template = document.getElementById('ingredient-fields-template').innerHTML;
    const index = new Date().getTime();
    const newFields = template.replace(/recipe_form_ingredients_attributes/g, `recipe_form_ingredients_attributes_${index}`);

    const container = document.getElementById('ingredient-fields-container');
    const div = document.createElement('div');
    div.innerHTML = newFields;
    container.appendChild(div);
  }
}
