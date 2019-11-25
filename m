Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B98D10945C
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 20:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfKYTpk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 14:45:40 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35413 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfKYTpk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 14:45:40 -0500
Received: by mail-pf1-f196.google.com with SMTP id q13so7874192pff.2;
        Mon, 25 Nov 2019 11:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=M7YEJQQCWWOF/6Qk+IKCL3o+e6ZCa/CzOFISlOJj9x4=;
        b=KRxpy9tmBuz/Y6E5ZcTPWUbzunoiYSK4TBs2ATaMrO15lNobPFEeeYkqBYk0QZHX7A
         0AdWKFQ1uApD/fonemiGgADosF8C1aYF6a2GCnNymH7O7RETHOPTamvwMVB2XL5gBZNx
         UPor8vONkq/YEDlqE4eKzip0CUincUBuVNYG+bk6ERcHCVGsTha07EX4k1wmQ7rGf979
         HD7YoOMbZYPlbgM3y65vYzIKeDAaTI+k0yITE9L6QsSWFqEwvTH0xEGlhZwVP4nje1Kj
         tIsvNG53vkhLMal/peaamiYQcVz1iZiSBwAdqMulGTJdI5rDv/ZXN+rY3mGcRVk+3LNx
         R7Tg==
X-Gm-Message-State: APjAAAVWjfjWfSOfY7lNXkkrI1uZam8i/8f6FrEGotr6TEZIGmGOqi9n
        LNE7wFpGOB3vplIOqR/hT40=
X-Google-Smtp-Source: APXvYqxMB8lD3PmfOSQ1XLqNCfSPqBskn/cay4AfsP3Xib2x1ASRh/3D027mO0WKIokUcNZdy+qBDQ==
X-Received: by 2002:a65:590f:: with SMTP id f15mr33726653pgu.381.1574711137981;
        Mon, 25 Nov 2019 11:45:37 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id w138sm9852820pfc.68.2019.11.25.11.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 11:45:36 -0800 (PST)
Date:   Mon, 25 Nov 2019 11:45:35 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [GIT PULL] MIPS changes for 5.5
Message-ID: <20191125194535.nh6762uusyhz7jtn@pburton-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wzjxgo2nx2snpkds"
Content-Disposition: inline
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--wzjxgo2nx2snpkds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Here are the main MIPS changes for 5.5; please pull.

There is one conflict when merging to current master, in the
per_hub_init() function in arch/mips/sgi-ip27/ip27-init.c. The correct
resolution is as follows:

