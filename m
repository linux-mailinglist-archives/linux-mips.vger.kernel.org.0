Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39959326F82
	for <lists+linux-mips@lfdr.de>; Sun, 28 Feb 2021 00:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhB0XAh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Feb 2021 18:00:37 -0500
Received: from mail.zx2c4.com ([104.131.123.232]:38624 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230086AbhB0XAh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Feb 2021 18:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1614466792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ruHnn35tHGWqmIIKSqPSjV+S8aLejAV+Q0Pzr+W+a+c=;
        b=fuzy8pq+Fra7sYKv06vQSTQe0jwwtRIGkpKC3JsfDEGK22pjjlphecB+VnyuKpN8C+UwrV
        gQApxPCueFEAgHviXQ1jWSjBH+fCU1kY48uwqh7G3BwsvNTR3RTrHqc3ovuxbKkGJfsKKk
        paTySieRBUQLlygXYQSHDehFWG9Yl3s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 978e4c7e (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Sat, 27 Feb 2021 22:59:52 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id l8so12819368ybe.12;
        Sat, 27 Feb 2021 14:59:51 -0800 (PST)
X-Gm-Message-State: AOAM5324HI1g5CzZnAhoVSD0DKtIR7+YUV+lUpVyokZZ6sJmQsC5Xcbj
        MbcebxRnIUHYT9bWu4ggUPavqaUx8dLY0KB09rY=
X-Google-Smtp-Source: ABdhPJwePrGOkapgHkdD3qsOiO4/cDK0jSfZ8VJ7DOLedNSu+x/0hCIxvHSRBxmZdHs2oQdTNnSo9WMHIrvSuu8ETfk=
X-Received: by 2002:a25:8c2:: with SMTP id 185mr14312273ybi.20.1614466791149;
 Sat, 27 Feb 2021 14:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20210227122605.2680138-1-Jason@zx2c4.com> <alpine.DEB.2.21.2102271424100.44210@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2102271424100.44210@angie.orcam.me.uk>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Sat, 27 Feb 2021 23:59:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
Message-ID: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 27, 2021 at 2:41 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Sat, 27 Feb 2021, Jason A. Donenfeld wrote:
>
> > The CPU_MIPS64 and CPU_MIPS32 variables are supposed to be able to
> > distinguish broadly between 64-bit and 32-bit MIPS CPUs. However, they
>
>  That is not true.  The purpose of these options is to identify MIPS64 and
> MIPS32 ISA processors respectively (and the generic features these ISAs
> imply).  There are 64-bit and 32-bit MIPS processors which do not qualify,
> specifically all MIPS I, MIPS II, MIPS III, and MIPS IV implementations.
>
> > weren't selected by the specialty CPUs, Octeon and Loongson, which meant
> > it was possible to hit a weird state of:
> >
> >     MIPS=y, CONFIG_64BIT=y, CPU_MIPS64=n
>
>  This is a correct combination for MIPS III and MIPS IV processors.
>
> > This commit rectifies the issue by having CPU_MIPS64 be selected when
> > the missing Octeon or Loongson models are selected.
>
>  From the description and/or other options selected by CPU_LOONGSON64 and
> CPU_CAVIUM_OCTEON I infer the change itself is correct, so you only need
> to rewrite the change description.

Indeed you're right. v2 on its way.

Jason
