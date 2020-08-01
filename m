Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD04B235110
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 09:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgHAH7y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 1 Aug 2020 03:59:54 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34448 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgHAH7x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Aug 2020 03:59:53 -0400
Received: by mail-io1-f68.google.com with SMTP id q75so25743573iod.1
        for <linux-mips@vger.kernel.org>; Sat, 01 Aug 2020 00:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6p1amqN0kCvOPk8L44gib3tT6fwdyyu9zFaBgJyeISk=;
        b=d36IH0wWcNBHLZhjLMyx+aAOLbWL95TwrzT6mxU28/cy73oOxtvZIqr5k4GIkc98CI
         6wzm3XV4Na+l/jxyygnK61Y+rJ6VSqjnpEf9EcxuX0slF/wG3QRR/Yshe5NeLBcwnnxc
         5g6USTNjddGZ3UtlXTD+scohszE4LObrCDo860sDFjurSWY/EO2dZxNJmyCRlJ4DHgkt
         0PWiq9ToZPRgzldfD7t6KXqLlHBKDtFzpoHoJAe/uq94iw5FmOej0yKeIXH4f/QMyEpe
         7Sd8KioaRFKxn5ftp5ChK9rUx3nvCjjrNnp9BSvPlHaOu8kbeLJDwaOYajo0e+iDT60Y
         vrQA==
X-Gm-Message-State: AOAM531tyy0o7LTsOIHzcx4gwb4yZUQL6aSBXNhxWeKIMaS2awVfHDMt
        1zdxaLXdGEaD+qu0nGEfrwSYCoHzRyELc2fhiLJaXH1kCwE=
X-Google-Smtp-Source: ABdhPJyjZg5AF2MtH8jumkZZr7dJ9lXhjbXdirq4vNzVcaLOjgapeX/1OIaKVv3gBxVDC8dMXr1HUqsIrEEl4NqAXoc=
X-Received: by 2002:a6b:ce11:: with SMTP id p17mr7277494iob.125.1596268792756;
 Sat, 01 Aug 2020 00:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com> <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
In-Reply-To: <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 1 Aug 2020 15:59:41 +0800
Message-ID: <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Wed, May 6, 2020 at 1:30 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 于 2020年5月2日 GMT+08:00 下午12:55:43, Huacai Chen <chenhc@lemote.com> 写到:
> >Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
> >mode by default. However, gslq/gssq (16-bytes load/store instructions)
> >overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
> >gssq for optimization in kernel, we should enable COP2 usage in kernel.
> >
> >Please pay attention that in this patch we only enable COP2 in kernel,
> >which means it will lose ST0_CU2 when a process go to user space (try
> >to use COP2 in user space will trigger an exception and then grab COP2,
> >which is similar to FPU). And as a result, we need to modify the context
> >switching code because the new scheduled process doesn't contain ST0_CU2
> >in its THERAD_STATUS probably.
> >
> >Signed-off-by: Huacai Chen <chenhc@lemote.com>
>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
Does this patch have some unresolved problems, or there is something unclear?

