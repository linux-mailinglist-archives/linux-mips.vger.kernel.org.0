Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CBE1D66AC
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 10:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgEQIzp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 04:55:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:56346 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbgEQIzo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 04:55:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jaF5B-0003F8-01; Sun, 17 May 2020 10:55:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E6ECBC04D6; Sun, 17 May 2020 10:37:54 +0200 (CEST)
Date:   Sun, 17 May 2020 10:37:54 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v2 RESEND 4/4] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
Message-ID: <20200517083754.GB3939@alpha.franken.de>
References: <20200503103304.40678-5-git@xen0n.name>
 <20200503105012.43246-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503105012.43246-1-git@xen0n.name>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 03, 2020 at 06:50:13PM +0800, WANG Xuerui wrote:
> +#endif
> +
> +#endif /* _ASM_MACH_LOONGSON64_CPUCFG_EMUL_H_ */
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index ca2e6f1af4fe..907e31ff562f 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -28,6 +28,8 @@
>  #include <asm/spram.h>
>  #include <linux/uaccess.h>
>  
> +#include <asm/mach-loongson64/cpucfg-emul.h>
> +

this doesn't fly:

In file included from /local/tbogendoerfer/korg/linux/arch/mips/kernel/cpu-probe.c:31:0:
/local/tbogendoerfer/korg/linux/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h:7:27: fatal error: loongson_regs.h: No such file or directory
 #include <loongson_regs.h>
                           ^
compilation terminated.

Is there a chance to put this code in a loongsoon specific file ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
