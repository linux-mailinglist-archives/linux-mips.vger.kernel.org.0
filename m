Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991069EB3C
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 16:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfH0Ojp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 10:39:45 -0400
Received: from forward102p.mail.yandex.net ([77.88.28.102]:58241 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725811AbfH0Ojp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 10:39:45 -0400
Received: from mxback20j.mail.yandex.net (mxback20j.mail.yandex.net [IPv6:2a02:6b8:0:1619::114])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 400771D40D51;
        Tue, 27 Aug 2019 17:39:39 +0300 (MSK)
Received: from smtp1j.mail.yandex.net (smtp1j.mail.yandex.net [2a02:6b8:0:801::ab])
        by mxback20j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id OAF4XlWOYD-dctKXdi4;
        Tue, 27 Aug 2019 17:39:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566916779;
        bh=PJ119mpnq8nVpyjKv8yZe8For/TsQNCkorIYz73kXLs=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=qKp4UMTaP4ky+9u8RNszQuXQY993duSx7LT52I5xV7oP9vjIngCQPl3vvDjz7E/UP
         w5VH5a2MCNIA0hsZZ2xJTulWv+Av0qM3Ex+x0oxuk38xhOyVN3jc7wFiCbtfcydqa3
         riXpDCpo3vr4dzGSNNlfj4D1f7+7HTKfgfHMc2yc=
Authentication-Results: mxback20j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id BzHanbBxLF-dOA0S2Cf;
        Tue, 27 Aug 2019 17:39:35 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 00/13] Modernize Loongson64 Machine
To:     =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>,
        linux-mips <linux-mips@vger.kernel.org>
Cc:     "paul.burton" <paul.burton@mips.com>, tglx <tglx@linutronix.de>,
        jason <jason@lakedaemon.net>, maz <maz@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        robh+dt <robh+dt@kernel.org>,
        "mark.rutland" <mark.rutland@arm.co>,
        devicetree <devicetree@vger.kernel.org>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <tencent_6718208E72843D804D77BB8D@qq.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1430e997-3bf1-f2be-53c7-73fe12c0dba7@flygoat.com>
Date:   Tue, 27 Aug 2019 22:39:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <tencent_6718208E72843D804D77BB8D@qq.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/27 下午9:25, 陈华才 wrote:
> Hi, Jiaxun,

Hi Huacai

Thanks for your response.

>
> 1, To describe CPU I prefer "loongson" to "ls" because "ls" is confusing, and in future we will use ls2h/ls7a to describe Loongson's bridge.

"Loongson" seems too long in some cases, for DeviceTree Bindings, it 
will also delicate with vendor String.

