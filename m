Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F8C23F056
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 17:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgHGP71 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 11:59:27 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:47444 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgHGP71 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 11:59:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07706179|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0108605-0.00112385-0.988016;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03306;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.IE4BlWZ_1596815957;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IE4BlWZ_1596815957)
          by smtp.aliyun-inc.com(10.147.42.135);
          Fri, 07 Aug 2020 23:59:17 +0800
Subject: Re: [PATCH v2] MIPS: Provide Kconfig option for default IEEE 754
 conformance mode
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20200801061147.1412187-1-jiaxun.yang@flygoat.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <900c58a9-d706-be37-b160-603174a97e0f@wanyeetech.com>
Date:   Fri, 7 Aug 2020 23:59:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200801061147.1412187-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Jiaxun,

Reviewed-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

在 2020/8/1 下午2:11, Jiaxun Yang 写道:
> Requested by downstream distros, a Kconfig option for default
> IEEE 754 conformance mode allows them to set their mode to
> relaxed by default.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Huacai Chen <chenhc@lemote.com>
>
> --
> v2: Reword according to Xuerui's suggestion.
> ---
>   arch/mips/Kconfig            | 22 ++++++++++++++++++++++
>   arch/mips/kernel/cpu-probe.c | 12 +++++++++++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index eaf7519e3033..ac35df2b9133 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2899,6 +2899,28 @@ config MIPS_NR_CPU_NR_MAP
>   	default 1024 if MIPS_NR_CPU_NR_MAP_1024
>   	default NR_CPUS if !MIPS_NR_CPU_NR_MAP_1024
>   
> +choice
> +	prompt "Default IEEE 754 conformance mode"
> +	default IEEE754_DEFAULT_STRICT
> +	help
> +	  Sets the default IEEE 754 conformance mode, same as overriding the
> +	  default value for the ieee754= kernel parameter. See the kernel
> +	  parameter for details.
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
>   #
>   # Timer Interrupt Frequency Configuration
>   #
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index c231c1b67889..a5b8fe019afc 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -157,7 +157,17 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
>    * IEEE 754 conformance mode to use.  Affects the NaN encoding and the
>    * ABS.fmt/NEG.fmt execution mode.
>    */
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
>   /*
>    * Set the IEEE 754 NaN encodings and the ABS.fmt/NEG.fmt execution modes
