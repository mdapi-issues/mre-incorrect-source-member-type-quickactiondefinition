#!/usr/bin/env node

import { Org } from "@salesforce/core";

const conn = (await Org.create({})).getConnection();
console.log(await conn.metadata.delete("QuickAction", ["NewGroup"]));
