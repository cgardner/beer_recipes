<?php
/**
 * @file
 * beer_recipe_1.features.inc
 */

/**
 * Implementation of hook_node_info().
 */
function beer_recipe_1_node_info() {
  $items = array(
    'beer_recipe' => array(
      'name' => t('Beer Recipe'),
      'base' => 'node_content',
      'description' => t('A recipe for beer'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  return $items;
}
