Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33915A4A0C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfIAPkk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:40:40 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:18947 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIAPkk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:40:40 -0400
X-Greylist: delayed 313 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Sep 2019 11:40:37 EDT
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 272213F9BD;
        Sun,  1 Sep 2019 17:35:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MFqllP_KhE3t; Sun,  1 Sep 2019 17:35:21 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4CD6D3F90F;
        Sun,  1 Sep 2019 17:35:21 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:35:21 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 000/120] Linux for the PlayStation 2
Message-ID: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

This is the initial patch submission for the PlayStation 2. The series
implements support for USB devices and a frame buffer console, making
Linux usable with unmodified hardware having a working boot loader
installed on a memory card.

There are eight major parts:

1. The R5900 is the main processor that runs the kernel[1]. It implements
   the 64-bit MIPS III instruction set except LL, SC, LLD and SCD, with
   additional PREFETCH and conditional move instructions from MIPS IV as
   well as three-operand multiply and multiply-accumulate instructions.
   It has a set of R5900 specific 128-bit multimedia instructions (MMIs).

   The FPU implements single-precision floating-point operations but it
   is not entirely IEEE 754 compatible. The FPU is therefore emulated in
   software for normal ELF executables. The R5900 has several significant
   hardware bugs. Perhaps the most important bug affecting applications
   is the short loop bug that under certain conditions causes loops to
   execute only once or twice.

   R5900 specific handling of SYNC.P, SYNC.L, ERET, etc. are implemented.

2. Interrupts, a timer and minimal DMA support are implemented.

3. System commands (SCMDs) are implemented to identify the hardware model,
   read and set the real-time clock (RTC), and power off the machine.

4. Read-only memory (ROM) operations are implemented. These are used to
   identify the hardware. ROM operations are also used to resolve IOP
   libraries linked as firmware, as explained below.

6. The input/output processor (IOP) and its sub-system interface (SIF)
   are supported[2]. The IOP is a MIPS R3000A, or in later models a
   PowerPC 405GP emulating a MIPS R3000A, sometimes referred to as the
   sub processor. It runs a separate minikernel implemented in ROM. Most
   peripherals require, in whole or in part, handling by the IOP.

   Two IOP services are required to support USB devices: IOP memory
   allocation and IOP interrupt relay. The latter requires linking a
   custom IOP module, handled as firmware by the kernel, with library
   dependency resolution. Remote procedure calls (RPCs) are used to
   issue bidirectional commands over the SIF, via DMA.

7. The Graphics Synthesizer (GS) is the video hardware that displays the
   frame buffer console. The GS is highly configurable with a substantial
   set of hardware accelerated features. Its local memory is not directly
   accessible from the main bus. All drawing primitives are transmitted
   via DMA[3].

8. The frame buffer driver implements console support. The font is stored
   as textures in local GS memory and several hardware accelerated
   operations are implemented, for example XPAN, YPAN and YWRAP.

The o32 ABI is supported, but not yet n32 as it involves some additional
complications. I would very much like to add support for the 128-bit R5900
GPRs, for two primary reasons:

- The 128-bit multimedia instruction set is one of the defining features
  of the R5900. A respectable PlayStation 2 application ought to use them.

- The MMIs cannot be disabled by the kernel. MMIs will therefore appear
  to mostly work, with some occasional register corruption due to context
  switches, unless the kernel properly saves and restores the 128-bit
  registers.

This patch series has been tested with the PlayStation 2 models SCPH-30004,
SCPH-30004 R, SCPH-37000 L, SCPH-39004, SCPH-50004, SCPH-70004, SCPH-75004
and SCPH-77004.

Please consider it for inclusion.

Fredrik

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, https://wiki.qemu.org/File:C790.pdf

[2] "EE Overview", version 6.0, Sony Computer Entertainment Inc.

[3] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.

