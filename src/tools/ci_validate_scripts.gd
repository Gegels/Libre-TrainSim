# Tool for CI: parse every .gd file under res:// without loading scenes/assets.
# Uses GDScript.reload() so missing meshes/audio do not false-fail the check.
# Run as: godot --path src -s res://tools/ci_validate_scripts.gd
extends SceneTree


func _init() -> void:
	call_deferred("_validate_all")


func _validate_all() -> void:
	var errors := []
	_scan_dir("res://", errors)
	if errors.size() == 0:
		quit(0)
	push_error("GDScript validation failed (%d file(s)):" % errors.size())
	for msg in errors:
		push_error("  " + str(msg))
	quit(1)


func _scan_dir(dir_path: String, errors: Array) -> void:
	var d := Directory.new()
	if d.open(dir_path) != OK:
		errors.append("Could not open directory: %s" % dir_path)
		return
	d.list_dir_begin(true, false)
	while true:
		var name := d.get_next()
		if name == "":
			break
		if name == "." or name == "..":
			continue
		var full := dir_path.plus_file(name)
		if d.current_is_dir():
			if name.begins_with("."):
				continue
			if name == ".import" or name == "build":
				continue
			_scan_dir(full, errors)
		elif name.ends_with(".gd"):
			_validate_gd_file(full, errors)
	d.list_dir_end()


func _validate_gd_file(resource_path: String, errors: Array) -> void:
	var f := File.new()
	if f.open(resource_path, File.READ) != OK:
		errors.append("Could not read: %s" % resource_path)
		return
	var source := f.get_as_text()
	f.close()
	var script := GDScript.new()
	script.resource_path = resource_path
	script.set_source_code(source)
	var err := script.reload()
	if err != OK:
		errors.append("%s (error %s)" % [resource_path, String(err)])
