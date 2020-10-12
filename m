Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687A428B255
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387616AbgJLKiS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:58431 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387599AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-07; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 841EFC1140; Mon, 12 Oct 2020 12:34:47 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:34:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 1/4 RESEND] MIPS: Loongson64: Select SMP in Kconfig to
 avoid build error
Message-ID: <20201012103447.GA7953@alpha.franken.de>
References: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
 <1602373674-4579-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602373674-4579-2-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Oct 11, 2020 at 07:47:51AM +0800, Tiezhu Yang wrote:
> In the current code, CONFIG_SMP can be set as N by user on the Loongson
> platform, then there exists the following build error under !CONFIG_SMP:
> 
>   CC      arch/mips/kernel/asm-offsets.s
> In file included from ./include/linux/gfp.h:9:0,
>                  from ./include/linux/xarray.h:14,
>                  from ./include/linux/radix-tree.h:18,
>                  from ./include/linux/fs.h:15,
>                  from ./include/linux/compat.h:17,
>                  from arch/mips/kernel/asm-offsets.c:12:
> ./include/linux/topology.h: In function 'numa_node_id':
> ./include/linux/topology.h:119:2: error: implicit declaration of function 'cpu_logical_map' [-Werror=implicit-function-declaration]
>   return cpu_to_node(raw_smp_processor_id());
>   ^
> cc1: some warnings being treated as errors
> scripts/Makefile.build:117: recipe for target 'arch/mips/kernel/asm-offsets.s' failed
> make[1]: *** [arch/mips/kernel/asm-offsets.s] Error 1
> 
> Select SMP in Kconfig to avoid the above build error and then remove
> CONFIG_SMP=y in loongson3_defconfig.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> v2: no changes
> 
>  arch/mips/Kconfig                     | 1 +
>  arch/mips/configs/loongson3_defconfig | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
