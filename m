Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B9F2B1329
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 01:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgKMAT5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 19:19:57 -0500
Received: from [157.25.102.26] ([157.25.102.26]:51846 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbgKMAT5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 19:19:57 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id ED9F02BE0EC;
        Fri, 13 Nov 2020 00:19:53 +0000 (GMT)
Date:   Fri, 13 Nov 2020 00:19:50 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: remove GCC < 4.9 support
In-Reply-To: <20201111230314.GB19275@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2011130017330.4064799@eddie.linux-mips.org>
References: <20201111032105.2346303-1-ndesaulniers@google.com> <20201111230314.GB19275@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 12 Nov 2020, Thomas Bogendoerfer wrote:

> > Remove a tautology; since
> > commit 0bddd227f3dc ("Documentation: update for gcc 4.9 requirement")
> > which raised the minimally supported version of GCC to 4.9, this case is
> > always true.
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/427
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/mips/include/asm/compiler.h | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> applied to mips-next.

 It probably makes sense to get rid of GCC_OFF_SMALL_ASM altogether, as 
this syntactical indirection brings us nothing at this point and only 
obfuscates sources.

  Maciej
