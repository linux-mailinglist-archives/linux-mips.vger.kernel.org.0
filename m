Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A651389BF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 04:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733187AbgAMDcz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 22:32:55 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:46212 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732961AbgAMDcz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jan 2020 22:32:55 -0500
Received: by mail-io1-f65.google.com with SMTP id t26so8298489ioi.13;
        Sun, 12 Jan 2020 19:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jtJ5n8bvLyOE+deBSBgZkyAEPr+Moq3BE/Wzkoo8Gwc=;
        b=DecjkbC4A5B80De2Y//7TaLVOnf4MRht3jJCHdfa8Iy171xkOqRDBMhQZeLI2UNzsG
         jXz+4FkfbyfzFMJAggS/GtNNtipRvfKWr5B/V7L6IDJ3U4zGDEeAzrTPO7fkUalALRAx
         tsH88r/IwmoCv3lokb6YuG6DvQl0JUp7sjpzkwTgbKDk/4yIDzqPFmVJEZAO6irdBp5J
         Hi9hkA7mhpZR2vo4S6zpr2ntHrk2FP3S5AAppj8kIBMUplBP7tXFBQTG6d/2DR/z1w0B
         bRIxqVSje4RYQTjLYA4572cWf4DysoyYkLde7DidW1U1vyJ79ZKCMKmuJv1CHIXkZMSW
         FjqQ==
X-Gm-Message-State: APjAAAV5tX4wIddUdtuIlqqGLB1KbrE/EUQVmxwZAefu3qpdLmRIztUr
        /5xxTrLHgHO7X4pSO3hSUqd3EhgTPVKEe05IWc4=
X-Google-Smtp-Source: APXvYqza8aMS/tYZ+uop2NYOv26ngRJNYJPtaRsA2dDhrQBDYih57vE/XL5eneMMy8BoheZ2FasTsR2fVAXey3NLiOc=
X-Received: by 2002:a6b:4e0b:: with SMTP id c11mr9716656iob.143.1578886374641;
 Sun, 12 Jan 2020 19:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com> <20200112081416.722218-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 13 Jan 2020 11:38:04 +0800
Message-ID: <CAAhV-H4Q0z6R6RrUwDdNYj++YkqrAWRpC=RfhGY6-5_Kj1O-jA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Modernize Loongson64 Machine
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Sun, Jan 12, 2020 at 4:21 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Loongson have a long history of contributing their code to mainline kernel.
> However, it seems like recent years, they are focusing on maintain a kernel by themselves
> rather than contribute there code to the community.
>
> Kernel is progress rapidly too. Their code slept in mainline for a long peroid without proper
> maintainance and became outdated.
>
> This patchset brings modern DeviceTree and irqchip support to the Loongson64 machine, and leaves
> Loongson 2e/f alone since they are too legacy to touch.
I think you can provide a irqchip hierarchy for Loongson3 here. i.e.,
the flowchart of cpuintc, iointc, htpic, i8259, and so on.

Huacai

>
> PCI and some legacy I/O device will be converted later, together with LS7A PCH support.
>
> v1:
> - dt-bindings fixup according to Rob's comments
> - irqchip fixup according to Marc's comments
> - ls3-iointc: Make Core&IP map per-IRQ
> - Regenerate kconfigs
> - Typo & style improvements
>
> v2:
> - dt-bindings: Fix IOINTC, collect Rob's review tag
> - dtbs: Drop CPU Node, merge different ways according to Huacai and Paul's comments
>
> v3:
> - Split code have been merged
> - Fix IOINTC binding to allow map any child IRQ to and parent
> - Convert "HTINTC" into "HTPIC", which mixed HT vectors processing and i8259
> - Naming style fix according to Huacai's suggestions
>
> Jiaxun Yang (10):
>   dt-bindings: Document loongson vendor-prefix
>   irqchip: Add driver for Loongson I/O interrupt controller
>   dt-bindings: interrupt-controller: Add Loongson IOINTC
>   irqchip: Add driver for Loongson-3 HyperTransport PIC controller
>   dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
>   irqchip: mips-cpu: Convert to simple domain
>   MIPS: Loongson64: Drop legacy IRQ code
>   dt-bindings: mips: Add loongson boards
>   MIPS: Loongson64: Add generic dts
>   MIPS: Loongson64: Load built-in dtbs
>
>  .../interrupt-controller/loongson,htpic.yaml  |  59 +++
>  .../interrupt-controller/loongson,iointc.yaml |  92 +++++
>  .../bindings/mips/loongson/devices.yaml       |  29 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/mips/Kconfig                             |   6 +-
>  arch/mips/boot/dts/Makefile                   |   1 +
>  arch/mips/boot/dts/loongson/Makefile          |   5 +
>  .../boot/dts/loongson/loongson3-package.dtsi  |  62 ++++
>  .../dts/loongson/loongson3_4core_rs780e.dts   |  25 ++
>  .../dts/loongson/loongson3_8core_rs780e.dts   |  25 ++
>  arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  26 ++
>  arch/mips/include/asm/i8259.h                 |   1 +
>  .../include/asm/mach-loongson64/boot_param.h  |   2 +
>  .../asm/mach-loongson64/builtin_dtbs.h        |  13 +
>  arch/mips/include/asm/mach-loongson64/irq.h   |  32 +-
>  .../include/asm/mach-loongson64/loongson.h    |   1 +
>  arch/mips/loongson64/Makefile                 |   2 +-
>  arch/mips/loongson64/env.c                    |  23 ++
>  arch/mips/loongson64/init.c                   |   6 +
>  arch/mips/loongson64/irq.c                    | 162 ---------
>  arch/mips/loongson64/setup.c                  |  16 +
>  arch/mips/loongson64/smp.c                    |  28 +-
>  drivers/irqchip/Kconfig                       |  18 +
>  drivers/irqchip/Makefile                      |   2 +
>  drivers/irqchip/irq-i8259.c                   |   6 +-
>  drivers/irqchip/irq-loongson-htpic.c          | 147 ++++++++
>  drivers/irqchip/irq-loongson-iointc.c         | 338 ++++++++++++++++++
>  drivers/irqchip/irq-mips-cpu.c                |   2 +-
>  28 files changed, 915 insertions(+), 216 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
>  create mode 100644 arch/mips/boot/dts/loongson/Makefile
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3-package.dtsi
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
>  create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi
>  create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
>  delete mode 100644 arch/mips/loongson64/irq.c
>  create mode 100644 drivers/irqchip/irq-loongson-htpic.c
>  create mode 100644 drivers/irqchip/irq-loongson-iointc.c
>
> --
> 2.24.1
>
