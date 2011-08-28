<?php
/**
 * @file
 * beer_recipes.features.inc
 */

/**
 * Implementation of hook_node_info().
 */
function beer_recipes_node_info() {
  $items = array(
    'beer_recipe' => array(
      'name' => t('Beer Recipe'),
      'base' => 'node_content',
      'description' => t('Recipes for Beer'),
      'has_title' => '1',
      'title_label' => t('Name'),
      'help' => '',
    ),
  );
  return $items;
}
