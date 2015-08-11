trait Huggable {
  fn wants_hug(&self) -> bool;
}

fn maybe_hug<T: Huggable>(huggable: T) -> String {
  if huggable.wants_hug() {
    return "HUG!".to_string();
  } else {
    return "Empathy!".to_string();
  }
}

struct Cutie {
  name: String,
  wants_hug: bool
}

impl Huggable for Cutie {
  fn wants_hug(&self) -> bool {
    return self.wants_hug;
  }
}

#[test]
fn test() {
  let bob = Cutie{ name: "Bob".to_string(), wants_hug: true };
  let jen = Cutie{ name: "Jen".to_string(), wants_hug: false };
  assert!(maybe_hug(bob) == "HUG!".to_string());
  assert!(maybe_hug(jen) == "Empathy!".to_string());
}
