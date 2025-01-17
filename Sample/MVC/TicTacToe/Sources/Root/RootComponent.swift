//
//  Copyright (c) 2018. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import NeedleFoundation
import UIKit

class RootComponent: BootstrapComponent {

    public var playersStream: PlayersStream {
        return mutablePlayersStream
    }

    @MainActor
    public var mutablePlayersStream: MutablePlayersStream {
        return shared { PlayersStreamImpl() }
    }

    @MainActor
    var rootViewController: UIViewController {
        return RootViewController(playersStream: playersStream, loggedOutBuilder: loggedOutComponent, loggedInBuilder: loggedInComponent)
    }

    var loggedOutComponent: LoggedOutComponent {
        return LoggedOutComponent(parent: self)
    }

    var loggedInComponent: LoggedInComponent {
        return LoggedInComponent(parent: self)
    }
}
