
## Introduction
- Natural mode of verification engineers, independent of group policy, etc
  Part of the process they graviate to
  - Head-first: Extensive up-front planning, reasoning through possible, architecture, build-out, complex base for tests to leverage
  - Feet-first: After creating a broad-brush plan, start excercising little bits of the design. Understand its quirks, strengths, 
    weaknesses. Adjust broad strokes of a plan to fit with reality of the design and team implementing it

Feel like introductions to PSS (and I've created a few) often emphasize the up-front top-down approach to explaining a problem.
PSS is a very small community, and these introductions are often written by one of us with deep connections to the 
features of the PSS language. This introduction takes a slightly different approach. PSS introduces several 
new and useful tools that reduce duplication and errors across IP Teams by making tests and test content more 
portable and reusable. PSS also seamlessly integrates with the interfaces that we use to exercise
today's IP: APIs, register accesses, and memory.

Instead of starting with the new features that PSS adds and building down to familiar features, such as register 
accesses, we'll start with familiar features and build up. There are a couple of big risks in this plan:
  - there will certainly be points in the story where you will think that creating a whole new language **just to do this** 
  - we will often change our example to take advantage of new features. If only we had planned ahead...
is uncalled for. 

### Mission Statement for PSS
- Create randomized system-level tests
- Capture coverage goals and collect data- and behavioral-coverage metrics
- Enable test reuse 
- Enable modeling system-level constructs, such as memory management, multi-core test scheduling
- Capture the hardware/software interface 
- Enable test content, such as bring-up programming sequences, to be reused seamlessly from IP DV to subsystem to SoC and Post-Si

## But first, a quick intro and glossary
- Basics of the PSS language -- object-oriented, C++-style comments, constraints and randomization, data coverage, behavioral coverage
  - data structures
  - simple data types -- ints, bits, etc

- Functions and imported
- Core Library -- built-in functions that we can call. Sometimes we need to provide implementations for the PSS tool
  - Core library are things that the PSS processing tool knows about. Likely treats differently
- Component
- Action
- Package

## Reset Check 1: Accessing Memory (Basic register access ; core-library )
- PSS 'Hello World'
- Component, Action recap
- exec body
- read/write methods
  - addr_handle_t
  - 
- message / error / fatal
- How Zuspec-SV integrates with SystemVerilog

## Reset Check 2: Procedural Code (Automate reset check with data)
- Might want to factor out base address (field in component)
- Static data of addresses, expected, mask
- foreach, if/else, etc

## Initializing the Design
- Many registers -- possibly across multiple hierarchies
- Fields in registers that must be set/cleared
  - Registers and fields may change, so don't want to hard-code
- Introducing the PSS register model
  - Break down into groups, integer registers, regs with fields
  - Specify field offsets. Note that this is specified per-type
- Creating a register model
- Setting up a register model
- Calling a register model
- Implementing the PSS tool 'back-end' API
  - Leverage existing UVM reg adapter
-> Use a function to group behavior?
--> Maybe use a component-level function?

## Programming a Memory Transfer
- Call init directly (put in a function?)
- Show using register API
- Show poll loop with 'yield'
- Show simple randomization

## A little bit of randomization
- basic data randomization
- Use a 'struct' to collect constraints
- Cover available constraints
- Use the inline procedural randomization, which should be familiar to SV users

## Revisiting the Basic Memory Transfer
- Recap on what we have
  - Function-driven test that makes local decisions
  - Hard-coded (or singularly-randomized) memory addresses
  - Hard-coded DMA channel
- What do we want next?
  - Multiple parallel operations
    - How do we ensure that unique channels are used?
    - How do we ensure that unique memory is used (and freed)?
  - Could continue down the "programming" path that we're on
  - But... PSS provides us modeling facilities that address several of these challenges
- Emphasize that need more control
-> What if we need to reach in how transfer size?
-> Can we get some other behavior that should be changable?
- Want our behaviors to be a bit more like objects than functions
--> Behold, the Activity and Action
-- We already encapsulate our behavior in an action, but it's really just 
-- Activities give us a way to relate multiple actions -- similar to the way
   exec blocks let us relate multiple procedural statements


## Intro to Declarative Programming with PSS
- Action/activity are top-level language feature
  - exec blocks, functions called by actions
- Compare/contrast SV/PSS approach to randomization
- 

## Declarative Memory
- Address spaces
- 

## Executors
- Motivation



introduction of the new concepts that PSS introduces and build-- top-down 
theory of components, actions, and flow objects, this introduction starts with