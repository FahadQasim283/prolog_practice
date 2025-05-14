% ----------------------------
% Driving License Eligibility Rules
% ----------------------------

% Facts: vehicle types and their required minimum ages
vehicle(car, 18).
vehicle(bike, 16).
vehicle(truck, 21).

% Facts: people and their ages
person(john, 20).
person(emma, 16).
person(mike, 25).

% Rule: Check if a person is eligible to drive a vehicle
can_drive(Person, Vehicle) :-
    person(Person, Age),
    vehicle(Vehicle, MinAge),
    Age >= MinAge.

% Rule: Speed limits based on vehicle type
speed_limit(car, 100).   % km/h
speed_limit(bike, 60).
speed_limit(truck, 80).

% Rule: Check if a driver is overspeeding
overspeeding(Person, Vehicle, Speed) :-
    can_drive(Person, Vehicle),
    speed_limit(Vehicle, Limit),
    Speed > Limit.

% ----------------------------
% Entry point for OneCompiler
% ----------------------------
:- initialization(main).

main :-
    (can_drive(john, car) ->
        write('John can drive car.'), nl ;
        write('John cannot drive car.'), nl),

    (can_drive(emma, truck) ->
        write('Emma can drive truck.'), nl ;
        write('Emma cannot drive truck.'), nl),

    (overspeeding(mike, bike, 70) ->
        write('Mike is overspeeding.'), nl ;
        write('Mike is not overspeeding.'), nl),

    halt.
