Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E91432BD89
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhCCQMO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:12:14 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37256 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350530AbhCCC47 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 21:56:59 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id E939B92009C; Wed,  3 Mar 2021 03:56:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id DD7FD92009B;
        Wed,  3 Mar 2021 03:56:13 +0100 (CET)
Date:   Wed, 3 Mar 2021 03:56:13 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     yunqiang.su@cipunited.com
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=5BPATCH_v6=5D_MIPS=3A_fo?=
 =?UTF-8?Q?rce_use_FR=3D0_for_FPXX_binary?=
In-Reply-To: <000701d70fd0$ecbb21a0$c63164e0$@cipunited.com>
Message-ID: <alpine.DEB.2.21.2103030321240.19637@angie.orcam.me.uk>
References: <20210302022907.1835-1-yunqiang.su@cipunited.com> <alpine.DEB.2.21.2103021645120.19637@angie.orcam.me.uk> <000701d70fd0$ecbb21a0$c63164e0$@cipunited.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 3 Mar 2021, yunqiang.su@cipunited.com wrote:

> > > v5->v6:
> > > 	Rollback to V3, aka remove config option.
> > 
> >  You can't reuse v3 as it stands because it breaks R6 as we previously
> > discussed.  You need to tell R6 and earlier ISAs apart and set the FR bit
> > accordingly.
> > 
> 
> It won't break r6, as all of r6 binary is FP64, and on r6
>    `frdefault' is always false, and `fr1' is always true.
> It won't trigger this mode switch.
> 
> Oh, you are right, there may be a case that to run legacy app on r6 CPU.
> For this case, on r6, we need to set the CPU to FRE mode.

 The FRE mode causes a severe performance regression for single FP 
operations, so we shouldn't use it for FPXX software.

 As a matter of interest: do you have figures available as to how many 
software packages are affected in Debian?

 Also it has now struck me that another userland workaround should be 
possible, by setting LD_PRELOAD in the environment system-wide to a 
dummy FR=0 DSO (e.g. via /etc/environment or /etc/initscript; I reckon 
systemd has its own way too), which will force the right mode the normal 
way.  All the distribution has been built for FPXX I presume, right?

 You can distribute a package with the dummy along with the environment 
entry to all the people who require it.  I fail to see how it could be 
more problematic than getting a questionable hack included in the kernel 
forever and then requiring everyone to upgrade the relevant packages 
anyway, which you will have to supply for stable releases too.

 Or I guess you could just rebuild libc as FR=0 instead, or is there a
Golang standard library that every Golang program uses?  And then have 
people upgrade that package instead.

 It seems to me like there are still a couple of alternatives available.  
You might be able to come up with yet more if you continued looking for 
them.  I consider putting any workaround into the kernel the last resort 
really.  The problem is in the userland, so let's try hard to deal with 
it there.

  Maciej
