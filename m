Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA3233EF6
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 08:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731341AbgGaGRK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 02:17:10 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59184 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731152AbgGaGRK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 02:17:10 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B2D24803202D;
        Fri, 31 Jul 2020 06:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RqL-rhfuLKKA; Fri, 31 Jul 2020 09:17:05 +0300 (MSK)
Date:   Fri, 31 Jul 2020 09:17:02 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Provide Kconfig option for default IEEE754
 conformance mode
Message-ID: <20200731061702.fxdfyxpvd6qrhoql@mobilestation>
References: <20200731041018.1381642-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200731041018.1381642-1-jiaxun.yang@flygoat.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 31, 2020 at 12:10:16PM +0800, Jiaxun Yang wrote:
> Requested by downstream distros, a Kconfig option for default
> IEEE754 conformance mode allows them to set their mode to
> relaxed by default.

That's what should have been here in the first place. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig            | 21 +++++++++++++++++++++
>  arch/mips/kernel/cpu-probe.c | 12 +++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index f6bb446d30f0..ef5b2a177b1b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2877,6 +2877,27 @@ config MIPS_NR_CPU_NR_MAP
>  	default 1024 if MIPS_NR_CPU_NR_MAP_1024
>  	default NR_CPUS if !MIPS_NR_CPU_NR_MAP_1024
>  
> +choice
> +	prompt "Default IEEE Std 754 conformance mode"
> +	default IEEE754_DEFAULT_STRICT
> +	help
> +	  Default IEEE Std 754 conformance mode, see ieee754= kernel parameter
> +	  for detail.
> +
> +	config IEEE754_DEFAULT_STRICT
> +		bool "Strict"
> +
> +	config IEEE754_DEFAULT_LEGACY
> +		bool "Legacy"
> +
> +	config IEEE754_DEFAULT_STD2008
> +		bool "2008"
> +
> +	config IEEE754_DEFAULT_RELAXED
> +		bool "Relaxed"
> +
> +endchoice
> +
>  #
>  # Timer Interrupt Frequency Configuration
>  #
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index d9e8d39a7289..03adeed58efb 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -157,7 +157,17 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
>   * IEEE 754 conformance mode to use.  Affects the NaN encoding and the
>   * ABS.fmt/NEG.fmt execution mode.
>   */
> -static enum { STRICT, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
> +enum ieee754_mode { STRICT, LEGACY, STD2008, RELAXED };
> +
> +#if defined(CONFIG_IEEE754_DEFAULT_STRICT)
> +static enum ieee754_mode ieee754 = STRICT;
> +#elif defined(CONFIG_IEEE754_DEFAULT_LEGACY)
> +static enum ieee754_mode ieee754 = LEGACY;
> +#elif defined(CONFIG_IEEE754_DEFAULT_STD2008)
> +static enum ieee754_mode ieee754 = STD2008;
> +#elif defined(CONFIG_IEEE754_DEFAULT_RELAXED)
> +static enum ieee754_mode ieee754 = RELAXED;
> +#endif
>  
>  /*
>   * Set the IEEE 754 NaN encodings and the ABS.fmt/NEG.fmt execution modes
> -- 
> 2.28.0
> 
