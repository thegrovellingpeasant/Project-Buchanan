import { useBackend } from '../backend';
import { Button, Dropdown, Section, Stack } from '../components';
import { Image } from '../components/Image';
import { Window } from '../layouts';

export const LoadoutSelect = (props, context) => {
  const { act, data } = useBackend(context);
  const { outfits = [], selected, items = [], preview } = data;
  return (
    <Window width={500} height={450} resizable>
      <Window.Content scrollable>
        <Section>
          <Dropdown
            selected={selected || 'Select a Loadout'}
            width="100%"
            nowrap
            options={outfits}
            onSelected={(value) =>
              act('loadout_select', {
                name: value,
              })
            }
          />
        </Section>
        <Stack direction="row" width="100%">
          <Stack.Item
            width="50%"
            height="100%"
            style={{ 'vertical-align': 'top' }}
          >
            <Section title="Contents" fill fitted>
              {(!items?.length && 'No outfit selected.') ||
                items.map((item) => (
                  <div
                    style={{ margin: '10px 10px', 'text-align': 'center' }}
                    key={`${item.name}`}
                  >
                    <div
                      style={{
                        transform: 'scale(1.5)',
                        'vertical-align': 'middle',
                        float: 'left',
                        clear: 'left',
                        height: '32px',
                        width: '32px',
                      }}
                      class={item.icon}
                    />
                    <div
                      style={{
                        display: 'block',
                        'vertical-align': 'middle',
                        float: 'left',
                        width: 'calc(100% - 32px)',
                        'line-height': '32px',
                        margin: 'auto',
                      }}
                    >
                      {item.name} {item.quantity > 1 && `x${item.quantity}`}
                      <br />
                    </div>
                  </div>
                ))}
            </Section>
          </Stack.Item>
          <Stack.Item
            height="100%"
            width="50%"
            style={{ 'vertical-align': 'top' }}
          >
            <Section title="Preview" fill>
              {(!preview && 'No outfit selected.') || (
                <div>
                  <Image
                    src={`data:image/jpeg;base64,${preview}`}
                    height="100%"
                    width="100%"
                    verticalAlign="middle"
                  />
                  <br />
                  <br />
                  <div
                    style={{
                      display: 'table',
                      width: '100%',
                      'text-align': 'center',
                    }}
                  >
                    <Button
                      style={{ display: 'table-cell', 'text-align': 'center' }}
                      content={'<<'}
                      onClick={() =>
                        act('loadout_preview_direction', { direction: -1 })
                      }
                    />
                    <Button
                      style={{ display: 'table-cell', 'text-align': 'center' }}
                      content={'>>'}
                      onClick={() =>
                        act('loadout_preview_direction', { direction: 1 })
                      }
                    />
                  </div>
                  <Button
                    style={{
                      margin: 'auto',
                      display: 'block',
                      'text-align': 'center',
                    }}
                    content={'Finished'}
                    onClick={() => act('loadout_confirm')}
                  />
                </div>
              )}
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
