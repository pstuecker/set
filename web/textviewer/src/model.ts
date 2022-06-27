/**
 * Copyright (c) 2022 DB Netz AG and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */
import axios from 'axios'

/**
 * THe model for a problem message
 */
export interface ProblemMessage {
  severity: number
  type: string
  message: string
  lineStart: number
  lineEnd: number
  columnStart: number
  columnEnd: number
}

/**
 * Helper class to fetch the data model
 */
export class Model {
  async fetchFile () {
    const response = await axios.get('model.ppxml')
    return response.data
  }

  async fetchProblems () {
    const response = await axios.get<ProblemMessage[]>('problems.json')
    return response.data
  }
}