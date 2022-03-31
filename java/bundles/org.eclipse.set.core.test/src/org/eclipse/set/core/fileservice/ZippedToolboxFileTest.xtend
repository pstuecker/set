/**
 * Copyright (c) 2020 DB Netz AG and others.
 * 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */

package org.eclipse.set.core.fileservice

import java.io.IOException
import java.nio.file.Paths
import org.eclipse.set.basis.files.ToolboxFile
import org.eclipse.set.basis.files.ToolboxFileRole
import org.eclipse.set.core.services.files.ToolboxFileFormatService
import org.eclipse.set.sessionservice.SetSessionService
import org.eclipse.set.unittest.utils.toolboxfile.AbstractToolboxFileTest
import org.junit.jupiter.api.Test

/**
 * Test for {@link ZippedPlanProToolboxFile}
 */
class ZippedToolboxFileTest extends AbstractToolboxFileTest {
	static val TESTPATH = "testResource/ABC_01_01_Ibn-Zustand_DT.planpro"

	/**
	 * Test method for {@link ZippedPlanProToolboxFile#open()}
	 */
	@Test
	def void testOpen() throws IOException{
		whenOpen
		thenExpectContentsExists(true)
		thenExpectResourceCallsWithinZipDirectory
	}

	/**
	 * Test method for {@link ZippedPlanProToolboxFile#close()}
	 * 
	 */
	@Test
	def void testClose() throws IOException {
		whenOpen
		whenClose
		thenExpectZippedDirectoryNotExist
		thenExpectContentsExists(false)
	}

	/**
	 * Test method for multiple {@link ZippedPlanProToolboxFile#close()}
	 */
	@Test
	def void testMultipleClose() throws IOException {
		whenOpen
		whenClose
		whenClose
		thenExpectZippedDirectoryNotExist
		thenExpectContentsExists(false)
	}

	/**
	 * Test method for multiple {@link ZippedPlanProToolboxFile#close()}
	 */
	@Test
	def void testAutoclose() throws IOException {
		ToolboxFileRole.SESSION.whenOpenAndAutoclose
		thenExpectZippedDirectoryNotExist
	}

	/**
	 * Test method for {@link ZippedPlanProToolboxFile#close()#open()}, when Close File
	 * and Open again
	 * 
	 */
	@Test
	def void testCloseThenOpen() throws IOException{
		whenOpen
		thenExpectContentsExists(true)
		whenClose
		thenExpectContentsExists(false)
		whenOpen
		thenExpectContentsExists(true)
		thenExpectResourceCallsWithinZipDirectory
	}

	def ToolboxFileFormatService setUpFormatService() {
	}

	override protected ToolboxFile createToolboxFile(ToolboxFileRole role) {
		val fileService = new ToolboxFileServiceImpl
		fileService.addFormat(createFormatService)
		val toolboxFile = fileService.load(Paths.get(TESTPATH), role)
		toolboxFile.temporaryDirectory = Paths.get(TMP_PATH)
		return toolboxFile

	}

	override protected createFormatService() {
		val formatService = new ZippedPlanProFileFormatService
		formatService.sessionService = new SetSessionService
		return formatService
	}

}
