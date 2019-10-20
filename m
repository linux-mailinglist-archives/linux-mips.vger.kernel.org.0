Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65109DDEEE
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2019 16:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfJTOoC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Oct 2019 10:44:02 -0400
Received: from forward106o.mail.yandex.net ([37.140.190.187]:40581 "EHLO
        forward106o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbfJTOoC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Oct 2019 10:44:02 -0400
Received: from mxback21g.mail.yandex.net (mxback21g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:321])
        by forward106o.mail.yandex.net (Yandex) with ESMTP id 489EE5060719;
        Sun, 20 Oct 2019 17:43:57 +0300 (MSK)
Received: from myt1-e9eae5d2de9d.qloud-c.yandex.net (myt1-e9eae5d2de9d.qloud-c.yandex.net [2a02:6b8:c00:1290:0:640:e9ea:e5d2])
        by mxback21g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id IYx3pKJQBt-hulSlfJW;
        Sun, 20 Oct 2019 17:43:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571582637;
        bh=tbACG+RJgX5RMpefETD0nzTWC48AXoNwG0P1CUgc65c=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=ipN+vpUacZsoPCHgdHIpDLqYHU5AvPfpQ1Hebh2/bwEbXhHQTOdt0HtG29E2BJMVw
         bbk9EqTETo3R1W+UWOHIZjBx0hxqOSHxGzcI/xYJUzEtRHjnddyb/Ik8PvzezkO2Rr
         3YWazUkmKmMRnFlIGfOcnxBuRs4iCSJr8T2wl1EY=
Authentication-Results: mxback21g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt1-e9eae5d2de9d.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id cvdeeoAR7I-hWtaONj5;
        Sun, 20 Oct 2019 17:43:43 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/5] MIPS: Loongson64: separate loongson2ef/loongson64 code
Date:   Sun, 20 Oct 2019 22:43:12 +0800
Message-Id: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

This patchset is the successor of previous set "Modernize Loongson64 Machine".
It based on latest mips-next. But some Loongson related fixes in mips-fixes is
not contained as the mips-next is not aligned with the latest status of mips-fixes.
Please look after them at apply time.

Thanks

