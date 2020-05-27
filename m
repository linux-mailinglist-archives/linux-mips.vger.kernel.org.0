Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DCB1E4139
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 14:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgE0MFd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 08:05:33 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34460 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgE0MFc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 08:05:32 -0400
Received: from halation.net.flygoat.com (unknown [IPv6:240e:390:496:b320::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 1B0E720CF4;
        Wed, 27 May 2020 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590581132; bh=pAfGmsVIfAgalNnpMcQ/Iz794j/8TOn7DIg2APlLWd0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OVUwsCEe81/Ckpt6f7xlL2qIHkQO7BJ/3MI75tt+dEEvxi8Fnh6TYZLjJIxOXJGm+
         UGJZapFMZ1s9SVzsU0MdHvac21Cnv4GNb4MBcS2MbNS4+TV4rYmeM7XFhzT+6NyLIO
         KxI6R2U7Q3SiiQN5nWZgC+H6CaQSf2XZtLwMp8/UZQpWOAYjAQKaP1XM9sh9U9PuBS
         QFaf5QWc9XI3fbJB0jvbGiglwpIFj+eVuJ3Dh9RRDDO+TKVMNJas41pIjzvHG1p6T4
         7lHio5JQrbZ5tdk9TpAgpgaxdbf1zC9OjbTHHG2QE8NUprWSswis9ShG2vezLSgkmm
         47JskCb/cQToQ==
Date:   Wed, 27 May 2020 20:05:22 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] MIPS: Move kernel head into a standalone section
Message-ID: <20200527200522.23c4e86f@halation.net.flygoat.com>
In-Reply-To: <20200527115354.GC13965@alpha.franken.de>
References: <20200527063438.391949-1-jiaxun.yang@flygoat.com>
        <20200527063438.391949-3-jiaxun.yang@flygoat.com>
        <20200527115354.GC13965@alpha.franken.de>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 27 May 2020 13:53:54 +0200
Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:

> On Wed, May 27, 2020 at 02:34:33PM +0800, Jiaxun Yang wrote:
> > That's what already done by Arm64 and other architectures.
> > That would allow us put more things like PE headers safely into
> > the header.
> > 
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  arch/mips/kernel/head.S        | 4 ++--
> >  arch/mips/kernel/vmlinux.lds.S | 8 ++++++--
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> > index c7c2795837e7..8081a905a71c 100644
> > --- a/arch/mips/kernel/head.S
> > +++ b/arch/mips/kernel/head.S
> > @@ -59,6 +59,8 @@
> >  #endif
> >  	.endm
> >  
> > +	__HEAD
> > +_head:
> >  #ifndef CONFIG_NO_EXCEPT_FILL
> >  	/*
> >  	 * Reserved space for exception handlers.  
> 
> I'm adding the missing piece, why this change ist broken:
> 
>          * Necessary for machines which link their kernels at KSEG0.
> 
> by putting something in front of that will probably break platforms
> making use of "feature". If we can make sure, we don't need it
> anymore, we should first remove this and then add __HEAD part.

__HEAD is just marking the section of code.
It will not add anything to the binary.

Btw: I just noticed this patch may break relocatable kernel. I'll delay
it for next merge window.

Thanks.

> 
> Thomas.
> 

--
Jiaxun Yang
