
struct Car {
  
  enum CarErrors: Error {
    case carLocked
    case carUnlocked
    case doorOpen
    case doorClose
    case noFuel
    case batteryIsLow
    case engineStarted
    case engineStoped
    case ignitionOn
    
    var errorDescription: String {
      switch self {
      case .carLocked:
        return "Car is already locked."
      case .carUnlocked:
        return "Car is already unlocked."
      case .doorOpen:
        return "Door is already opened."
      case .doorClose:
        return "Door is already closed."
      case .noFuel:
        return "Tank is empty. Go to petrol station."
      case .batteryIsLow:
        return "Battery is low."
      case .engineStarted:
        return "Engine is already started."
      case .engineStoped:
        return "Engine is already stoped."
      case .ignitionOn:
        return "Ignition is already on."
      }
    }
  }
  
  var isCarOpen: Bool
  var isDoorOpen: Bool
  var ignitionOn: Bool
  var isEngineStarted: Bool
  var isRunning: Bool
  var isFuelTankEmpty: Bool
  var isTheBatteryLow: Bool
  
  mutating func unlockTheCar() throws {
    if isCarOpen == true {
      throw CarErrors.carUnlocked
    }
    print("Car is unlocked // Машина разблокирована")
    isCarOpen = !isCarOpen
  }
  
  mutating func openTheDoor() throws {
    if isDoorOpen == true {
      throw CarErrors.doorOpen
    }
    print("Door is opened // Дверь отрыта")
    isDoorOpen = !isDoorOpen
  }
  
  mutating func closeTheDoor() throws {
    if !isDoorOpen {
      throw CarErrors.doorClose
    }
    print("Door is closed // Дверь закрыта")
    isDoorOpen = !isDoorOpen
  }
  
  mutating func turnOnTheIgnition() throws {
    if ignitionOn {
      throw CarErrors.ignitionOn
    }
    print("Ignition is turned on // Зажигание включено")
    ignitionOn = !ignitionOn
  }
  
  mutating func startTheEngine() throws {
    if isEngineStarted {
      throw CarErrors.engineStarted
    }
    print("Engine is started // Двигатель запущен")
    isEngineStarted = !isEngineStarted
  }
  
  mutating func drive() throws {
    if isFuelTankEmpty == true {
      throw CarErrors.noFuel
    }
    print("Car is running // Машина едет")
    isRunning = !isRunning
  }
  
  mutating func stopTheEngine() throws {
    if !isEngineStarted {
      throw CarErrors.engineStoped
    }
    print("Engine is stoped // Двигатель остановлен")
    isEngineStarted = !isEngineStarted
  }
  
  mutating func lockTheCar() throws {
    if !isCarOpen {
      throw CarErrors.carLocked
    }
    print("Car is locked // Машина заблокирована")
    isCarOpen = !isCarOpen
  }
  
  mutating func checkBattery() throws {
    if isTheBatteryLow {
      throw CarErrors.batteryIsLow
    }
    print("Battery is checked // Батарея проверена")
    isTheBatteryLow = !isTheBatteryLow
  }
}

// ------------------------------
// MARK: - Создание позитивного сценария
// ------------------------------

func doPositiveScenario() throws {
  var car = Car(
    isCarOpen: false,
    isDoorOpen: false,
    ignitionOn: false,
    isEngineStarted: false,
    isRunning: false,
    isFuelTankEmpty: false,
    isTheBatteryLow: false
  )
  
  try car.unlockTheCar()
  try car.openTheDoor()
  try car.closeTheDoor()
  try car.checkBattery()
  try car.turnOnTheIgnition()
  try car.startTheEngine()
  try car.drive()
  try car.stopTheEngine()
  try car.lockTheCar()
}

do {
  print("Positive scenario is running..")
  try doPositiveScenario()
} catch Car.CarErrors.carLocked {
  print(Car.CarErrors.carLocked.errorDescription)
} catch Car.CarErrors.carUnlocked {
  print(Car.CarErrors.carUnlocked.errorDescription)
} catch Car.CarErrors.doorOpen {
  print(Car.CarErrors.doorOpen.errorDescription)
} catch Car.CarErrors.doorClose {
  print(Car.CarErrors.doorClose.errorDescription)
} catch Car.CarErrors.noFuel {
  print(Car.CarErrors.noFuel.errorDescription)
} catch Car.CarErrors.batteryIsLow {
  print(Car.CarErrors.batteryIsLow.errorDescription)
} catch Car.CarErrors.engineStarted {
  print(Car.CarErrors.engineStarted.errorDescription)
} catch Car.CarErrors.engineStoped {
  print(Car.CarErrors.engineStoped.errorDescription)
} catch Car.CarErrors.ignitionOn {
  print(Car.CarErrors.ignitionOn.errorDescription)
}

// ------------------------------
// MARK: - Создание негативного сценария
// ------------------------------

func doNegativeScenario() throws {
  var car = Car(
    isCarOpen: false,
    isDoorOpen: false,
    ignitionOn: false,
    isEngineStarted: false,
    isRunning: false,
    isFuelTankEmpty: true,
    isTheBatteryLow: true
  )
  
  try car.unlockTheCar()
  try car.openTheDoor()
  try car.closeTheDoor()
  try car.turnOnTheIgnition()
  try car.startTheEngine()
  try car.drive()
  try car.stopTheEngine()
  try car.lockTheCar()
  try car.checkBattery()
  
}

do {
  print("")
  print("Negative scenario is running..")
  try doNegativeScenario()
} catch Car.CarErrors.carLocked {
  print(Car.CarErrors.carLocked.errorDescription)
} catch Car.CarErrors.carUnlocked {
  print(Car.CarErrors.carUnlocked.errorDescription)
} catch Car.CarErrors.doorOpen {
  print(Car.CarErrors.doorOpen.errorDescription)
} catch Car.CarErrors.doorClose {
  print(Car.CarErrors.doorClose.errorDescription)
} catch Car.CarErrors.noFuel {
  print(Car.CarErrors.noFuel.errorDescription)
} catch Car.CarErrors.batteryIsLow {
  print(Car.CarErrors.batteryIsLow.errorDescription)
} catch Car.CarErrors.engineStarted {
  print(Car.CarErrors.engineStarted.errorDescription)
} catch Car.CarErrors.engineStoped {
  print(Car.CarErrors.engineStoped.errorDescription)
} catch Car.CarErrors.ignitionOn {
  print(Car.CarErrors.ignitionOn.errorDescription)
}
