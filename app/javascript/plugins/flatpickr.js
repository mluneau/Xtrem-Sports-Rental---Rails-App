import flatpickr from 'flatpickr'
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatPickr = () => {
  flatpickr("#range_start", {
    inline: true,
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initFlatPickr };
