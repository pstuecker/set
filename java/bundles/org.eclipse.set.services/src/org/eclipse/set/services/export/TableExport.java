/**
 * Copyright (c) 2017 DB Netz AG and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */
package org.eclipse.set.services.export;

import java.nio.file.Path;
import java.util.Map;

import org.eclipse.set.basis.FreeFieldInfo;
import org.eclipse.set.basis.OverwriteHandling;
import org.eclipse.set.basis.ToolboxPaths;
import org.eclipse.set.basis.constants.ExportType;
import org.eclipse.set.basis.constants.TableType;
import org.eclipse.set.basis.exceptions.FileExportException;
import org.eclipse.set.model.tablemodel.Table;
import org.eclipse.set.model.titlebox.Titlebox;

/**
 * Interface for exporting Tables.
 * 
 * @author Schaefer
 */
public interface TableExport {

	/**
	 * Whether an implementation exports all, none or some of the provided
	 * tables depends on the functional context and requirements of the concrete
	 * export.
	 * 
	 * @param tables
	 *            the provided tables
	 * @param exportType
	 *            the export type
	 * @param titlebox
	 *            the titlebox
	 * @param freeFieldInfo
	 *            the free field info
	 * @param shortcut
	 *            the table shortcut (view id)
	 * @param outputDir
	 *            the output directory for the export
	 * @param toolboxPaths
	 *            the toolbox paths
	 * @param tableType
	 *            the type of table
	 * @param overwriteHandling
	 *            what to do when overwriting files
	 * 
	 * @throws FileExportException
	 *             if an file export exception occurs while exporting
	 */
	void export(Map<TableType, Table> tables, ExportType exportType,
			Titlebox titlebox, FreeFieldInfo freeFieldInfo, String shortcut,
			String outputDir, ToolboxPaths toolboxPaths, TableType tableType,
			OverwriteHandling overwriteHandling) throws FileExportException;

	/**
	 * Export the titlebox as an image. An individual implementation may do
	 * nothing if the implemented export technique is not appropriate for this
	 * task. Actually exactly one implementation should to the image export.
	 * 
	 * @param titlebox
	 *            the titlebox
	 * @param imagePath
	 *            the image path
	 * @param overwriteHandling
	 *            what to do when overwriting files
	 * 
	 * @throws Exception
	 *             if an exception occurs while exporting
	 */
	void exportTitleboxImage(Titlebox titlebox, Path imagePath,
			OverwriteHandling overwriteHandling) throws Exception;

	/**
	 * Export the titlebox as an PDF file. An individual implementation may do
	 * nothing if the implemented export technique is not appropriate for this
	 * task. Actually exactly one implementation should to the image export.
	 * 
	 * @param titlebox
	 *            the titlebox
	 * @param pdfPath
	 *            the image path
	 * @param overwriteHandling
	 *            what to do when overwriting files
	 * 
	 * @throws Exception
	 *             if an exception occurs while exporting
	 */
	void exportTitleboxPdf(Titlebox titlebox, Path pdfPath,
			OverwriteHandling overwriteHandling) throws Exception;
}
