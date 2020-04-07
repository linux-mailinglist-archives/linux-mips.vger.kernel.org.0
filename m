Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFDAA1A1353
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 20:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDGSKN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 14:10:13 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:33314 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgDGSKN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 14:10:13 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23993994AbgDGSKISscAr (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Tue, 7 Apr 2020 20:10:08 +0200
Date:   Tue, 7 Apr 2020 19:10:08 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Truncate load-y into 32bit for 32bit kernel
In-Reply-To: <CAKwvOd=Upj_OcrhBnqf1=woCRm-g2wqjv882R0HQeMJu12Uq9w@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004071837440.596385@eddie.linux-mips.org>
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com> <20200407080611.859256-1-jiaxun.yang@flygoat.com> <CAKwvOd=Upj_OcrhBnqf1=woCRm-g2wqjv882R0HQeMJu12Uq9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 7 Apr 2020, Nick Desaulniers wrote:

> V2 is way too clever, V1 was much more readable.

 I think V2 is a step in the right direction except it still has some 
issues, and also I'd simplify it as there's surely too much processing 
there.

 OTOH V1 is going to be a maintenance nightmare, as you need to handle all 
platforms individually whether they want different 32-bit and 64-bit load 
addresses or not.

> > diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> > index e1c44aed8156..f8fd3c39fb55 100644
> > --- a/arch/mips/Makefile
> > +++ b/arch/mips/Makefile
> > @@ -286,6 +286,9 @@ ifdef CONFIG_64BIT
> >        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
> >      endif
> >    endif
> > +else
> > +       # Truncate address into 32-bit
> > +       load-y := 0x$(shell echo "$(load-y)" | rev | head -c 8 | rev)

 You cannot just truncate `load-y' in place like this as it will break 
logic with `expr' used elsewhere in this Makefile (your original change 
would too) that does a string comparison on this variable.  So you need to 
define another variable for the sole linker's use, like `load-ld'.

 Then I think there's no need to invoke multiple programs, especially ones 
we don't currently rely on (`rev').  How about:

	load-ld = $(shell echo "$(load-y)" | sed 's/.\{8\}\(.\{8\}\)$/\1/')

 Also this really needs to be placed elsewhere, as it has nothing to do 
with KBUILD_SYM32 it has been attached to with this change, and explain 
why it is done rather than what (it's obvious from the command it's meant 
to truncate the address).

 So use something along the lines of:

# When linking a 32-bit executable the LLVM linker cannot cope with a
# 32-bit load address that has been sign-extended to 64 bits.  Simply
# remove the upper 32 bits then, as it is safe to do so with other
# linkers.
ifdef CONFIG_64BIT
	load-ld = $(load-y)
else
	load-ld = $(shell echo "$(load-y)" | sed 's/.\{8\}\(.\{8\}\)$/\1/')
endif

just above the use place, and then adjust the place to refer `load-ld' 
rather than `load-y'.

 Put the justification for this change (feel free to reuse observations I 
made here), like why a new variable, in the change description.

  Maciej
