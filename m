Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B20E9B3331
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2019 04:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbfIPCSW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Sep 2019 22:18:22 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45472 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfIPCSW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Sep 2019 22:18:22 -0400
Received: by mail-io1-f67.google.com with SMTP id f12so75086762iog.12;
        Sun, 15 Sep 2019 19:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dS4LWhWoQIfaXS1IeYxaej6aBtDblxm9LQxI68sQRY=;
        b=W/rZELLdm6jGFQyYZEYjKkRThLiaWaerFGR6QDYSerJLXDEJ0fX3JTvokIsVZN17ie
         SvyexTHjTcgpGb6AXyl9u1cv5jjKG20woJbwSVBHV6YZjtnDsI0idoQb/FL6o9IhM3B4
         JndOOVFSsuhDpAP9x0++ZpuQufr9JjO85RPy6/qGpBrBLHTYjfrmJfdzsnv+FG2SXikm
         eGL3NnTeRs4KjGYjFRTUVv1wbgO3tLvn35EftcSrEKLwSwG1RThKUqq6JcFRHN7O7729
         Nee1iLxrXhhWQRENwJ/cHiUfRYkyD2J602bacx23pGZYVs0BZp5M40UzQZjJl6alG8fl
         dXrA==
X-Gm-Message-State: APjAAAVvTLtAU9wrj1MbxC+fGHdSxGVFz3vyWRguvWmMnsbWS/SxjtcQ
        5cB1IoVTpqB72gZripBTRk9OU6o15GyYXamUztk=
X-Google-Smtp-Source: APXvYqx67+sH4dP6XUpiQpjvCg6NSKyRSXSAmKmIcdU0FZw9SLNPkEfoqdBhjzES9ugutm+X/W4qjA3DfQZRetGvU3I=
X-Received: by 2002:a5d:8247:: with SMTP id n7mr12977515ioo.35.1568600300797;
 Sun, 15 Sep 2019 19:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-3-jiaxun.yang@flygoat.com> <20190910001248.few7zmxsrg72mdum@pburton-laptop>
In-Reply-To: <20190910001248.few7zmxsrg72mdum@pburton-laptop>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 16 Sep 2019 10:23:06 +0800
Message-ID: <CAAhV-H7LJ=o_7_b9n2ANRDOMAg=+5XrLLWo1DSCB9Xon+Z7GiQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] MIPS: Loongson64: separate loongson2ef/loongson64
 code
To:     Paul Burton <paul.burton@mips.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.co" <mark.rutland@arm.co>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 10, 2019 at 6:26 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi Jiaxun & Huacai,
>
> On Thu, Sep 05, 2019 at 10:42:59PM +0800, Jiaxun Yang wrote:
> > As later model of GSx64 family processors including 2-series-soc have
> > similar design with initial loongson3a while loongson2e/f seems less
> > identical, we separate loongson2e/f support code out of mach-loongson64
> > to make our life easier.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> I looked at applying the first 3 patches of this series to mips-next &
> squashed in the relevant defconfig updates, then was looking at applying
> Huacai's recent 3 patch series.
>
> One issue is that they conflict, but beyond that it showed me that this
> patch deletes kernel-entry-init.h entirely. Was that intentional? If so
> it should be a separate patch & it needs an explanation.
>
> Please could the two of you make it clear what branch & commit your
> patches are based upon? Ideally it should be the current head of the
> mips-next branch.
Hi, Paul,

Jiaxun has replied your question but his email is blocked by mail-list
for some unkown reasons. We have discussed and we both think that the
big-rework-patchset need some more improvements and the Loongson-3A R4
patchset can be merged first.

Huacai

