Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0278631CB82
	for <lists+linux-mips@lfdr.de>; Tue, 16 Feb 2021 14:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhBPN4X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Feb 2021 08:56:23 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:34238 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhBPN4U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Feb 2021 08:56:20 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 799E292009D; Tue, 16 Feb 2021 14:55:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7266592009C;
        Tue, 16 Feb 2021 14:55:36 +0100 (CET)
Date:   Tue, 16 Feb 2021 14:55:36 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        kernel test robot <lkp@intel.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Add basic support for ptrace single step
In-Reply-To: <20210212163335.GA12558@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2102161433520.1521@angie.orcam.me.uk>
References: <1612939961-8827-1-git-send-email-yangtiezhu@loongson.cn> <20210211102905.GE7985@alpha.franken.de> <20210212163335.GA12558@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 12 Feb 2021, Thomas Bogendoerfer wrote:

> > IMHO ptrace single step is for CPUs supporting single stepping and not
> > for emulating it in the kernel.
> 
> I've checked other arch how they implement single step, and looks like
> I'm wrong. So I'm ok with applying your patch. Can you resend it again,
> so I'll get the latest version in patchwork ?

 Huh?  How is that supposed to work?  Skimming over the code it hardcodes 
the breakpoint instruction, which is ISA-dependent and relies on branches 
or jumps to have a delay slot, which is not universally true.  The kernel 
does not know all the exotic branches the MIPS ISA has (BC1ANY4F anyone?) 
either and IMHO should not.

 This is broken and belongs to the userland anyway.  See how complex the 
handling is in GDB, specifically `mips16_next_pc', `micromips_next_pc' and 
`mips32_next_pc' in gdb/mips-tdep.c.

 We do have branch emulation code, but it was intended for a different 
purpose and is therefore not complete enough for single-stepping 
emulation.

 And I find it regrettable that the kernel has become so bloated here and 
attempts are made to make it even more bloated.  All under the original 
excuse made by FP emulation code, which also should have been made in the 
userland.  It all really does not belong to the kernel with its elevated 
privilege.  It does not require the privilege.

 We do need a ptrace(2) request to stop on signal handler invocation 
though, which is something we have been missing and never got to 
implementing.

  Maciej