Jiaxun Yang (6):
  MIPS: Loongson64: Rename CPU TYPES
  MIPS: Fork loongson2ef from loongson64
  MIPS: Loongson2ef: clean up loongson64 related code
  MIPS: Loongson64: Cleanup unused code
  MIPS: Loongson64: Move files to the top-level directory
  MAINTAINERS: Fix entries for Loongson2EF and add myself to Loongson64

 MAINTAINERS                                   |  10 +-
 arch/mips/Kbuild.platforms                    |   1 +
 arch/mips/Kconfig                             |  81 ++++++++----
 arch/mips/configs/fuloong2e_defconfig         |   2 +-
 arch/mips/configs/lemote2f_defconfig          |   2 +-
 arch/mips/configs/loongson3_defconfig         |   1 -
 arch/mips/include/asm/bootinfo.h              |   3 +-
 arch/mips/include/asm/cop2.h                  |   2 +-
 arch/mips/include/asm/cpu-type.h              |   9 +-
 arch/mips/include/asm/cpu.h                   |   4 +-
 arch/mips/include/asm/hazards.h               |   4 +-
 arch/mips/include/asm/io.h                    |   2 +-
 arch/mips/include/asm/irqflags.h              |   2 +-
 .../cpu-feature-overrides.h                   |  15 +--
 .../cs5536/cs5536.h                           |   0
 .../cs5536/cs5536_mfgpt.h                     |   0
 .../cs5536/cs5536_pci.h                       |   0
 .../cs5536/cs5536_vsm.h                       |   0
 .../loongson.h                                |  37 +-----
 .../machine.h                                 |  12 +-
 .../asm/mach-loongson2ef/mc146818rtc.h        |  36 ++++++
 .../mem.h                                     |   6 +-
 .../pci.h                                     |  12 +-
 .../include/asm/mach-loongson2ef/spaces.h     |  10 ++
 .../mach-loongson64/cpu-feature-overrides.h   |   3 -
 arch/mips/include/asm/mach-loongson64/irq.h   |   4 -
 .../asm/mach-loongson64/kernel-entry-init.h   |   4 -
 .../include/asm/mach-loongson64/loongson.h    | 114 -----------------
 .../mips/include/asm/mach-loongson64/mmzone.h |  29 +----
 arch/mips/include/asm/mach-loongson64/pci.h   |  31 -----
 .../include/asm/mach-loongson64/topology.h    |   4 +-
 arch/mips/include/asm/module.h                |   8 +-
 arch/mips/include/asm/processor.h             |   2 +-
 arch/mips/include/asm/r4kcache.h              |   4 +-
 arch/mips/kernel/cpu-probe.c                  |  16 +--
 arch/mips/kernel/idle.c                       |   2 +-
 arch/mips/kernel/perf_event_mipsxx.c          |   4 +-
 arch/mips/kernel/setup.c                      |   2 +-
 arch/mips/kernel/traps.c                      |   2 +-
 arch/mips/lib/csum_partial.S                  |   4 +-
 arch/mips/{loongson64 => loongson2ef}/Kconfig |  53 +-------
 .../mips/{loongson64 => loongson2ef}/Makefile |   8 +-
 arch/mips/loongson2ef/Platform                |  32 +++++
 .../common/Makefile                           |   0
 .../common/bonito-irq.c                       |   0
 .../common/cmdline.c                          |   0
 .../common/cs5536/Makefile                    |   0
 .../common/cs5536/cs5536_acc.c                |   0
 .../common/cs5536/cs5536_ehci.c               |   0
 .../common/cs5536/cs5536_ide.c                |   0
 .../common/cs5536/cs5536_isa.c                |   0
 .../common/cs5536/cs5536_mfgpt.c              |   0
 .../common/cs5536/cs5536_ohci.c               |   0
 .../common/cs5536/cs5536_pci.c                |   0
 .../common/early_printk.c                     |   2 +-
 arch/mips/loongson2ef/common/env.c            |  71 +++++++++++
 .../{loongson64 => loongson2ef}/common/init.c |   5 -
 .../{loongson64 => loongson2ef}/common/irq.c  |   0
 .../common/machtype.c                         |   1 -
 .../{loongson64 => loongson2ef}/common/mem.c  |  37 ------
 .../{loongson64 => loongson2ef}/common/pci.c  |   8 --
 .../common/platform.c                         |   0
 .../{loongson64 => loongson2ef}/common/pm.c   |   9 +-
 .../common/reset.c                            |  21 ----
 .../{loongson64 => loongson2ef}/common/rtc.c  |   0
 arch/mips/loongson2ef/common/serial.c         |  86 +++++++++++++
 .../common/setup.c                            |  21 ----
 .../{loongson64 => loongson2ef}/common/time.c |   4 -
 .../common/uart_base.c                        |  17 +--
 .../fuloong-2e/Makefile                       |   0
 .../fuloong-2e/dma.c                          |   0
 .../fuloong-2e/irq.c                          |   0
 .../fuloong-2e/reset.c                        |   0
 .../lemote-2f/Makefile                        |   0
 .../lemote-2f/clock.c                         |   6 +-
 .../lemote-2f/dma.c                           |   0
 .../lemote-2f/ec_kb3310b.c                    |   0
 .../lemote-2f/ec_kb3310b.h                    |   0
 .../lemote-2f/irq.c                           |   0
 .../lemote-2f/machtype.c                      |   0
 .../lemote-2f/pm.c                            |   0
 .../lemote-2f/reset.c                         |   2 +-
 arch/mips/loongson64/Kconfig                  | 119 +-----------------
 arch/mips/loongson64/Makefile                 |  29 ++---
 arch/mips/loongson64/Platform                 |  33 +----
 .../loongson64/{loongson-3 => }/acpi_init.c   |   0
 arch/mips/loongson64/{common => }/cmdline.c   |   2 -
 arch/mips/loongson64/common/serial.c          | 117 -----------------
 .../loongson64/{loongson-3 => }/cop2-ex.c     |   0
 arch/mips/loongson64/{loongson-3 => }/dma.c   |   0
 arch/mips/loongson64/{common => }/env.c       |  62 +--------
 arch/mips/loongson64/{loongson-3 => }/hpet.c  |   0
 arch/mips/loongson64/{common => }/init.c      |  17 +--
 arch/mips/loongson64/{loongson-3 => }/irq.c   |   8 +-
 arch/mips/loongson64/loongson-3/Makefile      |  11 --
 arch/mips/loongson64/{loongson-3 => }/numa.c  |  11 +-
 arch/mips/loongson64/{common => }/pci.c       |   5 +-
 .../loongson64/{loongson-3 => }/platform.c    |   0
 arch/mips/loongson64/{common => }/pm.c        |  53 --------
 arch/mips/loongson64/{common => }/reset.c     |  30 -----
 arch/mips/loongson64/{common => }/rtc.c       |   0
 arch/mips/loongson64/{common => }/setup.c     |  21 ----
 arch/mips/loongson64/{loongson-3 => }/smp.c   |   0
 arch/mips/loongson64/{loongson-3 => }/smp.h   |   0
 arch/mips/loongson64/{common => }/time.c      |   3 -
 arch/mips/mm/c-r4k.c                          |  32 ++---
 arch/mips/mm/page.c                           |   2 +-
 arch/mips/mm/tlb-r4k.c                        |   4 +-
 arch/mips/mm/tlbex.c                          |   6 +-
 arch/mips/oprofile/Makefile                   |   4 +-
 arch/mips/oprofile/common.c                   |   4 +-
 arch/mips/pci/Makefile                        |   2 +-
 drivers/cpufreq/loongson2_cpufreq.c           |   2 +-
 drivers/gpio/Kconfig                          |   2 +-
 drivers/gpio/gpio-loongson.c                  |   2 +-
 drivers/platform/mips/Kconfig                 |   4 +-
 include/drm/drm_cache.h                       |   2 +-
 117 files changed, 447 insertions(+), 1007 deletions(-)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cpu-feature-overrides.h (73%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_mfgpt.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_pci.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_vsm.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/loongson.h (90%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/machine.h (60%)
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mem.h (86%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/pci.h (84%)
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
 copy arch/mips/{loongson64 => loongson2ef}/Kconfig (64%)
 copy arch/mips/{loongson64 => loongson2ef}/Makefile (68%)
 create mode 100644 arch/mips/loongson2ef/Platform
 rename arch/mips/{loongson64 => loongson2ef}/common/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/bonito-irq.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/cmdline.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_acc.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ehci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ide.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_isa.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_mfgpt.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ohci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_pci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/early_printk.c (93%)
 create mode 100644 arch/mips/loongson2ef/common/env.c
 copy arch/mips/{loongson64 => loongson2ef}/common/init.c (95%)
 rename arch/mips/{loongson64 => loongson2ef}/common/irq.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/machtype.c (96%)
 rename arch/mips/{loongson64 => loongson2ef}/common/mem.c (75%)
 copy arch/mips/{loongson64 => loongson2ef}/common/pci.c (90%)
 rename arch/mips/{loongson64 => loongson2ef}/common/platform.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/pm.c (93%)
 copy arch/mips/{loongson64 => loongson2ef}/common/reset.c (79%)
 copy arch/mips/{loongson64 => loongson2ef}/common/rtc.c (100%)
 create mode 100644 arch/mips/loongson2ef/common/serial.c
 copy arch/mips/{loongson64 => loongson2ef}/common/setup.c (57%)
 copy arch/mips/{loongson64 => loongson2ef}/common/time.c (91%)
 rename arch/mips/{loongson64 => loongson2ef}/common/uart_base.c (56%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/dma.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/irq.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/reset.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/clock.c (96%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/dma.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.h (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/irq.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/machtype.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/pm.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/reset.c (98%)
 rename arch/mips/loongson64/{loongson-3 => }/acpi_init.c (100%)
 rename arch/mips/loongson64/{common => }/cmdline.c (97%)
 delete mode 100644 arch/mips/loongson64/common/serial.c
 rename arch/mips/loongson64/{loongson-3 => }/cop2-ex.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/dma.c (100%)
 rename arch/mips/loongson64/{common => }/env.c (79%)
 rename arch/mips/loongson64/{loongson-3 => }/hpet.c (100%)
 rename arch/mips/loongson64/{common => }/init.c (69%)
 rename arch/mips/loongson64/{loongson-3 => }/irq.c (96%)
 delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
 rename arch/mips/loongson64/{loongson-3 => }/numa.c (96%)
 rename arch/mips/loongson64/{common => }/pci.c (97%)
 rename arch/mips/loongson64/{loongson-3 => }/platform.c (100%)
 rename arch/mips/loongson64/{common => }/pm.c (68%)
 rename arch/mips/loongson64/{common => }/reset.c (64%)
 rename arch/mips/loongson64/{common => }/rtc.c (100%)
 rename arch/mips/loongson64/{common => }/setup.c (57%)
 rename arch/mips/loongson64/{loongson-3 => }/smp.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/smp.h (100%)
 rename arch/mips/loongson64/{common => }/time.c (90%)

-- 
2.23.0

