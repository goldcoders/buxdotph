//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <buxdotph/buxdotph_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) buxdotph_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "BuxdotphPlugin");
  buxdotph_plugin_register_with_registrar(buxdotph_registrar);
}
