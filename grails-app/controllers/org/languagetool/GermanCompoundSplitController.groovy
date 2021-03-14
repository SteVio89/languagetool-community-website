/* LanguageTool Community 
 * Copyright (C) 2021 Daniel Naber (http://www.danielnaber.de)
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301
 * USA
 */
package org.languagetool

import de.danielnaber.jwordsplitter.GermanWordSplitter

class GermanCompoundSplitController {
    
    def index() {
        []
    }

    def split() {
        GermanWordSplitter splitter = new GermanWordSplitter(true);
        splitter.setMinimumWordLength(3)
        splitter.setStrictMode(true)
        String[] words = params.input.split("\\s")
        List<String> res = new ArrayList<>()
        for (String word : words) {
            List<String> parts = splitter.splitWord(word)
            res.addAll(parts.join(" "))
        }
        render(view:'index', model: [splits: res, input: params.input])
    }
}
