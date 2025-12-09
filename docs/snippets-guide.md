# VSCode Snippets Reference

Complete guide to all configured code snippets. Type the prefix and press Tab to expand.

## JavaScript Snippets

### Console & Debugging

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `cl` | `console.log()` | Quick console log |
| `clv` | `console.log('var:', var)` | Log variable with name |

**Examples**:
```javascript
cl → console.log()
clv → console.log('user:', user)
```

### Functions

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `fn` | `function name() {}` | Regular function |
| `af` | `const name = () => {}` | Arrow function |
| `afn` | `async function name() {}` | Async function |
| `aaf` | `const name = async () => {}` | Async arrow function |

**Examples**:
```javascript
af → const myFunc = (params) => {}
aaf → const fetchData = async (id) => {}
```

### Imports & Exports

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `imp` | `import module from 'path'` | Import default |
| `imd` | `import { exports } from 'path'` | Import destructured |
| `exp` | `export default name` | Export default |
| `exn` | `export { name }` | Named export |

**Examples**:
```javascript
imp → import React from 'react'
imd → import { useState, useEffect } from 'react'
```

### Control Flow

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `try` | Try-catch block | Error handling |
| `for` | `for (let i = 0; i < length; i++)` | For loop |
| `forof` | `for (const item of array)` | For...of loop |
| `ter` | `condition ? true : false` | Ternary operator |

**Examples**:
```javascript
try → try { } catch (error) { }
forof → for (const item of items) { }
```

### Arrays

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `foreach` | `array.forEach(item => {})` | ForEach loop |
| `map` | `array.map(item => )` | Map array |
| `filter` | `array.filter(item => )` | Filter array |
| `reduce` | `array.reduce((acc, item) => , initial)` | Reduce array |
| `find` | `array.find(item => )` | Find item |
| `some` | `array.some(item => )` | Some condition |
| `every` | `array.every(item => )` | Every condition |
| `sort` | `array.sort((a, b) => a - b)` | Sort array |

**Examples**:
```javascript
map → users.map(user => user.name)
filter → numbers.filter(n => n > 10)
```

### Objects

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `dob` | `const { props } = object` | Object destructuring |
| `dar` | `const [items] = array` | Array destructuring |
| `spr` | `{ ...object }` | Spread object |
| `om` | `method() {}` | Object method |
| `ok` | `Object.keys(object)` | Get object keys |
| `ov` | `Object.values(object)` | Get object values |
| `oe` | `Object.entries(object)` | Get object entries |

**Examples**:
```javascript
dob → const { name, age } = user
spr → const newUser = { ...user, active: true }
```

### Async & Promises

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `prom` | `new Promise((resolve, reject) => {})` | Create promise |
| `aw` | `await promise` | Await expression |
| `fetch` | Basic fetch call | Fetch API |
| `fetchpost` | POST fetch request | POST with fetch |
| `fetcht` | Fetch with try-catch | Fetch with error handling |

**Examples**:
```javascript
aw → await getData()
fetcht → try { const res = await fetch(url) ... }
```

### Utilities

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `st` | `setTimeout(() => {}, 1000)` | Set timeout |
| `si` | `setInterval(() => {}, 1000)` | Set interval |
| `oc` | `object?.property` | Optional chaining |
| `nc` | `value ?? default` | Nullish coalescing |
| `tl` | `` `${expression}` `` | Template literal |
| `jp` | `JSON.parse(string)` | Parse JSON |
| `js` | `JSON.stringify(object)` | Stringify JSON |
| `lsg` | `localStorage.getItem('key')` | Get from localStorage |
| `lss` | `localStorage.setItem('key', value)` | Set in localStorage |
| `iife` | `(async () => {})()` | Async IIFE |

## TypeScript Snippets

