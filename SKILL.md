---
name: openapi2cli
description: Generate CLI tools from OpenAPI specs. Use when you need to interact with any API that has an OpenAPI/Swagger spec - generates a ready-to-use CLI with commands, options, and authentication. Built for AI agents who need quick API access without writing HTTP requests.
---

# OpenAPI to CLI

Generate CLI tools from OpenAPI 3.x specs. Point at any spec, get a working CLI.

## Installation

```bash
uvx openapi2cli generate spec.yaml --name myapi  # one-off
uv tool install openapi2cli                       # persistent
```

## Usage

### Generate a CLI

```bash
# From URL
openapi2cli generate https://petstore3.swagger.io/api/v3/openapi.json --name petstore

# From local file
openapi2cli generate ./api-spec.yaml --name myapi --output myapi_cli.py
```

### Use the generated CLI

```bash
# See available commands
./petstore_cli.py --help

# Commands are grouped by API tags
./petstore_cli.py pet find-by-status --status available
./petstore_cli.py store inventory

# Authentication via env vars
export PETSTORE_API_KEY=your-key
./petstore_cli.py pet get --pet-id 123

# JSON output for scripting
./petstore_cli.py pet list --output json | jq '.[0].name'
```

### Inspect a spec

```bash
openapi2cli inspect https://api.example.com/openapi.json
```

Shows endpoints, parameters, and auth schemes without generating code.

## Generated CLI Features

- Commands grouped by API tags
- Options for all parameters and request body fields
- Auth support: API keys, Bearer tokens, env vars
- Output formats: json, table, raw
- Base URL override for staging/dev environments

## Python API

```python
from openapi2cli import OpenAPIParser, CLIGenerator

# Parse spec
parser = OpenAPIParser()
spec = parser.parse("https://api.example.com/openapi.json")

# Generate CLI
generator = CLIGenerator()
cli = generator.generate(spec, name="example")
cli.save("example_cli.py")
```

## Links

- PyPI: https://pypi.org/project/openapi2cli/
- GitHub: https://github.com/Olafs-World/openapi2cli
