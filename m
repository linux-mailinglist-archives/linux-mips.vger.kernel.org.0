Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA0A2E725F
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 17:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgL2QkJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 11:40:09 -0500
Received: from elvis.franken.de ([193.175.24.41]:45176 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgL2QkI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 11:40:08 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kuI1p-0007OT-00; Tue, 29 Dec 2020 17:39:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9CCF2C07BF; Tue, 29 Dec 2020 17:39:07 +0100 (CET)
Date:   Tue, 29 Dec 2020 17:39:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson64: Give chance to build under
 !CONFIG_NUMA and !CONFIG_SMP
Message-ID: <20201229163907.GA8519@alpha.franken.de>
References: <1606998772-5904-1-git-send-email-yangtiezhu@loongson.cn>
 <20201215132123.GA9201@alpha.franken.de>
 <3eb215e2-82ae-2834-2837-55f429027840@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3eb215e2-82ae-2834-2837-55f429027840@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 16, 2020 at 10:44:23AM +0800, Tiezhu Yang wrote:
> I have tested the following three configs on the Loongson platform:
> (1) !NUMA and !SMP,
> (2) !NUMA and SMP,
> (3) NUMA and SMP,
> everything is all right.
> 
> But there exists the following build error under NUMA and !SMP:
> 
>   CC      arch/mips/kernel/asm-offsets.s
> In file included from ./include/linux/gfp.h:9:0,
>                  from ./include/linux/xarray.h:14,
>                  from ./include/linux/radix-tree.h:19,
>                  from ./include/linux/fs.h:15,
>                  from ./include/linux/compat.h:17,
>                  from arch/mips/kernel/asm-offsets.c:12:
> ./include/linux/topology.h: In function ‘numa_node_id’:
> ./include/linux/topology.h:119:2: error: implicit declaration of function
> ‘cpu_logical_map’ [-Werror=implicit-function-declaration]
>   return cpu_to_node(raw_smp_processor_id());
>   ^
> cc1: some warnings being treated as errors
> scripts/Makefile.build:117: recipe for target
> 'arch/mips/kernel/asm-offsets.s' failed
> make[1]: *** [arch/mips/kernel/asm-offsets.s] Error 1
> arch/mips/Makefile:396: recipe for target 'archprepare' failed
> make: *** [archprepare] Error 2
> 
> I find a patch to fix this kind of build errors [1], but it seems
> meaningless.
> 
> According to the NUMA and SMP description in arch/mips/Kconfig,
> we will use only one CPU of a multiprocessor machine if !SMP,
> on single node systems leave NUMA disabled.
> 
> So I think there is no need to use NUMA if !SMP, and also we should
> make NUMA depend on SMP to avoid build errors.

ok, but compiling IP27 with your patch gives

WARNING: unmet direct dependencies detected for NUMA
  Depends on [n]: SYS_SUPPORTS_NUMA [=y] && SMP [=n]
  Selected by [y]:
  - SGI_IP27 [=y] && <choice>

WARNING: unmet direct dependencies detected for NUMA
  Depends on [n]: SYS_SUPPORTS_NUMA [=y] && SMP [=n]
  Selected by [y]:
  - SGI_IP27 [=y] && <choice>

WARNING: unmet direct dependencies detected for NUMA
  Depends on [n]: SYS_SUPPORTS_NUMA [=y] && SMP [=n]
  Selected by [y]:
  - SGI_IP27 [=y] && <choice>

If I use "select SMP" instead both ip27 and loongson64 compile.

If you are ok with this change, I'll change it while appling your
patch.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
