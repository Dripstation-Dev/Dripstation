import { Feature, FeatureNumberInput, FeatureToggle } from "../base";

export const fov_darkness: Feature<number> = {
  name: "Fog of War darkness",
  category: "GAMEPLAY",
  description: `How dark do you want your fog of war to be?`,
  component: FeatureNumberInput,
};