### Types & Interfaces

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `int` | `interface Name {}` | Interface definition |
| `typ` | `type Name = type` | Type alias |
| `enum` | `enum Name {}` | Enum definition |
| `impt` | `import type { Type }` | Import type |
| `expt` | `export type { Type }` | Export type |
| `asc` | `as const` | As const assertion |
| `sat` | `satisfies Type` | Satisfies operator |

**Examples**:
```typescript
int → interface User { name: string }
typ → type ID = string | number
```

### Functions

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `tfn` | `function name(param: type): ReturnType {}` | Typed function |
| `taf` | `const name = (param: type): ReturnType => {}` | Typed arrow function |
| `tafn` | `async function name(): Promise<Type> {}` | Async typed function |
| `gfn` | `function name<T>(param: T) {}` | Generic function |

**Examples**:
```typescript
taf → const add = (a: number, b: number): number => a + b
gfn → function identity<T>(value: T): T { return value }
```

### Classes

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `cls` | Basic class | TypeScript class |
| `clsp` | Class with properties | Class with typed properties |

**Examples**:
```typescript
cls → class User { constructor() {} }
clsp → class User { private name: string; constructor(name: string) {} }
```

## React (JavaScript) Snippets

### Components

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `rfc` | `export function Component() {}` | Functional component |
| `rfcp` | Component with props | Component with props destructured |
| `rfcc` | Component with children | Component accepting children |

**Examples**:
```jsx
rfc → export function Button() { return <div></div> }
rfcc → export function Layout({ children }) { return <div>{children}</div> }
```

### Hooks

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `us` | `const [state, setState] = useState()` | useState hook |
| `ue` | `useEffect(() => {}, [])` | useEffect hook |
| `uec` | useEffect with cleanup | useEffect with return |
| `ur` | `const ref = useRef(null)` | useRef hook |
| `ucb` | `const callback = useCallback(() => {}, [])` | useCallback hook |
| `um` | `const memoized = useMemo(() => {}, [])` | useMemo hook |
| `uc` | `const context = useContext(Context)` | useContext hook |
| `ured` | `const [state, dispatch] = useReducer()` | useReducer hook |
| `uch` | `export function useName() {}` | Custom hook |

**Examples**:
```jsx
us → const [count, setCount] = useState(0)
ue → useEffect(() => { }, [])
uch → export function useLocalStorage() { }
```

### Event Handlers

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `eh` | `const handleClick = (e) => {}` | Event handler |
| `aeh` | Async event handler | Async event with try-catch |

**Examples**:
```jsx
eh → const handleSubmit = (e) => {}
aeh → const handleSubmit = async (e) => { e.preventDefault(); try {} catch {} }
```

### Context

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `rctx` | Complete context setup | Context, Provider, and custom hook |

**Examples**:
```jsx
rctx → Creates ThemeContext, ThemeProvider, and useTheme hook
```

### Imports

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `imr` | `import React from 'react'` | Import React |
| `imus` | `import { useState } from 'react'` | Import useState |
| `imue` | `import { useEffect } from 'react'` | Import useEffect |

## React (TypeScript) Snippets

### Components

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `rfc` | Typed functional component | Component with Props interface |
| `rfcc` | Component with children | Component with ReactNode children |

**Examples**:
```tsx
rfc →
interface ComponentProps { prop: type }
export function Component({ prop }: ComponentProps) {}
```

### Hooks

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `us` | `const [state, setState] = useState<type>()` | Typed useState |
| `ur` | `const ref = useRef<HTMLDivElement>(null)` | Typed useRef |

**Examples**:
```tsx
us → const [user, setUser] = useState<User | null>(null)
ur → const inputRef = useRef<HTMLInputElement>(null)
```

### Next.js

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `npage` | `export default function Page() {}` | Next.js page |
| `napi` | API route handler | Next.js 13+ API route |
| `nsa` | `'use server'` function | Server action |
| `nac` | `async function Component()` | Async server component |
| `nmeta` | Metadata export | Next.js metadata |

