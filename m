Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34B3419EEA
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 21:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbhI0TKS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 15:10:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235964AbhI0TKS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 15:10:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED0B960EB4;
        Mon, 27 Sep 2021 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632769720;
        bh=uAf1MxpYFlugCZ2GjmaYasvI1ecxPIYOvcmMPqvCgyU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M8cvOU29aUIHD4Gxeit43bR8aYDIts/QfKUTt8inLrZG8MjzFdaB7z88JWbl2tjJh
         ha1jvlcY9f+M5q/wwRlXPrVu8AUXV0divn/vtOwSmWP7xwZpJ3mV/KM1k4SRiKIq28
         zoUI4SyXfHjihWNxT7FnZPw8cEDYhQV9DxQ3ZeqnLTbulcf69DBM3EqNqS9vDy3+3H
         KgUTviLDykIjp2C4+tH9ClhevE78CTmswErHdxy9ygk2B/A4kuhCe8c4AupJQ7a/bX
         CfNbkUVvlOYjGf0MEE3PosxCWYULybJTIuLu11U+jN+SMCEYqYjOxGi+7Ehkp4vzGJ
         3CLlERv10KHwg==
Received: by mail-ed1-f51.google.com with SMTP id bd28so11924358edb.9;
        Mon, 27 Sep 2021 12:08:39 -0700 (PDT)
X-Gm-Message-State: AOAM532p3HHPiq+Le6x3CYdo7v828oKvNFrYXVAyJP+BlNW+dKvw6oY+
        GTutXW5JCrZWpgSJy4xDrSHBYLMo7MMYNW80kA==
X-Google-Smtp-Source: ABdhPJzy0nrFvTF1zgTVDH7QhyNMnLVtlp6yk8P68bqrNroyMF0EvlSnFg9GNH01lPElsTH2BpfVglkOgIUv37T40n0=
X-Received: by 2002:a50:8163:: with SMTP id 90mr1681708edc.271.1632769718534;
 Mon, 27 Sep 2021 12:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210924170546.805663-1-f.fainelli@gmail.com> <20210924170546.805663-8-f.fainelli@gmail.com>
In-Reply-To: <20210924170546.805663-8-f.fainelli@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Sep 2021 14:08:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLSiCb7-tHW3VTOTdMt=qahAij77zF2us-CZqXYAi0jmg@mail.gmail.com>
Message-ID: <CAL_JsqLSiCb7-tHW3VTOTdMt=qahAij77zF2us-CZqXYAi0jmg@mail.gmail.com>
Subject: Re: [PATCH 07/11] of/irq: Export of_irq_count to drivers
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 24, 2021 at 12:07 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> In order to build drivers/irqchip/irq-bcm7120-l2.c as a module, we will
> need to have of_irq_count() exported to modules.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/of/irq.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 352e14b007e7..949b9d1f8729 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -440,6 +440,7 @@ int of_irq_count(struct device_node *dev)
>
>         return nr;
>  }
> +EXPORT_SYMBOL_GPL(of_irq_count);

Please convert to use platform_irq_count() instead.

Rob
