import Foundation
import RxSwift

protocol UseCase {
    associatedtype Params
    associatedtype Model
}
extension UseCase {
    func unwrappParams(_ params: Params?) -> Params {
        guard let unwrapped = params else {
            fatalError("UseCase \(String(describing: self)) must have params")
        }
        return unwrapped
    }
}

protocol CompletableUseCase: UseCase {
    func execute(with params: Params?) -> Completable
}

protocol SingleUseCase: UseCase {
    func execute(with params: Params?) -> Single<Model>
}

protocol MaybeUseCase: UseCase {
    func execute(with params: Params?) -> Maybe<Model>
}

protocol ObservableUseCase: UseCase {
    func execute(with params: Params?) -> Observable<Model>
}
