Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6A771A1205
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 18:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgDGQsO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 12:48:14 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:59686 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgDGQsN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 12:48:13 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23993062AbgDGQsJjgyE6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org> + 2 others);
        Tue, 7 Apr 2020 18:48:09 +0200
Date:   Tue, 7 Apr 2020 17:48:09 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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
In-Reply-To: <CAKwvOdkAXuTPR7Bm4+ai3GcKv+ytes3S2UZxOxqSrRtqkt485Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004071720010.596385@eddie.linux-mips.org>
References: <20200405163052.18942-1-masahiroy@kernel.org> <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org> <CAK7LNATKLcCPYxQZNbrS-jMPg+_BETU0dGv0qYvLqUkJ2fMt5w@mail.gmail.com> <alpine.LFD.2.21.2004061240060.4156324@eddie.linux-mips.org>
 <CAKwvOdkAXuTPR7Bm4+ai3GcKv+ytes3S2UZxOxqSrRtqkt485Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 6 Apr 2020, Nick Desaulniers wrote:

> >  Well, maybe that was a conscious decision, however it's a linker feature
> > that has been there since forever and projects like Linux can legitimately
> > rely on it.  In this case perhaps sticking to other linkers, which have
> > the right features, is the right solution rather than trying to turn a
> > complex and mature project like Linux upside down (and quite possibly
> > introducing bugs and pessimisations on the way) just to match an inferior
> > tool.  Adapt your tool to the task, not the task to your tool.
> 
> The feature you refer to and the feature Masahiro is referring to are
> two separate issues.  If you care to understand the issue Masahiro is
> trying to fix, please take the time to read the full discussion:
> https://github.com/ClangBuiltLinux/linux/issues/515 and particularly
> https://reviews.llvm.org/D63564

 The onus is on the patch submitter to justify a change I'm afraid, and 
not the reviewer to chase such justification.  A change is supposed to be 
self-contained and straightforward to understand for someone reasonably 
familiar with the matters covered though not necessarily with the specific 
issue.  And this change is missing such self-contained justification I'm 
afraid.

 You need to make it easy for the reviewer to accept a change.  If a 
reviewer looks at the proposed change itself, reads through the associated 
description and immediately knows what is going on and that the change is 
good, the this is a good submission.

> >  It's a standard feature of libraries that a symbol reference is satisfied
> > by the first symbol definition encountered.  Any extra ones provided later
> > in the link order are ignored.  And we have control over the link order.
> 
> Relying on link order is terribly brittle. Renaming a file can cause
> your implementation to change, and ties your hands from ever using
> things like LTO or newer build systems like ninja.  Static
> initialization order is a plague to C and C++.  It's explicitly
> undefined behavior you've just admitted you prefer to rely on.  (A
> Google search for "static initialization order" wants to autocomplete
> to "static initialization order fiasco" which is also an interesting
> read; https://www.cryptopp.com/wiki/Static_Initialization_Order_Fiasco).

 Renaming a file does not cause the link order to automatically change 
(although I can imagine a build system where that happens).  And we're not 
talking about static initialisers and their implicit dependencies that 
might be hard to follow.

 We just have pairs of symbols that need to appear in a specific order in 
the link, and this is quite straightforward to control, by placing 
platform files earlier on the linker's invocation line, followed by arch 
files, followed by generic files.  That's certainly been defined linker's 
behaviour, especially as tools had to rely on it in more complex build 
systems before weak symbols were invented.

> Masahiro is right that this case has some questionable choices in
> terms of redefining symbols with different implementations.  I think
> __HAVE_ARCH_STRCPY and friends in lib/string.c is actually the best
> pattern for not providing multiple definitions of a symbol, followed
> by marking symbols meant to be overridden at link time based on config
> as __weak.  He's just trying to help clean this up.

 That is perhaps a worthwhile improvement, but does not appear to have
anything to do with LLVM and its bug in handling the EXTERN linker script 
command.  Let's not mix up things.

 Also IIUC this will result in a code bloat: previously objects providing 
fallback symbols were not pulled from archives if not needed, whereas now 
they will always be and will remain permanently unused, wasting memory at 
run time.  So this looks to me like a (gratuitous) pessimisation.

> >  Hmm, what intention?  Can you please be more specific?
> 
> That prom_meminit and prom_free_prom_memory are meant to be overridden
> by other configs.

 Then a comment at the fallback implementation should be enough.  Besides 
you need to be somewhat familiar with code you want to work with and Linux 
has always been terse in code annotations and relied on code being 
self-explanatory instead.

  Maciej
