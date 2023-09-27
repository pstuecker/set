/*
 * Copyright (c) 2021 DB Netz AG and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */
import { MapSourceType } from '../MapSource'
import Configuration from '../Configuration'
import XYZ from 'ol/source/XYZ'
import XHRMapBase from './XHRMapBase'

/**
 * Map source for Here Maps satellite maps maps
 * Requries a Mapbox api token
 *
 * @author Stuecker
 */
export default class HereMapsSat extends XHRMapBase {
  source: XYZ | null = null
  constructor () {
    super('HERE_SAT', 'Here Maps', MapSourceType.Satellite, Configuration.getToolboxConfiguration().hereApiKey)
  }

  getAPIUrl (): string {
    return Configuration.getHereMapsURL()
      .replace('{mapType}', 'maptile-aerial')
      .replace('{mapScheme}', 'satellite.day')
  }

  getAPIHeaders (): [string, string][] {
    return [['key', this.getAPIKey()]]
  }
}
