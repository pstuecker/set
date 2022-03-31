/**
 * Copyright (c) 2018 DB Netz AG and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */
package org.eclipse.set.basis.autofill;

import java.util.List;

import com.google.common.collect.Lists;

/**
 * Default implementation of a filling trigger.
 * 
 * @author Schaefer
 */
public class DefaultTrigger implements FillTrigger {

	private final List<FillInstruction> instructions = Lists.newLinkedList();

	@Override
	public void activate() {
		instructions.forEach(i -> i.execute());
	}

	@Override
	public void addFillInstruction(final FillInstruction instruction) {
		instructions.add(instruction);
	}
}
