Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFDF719F538
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 13:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbgDFLyS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 07:54:18 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:34734 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgDFLyR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 07:54:17 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992976AbgDFLyOZ7Nfb (ORCPT
        <rfc822;linux-mips@vger.kernel.org> + 2 others);
        Mon, 6 Apr 2020 13:54:14 +0200
Date:   Mon, 6 Apr 2020 12:54:14 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux-MIPS <linux-mips@linux-mips.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        =?UTF-8?Q?F=C4=81ng-ru=C3=AC_S=C3=B2ng?= <maskray@google.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and
 prom_free_prom_memory
In-Reply-To: <CAK7LNATKLcCPYxQZNbrS-jMPg+_BETU0dGv0qYvLqUkJ2fMt5w@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004061240060.4156324@eddie.linux-mips.org>
References: <20200405163052.18942-1-masahiroy@kernel.org> <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org> <CAK7LNATKLcCPYxQZNbrS-jMPg+_BETU0dGv0qYvLqUkJ2fMt5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 6 Apr 2020, Masahiro Yamada wrote:

> > > As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> > > is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> > > CONFIG_SGI_IP32 is enabled.
> > >
> > > The use of EXPORT_SYMBOL in static libraries potentially causes a
> > > problem for the llvm linker [1]. So, I want to forcibly link lib-y
> > > objects to vmlinux when CONFIG_MODULES=y.
> >
> >  It looks to me like a bug in the linker in the handling of the EXTERN
> > command.  Why not fix the linker instead?
[...]
> I am not sure if this is a bug.
> Anyway, they decided to not change ld.lld

 Well, maybe that was a conscious decision, however it's a linker feature 
that has been there since forever and projects like Linux can legitimately 
rely on it.  In this case perhaps sticking to other linkers, which have 
the right features, is the right solution rather than trying to turn a 
complex and mature project like Linux upside down (and quite possibly 
introducing bugs and pessimisations on the way) just to match an inferior 
tool.  Adapt your tool to the task, not the task to your tool.

> MIPS code is so confusing.
> There are multiple definitions,
> and lib.a is (ab)used to hide them.

 It's a standard feature of libraries that a symbol reference is satisfied 
by the first symbol definition encountered.  Any extra ones provided later 
in the link order are ignored.  And we have control over the link order.

> I fixed another one for MIPS before, and
> 0-day bot reported this recently.
> 
> 
> There are lots of prom_meminit() definitions
> in arch/mips/.

 Naturally, many platforms will have its own, in addition to some generic 
(possibly dummy) one.

> Making the intention clearer is a good thing, IMHO.

 Hmm, what intention?  Can you please be more specific?

  Maciej
