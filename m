Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECAB33FBD5
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 00:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhCQXaZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 19:30:25 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:37814 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhCQX3z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 19:29:55 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id BB20A92009C; Thu, 18 Mar 2021 00:29:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id B651592009B;
        Thu, 18 Mar 2021 00:29:53 +0100 (CET)
Date:   Thu, 18 Mar 2021 00:29:53 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     yunqiang.su@cipunited.com
cc:     'Thomas Bogendoerfer' <tsbogend@alpha.franken.de>,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=E5=9B=9E=E5=A4=8D=3A_=E5=9B?=
 =?UTF-8?Q?=9E=E5=A4=8D=3A_=5BPATCH_v6=5D_MIPS=3A_force_use_FR?=
 =?UTF-8?Q?=3D0_for_FPXX_binary?=
In-Reply-To: <000e01d7109e$27296360$757c2a20$@cipunited.com>
Message-ID: <alpine.DEB.2.21.2103172344360.21463@angie.orcam.me.uk>
References: <20210302022907.1835-1-yunqiang.su@cipunited.com> <alpine.DEB.2.21.2103021645120.19637@angie.orcam.me.uk> <000701d70fd0$ecbb21a0$c63164e0$@cipunited.com> <alpine.DEB.2.21.2103030321240.19637@angie.orcam.me.uk> <000b01d70fdb$c7b74450$5725ccf0$@cipunited.com>
 <alpine.DEB.2.21.2103031800130.19637@angie.orcam.me.uk> <000e01d7109e$27296360$757c2a20$@cipunited.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 4 Mar 2021, yunqiang.su@cipunited.com wrote:

> >  How many is that though?  Two?  Ten?  A thousand?
> 
> syq@m530-2:~$ cat
> /var/lib/apt/lists/mirrors.aliyun.com_debian_dists_sid_main_source_Sources |
> grep 'Build-Depends' | grep golang | wc
>    2039   21384  344099

 Ack, that's quite a lot indeed.

> >  I'd say the chosen policy of any distribution is said distribution's
> problem, not
> > the upstream kernel's.  You can have a local patch for the kernel too if
> you
> > consider a kernel solution the only one that works for you.  From the
> > discussion so far it looks to me like the least involving solution which
> will
> > make everyone happy.
> > 
> 
> It is not only about one distribution, instead of all distribution, since
> this is caused by the bug of Golang distribution.

 I think every distribution is free to handle the problem their own way.  
You have asked on behalf of Debian, so we're discussing what Debian can 
do.  Other distributions may or may not follow.

> >  Also I'll repeat myself: is there a Golang standard library that every
> Golang
> > program uses?
> > 
> 
> Yes. It even effect /usr/bin/go itself, and all of binaries its generate may
> be effected.

 Sigh, you did not answer my question again, but I have lost my patience 
and figured it out myself, as noted with v7 (libgo.so.17 is the Golang 
standard library as at GCC 11).  The obvious userland solution goes along 
with it.  You don't even have to do anything really.

 NB please keep the subject proper of the cover letter the same with every 
iteration of a patch series, as in that case mail user agents (at least 
the sane ones) will group all iterations together in the thread sorting 
mode.  With the subject changed every time the link is lost and 
submissions are scattered all over the mail folder.

  Maciej
