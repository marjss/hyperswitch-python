use pyo3::prelude::*;

#[pyfunction]
fn hello(name: &str) -> String {
    format!("Hello, {name}!")
}

#[pyfunction]
fn version() -> String {
    env!("CARGO_PKG_VERSION").to_string()
}

#[pymodule]
fn _hyperswitch_python(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(hello, m)?)?;
    m.add_function(wrap_pyfunction!(version, m)?)?;
    Ok(())
}
