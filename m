Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C24350A7C
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 00:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhCaW4P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 18:56:15 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:38292 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhCaWzp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Mar 2021 18:55:45 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id C1BCB92009C; Thu,  1 Apr 2021 00:55:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id BE4B192009B;
        Thu,  1 Apr 2021 00:55:43 +0200 (CEST)
Date:   Thu, 1 Apr 2021 00:55:43 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Mauri Sandberg <sandberg@mailfence.com>, f.fainelli@gmail.com,
        linux-mips@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH v3 1/1] MIPS: kernel: setup.c: fix compilation error
In-Reply-To: <20210330125347.GA10767@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2104010053360.18977@angie.orcam.me.uk>
References: <20210326134158.268164-1-sandberg@mailfence.com> <20210329123136.3717-1-sandberg@mailfence.com> <20210329123136.3717-2-sandberg@mailfence.com> <20210330125347.GA10767@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 30 Mar 2021, Thomas Bogendoerfer wrote:

> > With ath79_defconfig enabling CONFIG_MIPS_ELF_APPENDED_DTB gives a
> > compilation error. This patch fixes it.
> > 
> > Build log:
> > ...
> >   CC      kernel/locking/percpu-rwsem.o
> > ../arch/mips/kernel/setup.c:46:39: error: conflicting types for
> > '__appended_dtb'
> >  const char __section(".appended_dtb") __appended_dtb[0x100000];
> >                                        ^~~~~~~~~~~~~~
> > In file included from ../arch/mips/kernel/setup.c:34:
> > ../arch/mips/include/asm/bootinfo.h:118:13: note: previous declaration
> > of '__appended_dtb' was here
> >  extern char __appended_dtb[];
> >              ^~~~~~~~~~~~~~
> >   CC      fs/attr.o
> > make[4]: *** [../scripts/Makefile.build:271: arch/mips/kernel/setup.o]
> >  Error 1
> > ...
> > 
> > Root cause seems to be:
> > Fixes: b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")
> > 
> > Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
> > Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: trivial@kernel.org
> > ---
> >  arch/mips/kernel/setup.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> applied to mips-fixes. I dropped the Tested-by as this would imply
> for me booting that kernel, which I didn't.

 Why removing the `const' qualifier rather than adding it to the 
declaration?  Is the DTB supposed to be r/w for the kernel?

  Maciej
