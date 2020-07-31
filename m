Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FE8234144
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 10:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbgGaId0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 04:33:26 -0400
Received: from [115.28.160.31] ([115.28.160.31]:40014 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728494AbgGaId0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 31 Jul 2020 04:33:26 -0400
Received: from hanazono.local (unknown [116.236.177.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C255260130;
        Fri, 31 Jul 2020 16:33:21 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1596184402; bh=k/rgArit88h2OIcboYHgG+XD5TJS5EAhZcv7J3t+lVI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bsRjpc5HvVev7q1qhFOKfcib8o1VPe5FXGjacL8nFgYY4IZG74bT826t7qK42JNkp
         1ztaK5ZKjz1zHgOLU+9NncrSqwkdapZV09ZF+pNqWP3r8Ibd5G+KKT6NFg+a050jHJ
         uUMqqtaW9Bq0x/ml1NXmH5Jldl5Zfxze9ufxyRag=
Subject: Re: [PATCH] MIPS: Provide Kconfig option for default IEEE754
 conformance mode
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20200731041018.1381642-1-jiaxun.yang@flygoat.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <e314d7f4-56cb-950f-6f38-d49a00101f5f@xen0n.name>
Date:   Fri, 31 Jul 2020 16:33:21 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:81.0)
 Gecko/20100101 Thunderbird/81.0a1
MIME-Version: 1.0
In-Reply-To: <20200731041018.1381642-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

Nice catch! Only one minor nit. Otherwise:

Reviewed-by: WANG Xuerui <git@xen0n.name>


On 2020/7/31 12:10, Jiaxun Yang wrote:
> Requested by downstream distros, a Kconfig option for default
> IEEE754 conformance mode allows them to set their mode to
> relaxed by default.
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

Here and the title, "IEEE Std 754" can be just "IEEE 754". I don't
remember seeing the "IEEE Std 754" phrase anywhere.

I suggest the following help message:

"Sets the default IEEE 754 conformance mode, same as overriding the
default value for the ieee754= kernel parameter. See the kernel
parameter for details."

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
