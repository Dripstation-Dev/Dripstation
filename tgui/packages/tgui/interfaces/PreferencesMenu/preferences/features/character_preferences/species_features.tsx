// THIS IS A NOVA SECTOR UI FILE
import {
  Feature,
  FeatureTextInput,
} from "../base";

export const flavor_text: Feature<string> = {
  name: 'Flavor Text',
  description:
    "Appears when your character is examined (but only if they're identifiable - try a gas mask).",
  component: FeatureTextInput,
};

export const general_record: Feature<string> = {
  name: 'Records - General',
  description:
    'Your general records! These are records that are for general viewing-things like employment, qualifications, etc. By default, anyone with a HUD/records access can view these.',
  component: FeatureTextInput,
};

export const security_record: Feature<string> = {
  name: 'Records - Security',
  description:
    'Your security records! These are records for criminal records, arrest history, things like that. Sec officers can view these.',
  component: FeatureTextInput,
};

export const medical_record: Feature<string> = {
  name: 'Records - Medical',
  description:
    'Your medical records! These are records for things like medical history, prescriptions, DNR orders, etc. Medical staff can view these.',
  component: FeatureTextInput,
};

export const exploitable_info: Feature<string> = {
  name: 'Records - Exploitable',
  description:
    "This section is for information antagonists can use, IN CHARACTER AND OUT. If you are willing to be disrupted by antagonists MORE than the average player (this is usually a very fun experience, if you're into that kind of roleplay), put it here! Also for things antagonists can use against your character.",
  component: FeatureTextInput,
};
