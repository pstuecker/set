/**
 * Copyright (c) 2016 DB Netz AG and others.
 * 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */
package org.eclipse.set.ppmodel.extensions

import de.scheidtbachmann.planpro.model.model1902.Flankenschutz.Fla_Zwieschutz
import de.scheidtbachmann.planpro.model.model1902.Weichen_und_Gleissperren.W_Kr_Gsp_Element
import de.scheidtbachmann.planpro.model.model1902.Flankenschutz.Fla_Schutz
import static extension org.eclipse.set.ppmodel.extensions.ZeigerExtensions.*

/**
 * Extensions for {@link Fla_Zwieschutz}.
 */
class FlaZwieschutzExtensions extends BasisObjektExtensions {

	/**
	 * @param zwieschutz this Zwieschutz
	 * 
	 * @return the Zwieschutzweiche
	 */
	def static W_Kr_Gsp_Element getZwieschutzweiche(Fla_Zwieschutz zwieschutz) {
		return zwieschutz.IDWElement.resolve(W_Kr_Gsp_Element)
	}

	/**
	 * @param zwieschutz this Zwieschutz
	 * 
	 * @return the left Flankenschutz of the Zwieschutzelement
	 */
	def static Fla_Schutz getFlaSchutzL(Fla_Zwieschutz zwieschutz) {
		return zwieschutz.flaZwieschutzElement.IDFlaSchutzL.resolve(Fla_Schutz)
	}

	/**
	 * @param zwieschutz this Zwieschutz
	 * 
	 * @return whether the Zwieschutz has a left Flankenschutz
	 */
	def static boolean hasFlaSchutzL(Fla_Zwieschutz zwieschutz) {
		return zwieschutz.flaSchutzL !== null
	}

	/**
	 * @param zwieschutz this Zwieschutz
	 * 
	 * @return the right Flankenschutz of the Zwieschutzelement
	 */
	def static Fla_Schutz getFlaSchutzR(Fla_Zwieschutz zwieschutz) {
		return zwieschutz.flaZwieschutzElement.IDFlaSchutzR.resolve(Fla_Schutz)
	}

	/**
	 * @param zwieschutz this Zwieschutz
	 * 
	 * @return whether the Zwieschutz has a right Flankenschutz
	 */
	def static boolean hasFlaSchutzR(Fla_Zwieschutz zwieschutz) {
		return zwieschutz.flaSchutzR !== null
	}
}
