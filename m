Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030E819FC60
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 20:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgDFSCl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 14:02:41 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41446 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgDFSCl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 14:02:41 -0400
Received: by mail-pf1-f195.google.com with SMTP id a24so7928411pfc.8
        for <linux-mips@vger.kernel.org>; Mon, 06 Apr 2020 11:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6e1Q4vKzJzmKGtNiNjd8gFNJAJWEC5ayrvQVjXOX/iA=;
        b=VKzVFvDbHxCrHuz1BGNeFLrQzjOqXm308/UzV4dy7t/94/5o8Eqc32uFmFoYw1GhVv
         YL/PJrZ5wYaWlf09YP/5Cw9aVe6InMX/KFrOUrgH1YJZJlWiq0Opcgr8ReG8QawTI274
         WKtN/MWOtTpvlpHUdwxVT22pAxgnoaRhgG6I2tYHtL7RiZpTtHHQ4uZytoqFsV3Ar8ar
         ITcWYla8llaWu6JMF/9m/uIk+0Gwo3dkQMaEfnRI4dV96O34aZcV0bQr0GRy9DktfRs3
         TkQw9r5uzIm1fP0iGYUwFSotBFCkb0R1wjfvHieZvIKI/5/QkP4n26nnVJRvQ5geQ51+
         8Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6e1Q4vKzJzmKGtNiNjd8gFNJAJWEC5ayrvQVjXOX/iA=;
        b=T2iKlXr0xs996SnzThxKtSczA/c6WV3JYZHTmmLT6kapgtwXxH0SPDyCQa0T5vVyi6
         MznxxUuFg7MWKGoHjXfr+duMIatLjVtLYWrwo/pai1ZP5cNKcEX5NxUUAtVoMk5hHEXm
         j+u5qTuEh3k9sxtuaEXr+ulJyJWa0bMfQa7O7Hl22JJMqNyNRNROQWTVUIDTFQbbYS6R
         zs4u2J8gQhaff53Il/S9LROKWGpFKizHaqgPswfT+VTzpH+2lYbF27fwKqhmNQ4d7sMk
         0jDSJ5lFOuznCCpEB9dP08a+A20Fiy+QYpl3N2K38WVsqG5vuIOd6aFsF8Hz4XN+gfS5
         8cGg==
X-Gm-Message-State: AGi0PuZMKKv5ZXjbXscS25YGPLVhno6KTm8fu7T4MX3rzEZJ1G6DD+9b
        2O/liDr2DoHCPOV+8OFuS5Z3SKxpsRY32AdhN2qJQw==
X-Google-Smtp-Source: APiQypKM2PYCFQ6CoF0zH+mGNXOYzfT9ZqJG+BVP9vjjtE7Ws2bYfTPeukVx527QNaPkITHuCZ24GDQU95IlK8Bm80M=
X-Received: by 2002:a63:b954:: with SMTP id v20mr264508pgo.381.1586196157861;
 Mon, 06 Apr 2020 11:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200405163052.18942-1-masahiroy@kernel.org> <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org>
 <CAK7LNATKLcCPYxQZNbrS-jMPg+_BETU0dGv0qYvLqUkJ2fMt5w@mail.gmail.com> <alpine.LFD.2.21.2004061240060.4156324@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2004061240060.4156324@eddie.linux-mips.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 6 Apr 2020 11:02:27 -0700
Message-ID: <CAKwvOdkAXuTPR7Bm4+ai3GcKv+ytes3S2UZxOxqSrRtqkt485Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

On Mon, Apr 6, 2020 at 4:54 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Mon, 6 Apr 2020, Masahiro Yamada wrote:
>
> > > > As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> > > > is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> > > > CONFIG_SGI_IP32 is enabled.
> > > >
> > > > The use of EXPORT_SYMBOL in static libraries potentially causes a
> > > > problem for the llvm linker [1]. So, I want to forcibly link lib-y
> > > > objects to vmlinux when CONFIG_MODULES=y.
> > >
> > >  It looks to me like a bug in the linker in the handling of the EXTERN
> > > command.  Why not fix the linker instead?
> [...]
> > I am not sure if this is a bug.
> > Anyway, they decided to not change ld.lld
>
>  Well, maybe that was a conscious decision, however it's a linker feature
> that has been there since forever and projects like Linux can legitimately
> rely on it.  In this case perhaps sticking to other linkers, which have
> the right features, is the right solution rather than trying to turn a
> complex and mature project like Linux upside down (and quite possibly
> introducing bugs and pessimisations on the way) just to match an inferior
> tool.  Adapt your tool to the task, not the task to your tool.

The feature you refer to and the feature Masahiro is referring to are
two separate issues.  If you care to understand the issue Masahiro is
trying to fix, please take the time to read the full discussion:
https://github.com/ClangBuiltLinux/linux/issues/515 and particularly
https://reviews.llvm.org/D63564

>
> > MIPS code is so confusing.
> > There are multiple definitions,
> > and lib.a is (ab)used to hide them.
>
>  It's a standard feature of libraries that a symbol reference is satisfied
> by the first symbol definition encountered.  Any extra ones provided later
> in the link order are ignored.  And we have control over the link order.

Relying on link order is terribly brittle. Renaming a file can cause
your implementation to change, and ties your hands from ever using
things like LTO or newer build systems like ninja.  Static
initialization order is a plague to C and C++.  It's explicitly
undefined behavior you've just admitted you prefer to rely on.  (A
Google search for "static initialization order" wants to autocomplete
to "static initialization order fiasco" which is also an interesting
read; https://www.cryptopp.com/wiki/Static_Initialization_Order_Fiasco).

Masahiro is right that this case has some questionable choices in
terms of redefining symbols with different implementations.  I think
__HAVE_ARCH_STRCPY and friends in lib/string.c is actually the best
pattern for not providing multiple definitions of a symbol, followed
by marking symbols meant to be overridden at link time based on config
as __weak.  He's just trying to help clean this up.

>
> > I fixed another one for MIPS before, and
> > 0-day bot reported this recently.
> >
> >
> > There are lots of prom_meminit() definitions
> > in arch/mips/.
>
>  Naturally, many platforms will have its own, in addition to some generic
> (possibly dummy) one.
>
> > Making the intention clearer is a good thing, IMHO.
>
>  Hmm, what intention?  Can you please be more specific?

That prom_meminit and prom_free_prom_memory are meant to be overridden
by other configs.

-- 
Thanks,
~Nick Desaulniers
