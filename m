Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BEC32C898
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbhCDAup (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:45 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37282 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242964AbhCCRai (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 12:30:38 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 84E5292009C; Wed,  3 Mar 2021 18:29:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7703292009B;
        Wed,  3 Mar 2021 18:29:52 +0100 (CET)
Date:   Wed, 3 Mar 2021 18:29:52 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     yunqiang.su@cipunited.com
cc:     'Thomas Bogendoerfer' <tsbogend@alpha.franken.de>,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=E5=9B=9E=E5=A4=8D=3A_=5BPATC?=
 =?UTF-8?Q?H_v6=5D_MIPS=3A_force_use_FR=3D0_for_FPXX_binar?=
 =?UTF-8?Q?y?=
In-Reply-To: <000b01d70fdb$c7b74450$5725ccf0$@cipunited.com>
Message-ID: <alpine.DEB.2.21.2103031800130.19637@angie.orcam.me.uk>
References: <20210302022907.1835-1-yunqiang.su@cipunited.com> <alpine.DEB.2.21.2103021645120.19637@angie.orcam.me.uk> <000701d70fd0$ecbb21a0$c63164e0$@cipunited.com> <alpine.DEB.2.21.2103030321240.19637@angie.orcam.me.uk>
 <000b01d70fdb$c7b74450$5725ccf0$@cipunited.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 3 Mar 2021, yunqiang.su@cipunited.com wrote:

> >  The FRE mode causes a severe performance regression for single FP
> > operations, so we shouldn't use it for FPXX software.
> > 
> 
> If we need to run pre-R6 FPXX/FP32 app on r6 CPU, it may be the only choice
> for us.

 Nope, FPXX doesn't require FRE, and FPXX is all this change is about.

> Any way, in this case we need lots of T&E, the problem of FRE won't be a big
> problem.

 The R6 instruction set has been designed such as to minimise traps and 
emulations, so there is no point to make it worse for everyone for the 
sake of a broken corner case.

> >  As a matter of interest: do you have figures available as to how many
> > software packages are affected in Debian?
> > 
> 
> Almost all packages built with Golang in buster.

 How many is that though?  Two?  Ten?  A thousand?

> >  Also it has now struck me that another userland workaround should be
> > possible, by setting LD_PRELOAD in the environment system-wide to a
> > dummy FR=0 DSO (e.g. via /etc/environment or /etc/initscript; I reckon
> > systemd has its own way too), which will force the right mode the normal
> way.
> > All the distribution has been built for FPXX I presume, right?
> > 
> 
> It is not acceptable for "stable" branch of distributions.

 I'd say the chosen policy of any distribution is said distribution's 
problem, not the upstream kernel's.  You can have a local patch for the 
kernel too if you consider a kernel solution the only one that works for 
you.  From the discussion so far it looks to me like the least involving 
solution which will make everyone happy.

> >  Or I guess you could just rebuild libc as FR=0 instead, or is there a
> Golang
> > standard library that every Golang program uses?  And then have people
> > upgrade that package instead.
> > 
> 
> Rebuiding libc to FP32 is not acceptable, since we want to do is to support
> MSA,
> Which require FR=1 and all the result is FP64.

 Do you have any software build for MSA with your distribution already, 
or do you just plan it?  How is it expected work with non-MSA hardware, 
which I believe is still predominant?

 Also I'll repeat myself: is there a Golang standard library that every 
Golang program uses?

> In fact we found this problem when we try to enable MIPS_O32_FP64_SUPPORT,
> Without this option is enabled, all FPXX binaries are still use FR=0 mode:
> See: function mips_set_personality_fp()
> 
> So, here, we doesn't introduce the rollback to FR=0.

 So keep MIPS_O32_FP64_SUPPORT disabled then until the environment has 
been fixed?

> >  It seems to me like there are still a couple of alternatives available.
> > You might be able to come up with yet more if you continued looking for
> them.
> > I consider putting any workaround into the kernel the last resort really.
> The
> > problem is in the userland, so let's try hard to deal with it there.
> > 
> 
> Yes. It is problem of userland, while it has no way to fix in for the
> pre-exist binaries in userland.

 I gave you examples.  It appears the problem instead is with the 
distribution's policy, and the kernel is not there to work it around, 
sorry.

  Maciej
