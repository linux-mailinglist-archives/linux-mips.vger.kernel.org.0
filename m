Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA2F206FCF
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389222AbgFXJPf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:15:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387970AbgFXJPe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:15:34 -0400
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CF882082F;
        Wed, 24 Jun 2020 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592990133;
        bh=14K+VhMvuge//+mHFVRO68jMad3Xx5brMH+O3+ggBOk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IFQxL2bunzkopmfTsIvl2UbpyJSVNCbVz1tMkicOQpIhZE+i7/lWCftYg10E3XPAI
         LleqWHI0jaKN4UcquF75OjUnAAl7OdeSI1CZUwvRqOC11GAXNdmVhHLdaOFnoVbq1E
         XfG8K/JctUacbaPa4zvCuXENEZxWe4yQDQX+rA74=
Received: by mail-lj1-f182.google.com with SMTP id 9so1752239ljc.8;
        Wed, 24 Jun 2020 02:15:33 -0700 (PDT)
X-Gm-Message-State: AOAM533UbckesswlTmbt/oQeNGmzfV1ZPmHY9ngNSAuY/zZug+mGZ68u
        ONx4rT1rT0ygL8cH+U/nlA58qlLJp/ozW7Bl0iQ=
X-Google-Smtp-Source: ABdhPJxbxsux7XuzN8uOjxja4hquHGy/NKFHEFBm47OMUifwg0Hc5X+Fhkw49rQCA/MTWVvIK0zPn0Jq/i3BDFjZoEY=
X-Received: by 2002:a2e:954c:: with SMTP id t12mr13005177ljh.287.1592990131408;
 Wed, 24 Jun 2020 02:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn> <1592902276-3969-2-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1592902276-3969-2-git-send-email-yangtiezhu@loongson.cn>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 24 Jun 2020 11:15:20 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
Message-ID: <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
Subject: Re: [PATCH 1/7] irqchip: Fix potential resource leaks
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Kukjin Kim <kgene@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 Jun 2020 at 10:51, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> There exists some potential resource leaks in the error path, fix them.

This should be split per driver and per bug (although mostly in driver
it's just one bug). Otherwise it is difficult to review, backport and
revert.

Best regards,
Krzysztof


> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/irqchip/irq-ath79-misc.c      |  3 +++
>  drivers/irqchip/irq-csky-apb-intc.c   |  3 +++
>  drivers/irqchip/irq-csky-mpintc.c     | 26 ++++++++++++++++++++------
>  drivers/irqchip/irq-davinci-aintc.c   | 17 +++++++++++++----
>  drivers/irqchip/irq-davinci-cp-intc.c | 17 ++++++++++++++---
>  drivers/irqchip/irq-digicolor.c       |  4 ++++
>  drivers/irqchip/irq-dw-apb-ictl.c     | 11 ++++++++---
>  drivers/irqchip/irq-loongson-htvec.c  |  5 ++++-
>  drivers/irqchip/irq-ls1x.c            |  4 +++-
>  drivers/irqchip/irq-mscc-ocelot.c     |  6 ++++--
>  drivers/irqchip/irq-nvic.c            |  2 ++
>  drivers/irqchip/irq-omap-intc.c       |  4 +++-
>  drivers/irqchip/irq-riscv-intc.c      |  1 +
>  drivers/irqchip/irq-s3c24xx.c         | 20 +++++++++++++++-----
>  drivers/irqchip/irq-xilinx-intc.c     |  1 +
>  15 files changed, 98 insertions(+), 26 deletions(-)
