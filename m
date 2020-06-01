Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6851EA564
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgFAN4d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 09:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAN4d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 09:56:33 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D7EC05BD43;
        Mon,  1 Jun 2020 06:56:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v2so3499199pfv.7;
        Mon, 01 Jun 2020 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NnJ2aNDnHxnX78YplbfmtL0qZ9sbXLKRHhLXydSwmbs=;
        b=Zf2g5J8PciyeJ3M9+j9tm0SwFeo02JbuT4cP06zTvhbTncf3t6qGuKO3/zDXILg+VA
         /lVKDICquxnsOLoCRpcX1QWuRbOsdmb/53MIiJOEs0NqIXvhe/JSmYpEi7kP6oFItp1a
         aqN+vPmWGGZl7ha1s6daaAp31F3bz7A2zVCVXBgpZaopOCp3J9eQiHyhyF3Oq/bUDZ6V
         C30GTaRiN68Q0QZB1pHk9lf+tLEHkYxkMuzLtTXhdYyNQ3icrxRjUlSaa86al0+kisyK
         JXxeKcE7NozwBzv8b0ytibUZPujyh+QkpzNOAFhr5S10S10imEDYbpmUikjfyiC/QW4Y
         qkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NnJ2aNDnHxnX78YplbfmtL0qZ9sbXLKRHhLXydSwmbs=;
        b=h7bXIEOu4YWUVdwbh0rXjwnnYc/cp26cwQU/nBtACqXR5+DNVti7wLyMBXU7Ny5aFb
         kFnpPuHW8hW0H8YaKs9+J1YH2NnoJDiymlrQQAGTLpP8lMoLURVOw/rmc4i/MmaESYBZ
         k10TBqsC/aintHRxlI1dpdFflwE2pu05SBG0z2g86ZdqNv9ayCAd0c8Uj9ykRbrqNJPd
         KtM4YcxChtlg0RPgxyA5Tgyac82p4HzbPowQRlpXGsiSTp/JAkqNuZOkS2DysD2hRYgF
         +6tY6m8u4RYNFqZw6JrmSOKE0NRh/n4g4Y9Lq96wke5kfM7LxNnuOanVVMfSb1lFbu2L
         GNFw==
X-Gm-Message-State: AOAM531x4Degw20qm8lEstYUUOGsFBZUmqFQEK4kP7gyhOxdAc3CdbmC
        W4q8HJYZIOMxVYPHAZ8f6E0qli5YLKqm2oiAKv4=
X-Google-Smtp-Source: ABdhPJzp4kqPEV9xtuw6yNWIcBe/q7YWBMM7fE0PPWGX8XNJn90BPLkgNVLDiPMj9eaJDZp2o54lQV8nSax2uYQma+4=
X-Received: by 2002:a62:1c46:: with SMTP id c67mr14165404pfc.170.1591019793048;
 Mon, 01 Jun 2020 06:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru> <20200601122121.15809-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200601122121.15809-7-Sergey.Semin@baikalelectronics.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Jun 2020 16:56:21 +0300
Message-ID: <CAHp75Vec8DA+dVDGif7UhBtxDPFZG0nnCav=qLJON=j8=9QxSA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 1, 2020 at 3:26 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Add myself as a maintainer of MIPS CPU and GIC IRQchip, MIPS GIC timer
> and MIPS CPS CPUidle drivers.
...
> +MIPS CORE DRIVERS
> +M:     Serge Semin <fancer.lancer@gmail.com>
> +L:     linux-mips@vger.kernel.org
> +S:     Supported
> +F:     drivers/bus/mips_cdmm.c
> +F:     drivers/irqchip/irq-mips-cpu.c
> +F:     drivers/irqchip/irq-mips-gic.c
> +F:     drivers/clocksource/mips-gic-timer.c
> +F:     drivers/cpuidle/cpuidle-cps.c

I think nowadays checkpatch.pl warns on wrong ordering in this data base.


-- 
With Best Regards,
Andy Shevchenko
