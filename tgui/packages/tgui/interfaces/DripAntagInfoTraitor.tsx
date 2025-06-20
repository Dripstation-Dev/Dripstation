import { useBackend } from '../backend';
import { BlockQuote, Section, Stack } from '../components';
import { BooleanLike } from 'common/react';
import { Window } from '../layouts';
import { ObjectivesSection, Objective } from './common/ObjectiveSelection';
import { AntagInfoHeader } from './common/AntagInfoHeader';

const badstyle = {
  color: 'red',
  fontWeight: 'bold',
};

const goalstyle = {
  color: 'lightblue',
  fontWeight: 'bold',
};

const allystyle = {
  fontWeight: 'bold',
  color: 'yellow',
};

type Info = {
  antag_name: string;
  faction_desc: string;
  allies: string;
  has_codewords: BooleanLike;
  phrases: string;
  responses: string;
  code: string;
  failsafe_code: string;
  has_uplink: BooleanLike;
  uplink_unlock_info: string;
  objectives: Objective[];
};

const UplinkSection = (_props, context) => {
  const { data } = useBackend<Info>(context);
  const { has_uplink, uplink_unlock_info, code, failsafe_code } = data;
  return (
    <Section title="Uplink" mb={!has_uplink && -1}>
      <Stack vertical>
        <Stack.Item>
          <BlockQuote>
            Keep this uplink safe, and don&apos;t feel like you need to buy everything immediately — you can save your
            telecrystals to use whenever you&apos;re in a tough situation and need help.
          </BlockQuote>
        </Stack.Item>
        <Stack.Divider />
        <Stack.Item>
          <Stack fill>
            <Stack.Item bold>{code && <span style={goalstyle}>Code: {code}</span>}</Stack.Item>
            <Stack.Divider />
            {failsafe_code && (
              <>
                <Stack.Item bold>{code && <span style={goalstyle}>Code: {code}</span>}</Stack.Item>
                <Stack.Divider />
              </>
            )}
            <Stack.Item>
              <BlockQuote>{uplink_unlock_info}</BlockQuote>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const EmployerSection = (_props, context) => {
  const { data } = useBackend<Info>(context);
  const { allies, faction_desc } = data;
  return (
    <Section
      fill
      title="Employer"
      scrollable
    >
      <Stack vertical fill>
        <Stack.Item grow>
          <Stack vertical>
            <Stack.Item>
              <span style={allystyle}>
                Your allegiances:
                <br />
              </span>
              <BlockQuote>{allies}</BlockQuote>
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <span style={goalstyle}>
                Important notes:
                <br />
              </span>
              <BlockQuote>{faction_desc}</BlockQuote>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const CodewordsSection = (_props, context) => {
  const { data } = useBackend<Info>(context);
  const { has_codewords, phrases, responses } = data;
  return (
    <Section title="Codewords" mb={!has_codewords && -1}>
      <Stack fill>
        {(!has_codewords && (
          <BlockQuote>
            You have not been supplied with codewords. You will have to use alternative methods to find potential allies.
            Proceed with caution, however, as everyone is a potential foe.
          </BlockQuote>
        )) || (
          <>
            <Stack.Item grow basis={0}>
              <BlockQuote>
                Your employer provided you with the following codewords to identify fellow agents. Use the codewords during
                regular conversation to identify other agents. Proceed with caution, however, as everyone is a potential foe.
                <span style={badstyle}>&ensp;You have memorized the codewords, allowing you to recognise them when heard.</span>
              </BlockQuote>
            </Stack.Item>
            <Stack.Divider mr={1} />
            <Stack.Item grow basis={0}>
              <Stack vertical>
                <Stack.Item>Code Phrases:</Stack.Item>
                <Stack.Item bold textColor="blue">
                  {phrases}
                </Stack.Item>
                <Stack.Item>Code Responses:</Stack.Item>
                <Stack.Item bold textColor="red">
                  {responses}
                </Stack.Item>
              </Stack>
            </Stack.Item>
          </>
        )}
      </Stack>
    </Section>
  );
};

export const DripAntagInfoTraitorContent = (_props, context) => {
  const { data } = useBackend<Info>(context);
  const { antag_name, objectives } = data;
  return (
    <Stack vertical fill>
      <Stack.Item>
        <AntagInfoHeader name={antag_name || 'Traitor'} asset="traitor.png" />
      </Stack.Item>
      <Stack.Item grow>
        <Stack fill>
          <Stack.Item width="70%">
            <ObjectivesSection objectives={objectives} />
          </Stack.Item>
          <Stack.Item width="30%">
            <EmployerSection />
          </Stack.Item>
        </Stack>
      </Stack.Item>
      <Stack.Item>
        <UplinkSection />
      </Stack.Item>
      <Stack.Item>
        <CodewordsSection />
      </Stack.Item>
    </Stack>
  );
};

export const DripAntagInfoTraitor = (_props, context) => {
  return (
    <Window width={620} height={620} theme="syndicate">
      <Window.Content>
        <DripAntagInfoTraitorContent />
      </Window.Content>
    </Window>
  );
};
