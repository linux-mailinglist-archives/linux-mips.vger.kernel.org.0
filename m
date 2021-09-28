Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68BD41AEE6
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 14:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240491AbhI1MZM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 08:25:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240426AbhI1MZH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 08:25:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 387886101E;
        Tue, 28 Sep 2021 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632831808;
        bh=03/X04FU8UxgwY9Mo44SL71H8TSm+bohH5WJX8dDLIM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lXMQvuUeDrOCpRx58iDmKbIyMuSR7PFdyV6WSvhmNLnwTdy7J6qzqmgP4RhhKAr5W
         UvM/K2ZUJQSrsnYxKBWDVFQXv+jcM6keKcw202J4p1+kx9uj2f1AXr2rkN/fD/8tcG
         9wASBGQkch33emvuAHSyBCuLfbqtHGLPZO7F/7yDDG+XobvW7qWLQZc+il4FxSQLal
         2vkqYtcLcJXtz76iKAbtzKEMDR6o/EbxRgzCfx4rivClk+fMLrCPHbm2w/Y2RCnA0N
         jdvt7THT496W/bXzRQCDV9D0dWtaemplMu7moy4lnNGvAh0uGuUT1AxnJYQnWI8qGG
         Ipw9xGp1yZ4jw==
Received: by mail-wm1-f50.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so2103978wmq.1;
        Tue, 28 Sep 2021 05:23:28 -0700 (PDT)
X-Gm-Message-State: AOAM532gIumjb6EKUrOuRnRm77+S82ub144MPuwqFmcojd1rzjFj1nbG
        RCNwfDyQ2FjNlWXYm1Q56A8GnixNvo+fEuQuTAo=
X-Google-Smtp-Source: ABdhPJxYldORYw+hO1zWq/uLFvhSnh5cxNha2dBDAYRrpPQ4C27UAAvrZ0nnDHSRNRZxLVjpogTo9BmSECl/om/jbF0=
X-Received: by 2002:a1c:7413:: with SMTP id p19mr4467363wmc.98.1632831795912;
 Tue, 28 Sep 2021 05:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org> <20210928115856.GK4199@sirena.org.uk>
In-Reply-To: <20210928115856.GK4199@sirena.org.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 28 Sep 2021 14:22:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
Message-ID: <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig unconditionally
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 28, 2021 at 1:58 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, Sep 28, 2021 at 09:50:26AM +0200, Arnd Bergmann wrote:
>
> > Not sure how we'd want to merge this patch, if two other things
> > need it. I'd prefer to merge it along with the QCOM_SCM change
> > through the soc tree, but that leaves the cirrus firmware broken
> > unless we also merge it the same way (rather than through ASoC
> > as it is now).
>
> We could also merge a tag into both places.

I wonder if I should just take my two patches as bugfixes for 5.15,
after all they do address real build failures. In that case, all  you need
is a merge with 5.15-rc4 or higher.

      Arnd
