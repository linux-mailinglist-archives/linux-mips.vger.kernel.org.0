Return-Path: <linux-mips+bounces-6743-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065E9C7FFF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 02:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1D07B23D8A
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 01:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B031E6DCF;
	Thu, 14 Nov 2024 01:30:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B4F1E500F;
	Thu, 14 Nov 2024 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731547802; cv=none; b=I+FqSSlc9TUXOKveFMbXxdRKZGacE01qsfWuSSU7n6hol6Wvqkb8giMMCqHrx6XYwkbHyjkEsUR/awkzi/wEvt7uw5oKNy7XyrCTwzmZ9WP3dxWdJsH3XQEGozfZ+GxLC7odE9ASoH9rZhH6BJfTbWODWGFv++evNvXjqUWBysA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731547802; c=relaxed/simple;
	bh=55kpfc8Ie+/7TeJpQ3BEBBJT2baJmmeu2NifzbnYc4k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FqwcELSiMFasICahRgtFUWmBY6oVJY6zG1Pt+BzfSAAH/farLcM2UqajA2se+cjMr0h11e0CIIWHg1tQAvYfk3EDfiIh1z35F8vEUmhGL6zj4eXJzYShOO/xG5ynzLhe+v/3huKxjlqs2dva44kt8pym8kyTlnbbIM4iwrXvZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 42DF592009C; Thu, 14 Nov 2024 02:29:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2EFF592009B;
	Thu, 14 Nov 2024 01:29:57 +0000 (GMT)
Date: Thu, 14 Nov 2024 01:29:57 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Masahiro Yamada <masahiroy@kernel.org>
cc: Rong Xu <xur@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Klara Modin <klarasmodin@gmail.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: move _stext definition to vmlinux.lds.S
In-Reply-To: <CAK7LNAR+-SCOHORKqA0S=ec8-ziFhkSVgKUY7EN6qEWXePouJQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2411140107290.9262@angie.orcam.me.uk>
References: <20241113064028.2795128-1-xur@google.com> <alpine.DEB.2.21.2411131542500.9262@angie.orcam.me.uk> <CAK7LNAR+-SCOHORKqA0S=ec8-ziFhkSVgKUY7EN6qEWXePouJQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Nov 2024, Masahiro Yamada wrote:

> > > The _stext symbol is intended to reference the start of the text section.
> > > However, it currently relies on a fragile link order because the existing
> > > EXPORT(_stext) resides within the .text section, which is not guaranteed
> > > to be placed first.
> >
> >  Umm, arch/mips/kernel/head.S does mean to be linked first.  We rely on it
> > for environments where there's no entry point is available and execution
> > starts from the beginning of the image.  See the comment right below your
> > change.
> >
> > > Move the _stext definition to the linker script to enforce an explicit
> > > ordering.
> >
> >  So if you say that the link order is fragile (which it may well be), then
> > that problem has to be fixed instead, likely with the linker script too,
> > and then perhaps an ASSERT placed there to verify that it has worked and
> > `_stext' refers to the beginning, taking into account what follows too.
> 
> 
> arch/mips/kernel/head.S is always passed as the first object
> in the link command because it is listed in scripts/head-object-list.txt
> 
> What you missed to understand is, the .text section of the first object
> is NOT guaranteed to be placed at the start of the image.

 I know how linker scripts work, thank you very much.  However there was 
nothing to understand from the commit description as hardly any has been 
given.

> Assume, we pass 3 objects, head.o, foo.o, bar.o to the linker
> in this order.
> 
> - head.o  contains a .text section
> - foo.o contains .text and .text.hot sections
> - bar.o contains .text and .text.hot sections
> 
> 
> The output will contain the sections in this order:
>    foo.o#.text.hot
>    bar.o#.text.hot
>    head.o#.text
>    foo.o#.text
>    bar.o#.text
> 
> 
> This result comes from the fact that TEXT_MAIN
> is not necessarily placed first.
> 
> See the macro in include/asm-generic/vmlinux.lds.h
> 
> #define TEXT_TEXT                                                       \
>                 ALIGN_FUNCTION();                                       \
>                 *(.text.hot .text.hot.*)                                \
>                 *(TEXT_MAIN .text.fixup)                                \
>                 *(.text.unlikely .text.unlikely.*)                      \
>                 *(.text.unknown .text.unknown.*)                        \

 It corresponds to what I suggested in the second paragraph of my previous 
reply, which I retained quoted above for your convenience.  The reviewer 
is not required to give the submitter a complete solution, but rather some 
guidance for the submitter to find the correct solution themselves.

> BTW, "head.o must be passed to the linker as the first object"
> is a bad convention in old days.
> If you expect the entry point at the beginning of the kernel image,
> it must be marked as __HEAD, which is placed in the .head.text section.
> 
> See commit ce697ccee1a8

 I do not disagree, however such details need to be given in the change 
description.  The purpose of the change description is not to repeat in 
the texual form what the patch does, because everyone can see it, but to 
give rationale and any reasoning beyond the change being made, especially 
when fiddling with something that has worked for 30 years now.

 It's not that the old is always good, but at least it has proved in the 
field, so you need to convince the reviewer why the new is more suitable.

> Well-maintained architectures got rid of
> stupid "head.o must be passed first" requirement:
> 
>  - 2348e6bf4421
>  - 994b7ac1697b
>  - 5353fff29e42
> 
> If MIPS migrates to the cleaner __HEAD solution,
> it will be appreciated, but this is another story.

 Patches are welcome.

  Maciej

