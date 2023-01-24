//
//  Adaptable.swift
//  base
//
//  Created by Leif on 12/20/22.
//

/**
 This protocol creates the blueprint for the use of the function that converts the `NetworkModel` to a `DeviceModel`.
 */
protocol Adaptable {
    associatedtype NetworkModel
    associatedtype DeviceModel

    /**
     Static function that consumes a `NetworkModel` as a parameter and returns a `DeviceModel.`

     - Returns: `DeviceModel` which is a forward facing model.

     This function allows the ability to easily convert incoming data model into a more readable format. Each `NetworkModel` that needs to be converted must have its own adapter that conforms to this protocol.  This is built into an enum as outlined below.

     ```
     enum ExampleAdapter: Adaptable {
        static func device(from: NetworkExampleModel) throws -> ExampleDeviceModel {
         ExampleDeviceModel(
                var name: from.name
                var description: from.description
            )
        }
     }
     ```

     */
    static func device(from: NetworkModel) throws -> DeviceModel
}

/**
 This protocol creates the blueprint for the use of the function that converts the `DeviceModel` to a `NetworkModel` for when sending data, such as `POST` methods.
 */
protocol BiDirectionallyAdaptable: Adaptable {
    associatedtype NetworkModel
    associatedtype DeviceModel

    /**
     Static function that consumes a `DeviceModel` as a parameter and returns a `NetworkModel.`

     - Returns: `NetworkModel` which is a model that conforms to API data model standards.

     This function allows the ability to easily convert data in which should be sent to the server from a forward facing model. Each `DeviceModel` that needs to be sent to the server should be converted. and must have its own adapter that conforms to this protocol. This is built into an enum as outlined below.

     ```
     enum ExampleAdapter: Adaptable {
        static func device(from: ExampleDeviceModel) throws -> NetworkExampleModel {
         NetworkExampleModel(
                var name: from.name
                var description: from.description
            )
        }
     }
     ```

     */
    static func network(from: DeviceModel) throws -> NetworkModel
}