diff --cc arch/mips/sgi-ip27/ip27-init.c
index 79a52c472782,8fd3505e2b9c..f597e1ee2df7
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@@ -67,16 -62,25 +62,16 @@@ static void per_hub_init(nasid_t nasid
        REMOTE_HUB_S(nasid, IIO_ICTP, 0x800);
        REMOTE_HUB_S(nasid, IIO_ICTO, 0xff);
 =20
-       hub_rtc_init(cnode);
+       hub_rtc_init(nasid);
 =20
 -#ifdef CONFIG_REPLICATE_EXHANDLERS
 -      /*
 -       * If this is not a headless node initialization,
 -       * copy over the caliased exception handlers.
 -       */
 -      if (get_nasid() =3D=3D nasid) {
 -              extern char except_vec2_generic, except_vec3_generic;
 -              extern void build_tlb_refill_handler(void);
 -
 -              memcpy((void *)(CKSEG0 + 0x100), &except_vec2_generic, 0x80=
);
 -              memcpy((void *)(CKSEG0 + 0x180), &except_vec3_generic, 0x80=
);
 -              build_tlb_refill_handler();
 -              memcpy((void *)(CKSEG0 + 0x100), (void *) CKSEG0, 0x80);
 -              memcpy((void *)(CKSEG0 + 0x180), &except_vec3_generic, 0x10=
0);
 +      if (nasid) {
 +              /* copy exception handlers from first node to current node =
*/
 +              memcpy((void *)NODE_OFFSET_TO_K0(nasid, 0),
 +                     (void *)CKSEG0, 0x200);
                __flush_cache_all();
 +              /* switch to node local exception handlers */
 +              REMOTE_HUB_S(nasid, PI_CALIAS_SIZE, PI_CALIAS_SIZE_8K);
        }
 -#endif
  }
 =20
  void per_cpu_init(void)

Thanks & happy thanksgiving!

Paul

The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.5

for you to fetch changes up to a8d0f11ee50ddbd9f243c7a8b1a393a4f23ba093:

  MIPS: SGI-IP27: Enable ethernet phy on second Origin 200 module (2019-11-=
23 14:20:30 -0800)

----------------------------------------------------------------
The main MIPS changes for 5.5:

- Atomics-related code sees some rework & cleanup, most notably allowing
  Loongson LL/SC errata workarounds to be more bulletproof & their
  correctness to be checked at build time.

- Command line setup code is simplified somewhat, resolving various
  corner cases.

- MIPS kernels can now be built with kcov code coverage support.

- We can now build with CONFIG_FORTIFY_SOURCE=3Dy.

- Miscellaneous cleanups.

And some platform specific changes:

- We now disable some broken TLB functionality on certain Ingenic
  systems, and JZ4780 systems gain some devicetree nodes to support
  more devices.

- Loongson support sees a number of cleanups, and we gain initial
  support for Loongson 3A R4 systems.

- We gain support for MediaTek MT7688-based GARDENA Smart Gateway
  systems.

- SGI IP27 (Origin 2*) see a number of fixes, cleanups &
  simplifications.

- SGI IP30 (Octane) systems are now supported.

----------------------------------------------------------------
Alexandre GRIVEAUX (4):
      MIPS: JZ4780: DTS: Add I2C nodes
      MIPS: CI20: DTS: Add I2C nodes
      MIPS: CI20: DTS: Add IW8103 Wifi + bluetooth
      MIPS: CI20: DTS: Add Leds

Alexey Khoroshilov (1):
      MIPS: allow building with kcov coverage

Aurabindo Jayamohanan (1):
      mips: check for dsp presence only once before save/restore

Dmitry Korotin (1):
      mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE

Huacai Chen (5):
      MIPS: Loongson: Add CFUCFG&CSR support
      MIPS: Loongson: Add Loongson-3A R4 basic support
      MIPS: Loongson-3: Add CSR IPI support
      MIPS: Loongson: Rename LOONGSON1 to LOONGSON32
      MIPS: Loongson: Unify LOONGSON3/LOONGSON64 Kconfig usage

Jiaxun Yang (10):
      MIPS: Loongson64: Rename CPU TYPES
      MIPS: Fork loongson2ef from loongson64
      MIPS: Loongson2ef: clean up loongson64 related code
      MIPS: Loongson64: Cleanup unused code
      MIPS: Loongson64: Move files to the top-level directory
      MIPS: Drop pmon.h
      MIPS: Loongson{2ef, 32, 64} convert to generic fw cmdline
      MIPS: Drop CPU_SUPPORTS_UNCACHED_ACCELERATED
      MIPS: Loongson2ef: Convert to early_printk_8250
      MIPS: Loongson64: Drop setup_pcimap

Jonas Gorski (1):
      MIPS: bmips: mark exception vectors as char arrays

Mike Rapoport (4):
      mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
      mips: fix build when "48 bits virtual memory" is enabled
      mips: drop __pXd_offset() macros that duplicate pXd_index() ones
      mips: add support for folded p4d page tables

Nathan Chancellor (1):
      mips: Fix unroll macro when building with Clang

Paul Burton (50):
      MIPS: r4k-bugs64: Limit R4k bug checks to affected systems
      MIPS: r4k-bugs64: Drop CONFIG_CPU_MIPSR6 checks
      MIPS: Unify sc beqz definition
      MIPS: Use compact branch for LL/SC loops on MIPSr6+
      MIPS: barrier: Add __SYNC() infrastructure
      MIPS: barrier: Clean up rmb() & wmb() definitions
      MIPS: barrier: Clean up __smp_mb() definition
      MIPS: barrier: Remove fast_mb() Octeon #ifdef'ery
      MIPS: barrier: Clean up __sync() definition
      MIPS: barrier: Clean up sync_ginv()
      MIPS: atomic: Fix whitespace in ATOMIC_OP macros
      MIPS: atomic: Handle !kernel_uses_llsc first
      MIPS: atomic: Use one macro to generate 32b & 64b functions
      MIPS: atomic: Emit Loongson3 sync workarounds within asm
      MIPS: atomic: Use _atomic barriers in atomic_sub_if_positive()
      MIPS: atomic: Unify 32b & 64b sub_if_positive
      MIPS: atomic: Deduplicate 32b & 64b read, set, xchg, cmpxchg
      MIPS: bitops: Handle !kernel_uses_llsc first
      MIPS: bitops: Only use ins for bit 16 or higher
      MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
      MIPS: bitops: ins start position is always an immediate
      MIPS: bitops: Implement test_and_set_bit() in terms of _lock variant
      MIPS: bitops: Allow immediates in test_and_{set,clear,change}_bit
      MIPS: bitops: Use the BIT() macro
      MIPS: bitops: Avoid redundant zero-comparison for non-LLSC
      MIPS: bitops: Abstract LL/SC loops
      MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
      MIPS: bitops: Emit Loongson3 sync workarounds within asm
      MIPS: bitops: Use smp_mb__before_atomic in test_* ops
      MIPS: cmpxchg: Emit Loongson3 sync workarounds within asm
      MIPS: cmpxchg: Omit redundant barriers for Loongson3
      MIPS: futex: Emit Loongson3 sync workarounds within asm
      MIPS: syscall: Emit Loongson3 sync workarounds within asm
      MIPS: barrier: Remove loongson_llsc_mb()
      MIPS: barrier: Make __smp_mb__before_atomic() a no-op for Loongson3
      MIPS: genex: Add Loongson3 LL/SC workaround to ejtag_debug_handler
      MIPS: genex: Don't reload address unnecessarily
      MIPS: Check Loongson3 LL/SC errata workaround correctness
      MIPS: futex: Restore \n after sync instructions
      MIPS: Provide unroll() macro, use it for cache ops
      MIPS: Drop 32-bit asm string functions
      MIPS: cmdline: Remove redundant Kconfig defaults
      MIPS: cmdline: Clean up boot_command_line initialization
      MIPS: Always define builtin_cmdline
      MIPS: Fix CONFIG_OF_EARLY_FLATTREE=3Dn builds
      MIPS: Make builtin_cmdline const & variable length
      MAINTAINERS: Use @kernel.org address for Paul Burton
      MIPS: tlbex: Fix build_restore_pagemask KScratch restore
      Merge tag 'mips_fixes_5.4_3' into mips-next
      MIPS: math-emu: Reuse name array in debugfs_fpuemu()

Paul Menzel (1):
      mips/cavium-octeon: Fix typo *must* in comment

Rikard Falkeborn (1):
      MIPS: Loongson: Fix GENMASK misuse

Stefan Roese (4):
      MIPS: ralink: mt7628a.dtsi: Add I2C controller DT node
      dt-bindings: mips: Add missing mt7688a-soc compatible
      dt-bindings: mips: Add gardena vendor prefix and board description
      MIPS: ralink: Add GARDENA smart Gateway MT7688 board

Thomas Bogendoerfer (23):
      MIPS: SGI-IP27: remove not used stuff inherited from IRIX
      MIPS: SGI-IP27: get rid of compact node ids
      nvmem: core: add nvmem_device_find
      MIPS: PCI: use information from 1-wire PROM for IOC3 detection
      MIPS: fw: arc: remove unused ARC code
      MIPS: fw: arc: use call_o32 to call ARC prom from 64bit kernel
      MIPS: Kconfig: always select ARC_MEMORY and ARC_PROMLIB for platform
      MIPS: fw: arc: workaround 64bit kernel/32bit ARC problems
      MIPS: SGI-IP22: set PHYS_OFFSET to memory start
      MIPS: SGI-IP22/28: Use PROM for memory detection
      MIPS: SGI-IP27: collect externs in new header file
      MIPS: SGI-IP27: move registering of smp ops into IP27 specific code
      MIPS: arc: remove unused stuff
      MIPS: arc: use function argument for passing argc/argv to prom_init_c=
mdline
      MIPS: SGI-IP27: reduce ARC usage to a minimum
      MIPS: include: remove unsued header file asm/sgi/sgi.h
      MIPS: SGI-IP27: replace MAX_COMPACT_NODE with MAX_NUMNODES
      MIPS: PCI: make phys_to_dma/dma_to_phys for pci-xtalk-bridge common
      MIPS: add support for SGI Octane (IP30)
      MIPS: SGI-IP27: Fix crash, when CPUs are disabled via nr_cpus paramet=
er
      MIPS: PCI: remember nasid changed by set interrupt affinity
      MIPS: PCI: Fix fake subdevice ID for IOC3
      MIPS: SGI-IP27: Enable ethernet phy on second Origin 200 module

Tiezhu Yang (3):
      MIPS: generic: Use __initconst for const init data
      MIPS: Loongson: Make default kernel log buffer size as 128KB for Loon=
gson3
      MIPS: Loongson: Fix return value of loongson_hwmon_init

Vincenzo Frascino (1):
      mips: vdso: Fix __arch_get_hw_counter()

Zhou Yanjie (1):
      MIPS: Ingenic: Disable abandoned HPTLB function.

 .mailmap                                           |   3 +-
 Documentation/devicetree/bindings/mips/ralink.txt  |  14 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/driver-api/nvmem.rst                 |   2 +
 MAINTAINERS                                        |  20 +-
 arch/mips/Kbuild.platforms                         |   2 +
 arch/mips/Kconfig                                  | 185 ++++---
 arch/mips/Kconfig.debug                            |   3 -
 arch/mips/Makefile                                 |   3 +
 arch/mips/Makefile.postlink                        |  10 +-
 arch/mips/bcm63xx/prom.c                           |   2 +-
 arch/mips/boot/dts/ingenic/ci20.dts                | 214 ++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  86 ++++
 .../dts/ralink/gardena_smart_gateway_mt7688.dts    | 197 +++++++
 arch/mips/boot/dts/ralink/mt7628a.dtsi             |  16 +
 arch/mips/cavium-octeon/setup.c                    |   2 +-
 arch/mips/configs/fuloong2e_defconfig              |   2 +-
 arch/mips/configs/lemote2f_defconfig               |   2 +-
 arch/mips/configs/loongson3_defconfig              |   2 -
 arch/mips/fw/arc/Makefile                          |   6 +-
 arch/mips/fw/arc/cmdline.c                         |  16 +-
 arch/mips/fw/arc/env.c                             |   6 -
 arch/mips/fw/arc/file.c                            |  49 --
 arch/mips/fw/arc/identify.c                        |  15 +-
 arch/mips/fw/arc/init.c                            |  20 +-
 arch/mips/fw/arc/memory.c                          |   9 +
 arch/mips/fw/arc/misc.c                            |  59 ---
 arch/mips/fw/arc/promlib.c                         |  25 +-
 arch/mips/fw/arc/salone.c                          |  25 -
 arch/mips/fw/arc/time.c                            |  25 -
 arch/mips/fw/arc/tree.c                            | 127 -----
 arch/mips/generic/init.c                           |   6 +-
 arch/mips/include/asm/atomic.h                     | 571 +++++++----------=
----
 arch/mips/include/asm/barrier.h                    | 228 ++------
 arch/mips/include/asm/bitops.h                     | 443 +++++-----------
 arch/mips/include/asm/bmips.h                      |  10 +-
 arch/mips/include/asm/bootinfo.h                   |   4 +-
 arch/mips/include/asm/bugs.h                       |  18 +-
 arch/mips/include/asm/cmpxchg.h                    |  59 ++-
 arch/mips/include/asm/cop2.h                       |   2 +-
 arch/mips/include/asm/cpu-type.h                   |  11 +-
 arch/mips/include/asm/cpu.h                        |  10 +-
 arch/mips/include/asm/fixmap.h                     |   2 +-
 arch/mips/include/asm/futex.h                      |  15 +-
 arch/mips/include/asm/hazards.h                    |   2 +-
 arch/mips/include/asm/io.h                         |   2 +-
 arch/mips/include/asm/irqflags.h                   |   2 +-
 arch/mips/include/asm/llsc.h                       |  19 +-
 arch/mips/include/asm/mach-ip22/spaces.h           |  12 +-
 arch/mips/include/asm/mach-ip27/mmzone.h           |   2 +-
 arch/mips/include/asm/mach-ip27/topology.h         |   5 +-
 .../include/asm/mach-ip30/cpu-feature-overrides.h  |  83 +++
 arch/mips/include/asm/mach-ip30/irq.h              |  87 ++++
 .../mips/include/asm/mach-ip30/kernel-entry-init.h |  13 +
 arch/mips/include/asm/mach-ip30/mangle-port.h      |  22 +
 arch/mips/include/asm/mach-ip30/spaces.h           |  20 +
 arch/mips/include/asm/mach-ip30/war.h              |  26 +
 .../asm/mach-loongson2ef/cpu-feature-overrides.h   |  44 ++
 .../cs5536/cs5536.h                                |   0
 .../cs5536/cs5536_mfgpt.h                          |   0
 .../cs5536/cs5536_pci.h                            |   0
 .../cs5536/cs5536_vsm.h                            |   0
 arch/mips/include/asm/mach-loongson2ef/loongson.h  | 326 ++++++++++++
 .../machine.h                                      |  12 +-
 .../include/asm/mach-loongson2ef/mc146818rtc.h     |  36 ++
 .../{mach-loongson64 =3D> mach-loongson2ef}/mem.h    |   6 +-
 arch/mips/include/asm/mach-loongson2ef/pci.h       |  46 ++
 arch/mips/include/asm/mach-loongson2ef/spaces.h    |  10 +
 arch/mips/include/asm/mach-loongson32/prom.h       |  20 -
 .../asm/mach-loongson64/cpu-feature-overrides.h    |   3 -
 arch/mips/include/asm/mach-loongson64/irq.h        |   4 -
 .../asm/mach-loongson64/kernel-entry-init.h        |  32 +-
 arch/mips/include/asm/mach-loongson64/loongson.h   | 115 -----
 .../include/asm/mach-loongson64/loongson_regs.h    | 227 ++++++++
 arch/mips/include/asm/mach-loongson64/mmzone.h     |  29 +-
 arch/mips/include/asm/mach-loongson64/pci.h        |  31 --
 arch/mips/include/asm/mach-loongson64/topology.h   |   4 +-
 arch/mips/include/asm/mipsregs.h                   |   6 +
 arch/mips/include/asm/module.h                     |  12 +-
 arch/mips/include/asm/pci/bridge.h                 |   1 +
 arch/mips/include/asm/pgalloc.h                    |   4 +-
 arch/mips/include/asm/pgtable-32.h                 |   6 +-
 arch/mips/include/asm/pgtable-64.h                 |  44 +-
 arch/mips/include/asm/pgtable.h                    |  11 -
 arch/mips/include/asm/pmon.h                       |  46 --
 arch/mips/include/asm/processor.h                  |   2 +-
 arch/mips/include/asm/r4kcache.h                   | 362 +------------
 arch/mips/include/asm/sgi/heart.h                  | 272 ++++++++++
 arch/mips/include/asm/sgi/sgi.h                    |  48 --
 arch/mips/include/asm/sgialib.h                    |  22 +-
 arch/mips/include/asm/sgiarcs.h                    | 103 ++--
 arch/mips/include/asm/sn/agent.h                   |   2 +-
 arch/mips/include/asm/sn/arch.h                    |  31 --
 arch/mips/include/asm/sn/gda.h                     |   4 +-
 arch/mips/include/asm/sn/hub.h                     |   4 +-
 arch/mips/include/asm/sn/ioc3.h                    |   9 +
 arch/mips/include/asm/sn/mapped_kernel.h           |   4 +-
 arch/mips/include/asm/sn/sn0/arch.h                |  18 +-
 arch/mips/include/asm/sn/sn_private.h              |   5 +-
 arch/mips/include/asm/sn/types.h                   |   4 -
 arch/mips/include/asm/string.h                     | 121 -----
 arch/mips/include/asm/sync.h                       | 207 ++++++++
 arch/mips/include/asm/unroll.h                     |  77 +++
 arch/mips/include/asm/vdso/gettimeofday.h          |   4 +-
 arch/mips/kernel/Makefile                          |   2 +-
 arch/mips/kernel/cpu-probe.c                       |  53 +-
 arch/mips/kernel/genex.S                           |   8 +-
 arch/mips/kernel/idle.c                            |   7 +-
 arch/mips/kernel/perf_event_mipsxx.c               |   6 +-
 arch/mips/kernel/pm-cps.c                          |  20 +-
 arch/mips/kernel/{cpu-bugs64.c =3D> r4k-bugs64.c}    |  11 +-
 arch/mips/kernel/setup.c                           | 137 +++--
 arch/mips/kernel/smp-bmips.c                       |   9 +-
 arch/mips/kernel/syscall.c                         |   3 +-
 arch/mips/kernel/traps.c                           |   4 +-
 arch/mips/kvm/mmu.c                                |  40 +-
 arch/mips/kvm/trap_emul.c                          |   4 +-
 arch/mips/lib/bitops.c                             |  57 +-
 arch/mips/lib/csum_partial.S                       |   4 +-
 arch/mips/loongson2ef/Kconfig                      |  95 ++++
 arch/mips/loongson2ef/Makefile                     |  18 +
 arch/mips/loongson2ef/Platform                     |  32 ++
 .../{loongson64 =3D> loongson2ef}/common/Makefile    |   3 +-
 .../common/bonito-irq.c                            |   0
 .../common/cs5536/Makefile                         |   0
 .../common/cs5536/cs5536_acc.c                     |   0
 .../common/cs5536/cs5536_ehci.c                    |   0
 .../common/cs5536/cs5536_ide.c                     |   0
 .../common/cs5536/cs5536_isa.c                     |   0
 .../common/cs5536/cs5536_mfgpt.c                   |   0
 .../common/cs5536/cs5536_ohci.c                    |   0
 .../common/cs5536/cs5536_pci.c                     |   0
 arch/mips/loongson2ef/common/env.c                 |  53 ++
 .../mips/{loongson64 =3D> loongson2ef}/common/init.c |  10 +-
 arch/mips/{loongson64 =3D> loongson2ef}/common/irq.c |   0
 .../{loongson64 =3D> loongson2ef}/common/machtype.c  |   1 -
 arch/mips/loongson2ef/common/mem.c                 |  62 +++
 arch/mips/{loongson64 =3D> loongson2ef}/common/pci.c |   8 -
 .../{loongson64 =3D> loongson2ef}/common/platform.c  |   0
 arch/mips/{loongson64 =3D> loongson2ef}/common/pm.c  |   9 +-
 .../{loongson64 =3D> loongson2ef}/common/reset.c     |  21 -
 arch/mips/{loongson64 =3D> loongson2ef}/common/rtc.c |   0
 arch/mips/loongson2ef/common/serial.c              |  86 ++++
 .../{loongson64 =3D> loongson2ef}/common/setup.c     |  21 -
 .../mips/{loongson64 =3D> loongson2ef}/common/time.c |   4 -
 .../{loongson64 =3D> loongson2ef}/common/uart_base.c |  19 +-
 .../fuloong-2e/Makefile                            |   0
 .../{loongson64 =3D> loongson2ef}/fuloong-2e/dma.c   |   0
 .../{loongson64 =3D> loongson2ef}/fuloong-2e/irq.c   |   0
 .../{loongson64 =3D> loongson2ef}/fuloong-2e/reset.c |   0
 .../{loongson64 =3D> loongson2ef}/lemote-2f/Makefile |   0
 .../{loongson64 =3D> loongson2ef}/lemote-2f/clock.c  |   6 +-
 .../{loongson64 =3D> loongson2ef}/lemote-2f/dma.c    |   0
 .../lemote-2f/ec_kb3310b.c                         |   0
 .../lemote-2f/ec_kb3310b.h                         |   0
 .../{loongson64 =3D> loongson2ef}/lemote-2f/irq.c    |   0
 .../lemote-2f/machtype.c                           |   0
 .../{loongson64 =3D> loongson2ef}/lemote-2f/pm.c     |   0
 .../{loongson64 =3D> loongson2ef}/lemote-2f/reset.c  |   2 +-
 arch/mips/loongson32/Kconfig                       |   2 +-
 arch/mips/loongson32/Platform                      |   4 +-
 arch/mips/loongson32/common/prom.c                 |  59 +--
 arch/mips/loongson32/common/setup.c                |  11 +-
 arch/mips/loongson64/Kconfig                       | 119 +----
 arch/mips/loongson64/Makefile                      |  29 +-
 arch/mips/loongson64/Platform                      |  35 +-
 arch/mips/loongson64/{loongson-3 =3D> }/acpi_init.c  |   0
 arch/mips/loongson64/common/cmdline.c              |  44 --
 arch/mips/loongson64/common/early_printk.c         |  38 --
 arch/mips/loongson64/common/mem.c                  | 157 ------
 arch/mips/loongson64/common/serial.c               | 117 -----
 arch/mips/loongson64/{loongson-3 =3D> }/cop2-ex.c    |   0
 arch/mips/loongson64/{loongson-3 =3D> }/dma.c        |   0
 arch/mips/loongson64/{common =3D> }/env.c            |  62 +--
 arch/mips/loongson64/{loongson-3 =3D> }/hpet.c       |   0
 arch/mips/loongson64/init.c                        |  46 ++
 arch/mips/loongson64/{loongson-3 =3D> }/irq.c        |   8 +-
 arch/mips/loongson64/loongson-3/Makefile           |  11 -
 arch/mips/loongson64/{loongson-3 =3D> }/numa.c       |  11 +-
 arch/mips/loongson64/pci.c                         |  51 ++
 arch/mips/loongson64/{loongson-3 =3D> }/platform.c   |   0
 arch/mips/loongson64/pm.c                          | 104 ++++
 arch/mips/loongson64/reset.c                       |  64 +++
 arch/mips/loongson64/rtc.c                         |  39 ++
 arch/mips/loongson64/setup.c                       |  30 ++
 arch/mips/loongson64/{loongson-3 =3D> }/smp.c        | 160 ++++--
 arch/mips/loongson64/{loongson-3 =3D> }/smp.h        |   0
 arch/mips/loongson64/time.c                        |  29 ++
 arch/mips/math-emu/me-debugfs.c                    |   3 +-
 arch/mips/mm/c-r3k.c                               |   4 +-
 arch/mips/mm/c-r4k.c                               |  51 +-
 arch/mips/mm/c-tx39.c                              |   4 +-
 arch/mips/mm/fault.c                               |  12 +-
 arch/mips/mm/hugetlbpage.c                         |  14 +-
 arch/mips/mm/init.c                                |   6 +-
 arch/mips/mm/ioremap.c                             |   6 +-
 arch/mips/mm/page.c                                |   2 +-
 arch/mips/mm/pgtable-32.c                          |   6 +-
 arch/mips/mm/tlb-r4k.c                             |   8 +-
 arch/mips/mm/tlbex.c                               |  29 +-
 arch/mips/oprofile/Makefile                        |   4 +-
 arch/mips/oprofile/common.c                        |   6 +-
 arch/mips/oprofile/op_model_mipsxx.c               |   2 +-
 arch/mips/pci/Makefile                             |   2 +-
 arch/mips/pci/pci-ip27.c                           |  35 +-
 arch/mips/pci/pci-xtalk-bridge.c                   | 156 +++++-
 arch/mips/power/cpu.c                              |   8 +-
 arch/mips/sgi-ip22/ip22-mc.c                       |  74 +--
 arch/mips/sgi-ip27/ip27-common.h                   |  10 +
 arch/mips/sgi-ip27/ip27-hubio.c                    |  10 +-
 arch/mips/sgi-ip27/ip27-init.c                     |  55 +-
 arch/mips/sgi-ip27/ip27-irq.c                      |   8 +-
 arch/mips/sgi-ip27/ip27-klconfig.c                 |  14 +-
 arch/mips/sgi-ip27/ip27-klnuma.c                   |  21 +-
 arch/mips/sgi-ip27/ip27-memory.c                   |  73 +--
 arch/mips/sgi-ip27/ip27-nmi.c                      |  16 +-
 arch/mips/sgi-ip27/ip27-reset.c                    |   8 +-
 arch/mips/sgi-ip27/ip27-smp.c                      |  82 +--
 arch/mips/sgi-ip27/ip27-timer.c                    |   6 +-
 arch/mips/sgi-ip27/ip27-xtalk.c                    |  48 +-
 arch/mips/sgi-ip30/Makefile                        |   9 +
 arch/mips/sgi-ip30/Platform                        |   8 +
 arch/mips/sgi-ip30/ip30-common.h                   |   9 +
 arch/mips/sgi-ip30/ip30-console.c                  |  23 +
 arch/mips/sgi-ip30/ip30-irq.c                      | 328 ++++++++++++
 arch/mips/sgi-ip30/ip30-power.c                    |  41 ++
 arch/mips/sgi-ip30/ip30-setup.c                    | 138 +++++
 arch/mips/sgi-ip30/ip30-smp.c                      | 149 ++++++
 arch/mips/sgi-ip30/ip30-timer.c                    |  63 +++
 arch/mips/sgi-ip30/ip30-xtalk.c                    | 152 ++++++
 arch/mips/tools/.gitignore                         |   1 +
 arch/mips/tools/Makefile                           |   5 +
 arch/mips/tools/loongson3-llsc-check.c             | 307 +++++++++++
 arch/mips/vdso/Makefile                            |   1 +
 drivers/cpufreq/loongson2_cpufreq.c                |   2 +-
 drivers/gpio/Kconfig                               |   2 +-
 drivers/gpio/gpio-loongson.c                       |   2 +-
 drivers/nvmem/core.c                               |  61 +--
 drivers/platform/mips/Kconfig                      |   4 +-
 drivers/platform/mips/cpu_hwmon.c                  |  17 +-
 include/drm/drm_cache.h                            |   2 +-
 include/linux/nvmem-consumer.h                     |   9 +
 242 files changed, 5684 insertions(+), 3674 deletions(-)
 create mode 100644 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.=
dts
 delete mode 100644 arch/mips/fw/arc/salone.c
 delete mode 100644 arch/mips/fw/arc/time.c
 delete mode 100644 arch/mips/fw/arc/tree.c
 create mode 100644 arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
 create mode 100644 arch/mips/include/asm/mach-ip30/irq.h
 create mode 100644 arch/mips/include/asm/mach-ip30/kernel-entry-init.h
 create mode 100644 arch/mips/include/asm/mach-ip30/mangle-port.h
 create mode 100644 arch/mips/include/asm/mach-ip30/spaces.h
 create mode 100644 arch/mips/include/asm/mach-ip30/war.h
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/cpu-feature-over=
rides.h
 rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs553=
6/cs5536.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs553=
6/cs5536_mfgpt.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs553=
6/cs5536_pci.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs553=
6/cs5536_vsm.h (100%)
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/loongson.h
 rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/machi=
ne.h (60%)
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
 rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/mem.h=
 (86%)
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/pci.h
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
 delete mode 100644 arch/mips/include/asm/mach-loongson32/prom.h
 create mode 100644 arch/mips/include/asm/mach-loongson64/loongson_regs.h
 delete mode 100644 arch/mips/include/asm/pmon.h
 create mode 100644 arch/mips/include/asm/sgi/heart.h
 delete mode 100644 arch/mips/include/asm/sgi/sgi.h
 create mode 100644 arch/mips/include/asm/sync.h
 create mode 100644 arch/mips/include/asm/unroll.h
 rename arch/mips/kernel/{cpu-bugs64.c =3D> r4k-bugs64.c} (97%)
 create mode 100644 arch/mips/loongson2ef/Kconfig
 create mode 100644 arch/mips/loongson2ef/Makefile
 create mode 100644 arch/mips/loongson2ef/Platform
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/Makefile (80%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/bonito-irq.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/Makefile (100=
%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_acc.c =
(100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ehci.c=
 (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ide.c =
(100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_isa.c =
(100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_mfgpt.=
c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ohci.c=
 (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_pci.c =
(100%)
 create mode 100644 arch/mips/loongson2ef/common/env.c
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/init.c (90%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/irq.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/machtype.c (96%)
 create mode 100644 arch/mips/loongson2ef/common/mem.c
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/pci.c (90%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/platform.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/pm.c (93%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/reset.c (79%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/rtc.c (100%)
 create mode 100644 arch/mips/loongson2ef/common/serial.c
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/setup.c (57%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/time.c (91%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/common/uart_base.c (56%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/Makefile (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/dma.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/irq.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/reset.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/Makefile (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/clock.c (96%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/dma.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/ec_kb3310b.c (100=
%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/ec_kb3310b.h (100=
%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/irq.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/machtype.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/pm.c (100%)
 rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/reset.c (98%)
 rename arch/mips/loongson64/{loongson-3 =3D> }/acpi_init.c (100%)
 delete mode 100644 arch/mips/loongson64/common/cmdline.c
 delete mode 100644 arch/mips/loongson64/common/early_printk.c
 delete mode 100644 arch/mips/loongson64/common/mem.c
 delete mode 100644 arch/mips/loongson64/common/serial.c
 rename arch/mips/loongson64/{loongson-3 =3D> }/cop2-ex.c (100%)
 rename arch/mips/loongson64/{loongson-3 =3D> }/dma.c (100%)
 rename arch/mips/loongson64/{common =3D> }/env.c (79%)
 rename arch/mips/loongson64/{loongson-3 =3D> }/hpet.c (100%)
 create mode 100644 arch/mips/loongson64/init.c
 rename arch/mips/loongson64/{loongson-3 =3D> }/irq.c (96%)
 delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
 rename arch/mips/loongson64/{loongson-3 =3D> }/numa.c (96%)
 create mode 100644 arch/mips/loongson64/pci.c
 rename arch/mips/loongson64/{loongson-3 =3D> }/platform.c (100%)
 create mode 100644 arch/mips/loongson64/pm.c
 create mode 100644 arch/mips/loongson64/reset.c
 create mode 100644 arch/mips/loongson64/rtc.c
 create mode 100644 arch/mips/loongson64/setup.c
 rename arch/mips/loongson64/{loongson-3 =3D> }/smp.c (92%)
 rename arch/mips/loongson64/{loongson-3 =3D> }/smp.h (100%)
 create mode 100644 arch/mips/loongson64/time.c
 create mode 100644 arch/mips/sgi-ip27/ip27-common.h
 create mode 100644 arch/mips/sgi-ip30/Makefile
 create mode 100644 arch/mips/sgi-ip30/Platform
 create mode 100644 arch/mips/sgi-ip30/ip30-common.h
 create mode 100644 arch/mips/sgi-ip30/ip30-console.c
 create mode 100644 arch/mips/sgi-ip30/ip30-irq.c
 create mode 100644 arch/mips/sgi-ip30/ip30-power.c
 create mode 100644 arch/mips/sgi-ip30/ip30-setup.c
 create mode 100644 arch/mips/sgi-ip30/ip30-smp.c
 create mode 100644 arch/mips/sgi-ip30/ip30-timer.c
 create mode 100644 arch/mips/sgi-ip30/ip30-xtalk.c
 create mode 100644 arch/mips/tools/loongson3-llsc-check.c



--wzjxgo2nx2snpkds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXdwvXwAKCRA+p5+stXUA
3d3VAQCJXsulyRuC0hX8nyZtItoJGyqh4xddb/JlHU9vx2l5QQEA0sfwIqdO3IjN
e/kgMC412DrwwWxPAeUe6hOuIG74gAI=
=UwPu
-----END PGP SIGNATURE-----

--wzjxgo2nx2snpkds--
