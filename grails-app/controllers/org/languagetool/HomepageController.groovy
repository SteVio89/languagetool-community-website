/* LanguageTool Community
 * Copyright (C) 2008 Daniel Naber (http://www.danielnaber.de)
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

/**
 * The main page of the website.
 */
class HomepageController extends BaseController {

    /**
     * Display the site's main page.
     */
    def index = {
        String langCode = params.lang ? params.lang : "en"
        Language langObject = Languages.getLanguageForShortCode(langCode)
        render(view:'index',model:[langCode: langCode,
                lang: langCode,		// used in _corpusMatches.gsp
                languages: SortedLanguages.get(), language: langObject])
    }
    
}
