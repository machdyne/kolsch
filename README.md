# Kölsch Computer

Kölsch is an FPGA computer based on the GateMate A1.

This repo contains schematics, PCB layouts, pinouts, a 3D-printable case, example gateware and documentation.

Find more information on the [Kölsch product page](https://machdyne.com/product/kolsch-computer/).

## Programming Kölsch 

Kölsch can be programmed over USB-C or by copying gateware to a MicroSD card. The FPGA is configured by the onboard RP2040, which can load the configuration from onboard flash, a FAT-formatted MicroSD card or over the USB-JTAG bridge.

### JTAG

Program the FPGA configuration SRAM:

```
openFPGALoader -c dirtyJtag image.bit
```

## Examples

In order to build the examples, first edit rtl/config.mk and set the paths to the location of your toolchain. You can download the toolchain from [Cologne Chip](https://colognechip.com).

You can build each example with:

```
$ make && make impl
```

### 3.5mm TRRS Audio Jack

| Pin | Signal |
| --- | ------ |
| T | Left Audio |
| R1 | Right Audio |
| R2 | Composite Video |
| S | GND |

## Resources

 * [fpga-dac audio player](https://github.com/machdyne/fpga-dac)

## Board Revisions

| Revision | Notes |
| -------- | ----- |
| V2 | Initial production version |

## Funding

This project was partially funded through the NGI0 Entrust Fund, a fund established by NLnet with financial support from the European Commission's Next Generation Internet programme.

## License

This project is released under the [CERN-OHL-P](LICENSE.txt) license.

Note: You can use these designs for commercial purposes but we ask that instead of producing exact clones, that you either replace our trademarks and logos with your own or add your own next to ours.
