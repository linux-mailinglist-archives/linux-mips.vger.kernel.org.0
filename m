Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D30350E59
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 07:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhDAFOg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 01:14:36 -0400
Received: from wilbur.contactoffice.com ([212.3.242.68]:32894 "EHLO
        wilbur.contactoffice.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhDAFOA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Apr 2021 01:14:00 -0400
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
        by wilbur.contactoffice.com (Postfix) with ESMTP id 245A9790;
        Thu,  1 Apr 2021 07:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617254036;
        s=20210208-e7xh; d=mailfence.com; i=sandberg@mailfence.com;
        h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        l=1781; bh=mnExVd7H3LYUpv6kgaiAfsg+uKAirG/U8Igvc3+qclc=;
        b=D5/kqpg2ZpDZ8cIYomEg6he0lZF64SC1XwtQSs2dP0lXorQ+li0kO7pj6AltjlXZ
        uUP/YT2c/r69fwqvaq31b7dQiofJL3Tr9baB8y3ejRQVAisTh7IyGJ4yQxQ/hw7jAX5
        q9HiHMSMrVM92+c38wtjaDh/mgkj1vfmlkAAyqB4C28GWD0cGfYZTitaHzq61BYwCle
        V2QuxO7NK83/oNwDzKW9g/2L7fvBo2BfPfl8FGMFaRH3tMRqABd070M0JTvbFGeegeB
        b9J6UPYS6lBPl18H+u/uUkTDcxTf5eaokP0d6+apB00XGLwecnVGHICc4EqpP8XuA7W
        Uv7AozBI0A==
Date:   Thu, 1 Apr 2021 07:13:52 +0200 (CEST)
From:   Mauri Sandberg <sandberg@mailfence.com>
Reply-To: Mauri Sandberg <sandberg@mailfence.com>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org,
        trivial@kernel.org
Message-ID: <51761286.363605.1617254032932@ichabod.co-bxl>
In-Reply-To: <alpine.DEB.2.21.2104010053360.18977@angie.orcam.me.uk>
References: <20210326134158.268164-1-sandberg@mailfence.com> <20210329123136.3717-1-sandberg@mailfence.com> <20210329123136.3717-2-sandberg@mailfence.com> <20210330125347.GA10767@alpha.franken.de> <alpine.DEB.2.21.2104010053360.18977@angie.orcam.me.uk>
Subject: Re: [PATCH v3 1/1] MIPS: kernel: setup.c: fix compilation error
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:250217426
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> ----------------------------------------
> From: Maciej W. Rozycki <macro@orcam.me.uk>
> On Tue, 30 Mar 2021, Thomas Bogendoerfer wrote:
> > > With ath79_defconfig enabling CONFIG_MIPS_ELF_APPENDED_DTB gives a
> > > compilation error. This patch fixes it.
> > > 
> > > Build log:
> > > ...
> > >   CC      kernel/locking/percpu-rwsem.o
> > > ../arch/mips/kernel/setup.c:46:39: error: conflicting types for
> > > '__appended_dtb'
> > >  const char __section(".appended_dtb") __appended_dtb[0x100000];
> > >                                        ^~~~~~~~~~~~~~
> > > In file included from ../arch/mips/kernel/setup.c:34:
> > > ../arch/mips/include/asm/bootinfo.h:118:13: note: previous declaration
> > > of '__appended_dtb' was here
> > >  extern char __appended_dtb[];
> > >              ^~~~~~~~~~~~~~
> > >   CC      fs/attr.o
> > > make[4]: *** [../scripts/Makefile.build:271: arch/mips/kernel/setup.o]
> > >  Error 1
> > > ...
> > > 
> > > Root cause seems to be:
> > > Fixes: b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")
> > > 
> > > Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
> > > Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: trivial@kernel.org
> > > ---
> > >  arch/mips/kernel/setup.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > applied to mips-fixes. I dropped the Tested-by as this would imply
> > for me booting that kernel, which I didn't.
> 
>  Why removing the `const' qualifier rather than adding it to the 
> declaration?  Is the DTB supposed to be r/w for the kernel?

That is a good point. I tried it too but to my untrained eye it seemed to break up things
more and I didn't have enough in-depth knowledge to touch things elsewhere.

-- Mauri
