/*
 * Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
 * or more contributor license agreements. Licensed under the Elastic License
 * 2.0; you may not use this file except in compliance with the Elastic License
 * 2.0.
 */

import { CoreSetup, CoreStart, Plugin } from '../../../../src/core/public';
import { SessionViewServices } from './types';
import { getSessionViewLazy } from './methods';

export class SessionViewPlugin implements Plugin {
  public setup(core: CoreSetup<SessionViewServices, void>) {}

  public start(core: CoreStart) {
    return {
      getSessionView: (sessionEntityId: string) => getSessionViewLazy(sessionEntityId),
    };
  }

  public stop() {}
}
