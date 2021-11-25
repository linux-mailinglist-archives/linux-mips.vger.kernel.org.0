Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCB345DE69
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 17:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbhKYQPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 11:15:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:41071 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356569AbhKYQNp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 11:13:45 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mqHKR-0005zr-02; Thu, 25 Nov 2021 17:10:31 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0BDC2C2F82; Thu, 25 Nov 2021 16:55:28 +0100 (CET)
Date:   Thu, 25 Nov 2021 16:55:28 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 4/4] MIPS: loongson64: fix FTLB configuration
Message-ID: <20211125155527.GC11524@alpha.franken.de>
References: <20211125105949.27147-1-huangpei@loongson.cn>
 <20211125105949.27147-5-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125105949.27147-5-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 25, 2021 at 06:59:49PM +0800, Huang Pei wrote:
> It turns out that 'decode_configs' -> 'set_ftlb_enable' is called under
> c->cputype unset, which leaves FTLB disabled on BOTH 3A2000 and 3A3000
> 
> Fix it by calling "decode_configs" after c->cputype is initialized
> 
> Fixes: da1bd29742b1 ("MIPS: Loongson64: Probe CPU features via CPUCFG")
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/cpu-probe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index ac0e2cfc6d57..24a529c6c4be 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1734,8 +1734,6 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
>  
>  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>  {
> -	decode_configs(c);
> -
>  	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
>  	c->options |= MIPS_CPU_GSEXCEX;
>  
> @@ -1796,6 +1794,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>  		panic("Unknown Loongson Processor ID!");
>  		break;
>  	}
> +
> +	decode_configs(c);
>  }
>  #else
>  static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
> -- 
> 2.20.1

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
