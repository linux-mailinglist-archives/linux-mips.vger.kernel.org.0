Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F206E2BB918
	for <lists+linux-mips@lfdr.de>; Fri, 20 Nov 2020 23:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgKTWhv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Nov 2020 17:37:51 -0500
Received: from [157.25.102.26] ([157.25.102.26]:40570 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726255AbgKTWhv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 20 Nov 2020 17:37:51 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 011112BE0EC;
        Fri, 20 Nov 2020 22:37:47 +0000 (GMT)
Date:   Fri, 20 Nov 2020 22:37:44 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [RFC PATCH] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
In-Reply-To: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <alpine.LFD.2.21.2011202202290.656242@eddie.linux-mips.org>
References: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 16 Nov 2020, Tiezhu Yang wrote:

> Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
> CONFIG_DEBUG_ATOMIC_SLEEP:
> 
>   CC      arch/mips/kernel/signal.o
> {standard input}: Assembler messages:
> {standard input}:1775: Error: Unable to parse register name $fp
> scripts/Makefile.build:283: recipe for target 'arch/mips/kernel/signal.o' failed
> make[2]: *** [arch/mips/kernel/signal.o] Error 1
> scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
> make[1]: *** [arch/mips/kernel] Error 2
> Makefile:1799: recipe for target 'arch/mips' failed
> make: *** [arch/mips] Error 2

 Your change description does not explain to me what is going on here I am 
afraid, and based on it I am unable to determine if it is fit for purpose.  

 It seems to me like your change papers over an issue by changing code 
generation somehow with the kernel configuration option selected so that 
invalid assembly is not produced anymore while invalid assembly should not 
happen in the first place regardless of the configuration.

 In particular `$fp' is a standard assembly alias for `$30' aka `$s8' and 
it is expected to work where `$30' or indeed any general-purpose register 
would:

#define SYMBOLIC_REGISTER_NAMES \
[...]
    {"$s8",	RTYPE_GP | 30}, \
    {"$fp",	RTYPE_GP | 30}, \
    {"$ra",	RTYPE_GP | 31}

(from gas/config/tc-mips.c) so please show us what the assembly line GAS 
chokes on looks like in your case.

> Documentation/dev-tools/kgdb.rst
> This option inserts code to into the compiled executable which saves
> the frame information in registers or on the stack at different points
> which allows a debugger such as gdb to more accurately construct stack
> back traces while debugging the kernel.

 Hmm, this is what DWARF debug information is for in the context of GDB, 
and I certainly used to use GDB to debug standard MIPS/Linux kernels built 
without the use of a separate frame pointer register (which there wasn't a 
kernel configuration option for back then, though which you obviously 
still could try to enforce with the use of `-fno-omit-frame-pointer' via 
CFLAGS) using JTAG probes or simulation some 15 years ago.

 And given the variable layout of the MIPS stack frame (unlike with some 
psABIs, e.g. Power) the use of `$fp' alone does not let you reconstruct a 
backtrace, because you cannot infer from the value of `$fp' where to 
retrieve the value of `$ra' from.  For that you need debug information.

 So the information you quote seems misleading or missing the context.

 NB hardly any MIPS software uses the frame pointer register and all is 
debuggable regardless; the only actual use for $fp is `alloca', VLAs or 
similar dynamic frame arrangements.

 So what actual problem are you trying to solve, except for the assembly 
error, and what is your use case for `$fp' with MIPS kernel debugging?

  Maciej