Huacai
>
> >---
> >V3: Stop using ST0_MM and use ST0_CU2 instead (Thank Thomas and Maciej).
> >
> > arch/mips/boot/compressed/head.S   |  7 +++++++
> > arch/mips/include/asm/stackframe.h | 12 +++++++++---
> > arch/mips/kernel/head.S            | 18 +++++++++---------
> > arch/mips/kernel/r4k_switch.S      |  3 +++
> > arch/mips/kernel/traps.c           |  8 +++++++-
> > 5 files changed, 35 insertions(+), 13 deletions(-)
> >
> >diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
> >index 409cb48..4580316 100644
> >--- a/arch/mips/boot/compressed/head.S
> >+++ b/arch/mips/boot/compressed/head.S
> >@@ -14,11 +14,18 @@
> >
> > #include <asm/asm.h>
> > #include <asm/regdef.h>
> >+#include <asm/mipsregs.h>
> >
> >       .set noreorder
> >       .cprestore
> >       LEAF(start)
> > start:
> >+#ifdef CONFIG_CPU_LOONGSON64
> >+      mfc0    t0, CP0_STATUS
> >+      or      t0, ST0_CU2   /* make 16-bytes load/store instructions usable */
> >+      mtc0    t0, CP0_STATUS
> >+#endif
> >+
> >       /* Save boot rom start args */
> >       move    s0, a0
> >       move    s1, a1
> >diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
> >index 4d6ad90..c9ee7de 100644
> >--- a/arch/mips/include/asm/stackframe.h
> >+++ b/arch/mips/include/asm/stackframe.h
> >@@ -42,6 +42,12 @@
> >       cfi_restore \reg \offset \docfi
> >       .endm
> >
> >+#ifdef CONFIG_CPU_LOONGSON64
> >+#define ST0_CUMASK (ST0_CU0 | ST0_CU2)
> >+#else
> >+#define ST0_CUMASK ST0_CU0
> >+#endif
> >+
> > #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> > #define STATMASK 0x3f
> > #else
> >@@ -450,7 +456,7 @@
> >  */
> >               .macro  CLI
> >               mfc0    t0, CP0_STATUS
> >-              li      t1, ST0_CU0 | STATMASK
> >+              li      t1, ST0_CUMASK | STATMASK
> >               or      t0, t1
> >               xori    t0, STATMASK
> >               mtc0    t0, CP0_STATUS
> >@@ -463,7 +469,7 @@
> >  */
> >               .macro  STI
> >               mfc0    t0, CP0_STATUS
> >-              li      t1, ST0_CU0 | STATMASK
> >+              li      t1, ST0_CUMASK | STATMASK
> >               or      t0, t1
> >               xori    t0, STATMASK & ~1
> >               mtc0    t0, CP0_STATUS
> >@@ -477,7 +483,7 @@
> >  */
> >               .macro  KMODE
> >               mfc0    t0, CP0_STATUS
> >-              li      t1, ST0_CU0 | (STATMASK & ~1)
> >+              li      t1, ST0_CUMASK | (STATMASK & ~1)
> > #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> >               andi    t2, t0, ST0_IEP
> >               srl     t2, 2
> >diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> >index 3b02ffe..bca6399 100644
> >--- a/arch/mips/kernel/head.S
> >+++ b/arch/mips/kernel/head.S
> >@@ -43,20 +43,20 @@
> >       .set    pop
> >       .endm
> >
> >-      .macro  setup_c0_status_pri
> >-#ifdef CONFIG_64BIT
> >-      setup_c0_status ST0_KX 0
> >+#ifdef CONFIG_CPU_LOONGSON64
> >+#define ST0_SET ST0_KX | ST0_CU2
> >+#elif defined(CONFIG_64BIT)
> >+#define ST0_SET ST0_KX
> > #else
> >-      setup_c0_status 0 0
> >+#define ST0_SET 0
> > #endif
> >+
> >+      .macro  setup_c0_status_pri
> >+      setup_c0_status ST0_SET 0
> >       .endm
> >
> >       .macro  setup_c0_status_sec
> >-#ifdef CONFIG_64BIT
> >-      setup_c0_status ST0_KX ST0_BEV
> >-#else
> >-      setup_c0_status 0 ST0_BEV
> >-#endif
> >+      setup_c0_status ST0_SET ST0_BEV
> >       .endm
> >
> > #ifndef CONFIG_NO_EXCEPT_FILL
> >diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
> >index 58232ae..c2fde40 100644
> >--- a/arch/mips/kernel/r4k_switch.S
> >+++ b/arch/mips/kernel/r4k_switch.S
> >@@ -53,6 +53,9 @@
> >       nor     a3, $0, a3
> >       and     a2, a3
> >       or      a2, t1
> >+#ifdef CONFIG_CPU_LOONGSON64
> >+      or      a2, ST0_CU2   /* make 16-bytes load/store instructions usable */
> >+#endif
> >       mtc0    a2, CP0_STATUS
> >       move    v0, a0
> >       jr      ra
> >diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> >index 31968cb..5efc525 100644
> >--- a/arch/mips/kernel/traps.c
> >+++ b/arch/mips/kernel/traps.c
> >@@ -2108,9 +2108,15 @@ static void configure_status(void)
> >        * Disable coprocessors and select 32-bit or 64-bit addressing
> >        * and the 16/32 or 32/32 FPR register model.  Reset the BEV
> >        * flag that some firmware may have left set and the TS bit (for
> >-       * IP27).  Set XX for ISA IV code to work.
> >+       * IP27). Set XX for ISA IV code to work, and enable CU2 for
> >+       * Loongson-3 to make 16-bytes load/store instructions usable.
> >        */
> >+#ifndef CONFIG_CPU_LOONGSON64
> >       unsigned int status_set = ST0_CU0;
> >+#else
> >+      unsigned int status_set = ST0_CU0 | ST0_CU2;
> >+#endif
> >+
> > #ifdef CONFIG_64BIT
> >       status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
> > #endif
>
> --
> Jiaxun Yang
