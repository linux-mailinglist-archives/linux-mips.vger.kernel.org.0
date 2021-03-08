Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74325331528
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 18:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhCHRrn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 12:47:43 -0500
Received: from elvis.franken.de ([193.175.24.41]:58706 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230200AbhCHRrS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 12:47:18 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJJyO-0007UB-01; Mon, 08 Mar 2021 18:47:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 55DB4C1AFC; Mon,  8 Mar 2021 18:47:06 +0100 (CET)
Date:   Mon, 8 Mar 2021 18:47:06 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes
Message-ID: <20210308174706.GB13680@alpha.franken.de>
References: <20210307182301.20710-1-bjorn@mork.no>
 <20210308105550.GC6622@alpha.franken.de>
 <87h7llc34m.fsf@miraculix.mork.no>
 <20210308125348.GA7976@alpha.franken.de>
 <878s6xbvxm.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878s6xbvxm.fsf@miraculix.mork.no>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 08, 2021 at 02:45:57PM +0100, Bjørn Mork wrote:
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> writes:
> 
> > I see
> >
> > diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> > index c1c345be04ff..4b4e39b7c79b 100644
> > --- a/arch/mips/kernel/vmlinux.lds.S
> > +++ b/arch/mips/kernel/vmlinux.lds.S
> > @@ -145,6 +145,7 @@ SECTIONS
> >         }
> >  
> >  #ifdef CONFIG_MIPS_ELF_APPENDED_DTB
> > +       STRUCT_ALIGN();
> >         .appended_dtb : AT(ADDR(.appended_dtb) - LOAD_OFFSET) {
> >                 *(.appended_dtb)
> >                 KEEP(*(.appended_dtb))
> > @@ -172,6 +173,7 @@ SECTIONS
> >  #endif
> >  
> >  #ifdef CONFIG_MIPS_RAW_APPENDED_DTB
> > +       STRUCT_ALIGN();
> >         __appended_dtb = .;
> >         /* leave space for appended DTB */
> >         . += 0x100000;
> >
> > in that patch, and IMHO this does align the appended_dtb. What do I miss ?
> 
> I'll not pretend I know anything about this subject, so feel free to
> adjust as necessary.
> 
> The problem with that patch is that it doesn't pad the image to the
> aligment.   So you can't do
> 
>  cat my.dtb >> arch/mips/boot/vmlinux.bin
> 
> anymore.  This used to work before commit 79edff12060f.

ok, took a little while to fully understand the problem. I've applied
your patch to mips-fixes with a Fixes: tag added.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
