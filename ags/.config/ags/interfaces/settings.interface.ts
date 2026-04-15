export interface AGSSetting {
  name: string;
  value: any;
  type: "int" | "float" | "string" | "bool" | "select";
  min: number;
  max: number;
  tooltip?: string;
}

export interface Settings {
  hyprland: {
    general: {
      border_size: AGSSetting;
      gaps_in: AGSSetting;
      gaps_out: AGSSetting;
    };
    decoration: {
      rounding: AGSSetting;
      active_opacity: AGSSetting;
      inactive_opacity: AGSSetting;
      blur: {
        enabled: AGSSetting;
        size: AGSSetting;
        passes: AGSSetting;
        xray?: AGSSetting;
      };
      shadow: {
        enabled: AGSSetting;
        range: AGSSetting;
        render_power: AGSSetting;
      };
    };
  };
  ui: {
    opacity: AGSSetting;
    scale: AGSSetting;
    fontSize: AGSSetting;
  };
}
