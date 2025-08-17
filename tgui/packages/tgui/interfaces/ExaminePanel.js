import { useBackend } from '../backend';
import { Stack, Section, ByondUi } from '../components';
import { Window } from '../layouts';

export const ExaminePanel = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    character_name,
    assigned_map,
    obscured,
    flavor_text,
    headshot,
  } = data;
  return (
    <Window
      title="Examine Panel"
      width={900}
      height={670}
      theme="admin">
      <Window.Content>
        <Stack fill>
          <Stack.Item grow>
            {!headshot ? (
              <Section fill title="Character Preview">
                {!obscured && (
                  <ByondUi
                    height="100%"
                    width="100%"
                    className="ExaminePanel__map"
                    params={{
                      id: assigned_map,
                      type: 'map',
                    }}
                  />
                )}
              </Section>
            ) : (
              <>
                <Section height="310px" title="Character Preview">
                  {!obscured && (
                    <ByondUi
                      height="260px"
                      width="100%"
                      className="ExaminePanel__map"
                      params={{
                        id: assigned_map,
                        type: 'map',
                      }}
                    />
                  )}
                </Section>
                <Section height="310px" title="Headshot">
                  <img
                    src={resolveAsset(headshot)}
                    height="250px"
                    width="250px"
                  />
                </Section>
              </>
            )}
          </Stack.Item>
          <Stack.Item grow>
            <Stack fill vertical>
              <Stack.Item grow>
                <Section scrollable fill title={character_name + "'s Flavor Text:"}>
                  {flavor_text}
                </Section>
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
