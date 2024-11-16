import { multiline } from 'common/string';
import { Fragment } from 'react';

import { useBackend } from '../backend';
import { Button, LabeledList, NoticeBox, Section } from '../components';
import { Window } from '../layouts';

export const CentcomPodLauncher = () => {
  return (
    <Window title="Config/Launch Supply Pod" width={700} height={700} resizable>
      <Window.Content scrollable>
        <CentcomPodLauncherContent />
      </Window.Content>
    </Window>
  );
};

// This is more or less a direct port from old tgui, with some slight
// text cleanup. But yes, it actually worked like this.
export const CentcomPodLauncherContent = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    bayNumber,
    effectReverse,
    dropoff_turf,
    bay,
    oldArea,
    launchClone,
    launchRandomItem,
    launchChoice,
    explosionChoice,
    damageChoice,
    effectShrapnel,
    effectStun,
    effectLimb,
    effectOrgans,
    effectBluespace,
    effectStealth,
    effectQuiet,
    effectMissile,
    effectCircle,
    effectBurst,
    effectTarget,
    effectName,
    effectAnnounce,
    fallingSound,
    landingSound,
    openingSound,
    leavingSound,
    soundVolume,
    fallDuration,
    landingDelay,
    openingDelay,
    departureDelay,
    styleChoice,
    numObjects,
    giveLauncher,
  } = data;
  return (
    <>
      <NoticeBox>
        To use this, simply spawn the atoms you want in one of the five Centcom
        Supplypod Bays. Items in the bay will then be launched inside your
        supplypod, one turf-full at a time! You can optionally use the following
        buttons to configure how the supplypod acts.
      </NoticeBox>
      <Section title="Centcom Pod Customization (To be used against Helen Weinstein)">
        <LabeledList>
          <LabeledList.Item label="Supply Bay">
            <Button
              content="Bay #1"
              selected={bayNumber === 1}
              onClick={() => act('bay1')}
            />
            <Button
              content="Bay #2"
              selected={bayNumber === 2}
              onClick={() => act('bay2')}
            />
            <Button
              content="Bay #3"
              selected={bayNumber === 3}
              onClick={() => act('bay3')}
            />
            <Button
              content="Bay #4"
              selected={bayNumber === 4}
              onClick={() => act('bay4')}
            />
            <Button
              content="ERT Bay"
              selected={bayNumber === 5}
              tooltip={multiline`
                This bay is located on the western edge of CentCom. Its the
                glass room directly west of where ERT spawn, and south of the
                CentCom ferry. Useful for launching ERT/Deathsquads/etc. onto
                the station via drop pods.
              `}
              onClick={() => act('bay5')}
            />
          </LabeledList.Item>
          {!!effectReverse && (
            <LabeledList.Item label="Reverse Drop">
              <Button
                content="Pick Dropoff Location"
                selected={picking_dropoff_turf}
                disabled={!effectReverse}
                tooltip={multiline`
                  [NOTE: ONLY WORKS WHEN REVERSE MODE IS ACTIVE]
                  This will allow you to select a dropoff turf. After
                  selecting a turf, any pod in 'Reverse Mode' will drop off
                  it's newly gotten cargo on this turf. Can be used to
                  transport things or people around the station in a neat,
                  IC way. Try doing this with the 'Seethrough Pod' style
                  enabled for extra fun!
                `}
                onClick={() => act('pickDropoffTurf')}
              />
              <Button
                content="Clear Dropoff Location"
                disabled={!dropoff_turf}
                tooltip={multiline`
                  Clears the selected dropoff turf for reverse mode.
                `}
                onClick={() => act('clearDropoffTurf')}
              />
              <p>
                Reverse Drop-off Location:
                {dropoff_turf ? dropoff_turf : 'None'}
              </p>
            </LabeledList.Item>
          )}
          {!effectReverse && (
            <LabeledList.Item label="Reverse Drop">
              <p>[Enable Reverse Mode for this feature]</p>
            </LabeledList.Item>
          )}
          <LabeledList.Item label="Teleport to">
            <Button content={bay} onClick={() => act('teleportCentcom')} />
            <Button
              content={oldArea ? oldArea : 'Where you were'}
              disabled={!oldArea}
              onClick={() => act('teleportBack')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Item Mode">
            <Button
              content="Clone Items"
              selected={launchClone}
              tooltip={multiline`
                Choosing this will create a duplicate of the item to be
                launched in Centcom, allowing you to send one type of item
                multiple times. Either way, the atoms are forceMoved into
                the supplypod after it lands (but before it opens).
              `}
              onClick={() => act('launchClone')}
            />
            <Button
              content="Random Items"
              selected={launchRandomItem}
              tooltip={multiline`
                Choosing this will pick a random item from the selected turf
                instead of the entire turfs contents. Best combined with
                single/random turf.
              `}
              onClick={() => act('launchRandomItem')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Launch style">
            <Button
              content="Ordered"
              selected={launchChoice === 1}
              tooltip={multiline`
                Instead of launching everything in the bay at once, this
                will "scan" things (one turf-full at a time) in order, left
                to right and top to bottom. undoing will reset the "scanner"
                to the top-leftmost position.
              `}
              onClick={() => act('launchOrdered')}
            />
            <Button
              content="Random Turf"
              selected={launchChoice === 2}
              tooltip={multiline`
                Instead of launching everything in the bay at once, this
                will launch one random turf of items at a time.
              `}
              onClick={() => act('launchRandomTurf')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Explosion">
            <Button
              content="Custom Size"
              selected={explosionChoice === 1}
              tooltip={multiline`
                This will cause an explosion of whatever size you like
                (including flame range) to occur as soon as the supplypod
                lands. Dont worry, supply-pods are explosion-proof!
              `}
              onClick={() => act('explosionCustom')}
            />
            <Button
              content="Adminbus"
              selected={explosionChoice === 2}
              tooltip={multiline`
                This will cause a maxcap explosion (dependent on server
                config) to occur as soon as the supplypod lands. Dont worry,
                supply-pods are explosion-proof!
              `}
              onClick={() => act('explosionBus')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Damage">
            <Button
              content="Custom Damage"
              selected={damageChoice === 1}
              tooltip={multiline`
                Anyone caught under the pod when it lands will be dealt
                this amount of brute damage. Sucks to be them!
              `}
              onClick={() => act('damageCustom')}
            />
            <Button
              content="Gib"
              selected={damageChoice === 2}
              tooltip={multiline`
                This will attempt to gib any mob caught under the pod when
                it lands, as well as dealing a nice 5000 brute damage. Ya
                know, just to be sure!
              `}
              onClick={() => act('damageGib')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Effects">
            <Button
              content="Projectile Cloud"
              selected={effectShrapnel}
              tooltip={multiline`
                This will create a cloud of shrapnel on landing,
                of any projectile you'd like!
              `}
              onClick={() => act('effectShrapnel')}
            />
            <Button
              content="Stun"
              selected={effectStun}
              tooltip={multiline`
                Anyone who is on the turf when the supplypod is launched
                will be stunned until the supplypod lands. They cant get
                away that easy!
              `}
              onClick={() => act('effectStun')}
            />
            <Button
              content="Delimb"
              selected={effectLimb}
              tooltip={multiline`
                This will cause anyone caught under the pod to lose a limb,
                excluding their head.
              `}
              onClick={() => act('effectLimb')}
            />
            <Button
              content="Yeet Organs"
              selected={effectOrgans}
              tooltip={multiline`
                This will cause anyone caught under the pod to lose all
                their limbs and organs in a spectacular fashion.
              `}
              onClick={() => act('effectOrgans')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Movement">
            <Button
              content="Bluespace"
              selected={effectBluespace}
              tooltip={multiline`
                Gives the supplypod an advanced Bluespace Recyling Device.
                After opening, the supplypod will be warped directly to the
                surface of a nearby NT-designated trash planet (/r/ss13).
              `}
              onClick={() => act('effectBluespace')}
            />
            <Button
              content="Stealth"
              selected={effectStealth}
              tooltip={multiline`
                This hides the red target icon from appearing when you
                launch the supplypod. Combos well with the "Invisible"
                style. Sneak attack, go!
              `}
              onClick={() => act('effectStealth')}
            />
            <Button
              content="Quiet"
              selected={effectQuiet}
              tooltip={multiline`
                This will keep the supplypod from making any sounds, except
                for those specifically set by admins in the Sound section.
              `}
              onClick={() => act('effectQuiet')}
            />
            <Button
              content="Reverse Mode"
              selected={effectReverse}
              tooltip={multiline`
                This pod will not send any items. Instead, after landing,
                the supplypod will close (similar to a normal closet closing),
                and then launch back to the right centcom bay to drop off any
                new contents.
              `}
              onClick={() => act('effectReverse')}
            />
            <Button
              content="Missile Mode"
              selected={effectMissile}
              tooltip={multiline`
                This pod will not send any items. Instead, it will immediately
                delete after landing (Similar visually to setting openDelay
                & departDelay to 0, but this looks nicer). Useful if you just
                wanna fuck some shit up. Combos well with the Missile style.
              `}
              onClick={() => act('effectMissile')}
            />
            <Button
              content="Any Descent Angle"
              selected={effectCircle}
              tooltip={multiline`
                This will make the supplypod come in from any angle. Im not
                sure why this feature exists, but here it is.
              `}
              onClick={() => act('effectCircle')}
            />
            <Button
              content="Machine Gun Mode"
              selected={effectBurst}
              tooltip={multiline`
                This will make each click launch 5 supplypods inaccuratly
                around the target turf (a 3x3 area). Combos well with the
                Missile Mode if you dont want shit lying everywhere after.
              `}
              onClick={() => act('effectBurst')}
            />
            <Button
              content="Specific Target"
              selected={effectTarget}
              tooltip={multiline`
                This will make the supplypod target a specific atom, instead
                of the mouses position. Smiting does this automatically!
              `}
              onClick={() => act('effectTarget')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Name/Desc">
            <Button
              content="Custom Name/Desc"
              selected={effectName}
              tooltip="Allows you to add a custom name and description."
              onClick={() => act('effectName')}
            />
            <Button
              content="Alert Ghosts"
              selected={effectAnnounce}
              tooltip={multiline`
                Alerts ghosts when a pod is launched. Useful if some dumb
                shit is aboutta come outta the pod.
              `}
              onClick={() => act('effectAnnounce')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Sound">
            <Button
              content="Custom Falling Sound"
              selected={fallingSound}
              tooltip={multiline`
                Choose a sound to play as the pod falls. Note that for this
                to work right you should know the exact length of the sound,
                in seconds.
              `}
              onClick={() => act('fallSound')}
            />
            <Button
              content="Custom Landing Sound"
              selected={landingSound}
              tooltip="Choose a sound to play when the pod lands."
              onClick={() => act('landingSound')}
            />
            <Button
              content="Custom Opening Sound"
              selected={openingSound}
              tooltip="Choose a sound to play when the pod opens."
              onClick={() => act('openingSound')}
            />
            <Button
              content="Custom Leaving Sound"
              selected={leavingSound}
              tooltip={multiline`
                Choose a sound to play when the pod departs (whether that be
                delection in the case of a bluespace pod, or leaving for
                centcom for a reversing pod).
              `}
              onClick={() => act('leavingSound')}
            />
            <Button
              content="Admin Sound Volume"
              selected={soundVolume}
              tooltip={multiline`
                Choose the volume for the sound to play at. Default values
                are between 1 and 100, but hey, do whatever. Im a tooltip,
                not a cop.
              `}
              onClick={() => act('soundVolume')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Timers">
            <Button
              content="Custom Falling Duration"
              selected={fallDuration !== 4}
              tooltip={multiline`
                Set how long the animation for the pod falling lasts. Create
                dramatic, slow falling pods!
              `}
              onClick={() => act('fallDuration')}
            />
            <Button
              content="Custom Landing Time"
              selected={landingDelay !== 20}
              tooltip={multiline`
                Choose the amount of time it takes for the supplypod to hit
                the station. By default this value is 0.5 seconds.
              `}
              onClick={() => act('landingDelay')}
            />
            <Button
              content="Custom Opening Time"
              selected={openingDelay !== 30}
              tooltip={multiline`
                Choose the amount of time it takes for the supplypod to open
                after landing. Useful for giving whatevers inside the pod a
                nice dramatic entrance! By default this value is 3 seconds.
              `}
              onClick={() => act('openingDelay')}
            />
            <Button
              content="Custom Leaving Time"
              selected={departureDelay !== 30}
              tooltip={multiline`
                Choose the amount of time it takes for the supplypod to leave
                after landing. By default this value is 3 seconds.
              `}
              onClick={() => act('departureDelay')}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Style">
            <Button
              content="Standard"
              selected={styleChoice === 1}
              tooltip={multiline`
                Same color scheme as the normal station-used supplypods
              `}
              onClick={() => act('styleStandard')}
            />
            <Button
              content="Advanced"
              selected={styleChoice === 2}
              tooltip={multiline`
                The same as the stations upgraded blue-and-white
                Bluespace Supplypods
              `}
              onClick={() => act('styleBluespace')}
            />
            <Button
              content="Syndicate"
              selected={styleChoice === 4}
              tooltip={multiline`
                A menacing black and blood-red. Great for sending meme-ops
                in style!
              `}
              onClick={() => act('styleSyndie')}
            />
            <Button
              content="Deathsquad"
              selected={styleChoice === 5}
              tooltip={multiline`
                A menacing black and dark blue. Great for sending deathsquads
                in style!
              `}
              onClick={() => act('styleBlue')}
            />
            <Button
              content="Cult Pod"
              selected={styleChoice === 6}
              tooltip="A blood and rune covered cult pod!"
              onClick={() => act('styleCult')}
            />
            <Button
              content="Missile"
              selected={styleChoice === 7}
              tooltip={multiline`
                A large missile. Combos well with a missile mode, so the
                missile doesnt stick around after landing.
              `}
              onClick={() => act('styleMissile')}
            />
            <Button
              content="Syndicate Missile"
              selected={styleChoice === 8}
              tooltip={multiline`
                A large blood-red missile. Combos well with missile mode,
                so the missile doesnt stick around after landing.
              `}
              onClick={() => act('styleSMissile')}
            />
            <Button
              content="Supply Crate"
              selected={styleChoice === 9}
              tooltip="A large, dark-green military supply crate."
              onClick={() => act('styleBox')}
            />
            <Button
              content="HONK"
              selected={styleChoice === 10}
              tooltip="A colorful, clown inspired look."
              onClick={() => act('styleHONK')}
            />
            <Button
              content="~Fruit"
              selected={styleChoice === 11}
              tooltip="For when an orange is angry"
              onClick={() => act('styleFruit')}
            />
            <Button
              content="Invisible"
              selected={styleChoice === 12}
              tooltip={multiline`
                Makes the supplypod invisible! Useful for when you want to
                use this feature with a gateway or something. Combos well
                with the "Stealth" and "Quiet Landing" effects.
              `}
              onClick={() => act('styleInvisible')}
            />
            <Button
              content="Show Contents (See Through Pod)"
              selected={styleChoice === 14}
              tooltip={multiline`
                By selecting this, the pod will instead look like whatevers
                inside it (as if it were the contents falling by themselves,
                without a pod). Useful for launching mechs at the station
                and standing tall as they soar in from the heavens.
              `}
              onClick={() => act('styleSeeThrough')}
            />
          </LabeledList.Item>
        </LabeledList>
      </Section>
      <Section>
        <LabeledList>
          <LabeledList.Item
            label={numObjects + ' turfs in ' + bay}
            buttons={
              <>
                <Button
                  content="undo Pod Bay"
                  tooltip={multiline`
                    Manually undoes the possible things to launch in the
                    pod bay.
                  `}
                  onClick={() => act('undo')}
                />
                <Button
                  content="Enter Launch Mode"
                  selected={giveLauncher}
                  tooltip="THE CODEX ASTARTES CALLS THIS MANEUVER: STEEL RAIN"
                  onClick={() => act('giveLauncher')}
                />
                <Button
                  content="Clear Selected Bay"
                  color="bad"
                  tooltip={multiline`
                    This will delete all objs and mobs from the selected bay.
                  `}
                  tooltipPosition="left"
                  onClick={() => act('clearBay')}
                />
              </>
            }
          />
        </LabeledList>
      </Section>
    </>
  );
};