**Examples**:
```tsx
npage → export default function Home() { return <div></div> }
napi → export async function GET(req: NextRequest) {}
nsa → 'use server'; export async function submitForm(data: FormData) {}
```

### Props & Events

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `props` | `interface ComponentProps {}` | Props interface |
| `eh` | Typed event handler | Event handler with React event type |

**Examples**:
```tsx
props → interface ButtonProps { onClick: () => void }
eh → const handleClick = (e: React.MouseEvent<HTMLButtonElement>) => {}
```

## Python Snippets

### Functions

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `def` | `def function_name():` | Function definition |
| `adef` | `async def function_name():` | Async function |
| `deft` | Typed function | Function with type hints |
| `main` | `if __name__ == '__main__':` | Main guard |

**Examples**:
```python
def → def calculate(): pass
deft → def add(a: int, b: int) -> int: pass
```

### Classes

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `cls` | Basic class | Class with __init__ |
| `dcls` | `@dataclass` | Dataclass |

**Examples**:
```python
cls → class User: def __init__(self): pass
dcls → @dataclass; class User: name: str
```

### Control Flow

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `try` | Try-except block | Error handling |
| `tryf` | Try-except-finally | With finally block |
| `with` | `with expr as var:` | Context manager |
| `awith` | `async with expr as var:` | Async context manager |
| `for` | `for item in iterable:` | For loop |
| `fore` | `for i, item in enumerate():` | For with enumerate |
| `while` | `while condition:` | While loop |

**Examples**:
```python
try → try: pass; except Exception as e: pass
for → for item in items: pass
```

### Comprehensions

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `lc` | `[expression for item in iterable]` | List comprehension |
| `dc` | `{key: value for item in iterable}` | Dict comprehension |
| `lam` | `lambda params: expression` | Lambda function |

**Examples**:
```python
lc → [x * 2 for x in numbers]
dc → {k: v for k, v in pairs}
```

### Utilities

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `p` | `print(value)` | Print |
| `pf` | `print(f'text: {var}')` | Print f-string |
| `imp` | `import module` | Import |
| `from` | `from module import name` | From import |

**Examples**:
```python
pf → print(f'User: {user.name}')
from → from datetime import datetime
```

### FastAPI

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `fapi` | `@app.get('/endpoint')` | FastAPI route |
| `fapir` | Route with response model | Route with response type |
| `pyd` | `class Model(BaseModel):` | Pydantic model |
| `pydv` | Pydantic with validator | Model with field validator |

**Examples**:
```python
fapi → @app.get('/users'); async def get_users(): pass
pyd → class User(BaseModel): name: str
```

### Decorators

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `prop` | `@property` decorator | Property getter/setter |
| `sm` | `@staticmethod` | Static method |
| `cm` | `@classmethod` | Class method |
| `doc` | Google-style docstring | Function documentation |

**Examples**:
```python
prop → @property; def name(self): return self._name
doc → """Description; Args: param: desc; Returns: desc"""
```

### Type Hints

| Prefix | Expands To | Description |
|--------|-----------|-------------|
| `ta` | `TypeAlias = type` | Type alias |

## Tips for Using Snippets

### Tab Stops
- After expanding a snippet, press `Tab` to jump between placeholders
- Press `Shift+Tab` to go back
- Press `Esc` to exit snippet mode

### Placeholders
- `$1`, `$2`, etc. are tab stops
- `$0` is the final cursor position
- `${1:default}` shows default text

### Custom Snippets
Add your own snippets in VSCode:
1. `Cmd+Shift+P` → "Configure User Snippets"
2. Choose language
3. Add snippet in JSON format

### Example Custom Snippet
```json
{
  "React Component": {
    "prefix": "mycomp",
    "body": [
      "export function ${1:Component}() {",
      "  return <div>${2:content}</div>",
      "}"
    ],
    "description": "My custom component"
  }
}
```

---

**Pro Tip**: Type a few letters of the snippet prefix and press `Ctrl+Space` to see matching snippets!
