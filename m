Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B86A31CB8E
	for <lists+linux-mips@lfdr.de>; Tue, 16 Feb 2021 15:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhBPOIe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Feb 2021 09:08:34 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:34258 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhBPOIY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Feb 2021 09:08:24 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id C062592009D; Tue, 16 Feb 2021 15:07:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id B90AE92009C;
        Tue, 16 Feb 2021 15:07:42 +0100 (CET)
Date:   Tue, 16 Feb 2021 15:07:42 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Make check condition for SDBBP consistent with
 EJTAG spec
In-Reply-To: <20210209140018.GA13043@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2102161506160.1521@angie.orcam.me.uk>
References: <1612847125-3141-1-git-send-email-yangtiezhu@loongson.cn> <20210209121124.GA11134@alpha.franken.de> <03fcfc00-acdd-a949-046c-3002195d6024@loongson.cn> <20210209140018.GA13043@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 9 Feb 2021, Thomas Bogendoerfer wrote:

> > > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > > index bcce32a..743d759 100644
> > > > --- a/arch/mips/kernel/genex.S
> > > > +++ b/arch/mips/kernel/genex.S
> > > > @@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
> > > >   	MTC0	k0, CP0_DESAVE
> > > >   	mfc0	k0, CP0_DEBUG
> > > > -	sll	k0, k0, 30	# Check for SDBBP.
> > > > -	bgez	k0, ejtag_return
> > > > +	andi	k0, k0, MIPS_DEBUG_DBP	# Check for SDBBP.
> > > > +	beqz	k0, ejtag_return
> > > IMHO both implementations are doing the same thing.
> > 
> > When I read the original code, it looks a little confusing
> > at first glance, the initial aim of this patch is to make the code
> > more readable and easier to understand.
> 
> which your version is, but the description sounds like there is a semantic
> change somewhere (at least to me). So with a little bit rewording I'm
> fine with applying your patch.

 Why is it confusing?  This is assembly and you're supposed to understand 
this stuff when looking into it.  Don't fix what ain't broke!

  Maciej
