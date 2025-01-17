/*
 * Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
 * or more contributor license agreements. Licensed under the Elastic License
 * 2.0 and the Server Side Public License, v 1; you may not use this file except
 * in compliance with, at your election, the Elastic License 2.0 or the Server
 * Side Public License, v 1.
 */

import Path from 'path';

import isPathInside from 'is-path-inside';

export function isNodeModule(dtsDir: string, path: string) {
  return (isPathInside(path, dtsDir) ? Path.relative(dtsDir, path) : path)
    .split(Path.sep)
    .includes('node_modules');
}