As you can see on Loongson's official website 
[http://loongson.cn/product/cpu/3/3A3000.html], "LS3A3000" had been 
written on the chip as the model name.

  In my opinion, "ls3" is a proper abbreviation of Loongson-3 processors.

But it's fine for me to convert "ls" to "loongson" if all people agree 
with this.

Btw: I don't think it's a good idea to bring Loongson-2H PCH support to 
mainline, as we can see the vendor code have a lot of dirty hacks that 
are totally unacceptable to us.

> 2, I think it is better to use loongson64c/loongson64g than loongson2ef/loongson64. As we disscussed, we will use PRID_IMP_LOONGSON_64C/PRID_IMP_LOONGSON_64G to describe 0x6300/0xc000.

Our discussion was limited on PRID. However, Early Loongson-3A/B 
processors is sharing the same PRID_IMP with Loongson-2E/F.

It may lead to confusion if we're using the same way to express totally 
different contents.

Notice me if any one have better idea on how to express loongson2ef 
family machines.

--

Jiaxun Yang

> Huacai
>
>
>
>   ------------------ Original ------------------
> From:  "Jiaxun Yang"<jiaxun.yang@flygoat.com>;Date:  Tue, Aug 27, 2019 04:52 PMTo:  "linux-mips"<linux-mips@vger.kernel.org>; Cc:  "chenhc"<chenhc@lemote.com>; "paul.burton"<paul.burton@mips.com>; "tglx"<tglx@linutronix.de>; "jason"<jason@lakedaemon.net>; "maz"<maz@kernel.org>; "linux-kernel"<linux-kernel@vger.kernel.org>; "robh+dt"<robh+dt@kernel.org>; "mark.rutland"<mark.rutland@arm.co>; "devicetree"<devicetree@vger.kernel.org>; "Jiaxun Yang"<jiaxun.yang@flygoat.com>; Subject:  [PATCH 00/13] Modernize Loongson64 Machine Loongson have a long history of contributing their code to mainline kernel.
> However, it seems like recent years, they are focusing on maintain a kernel by themselves
> rather than contribute there code to the community.
>
> Kernel is progress rapidly too. Their code slept in mainline for a long peroid without proper
> maintainance and became outdated.
>
> This patchset brings modern DeviceTree and irqchip support to the Loongson64 machine, and leaves
> Loongson 2e/f alone since they are too legacy to touch.
>
>
> Jiaxun Yang (13):
>    MIPS: Loongson64: Rename CPU TYPES
>    MIPS: Loongson64: Sepreate loongson2ef/loongson64 code
>    MAINTAINERS: Fix entries for new loongson64 path
>    irqchip: Add driver for Loongson-3 I/O interrupt controller
>    dt-bindings: interrupt-controller: Add Loongson-3 IOINTC
>    irqchip: Add driver for Loongson-3 HyperTransport interrupt controller
>    dt-bindings: interrupt-controller: Add Loongson-3 HTINTC
>    irqchip: i8259: Add plat-poll support
>    irqchip: mips-cpu: Convert to simple domain
>    MIPS: Loongson64: Drop legacy IRQ code
>    dt-bindings: mips: Add loongson cpus & boards
>    MIPS: Loongson64: Add generic dts
>    MIPS: Loongson64: Load built-in dtbs
>
>   .../loongson,ls3-htintc.yaml                  |  53 +++++
>   .../loongson,ls3-iointc.yaml                  |  61 +++++
>   .../bindings/mips/loongson/cpus.yaml          |  38 +++
>   .../bindings/mips/loongson/devices.yaml       |  64 ++++++
>   MAINTAINERS                                   |   9 +-
>   arch/mips/Kbuild.platforms                    |   1 +
>   arch/mips/Kconfig                             |  83 +++++--
>   arch/mips/boot/dts/Makefile                   |   1 +
>   arch/mips/boot/dts/loongson/Makefile          |   8 +
>   arch/mips/boot/dts/loongson/ls3-2nodes.dtsi   |   8 +
>   arch/mips/boot/dts/loongson/ls3-4nodes.dtsi   |  15 ++
>   arch/mips/boot/dts/loongson/ls3-cpus.dtsi     | 150 ++++++++++++
>   arch/mips/boot/dts/loongson/ls3-gs464.dtsi    |  18 ++
>   arch/mips/boot/dts/loongson/ls3-gs464e.dtsi   |  18 ++
>   .../boot/dts/loongson/ls3-rs780e-pch.dtsi     |  35 +++
>   arch/mips/boot/dts/loongson/ls3a-package.dtsi |  59 +++++
>   .../boot/dts/loongson/ls3a1000_780e_1way.dts  |  12 +
>   .../boot/dts/loongson/ls3a1000_780e_2way.dts  |  13 ++
>   .../boot/dts/loongson/ls3a1000_780e_4way.dts  |  13 ++
>   .../boot/dts/loongson/ls3a2000_780e_1way.dts  |  12 +
>   .../boot/dts/loongson/ls3a2000_780e_2way.dts  |  13 ++
>   .../boot/dts/loongson/ls3a2000_780e_4way.dts  |  13 ++
>   .../boot/dts/loongson/ls3a3000_780e_1way.dts  |  12 +
>   .../boot/dts/loongson/ls3a3000_780e_2way.dts  |  13 ++
>   .../boot/dts/loongson/ls3a3000_780e_4way.dts  |  13 ++
>   arch/mips/boot/dts/loongson/ls3b-package.dtsi |  59 +++++
>   .../mips/boot/dts/loongson/ls3b_780e_1way.dts |  13 ++
>   .../mips/boot/dts/loongson/ls3b_780e_2way.dts |  13 ++
>   arch/mips/include/asm/bootinfo.h              |   1 -
>   arch/mips/include/asm/cop2.h                  |   2 +-
>   arch/mips/include/asm/cpu-type.h              |   6 +-
>   arch/mips/include/asm/cpu.h                   |   4 +-
>   arch/mips/include/asm/hazards.h               |   2 +-
>   arch/mips/include/asm/io.h                    |   2 +-
>   arch/mips/include/asm/irqflags.h              |   2 +-
>   .../mach-loongson2ef/cpu-feature-overrides.h  |  45 ++++
>   .../cs5536/cs5536.h                           |   0
>   .../cs5536/cs5536_mfgpt.h                     |   0
>   .../cs5536/cs5536_pci.h                       |   0
>   .../cs5536/cs5536_vsm.h                       |   0
>   .../loongson2ef.h}                            |  31 +--
>   .../machine.h                                 |   6 -
>   .../mc146818rtc.h                             |   5 +-
>   .../mem.h                                     |   6 +-
>   arch/mips/include/asm/mach-loongson2ef/pci.h  |  43 ++++
>   .../include/asm/mach-loongson2ef/spaces.h     |  10 +
>   .../asm/mach-loongson64/builtin_dtbs.h        |  26 +++
>   .../mach-loongson64/cpu-feature-overrides.h   |   3 -
>   arch/mips/include/asm/mach-loongson64/irq.h   |   6 +-
>   .../asm/mach-loongson64/kernel-entry-init.h   |  74 ------
>   .../include/asm/mach-loongson64/loongson64.h  |  50 ++++
>   .../mips/include/asm/mach-loongson64/mmzone.h |  16 --
>   arch/mips/include/asm/mach-loongson64/pci.h   |  41 +---
>   .../include/asm/mach-loongson64/workarounds.h |   4 +-
>   arch/mips/include/asm/module.h                |   8 +-
>   arch/mips/include/asm/pgtable-bits.h          |   2 +-
>   arch/mips/include/asm/processor.h             |   2 +-
>   arch/mips/include/asm/r4kcache.h              |   4 +-
>   arch/mips/kernel/cpu-probe.c                  |  14 +-
>   arch/mips/kernel/idle.c                       |   2 +-
>   arch/mips/kernel/perf_event_mipsxx.c          |   4 +-
>   arch/mips/kernel/setup.c                      |   2 +-
>   arch/mips/kernel/traps.c                      |   2 +-
>   arch/mips/lib/csum_partial.S                  |   4 +-
>   arch/mips/loongson2ef/Kconfig                 |  93 ++++++++
>   arch/mips/loongson2ef/Makefile                |  18 ++
>   arch/mips/loongson2ef/Platform                |  32 +++
>   .../common/Makefile                           |   0
>   .../common/bonito-irq.c                       |   2 +-
>   .../common/cmdline.c                          |   2 +-
>   .../common/cs5536/Makefile                    |   0
>   .../common/cs5536/cs5536_acc.c                |   0
>   .../common/cs5536/cs5536_ehci.c               |   0
>   .../common/cs5536/cs5536_ide.c                |   0
>   .../common/cs5536/cs5536_isa.c                |   0
>   .../common/cs5536/cs5536_mfgpt.c              |   0
>   .../common/cs5536/cs5536_ohci.c               |   0
>   .../common/cs5536/cs5536_pci.c                |   0
>   .../common/early_printk.c                     |   2 +-
>   arch/mips/loongson2ef/common/env.c            |  71 ++++++
>   .../{loongson64 => loongson2ef}/common/init.c |   7 +-
>   .../{loongson64 => loongson2ef}/common/irq.c  |   2 +-
>   .../common/machtype.c                         |   3 +-
>   .../{loongson64 => loongson2ef}/common/mem.c  |  40 +---
>   .../{loongson64 => loongson2ef}/common/pci.c  |  11 +-
>   .../common/platform.c                         |   0
>   .../{loongson64 => loongson2ef}/common/pm.c   |   2 +-
>   .../common/reset.c                            |  23 +-
>   .../{loongson64 => loongson2ef}/common/rtc.c  |   0
>   .../common/serial.c                           |  37 +--
>   .../common/setup.c                            |   2 +-
>   .../{loongson64 => loongson2ef}/common/time.c |   2 +-
>   .../common/uart_base.c                        |  10 +-
>   .../fuloong-2e/Makefile                       |   0
>   .../fuloong-2e/dma.c                          |   0
>   .../fuloong-2e/irq.c                          |   2 +-
>   .../fuloong-2e/reset.c                        |   2 +-
>   .../lemote-2f/Makefile                        |   0
>   .../lemote-2f/clock.c                         |   2 +-
>   .../lemote-2f/dma.c                           |   0
>   .../lemote-2f/ec_kb3310b.c                    |   0
>   .../lemote-2f/ec_kb3310b.h                    |   0
>   .../lemote-2f/irq.c                           |   2 +-
>   .../lemote-2f/machtype.c                      |   2 +-
>   .../lemote-2f/pm.c                            |   2 +-
>   .../lemote-2f/reset.c                         |   2 +-
>   arch/mips/loongson64/Kconfig                  | 126 +---------
>   arch/mips/loongson64/Makefile                 |  23 +-
>   arch/mips/loongson64/Platform                 |  36 +--
>   .../loongson64/{loongson-3 => }/acpi_init.c   |   3 +-
>   .../loongson64/{loongson-3 => }/cop2-ex.c     |   5 +-
>   arch/mips/loongson64/{loongson-3 => }/dma.c   |   6 +-
>   arch/mips/loongson64/{common => }/env.c       | 139 ++++++-----
>   arch/mips/loongson64/{loongson-3 => }/hpet.c  |   0
>   arch/mips/loongson64/irq.c                    |  27 +++
>   arch/mips/loongson64/loongson-3/Makefile      |  11 -
>   arch/mips/loongson64/loongson-3/irq.c         | 158 -------------
>   arch/mips/loongson64/{loongson-3 => }/numa.c  |   4 +-
>   arch/mips/loongson64/pci.c                    |  45 ++++
>   .../loongson64/{loongson-3 => }/platform.c    |   0
>   arch/mips/loongson64/reset.c                  |  58 +++++
>   arch/mips/loongson64/setup.c                  | 107 +++++++++
>   arch/mips/loongson64/{loongson-3 => }/smp.c   |  28 +--
>   arch/mips/loongson64/{loongson-3 => }/smp.h   |   0
>   arch/mips/mm/c-r4k.c                          |  32 +--
>   arch/mips/mm/page.c                           |   2 +-
>   arch/mips/mm/tlb-r4k.c                        |   4 +-
>   arch/mips/mm/tlbex.c                          |   6 +-
>   arch/mips/oprofile/Makefile                   |   4 +-
>   arch/mips/oprofile/common.c                   |   4 +-
>   arch/mips/oprofile/op_model_loongson2.c       |   2 +-
>   arch/mips/oprofile/op_model_loongson3.c       |   2 +-
>   arch/mips/pci/Makefile                        |   2 +-
>   arch/mips/pci/fixup-fuloong2e.c               |   2 +-
>   arch/mips/pci/fixup-lemote2f.c                |   2 +-
>   arch/mips/pci/ops-loongson2.c                 |   2 +-
>   arch/mips/pci/ops-loongson3.c                 |   2 +-
>   drivers/cpufreq/loongson2_cpufreq.c           |   2 +-
>   drivers/gpio/Kconfig                          |   2 +-
>   drivers/gpio/gpio-loongson.c                  |   4 +-
>   drivers/irqchip/Kconfig                       |  17 ++
>   drivers/irqchip/Makefile                      |   2 +
>   drivers/irqchip/irq-i8259.c                   |  47 +++-
>   drivers/irqchip/irq-ls3-htintc.c              | 145 ++++++++++++
>   drivers/irqchip/irq-ls3-iointc.c              | 216 ++++++++++++++++++
>   drivers/irqchip/irq-mips-cpu.c                |   2 +-
>   drivers/platform/mips/cpu_hwmon.c             |   2 +-
>   include/drm/drm_cache.h                       |   2 +-
>   148 files changed, 2064 insertions(+), 841 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
>   create mode 100644 Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>   create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
>   create mode 100644 arch/mips/boot/dts/loongson/Makefile
>   create mode 100644 arch/mips/boot/dts/loongson/ls3-2nodes.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3-4nodes.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3-cpus.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3-gs464.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3-gs464e.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3-rs780e-pch.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a-package.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a1000_780e_1way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a1000_780e_2way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a1000_780e_4way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a2000_780e_1way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a2000_780e_2way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a2000_780e_4way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a3000_780e_1way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a3000_780e_2way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3a3000_780e_4way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3b-package.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/ls3b_780e_1way.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls3b_780e_2way.dts
>   create mode 100644 arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
>   rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536.h (100%)
>   rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_mfgpt.h (100%)
>   rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_pci.h (100%)
>   rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_vsm.h (100%)
>   rename arch/mips/include/asm/{mach-loongson64/loongson.h => mach-loongson2ef/loongson2ef.h} (91%)
>   rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/machine.h (80%)
>   rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mc146818rtc.h (80%)
>   rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mem.h (86%)
>   create mode 100644 arch/mips/include/asm/mach-loongson2ef/pci.h
>   create mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
>   create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
>   delete mode 100644 arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
>   create mode 100644 arch/mips/include/asm/mach-loongson64/loongson64.h
>   create mode 100644 arch/mips/loongson2ef/Kconfig
>   create mode 100644 arch/mips/loongson2ef/Makefile
>   create mode 100644 arch/mips/loongson2ef/Platform
>   rename arch/mips/{loongson64 => loongson2ef}/common/Makefile (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/bonito-irq.c (97%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cmdline.c (97%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/Makefile (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_acc.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ehci.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ide.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_isa.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_mfgpt.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ohci.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_pci.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/early_printk.c (97%)
>   create mode 100644 arch/mips/loongson2ef/common/env.c
>   rename arch/mips/{loongson64 => loongson2ef}/common/init.c (90%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/irq.c (98%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/machtype.c (94%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/mem.c (72%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/pci.c (89%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/platform.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/pm.c (99%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/reset.c (77%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/rtc.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/serial.c (63%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/setup.c (97%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/time.c (96%)
>   rename arch/mips/{loongson64 => loongson2ef}/common/uart_base.c (77%)
>   rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/Makefile (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/dma.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/irq.c (98%)
>   rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/reset.c (93%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/Makefile (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/clock.c (98%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/dma.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.c (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.h (100%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/irq.c (99%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/machtype.c (98%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/pm.c (99%)
>   rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/reset.c (99%)
>   rename arch/mips/loongson64/{loongson-3 => }/acpi_init.c (99%)
>   rename arch/mips/loongson64/{loongson-3 => }/cop2-ex.c (88%)
>   rename arch/mips/loongson64/{loongson-3 => }/dma.c (82%)
>   rename arch/mips/loongson64/{common => }/env.c (77%)
>   rename arch/mips/loongson64/{loongson-3 => }/hpet.c (100%)
>   create mode 100644 arch/mips/loongson64/irq.c
>   delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
>   delete mode 100644 arch/mips/loongson64/loongson-3/irq.c
>   rename arch/mips/loongson64/{loongson-3 => }/numa.c (98%)
>   create mode 100644 arch/mips/loongson64/pci.c
>   rename arch/mips/loongson64/{loongson-3 => }/platform.c (100%)
>   create mode 100644 arch/mips/loongson64/reset.c
>   create mode 100644 arch/mips/loongson64/setup.c
>   rename arch/mips/loongson64/{loongson-3 => }/smp.c (98%)
>   rename arch/mips/loongson64/{loongson-3 => }/smp.h (100%)
>   create mode 100644 drivers/irqchip/irq-ls3-htintc.c
>   create mode 100644 drivers/irqchip/irq-ls3-iointc.c
>
