Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE76419EF31
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 03:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDFBpt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Apr 2020 21:45:49 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34525 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDFBpt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Apr 2020 21:45:49 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0361jd9P013273;
        Mon, 6 Apr 2020 10:45:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0361jd9P013273
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586137540;
        bh=t1XbmubotdqxWQiJUtEmVVmLD3QtFzYtfXS6eKsOjqA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JJoh7W4D3xXNlBUBOyJoKb52THf5gc3KPF6ePUqzF2UyzZucECBoKQZng43N9midv
         4/zVoGccZ90Yf4Dd0uMppWex45oHbUktl8qUnY4ggHD7OjReYQLFldVTRLc7fVjCZZ
         RPricLYAybvutnGYMT9Tmn+YTEUwobmAg4btkg4ssvRq+BHazVgQX+7Qz8bhyeUEfi
         9lvff67EBT6wLXjGR3+0x2PxMNhQqNkIwxYQBGqCPFzcpdO+j7fwgkFszyZkSwEr4H
         07W5ALtyd17GZhgyuUWOE7svdWsK7AGy15n+KNS4VZ/WSeBPOnhU5M/Rqmy5AgvrGq
         WlVkxwRbkuQtg==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id l18so4928998uak.4;
        Sun, 05 Apr 2020 18:45:40 -0700 (PDT)
X-Gm-Message-State: AGi0PuYKMzvLLaQiO24vJMDVqETXnPHKdHG1nQjdtcoAlQChEKmjXiLH
        gWMRb84hnJW9z6SEyy4tL8TJnlqF6OXE1ASjnnk=
X-Google-Smtp-Source: APiQypIme//LwwgDhWdl23pH0ig14cQer/hMjepL0+AGooHh0rxFpP7g9QwIcB1KYEeAWqnvnWA/n5ux8B3PbibpFH8=
X-Received: by 2002:ab0:2085:: with SMTP id r5mr14017632uak.95.1586137538961;
 Sun, 05 Apr 2020 18:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200405163052.18942-1-masahiroy@kernel.org> <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 6 Apr 2020 10:45:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNATKLcCPYxQZNbrS-jMPg+_BETU0dGv0qYvLqUkJ2fMt5w@mail.gmail.com>
Message-ID: <CAK7LNATKLcCPYxQZNbrS-jMPg+_BETU0dGv0qYvLqUkJ2fMt5w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux-MIPS <linux-mips@linux-mips.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 6, 2020 at 2:16 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Mon, 6 Apr 2020, Masahiro Yamada wrote:
>
> > As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> > is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> > CONFIG_SGI_IP32 is enabled.
> >
> > The use of EXPORT_SYMBOL in static libraries potentially causes a
> > problem for the llvm linker [1]. So, I want to forcibly link lib-y
> > objects to vmlinux when CONFIG_MODULES=y.
>
>  It looks to me like a bug in the linker in the handling of the EXTERN
> command.  Why not fix the linker instead?
>
>   Maciej


I am not sure if this is a bug.
Anyway, they decided to not change ld.lld


MIPS code is so confusing.
There are multiple definitions,
and lib.a is (ab)used to hide them.

I fixed another one for MIPS before, and
0-day bot reported this recently.


There are lots of prom_meminit() definitions
in arch/mips/.

Making the intention clearer is a good thing, IMHO.


-- 
Best Regards
Masahiro Yamada
