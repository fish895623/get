```bash
lcov --directory . --capture -o coverage.info --ignore-errors inconsistent
```

```bash
lcov --remove coverage.info "build" "/usr" -o coverage.info
```

```bash
genhtml -o coverage coverage.ino
```
