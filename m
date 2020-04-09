Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA201A369A
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 17:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgDIPHt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 11:07:49 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:39000 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbgDIPHt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 11:07:49 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994900AbgDIPHqi08Bp (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Thu, 9 Apr 2020 17:07:46 +0200
Date:   Thu, 9 Apr 2020 16:07:46 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     YunQiang Su <wzssyqa@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
In-Reply-To: <20200409150923.5b224361@flygoat-x1e>
Message-ID: <alpine.LFD.2.21.2004091540450.596385@eddie.linux-mips.org>
References: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn>        <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com> <20200409150923.5b224361@flygoat-x1e>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 Apr 2020, Jiaxun Yang wrote:

> > > There is no need to build and call check_bugs32() under
> > > CONFIG_64BIT, just limit it under CONFIG_32BIT.  
> > 
> > Since 32bit is subset of 64bit, and due to the code, I think that the
> > initial purpose
> > of check_bugs32() is also willing to run even with CONFIG_64BIT.
> > 
> > For example, if we have a CPU which is 64bit, and work well on 64bit
> > mode, while has a bug only on 32bit mode, check_bugs32 should be used
> > here.
> > 
> > Loongson's 3A 1000 is the example, I cannot support FP32 mode well.
> 
> In this case bugs32 only contains a workaround for MIPS34K, which is a
> MIPS32 processor. It's safe to do so.

 This is because commit c65a5480ff29 ("[MIPS] Fix potential latency 
problem due to non-atomic cpu_wait.") moved the other generic workaround 
elsewhere.

 The intent has been since historical commit 450ad16ba0ab ("Get rid of 
arch/mips64/kernel.  9116 lines of code gone.") that `check_bugs32' is for 
generic errata affecting both 32-bit and 64-bit operation (e.g. 32-bit 
instructions, which naturally may occur in both cases) and `check_bugs64' 
is for errata affecting 64-bit operation only (e.g. 64-bit instructions).

 But currently it appears we have no generic errata handled, as surely a 
34K erratum cannot affect 64-bit operation.  So I think such a change 
makes sense in principle (if a generic erratum appears in the future we 
can add a third category, which includes workarounds that are always 
applied), but I think it has to be made in a cleaner way.

 Specifically `check_errata' has to be renamed to `check_errata32', some 
commentary added as to the intent, and last but not least a proper change 
description added that not only repeats what the change does (and what 
everyone sees regardless), but actually justifies why the change is made.  
Saying: "There is no need[...]" does not tell us *why* there is no need.

> But my suggestion is if you're going to clean-up bugs and workarounds
> you'd better establish a file for silicon bugs and provide Kconfig
> options to enable & disable them. Manage bug dependencies by Kconfig
> will be easier.

 Why is using Kconfig supposed to be better?  Several configurations 
support multiple processor types (e.g. swappable CPU daugthercards or FPGA 
soft-cores) and having to list CPU types across platforms as CPUs are 
added is going to be a maintenance nightmare.  Whereas having workarounds 
or panics associated with run-time determination of the actual CPU type 
guarantees they will trigger where necessary.  The use of `init' sections 
assures the reclaim of memory for use after bootstrap.

 OTOH I agree splitting off errata handling to a separate file may make 
sense for structural reasons; we have it already for `check_bugs64'.

  Maciej
