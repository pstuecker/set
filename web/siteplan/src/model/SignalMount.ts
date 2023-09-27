/**
 * Copyright (c) 2021 DB Netz AG and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */
import { checkInstance } from '@/util/ObjectExtension'
import { defaultPositionObj, Position } from './Position'
import { defaultSignalObj, Signal } from './Signal'
import SiteplanObject, { defaultObjectColorObj } from './SiteplanObject'

export enum SignalMountType {
  Mast = 'Mast',
  MehrereMasten = 'MehrereMasten',
  Pfosten = 'Pfosten',
  Schienenfuss = 'Schienenfuss',
  Gleisabschluss = 'Gleisabschluss',
  MastNiedrig = 'MastNiedrig',
  PfostenNiedrig = 'PfostenNiedrig',
  Deckenkonstruktion = 'Deckenkonstruktion',
  Wandkonstruktion = 'Wandkonstruktion',
  SignalauslegerLinks = 'SignalauslegerLinks',
  SignalauslegerMitte = 'SignalauslegerMitte',
  Sonderkonstruktion = 'Sonderkonstruktion',
  Signalbruecke = 'Signalbruecke',
  // Internally used, not generated by Java:
  BSVRVA = 'BSVRVA',
  MsUESWdh = 'MsUESWdh',
  None = 'None'
}

export interface SignalMount extends SiteplanObject
{
    guid: string
    position: Position
    attachedSignals: Signal[]
    mountType: SignalMountType
}

export function defaultSignalMountObj (): SignalMount {
  return {
    position: defaultPositionObj(),
    attachedSignals: [defaultSignalObj()],
    mountType: SignalMountType.BSVRVA,
    guid: '0',
    objectColors: [defaultObjectColorObj()]
  }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function isInstanceOfSignalMount (object: any): boolean {
  return checkInstance(object, defaultSignalMountObj())
}
