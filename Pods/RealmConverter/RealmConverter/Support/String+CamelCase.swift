////////////////////////////////////////////////////////////////////////////
//
// Copyright 2016 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import Foundation

extension String {
    
    var camelcaseString: String {
        guard !isEmpty else {
            return ""
        }

        let delimiters = CharacterSet(charactersIn: "_-")
        let pascalcaseString = capitalized.components(separatedBy: delimiters).joined(separator: "")
        return "\(pascalcaseString.substring(to: characters.index(startIndex, offsetBy: 1)).lowercased())\(pascalcaseString.substring(from: characters.index(startIndex, offsetBy: 1)))"
    }
    
}