>
> Also Jiaxun, it's really hard to see whether this patch is making any
> functional changes in addition to the duplication & renaming. I think it
> would be much better to split this into a few steps across multiple
> commits, something like this:
>
> 1) Copy the loongson64 directory to loongson2ef, and keep the copy as-is
>    *except* for the removal of the loongson2ef/loongon-3 subdirectory.
>    Delete loongson64/fuloong-2e & loongson64/lemote-2f.
>
> 2) Now clean up the loongson64 directory by moving files up from the
>    loongson-3 subdirectory.
>
> 3) Now clean up code, removing #ifdef's etc that no longer make sense.
>
> Provide the -M & -C flags to git format-patch when generating your
> patches. --find-copies-harder might help with the first step, if it's
> practical to run.
>
> That way each commit will be easier to review, and issues like the
> deletion of kernel-entry-init.h will be easier to spot.
>
> For now I undid the whole thing. It's getting late in the cycle anyway,
> so this will probably be v5.5 material.
>
> Thanks,
>     Paul
>
> > ---
> >  arch/mips/Kbuild.platforms                    |   1 +
> >  arch/mips/Kconfig                             |  51 +++++--
> >  arch/mips/include/asm/bootinfo.h              |   1 -
> >  .../mach-loongson2ef/cpu-feature-overrides.h  |  45 +++++++
> >  .../cs5536/cs5536.h                           |   0
> >  .../cs5536/cs5536_mfgpt.h                     |   0
> >  .../cs5536/cs5536_pci.h                       |   0
> >  .../cs5536/cs5536_vsm.h                       |   0
> >  .../loongson2ef.h}                            |  29 +---
> >  .../machine.h                                 |   6 -
> >  .../mc146818rtc.h                             |   5 +-
> >  .../mem.h                                     |   6 +-
> >  arch/mips/include/asm/mach-loongson2ef/pci.h  |  43 ++++++
> >  .../include/asm/mach-loongson2ef/spaces.h     |  10 ++
> >  .../mach-loongson64/cpu-feature-overrides.h   |   8 +-
> >  arch/mips/include/asm/mach-loongson64/irq.h   |   7 +-
> >  .../asm/mach-loongson64/kernel-entry-init.h   |  74 ----------
> >  .../include/asm/mach-loongson64/loongson64.h  |  48 +++++++
> >  .../mips/include/asm/mach-loongson64/mmzone.h |  16 ---
> >  arch/mips/include/asm/mach-loongson64/pci.h   |  41 +-----
> >  .../include/asm/mach-loongson64/workarounds.h |   4 +-
> >  arch/mips/loongson2ef/Kconfig                 |  93 +++++++++++++
> >  arch/mips/loongson2ef/Makefile                |  18 +++
> >  arch/mips/loongson2ef/Platform                |  32 +++++
> >  .../common/Makefile                           |   0
> >  .../common/bonito-irq.c                       |   2 +-
> >  .../common/cmdline.c                          |   2 +-
> >  .../common/cs5536/Makefile                    |   0
> >  .../common/cs5536/cs5536_acc.c                |   0
> >  .../common/cs5536/cs5536_ehci.c               |   0
> >  .../common/cs5536/cs5536_ide.c                |   0
> >  .../common/cs5536/cs5536_isa.c                |   0
> >  .../common/cs5536/cs5536_mfgpt.c              |   0
> >  .../common/cs5536/cs5536_ohci.c               |   0
> >  .../common/cs5536/cs5536_pci.c                |   0
> >  .../common/early_printk.c                     |   2 +-
> >  arch/mips/loongson2ef/common/env.c            |  71 ++++++++++
> >  .../{loongson64 => loongson2ef}/common/init.c |   7 +-
> >  .../{loongson64 => loongson2ef}/common/irq.c  |   2 +-
> >  .../common/machtype.c                         |   3 +-
> >  .../{loongson64 => loongson2ef}/common/mem.c  |  40 +-----
> >  .../{loongson64 => loongson2ef}/common/pci.c  |  11 +-
> >  .../common/platform.c                         |   0
> >  .../{loongson64 => loongson2ef}/common/pm.c   |   2 +-
> >  .../common/reset.c                            |  23 +---
> >  .../{loongson64 => loongson2ef}/common/rtc.c  |   0
> >  .../common/serial.c                           |  37 +----
> >  .../common/setup.c                            |   2 +-
> >  .../{loongson64 => loongson2ef}/common/time.c |   2 +-
> >  .../common/uart_base.c                        |  10 +-
> >  .../fuloong-2e/Makefile                       |   0
> >  .../fuloong-2e/dma.c                          |   0
> >  .../fuloong-2e/irq.c                          |   2 +-
> >  .../fuloong-2e/reset.c                        |   2 +-
> >  .../lemote-2f/Makefile                        |   0
> >  .../lemote-2f/clock.c                         |   2 +-
> >  .../lemote-2f/dma.c                           |   0
> >  .../lemote-2f/ec_kb3310b.c                    |   0
> >  .../lemote-2f/ec_kb3310b.h                    |   0
> >  .../lemote-2f/irq.c                           |   2 +-
> >  .../lemote-2f/machtype.c                      |   2 +-
> >  .../lemote-2f/pm.c                            |   2 +-
> >  .../lemote-2f/reset.c                         |   2 +-
> >  arch/mips/loongson64/Kconfig                  | 126 +-----------------
> >  arch/mips/loongson64/Makefile                 |  23 +---
> >  arch/mips/loongson64/Platform                 |  26 +---
> >  .../loongson64/{loongson-3 => }/acpi_init.c   |   3 +-
> >  .../loongson64/{loongson-3 => }/cop2-ex.c     |   5 +-
> >  arch/mips/loongson64/{loongson-3 => }/dma.c   |   6 +-
> >  arch/mips/loongson64/{common => }/env.c       |  72 +++-------
> >  arch/mips/loongson64/{loongson-3 => }/hpet.c  |   0
> >  arch/mips/loongson64/{loongson-3 => }/irq.c   |  40 +++++-
> >  arch/mips/loongson64/loongson-3/Makefile      |  11 --
> >  arch/mips/loongson64/{loongson-3 => }/numa.c  |   4 +-
> >  arch/mips/loongson64/pci.c                    |  45 +++++++
> >  .../loongson64/{loongson-3 => }/platform.c    |   0
> >  arch/mips/loongson64/reset.c                  |  58 ++++++++
> >  arch/mips/loongson64/setup.c                  |  91 +++++++++++++
> >  arch/mips/loongson64/{loongson-3 => }/smp.c   |   4 +-
> >  arch/mips/loongson64/{loongson-3 => }/smp.h   |   0
> >  arch/mips/oprofile/op_model_loongson2.c       |   2 +-
> >  arch/mips/oprofile/op_model_loongson3.c       |   2 +-
> >  arch/mips/pci/Makefile                        |   2 +-
> >  arch/mips/pci/fixup-fuloong2e.c               |   2 +-
> >  arch/mips/pci/fixup-lemote2f.c                |   2 +-
> >  arch/mips/pci/ops-loongson2.c                 |   2 +-
> >  arch/mips/pci/ops-loongson3.c                 |   2 +-
> >  drivers/cpufreq/loongson2_cpufreq.c           |   2 +-
> >  drivers/gpio/gpio-loongson.c                  |   2 +-
> >  drivers/platform/mips/cpu_hwmon.c             |   2 +-
> >  90 files changed, 720 insertions(+), 582 deletions(-)
> >  create mode 100644 arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
> >  rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536.h (100%)
> >  rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_mfgpt.h (100%)
> >  rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_pci.h (100%)
> >  rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_vsm.h (100%)
> >  rename arch/mips/include/asm/{mach-loongson64/loongson.h => mach-loongson2ef/loongson2ef.h} (91%)
> >  rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/machine.h (80%)
> >  rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mc146818rtc.h (80%)
> >  rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mem.h (86%)
> >  create mode 100644 arch/mips/include/asm/mach-loongson2ef/pci.h
> >  create mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
> >  delete mode 100644 arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
> >  create mode 100644 arch/mips/include/asm/mach-loongson64/loongson64.h
> >  create mode 100644 arch/mips/loongson2ef/Kconfig
> >  create mode 100644 arch/mips/loongson2ef/Makefile
> >  create mode 100644 arch/mips/loongson2ef/Platform
> >  rename arch/mips/{loongson64 => loongson2ef}/common/Makefile (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/bonito-irq.c (97%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cmdline.c (97%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/Makefile (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_acc.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ehci.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ide.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_isa.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_mfgpt.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ohci.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_pci.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/early_printk.c (97%)
> >  create mode 100644 arch/mips/loongson2ef/common/env.c
> >  rename arch/mips/{loongson64 => loongson2ef}/common/init.c (90%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/irq.c (98%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/machtype.c (94%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/mem.c (72%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/pci.c (89%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/platform.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/pm.c (99%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/reset.c (77%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/rtc.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/serial.c (63%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/setup.c (97%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/time.c (96%)
> >  rename arch/mips/{loongson64 => loongson2ef}/common/uart_base.c (77%)
> >  rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/Makefile (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/dma.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/irq.c (98%)
> >  rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/reset.c (93%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/Makefile (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/clock.c (98%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/dma.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.c (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.h (100%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/irq.c (99%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/machtype.c (98%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/pm.c (99%)
> >  rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/reset.c (99%)
> >  rename arch/mips/loongson64/{loongson-3 => }/acpi_init.c (99%)
> >  rename arch/mips/loongson64/{loongson-3 => }/cop2-ex.c (88%)
> >  rename arch/mips/loongson64/{loongson-3 => }/dma.c (82%)
> >  rename arch/mips/loongson64/{common => }/env.c (79%)
> >  rename arch/mips/loongson64/{loongson-3 => }/hpet.c (100%)
> >  rename arch/mips/loongson64/{loongson-3 => }/irq.c (77%)
> >  delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
> >  rename arch/mips/loongson64/{loongson-3 => }/numa.c (98%)
> >  create mode 100644 arch/mips/loongson64/pci.c
> >  rename arch/mips/loongson64/{loongson-3 => }/platform.c (100%)
> >  create mode 100644 arch/mips/loongson64/reset.c
> >  create mode 100644 arch/mips/loongson64/setup.c
> >  rename arch/mips/loongson64/{loongson-3 => }/smp.c (99%)
> >  rename arch/mips/loongson64/{loongson-3 => }/smp.h (100%)