Fredrik Noring (120):
  MIPS: R5900: Initial support for the Emotion Engine in the PlayStation 2
  MIPS: R5900: Trap the RDHWR instruction as an SQ address exception
  MIPS: R5900: Sign-extend o32 system call registers
  MIPS: R5900: Reset bits 127..64 of GPRs in RESTORE_SOME
  MIPS: R5900: Reset the funnel shift amount (SA) register in RESTORE_SOME
  MIPS: R5900: Workaround for the short loop bug
  MIPS: R5900: Add the SYNC.P instruction
  MIPS: R5900: Add implicit SYNC.P to the UASM_i_M[FT]C0 macros
  MIPS: R5900: Add mandatory SYNC.P to all M[FT]C0 instructions
  MIPS: R5900: Workaround exception NOP execution bug (FLX05)
  MIPS: R5900: Avoid pipeline hazard with the TLBP instruction
  MIPS: R5900: Avoid pipeline hazards with the TLBW[IR] instructions
  MIPS: R5900: Avoid pipeline hazard with the TLBR instruction
  MIPS: R5900: Install final length of TLB refill handler rather than 256 bytes
  MIPS: R5900: Verify that the TLB refill handler does not overflow
  MIPS: R5900: The ERET instruction has issues with delay slot and CACHE
  MIPS: R5900: Define CACHE instruction operation field encodings
  MIPS: R5900: Workaround where MSB must be 0 for the instruction cache
  MIPS: R5900: Use SYNC.L for data cache and SYNC.P for instruction cache
  MIPS: R5900: Define CP0.Config register fields
  MIPS: R5900: Workaround for CACHE instruction near branch delay slot
  MIPS: R5900: Support 64-bit inq() and outq() macros in 32-bit kernels
  MIPS: R5900: Add MFSA and MTSA instructions for the special SA register
  MIPS: PS2: Define PlayStation 2 I/O port, ROM and RAM address spaces
  MIPS: PS2: Define interrupt controller, DMA and timer IRQs
  MIPS: PS2: Interrupt controller (INTC) IRQ support
  MIPS: PS2: DMAC: Define DMA controller registers
  MIPS: PS2: DMAC: Define tag structures
  MIPS: PS2: DMAC: IRQ support
  MIPS: PS2: Timer support
  MIPS: PS2: SCMD: System command support
  MIPS: PS2: SCMD: System power off command
  MIPS: PS2: SCMD: Read system machine name command
  MIPS: PS2: SCMD: Read system command for the real-time clock (RTC)
  MIPS: PS2: SCMD: Set system command for the real-time clock (RTC)
  MIPS: PS2: ROM: Iterate over the files in a given ROM directory
  MIPS: PS2: ROM: Find ROM files with a given name, if they exist
  MIPS: PS2: ROM: Read data for a given ROM file name
  MIPS: PS2: ROM: Read extended information for a given ROM file
  MIPS: PS2: ROM: Read and decode the ROMVER file
  MIPS: PS2: ROM: Resolve the name for the type in the ROMVER file
  MIPS: PS2: ROM: Resolve the name for the region in the ROMVER file
  MIPS: PS2: ROM: Permit /dev/mem to access read-only memory
  MIPS: PS2: ROM: Sysfs module to inspect ROM files
  MIPS: PS2: ROM: Provide extended file information via sysfs
  MIPS: PS2: Identify the machine by model name
  MIPS: PS2: Let the system type be Sony PlayStation 2
  MIPS: Define and use cpu_relax_forever() for various halting loops
  MIPS: PS2: Power off support
  MIPS: PS2: Real-time clock (RTC) driver
  MIPS: PS2: IOP: I/O processor DMA register PCR2 set and clear
  MIPS: PS2: SIF: Sub-system interface reset of the I/O processor (IOP)
  MIPS: PS2: IOP: Define error numbers, descriptions and errno mapping
  MIPS: PS2: SIF: SIF register write command support
  MIPS: PS2: SIF: Respond to remote procedure call (RPC) bind command
  MIPS: PS2: SIF: Respond to RPC bind end command
  MIPS: PS2: SIF: Reset the SIF0 (sub-to-main) DMA controller
  MIPS: PS2: SIF: Handle SIF0 (sub-to-main) RPCs via interrupts
  MIPS: PS2: SIF: Enable the IOP to issue SIF commands
  MIPS: PS2: SIF: Enable the IOP to issue SIF RPCs
  MIPS: PS2: SIF: sif_rpc_bind() to request an RPC server connection
  MIPS: PS2: SIF: sif_rpc_unbind() to release an RPC server connection
  MIPS: PS2: SIF: sif_rpc() to issue a remote procedure call
  MIPS: PS2: IOP: Permit /dev/mem to access IOP memory
  MIPS: PS2: IOP: I/O processor memory support
  FIXME: Export _dma_cache_{wback,wback_inv,inv}
  MIPS: PS2: IOP: Module linking support
  MIPS: PS2: IOP: Verify that modules are IRX objects
  MIPS: PS2: IOP: Module version compatibility verification
  MIPS: PS2: IOP: Avoid linking already linked library modules
  MIPS: PS2: IOP: Resolve module dependencies
  MIPS: PS2: IOP: SIF printk command support
  MIPS: PS2: IOP: Heap memory allocate and free
  MIPS: PS2: SIF: Request RPC IRQ command
  MIPS: PS2: IOP: IRQ support
  MIPS: PS2: GS: Define privileged Graphics Synthesizer registers
  MIPS: PS2: GS: Write privileged registers
  MIPS: PS2: GS: Read privileged registers
  MIPS: PS2: GS: Define privileged register structures
  MIPS: PS2: GS: Define gs_xorq_imr()
  MIPS: PS2: GS: Privileged register write macros with named fields
  MIPS: PS2: GS: IRQ support
  MIPS: PS2: GS: Define Graphics Synthesizer primitive structures
  MIPS: PS2: GIF: Define Graphics Synthesizer interface structures
  MIPS: PS2: GIF: Graphics Synthesizer interface support
  MIPS: PS2: GS: Graphics Synthesizer device init and video clock
  MIPS: PS2: GS: Compute block count and indices
  MIPS: PS2: GS: Primitive and texel coordinate transformations
  MIPS: PS2: GS: Approximate video region with ROM region
  macro: Extend COUNT_ARGS() from 12 to 32 arguments
  MIPS: PS2: GS: Show privileged registers with sysfs
  MIPS: PS2: GS: Store privileged registers with sysfs
  fbdev: Add fb_warn_once() variant that only prints a warning once
  MIPS: PS2: FB: Frame buffer driver for the PlayStation 2
  MIPS: PS2: FB: fb_set_par() standard-definition television support
  MIPS: PS2: FB: fb_set_par() high-definition television support
  MIPS: PS2: FB: fb_set_par() VESA computer display mode support
  MIPS: PS2: FB: Preconfigure standard PAL, NTSC and VESA display modes
  MIPS: PS2: FB: Reset the Graphics Synthesizer drawing environment
  MIPS: PS2: FB: Clear the display buffer when changing video modes
  MIPS: PS2: FB: fb_setcolreg() 256 colour pseudo palette support
  MIPS: PS2: FB: fb_settile() with font stored as palette indexed textures
  MIPS: PS2: FB: Hardware accelerated fb_tilecopy() support
  MIPS: PS2: FB: Hardware accelerated fb_tilefill() support
  MIPS: PS2: FB: Simplified fb_tileblit() support
  MIPS: PS2: FB: fb_tilecursor() placeholder
  MIPS: PS2: FB: Hardware accelerated fb_pan_display() support
  MIPS: PS2: FB: fb_blank() display power management signaling (DPMS)
  MIPS: PS2: FB: Disable GIF DMA completion interrupts
  MIPS: PS2: FB: PAL and NTSC grayscale support
  MIPS: PS2: FB: Analogue display mode adjustment module parameter
  USB: OHCI: Support for the PlayStation 2
  USB: OHCI: OHCI_INTR_MIE workaround for freeze on the PlayStation 2
  MIPS: PS2: Workaround for unexpected uLaunchELF CP0 Status user mode
  MIPS: PS2: Define initial PlayStation 2 devices
  MIPS: PS2: Define workarounds related to the PlayStation 2
  MIPS: PS2: Define R5900 feature overrides
  MIPS: PS2: Define the PlayStation 2 platform
  MIPS: PS2: Initial support for the Sony PlayStation 2
  MIPS: Fix name of BOOT_MEM_ROM_DATA

 arch/mips/Kbuild.platforms                    |    1 +
 arch/mips/Kconfig                             |   35 +-
 arch/mips/Makefile                            |    1 +
 arch/mips/alchemy/board-gpr.c                 |    7 +-
 arch/mips/alchemy/board-mtx1.c                |    7 +-
 arch/mips/alchemy/board-xxs1500.c             |    7 +-
 arch/mips/alchemy/devboards/platform.c        |    4 +-
 arch/mips/ar7/setup.c                         |    4 +-
 arch/mips/ath79/setup.c                       |    8 +-
 arch/mips/bcm47xx/setup.c                     |    9 +-
 arch/mips/bcm63xx/setup.c                     |   12 +-
 arch/mips/boot/compressed/decompress.c        |    4 +-
 arch/mips/boot/compressed/head.S              |   16 +-
 arch/mips/cavium-octeon/smp.c                 |    4 +-
 arch/mips/cobalt/reset.c                      |    5 +-
 arch/mips/emma/markeins/setup.c               |    5 +-
 arch/mips/fw/arc/init.c                       |    4 +-
 arch/mips/include/asm/asmmacro.h              |   53 +
 arch/mips/include/asm/cacheops.h              |   17 +
 arch/mips/include/asm/cpu-type.h              |    4 +
 arch/mips/include/asm/cpu.h                   |    3 +-
 arch/mips/include/asm/io.h                    |   60 +-
 arch/mips/include/asm/irqflags.h              |   15 +
 .../asm/mach-ps2/cpu-feature-overrides.h      |   35 +
 arch/mips/include/asm/mach-ps2/dmac.h         |  254 ++
 arch/mips/include/asm/mach-ps2/gif.h          |   77 +
 arch/mips/include/asm/mach-ps2/gs-registers.h |  646 +++++
 arch/mips/include/asm/mach-ps2/gs.h           |   81 +
 arch/mips/include/asm/mach-ps2/iop-error.h    |   76 +
 arch/mips/include/asm/mach-ps2/iop-heap.h     |   19 +
 arch/mips/include/asm/mach-ps2/iop-memory.h   |   21 +
 arch/mips/include/asm/mach-ps2/iop-module.h   |   13 +
 .../mips/include/asm/mach-ps2/iop-registers.h |   19 +
 arch/mips/include/asm/mach-ps2/iop.h          |   21 +
 arch/mips/include/asm/mach-ps2/irq.h          |  130 +
 arch/mips/include/asm/mach-ps2/rom.h          |  171 ++
 arch/mips/include/asm/mach-ps2/scmd.h         |   56 +
 arch/mips/include/asm/mach-ps2/sif.h          |   94 +
 arch/mips/include/asm/mach-ps2/war.h          |   24 +
 arch/mips/include/asm/mipsregs.h              |  103 +
 arch/mips/include/asm/module.h                |    2 +
 arch/mips/include/asm/processor.h             |    6 +
 arch/mips/include/asm/r4kcache.h              |  244 +-
 arch/mips/include/asm/stackframe.h            |  108 +
 arch/mips/include/asm/string.h                |    3 +
 arch/mips/include/asm/traps.h                 |    2 +
 arch/mips/include/asm/uasm.h                  |   23 +
 arch/mips/include/uapi/asm/gif.h              |  164 ++
 arch/mips/include/uapi/asm/gs.h               |  723 +++++
 arch/mips/jz4740/reset.c                      |    9 +-
 arch/mips/kernel/cpu-probe.c                  |    8 +
 arch/mips/kernel/genex.S                      |   65 +
 arch/mips/kernel/head.S                       |    9 +
 arch/mips/kernel/r4k_switch.S                 |    9 +
 arch/mips/kernel/scall32-o32.S                |   12 +
 arch/mips/kernel/setup.c                      |    6 +-
 arch/mips/kernel/traps.c                      |   19 +-
 arch/mips/kernel/unaligned.c                  |   36 +-
 arch/mips/lib/delay.c                         |    7 +-
 arch/mips/lib/memset.S                        |    2 +
 arch/mips/loongson64/common/reset.c           |   16 +-
 arch/mips/mm/Makefile                         |    1 +
 arch/mips/mm/c-r4k.c                          |   27 +-
 arch/mips/mm/cache.c                          |    4 +
 arch/mips/mm/cerr-sb1.c                       |    4 +-
 arch/mips/mm/cex-gen.S                        |    6 +
 arch/mips/mm/tlbex-fault.S                    |    3 +
 arch/mips/mm/tlbex.c                          |   94 +-
 arch/mips/mm/uasm-mips.c                      |    1 +
 arch/mips/mm/uasm.c                           |    5 +-
 arch/mips/pic32/common/reset.c                |    9 +-
 arch/mips/pnx833x/common/reset.c              |    5 +-
 arch/mips/ps2/Kconfig                         |   16 +
 arch/mips/ps2/Makefile                        |   12 +
 arch/mips/ps2/Platform                        |    7 +
 arch/mips/ps2/devices.c                       |   98 +
 arch/mips/ps2/dmac-irq.c                      |  102 +
 arch/mips/ps2/identify.c                      |   86 +
 arch/mips/ps2/intc-irq.c                      |  118 +
 arch/mips/ps2/irq.c                           |   38 +
 arch/mips/ps2/memory.c                        |   45 +
 arch/mips/ps2/prom.c                          |   18 +
 arch/mips/ps2/reboot.c                        |   29 +
 arch/mips/ps2/rom-sysfs.c                     |  392 +++
 arch/mips/ps2/rom.c                           |  702 +++++
 arch/mips/ps2/scmd.c                          |  379 +++
 arch/mips/ps2/time.c                          |  153 ++
 arch/mips/sgi-ip22/ip22-reset.c               |    3 +-
 arch/mips/sgi-ip27/ip27-berr.c                |    4 +-
 arch/mips/sgi-ip27/ip27-reset.c               |   13 +-
 arch/mips/sgi-ip32/ip32-berr.c                |    4 +-
 arch/mips/sgi-ip32/ip32-irq.c                 |    3 +-
 arch/mips/sibyte/common/cfe.c                 |    3 +-
 arch/mips/txx9/rbtx4939/setup.c               |    4 +-
 arch/mips/vr41xx/common/pmu.c                 |    2 +-
 drivers/Makefile                              |    1 +
 drivers/ps2/Makefile                          |   12 +
 drivers/ps2/gif.c                             |  106 +
 drivers/ps2/gs-irq.c                          |   93 +
 drivers/ps2/gs-registers.c                    |  189 ++
 drivers/ps2/gs-sysfs.c                        |  592 +++++
 drivers/ps2/gs.c                              |  319 +++
 drivers/ps2/iop-heap.c                        |   90 +
 drivers/ps2/iop-irq.c                         |  186 ++
 drivers/ps2/iop-memory.c                      |   56 +
 drivers/ps2/iop-module.c                      |  954 +++++++
 drivers/ps2/iop-registers.c                   |   39 +
 drivers/ps2/sif.c                             |  888 +++++++
 drivers/rtc/Kconfig                           |   10 +
 drivers/rtc/Makefile                          |    1 +
 drivers/rtc/rtc-ps2.c                         |   74 +
 drivers/usb/host/Kconfig                      |    8 +
 drivers/usb/host/Makefile                     |    1 +
 drivers/usb/host/ohci-ps2.c                   |  264 ++
 drivers/video/fbdev/Kconfig                   |   12 +
 drivers/video/fbdev/Makefile                  |    1 +
 drivers/video/fbdev/ps2fb.c                   | 2362 +++++++++++++++++
 include/linux/console_struct.h                |    2 +
 include/linux/fb.h                            |    2 +
 include/linux/kernel.h                        |   12 +-
 include/uapi/linux/fb.h                       |    1 +
 121 files changed, 12077 insertions(+), 186 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-ps2/cpu-feature-overrides.h
 create mode 100644 arch/mips/include/asm/mach-ps2/dmac.h
 create mode 100644 arch/mips/include/asm/mach-ps2/gif.h
 create mode 100644 arch/mips/include/asm/mach-ps2/gs-registers.h
 create mode 100644 arch/mips/include/asm/mach-ps2/gs.h
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-error.h
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-heap.h
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-memory.h
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-module.h
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-registers.h
 create mode 100644 arch/mips/include/asm/mach-ps2/iop.h
 create mode 100644 arch/mips/include/asm/mach-ps2/irq.h
 create mode 100644 arch/mips/include/asm/mach-ps2/rom.h
 create mode 100644 arch/mips/include/asm/mach-ps2/scmd.h
 create mode 100644 arch/mips/include/asm/mach-ps2/sif.h
 create mode 100644 arch/mips/include/asm/mach-ps2/war.h
 create mode 100644 arch/mips/include/uapi/asm/gif.h
 create mode 100644 arch/mips/include/uapi/asm/gs.h
 create mode 100644 arch/mips/ps2/Kconfig
 create mode 100644 arch/mips/ps2/Makefile
 create mode 100644 arch/mips/ps2/Platform
 create mode 100644 arch/mips/ps2/devices.c
 create mode 100644 arch/mips/ps2/dmac-irq.c
 create mode 100644 arch/mips/ps2/identify.c
 create mode 100644 arch/mips/ps2/intc-irq.c
 create mode 100644 arch/mips/ps2/irq.c
 create mode 100644 arch/mips/ps2/memory.c
 create mode 100644 arch/mips/ps2/prom.c
 create mode 100644 arch/mips/ps2/reboot.c
 create mode 100644 arch/mips/ps2/rom-sysfs.c
 create mode 100644 arch/mips/ps2/rom.c
 create mode 100644 arch/mips/ps2/scmd.c
 create mode 100644 arch/mips/ps2/time.c
 create mode 100644 drivers/ps2/Makefile
 create mode 100644 drivers/ps2/gif.c
 create mode 100644 drivers/ps2/gs-irq.c
 create mode 100644 drivers/ps2/gs-registers.c
 create mode 100644 drivers/ps2/gs-sysfs.c
 create mode 100644 drivers/ps2/gs.c
 create mode 100644 drivers/ps2/iop-heap.c
 create mode 100644 drivers/ps2/iop-irq.c
 create mode 100644 drivers/ps2/iop-memory.c
 create mode 100644 drivers/ps2/iop-module.c
 create mode 100644 drivers/ps2/iop-registers.c
 create mode 100644 drivers/ps2/sif.c
 create mode 100644 drivers/rtc/rtc-ps2.c
 create mode 100644 drivers/usb/host/ohci-ps2.c
 create mode 100644 drivers/video/fbdev/ps2fb.c

-- 
2.21.0

