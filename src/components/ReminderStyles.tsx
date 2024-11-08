import { useState, useEffect } from "react";
import { load } from "@tauri-apps/plugin-store";

const ReminderStyles = () => {
  const [backgroundStyle, setBackgroundStyle] =
    useState<string>("particleBackground");

  // Load the stored background style on component mount
  useEffect(() => {
    const fetchBackgroundStyle = async () => {
      const store = await load("ReminderThemeStyle.json", { autoSave: true });
      const savedStyle = await store.get<string>("backgroundStyle");
      if (savedStyle) {
        setBackgroundStyle(savedStyle);
      }
    };
    fetchBackgroundStyle();
  }, []);

  // Save the selected style automatically
  const handleSaveTheme = async (selectedStyle: string) => {
    const store = await load("ReminderThemeStyle.json", { autoSave: true });
    await store.set("backgroundStyle", selectedStyle);
    await store.save();
    setBackgroundStyle(selectedStyle);
    console.log("Background style saved:", selectedStyle);
  };

  // Define the background style options
  const styles = [
    { value: "default", label: "Default" },
    { value: "polygonAnimation", label: "Polygon Animation" },
    { value: "canvasShapes", label: "Canvas Shapes" },
    { value: "particleBackground", label: "Particle Background" },
  ];

  return (
    <div className="grid grid-cols-3 gap-4">
      {styles.map((style) => (
        <div
          key={style.value}
          onClick={() => handleSaveTheme(style.value)}
          className={`cursor-pointer border-2 rounded-md p-4 text-center ${
            backgroundStyle === style.value
              ? "border-blue-500"
              : "border-gray-300"
          }`}
        >
          {style.label}
        </div>
      ))}
    </div>
  );
};

export default ReminderStyles;
