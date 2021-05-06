Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850FF374D6F
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 04:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbhEFCU4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 22:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbhEFCU4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 22:20:56 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BC5C061574;
        Wed,  5 May 2021 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=V4mzC/03A9PkISlLKmH95T2sRtfj/+QS0FV6NnWc8lQ=; b=CUr3GwM5D2MsDbraiZI94JBpka
        WqDevTQVDVCA4lekRPRoLZa7TnjVAxNC7GLWBoSokdpYnl5iTCxvUcsjzVNpAODRWfEUX1g5ooF0d
        68H2+eHfNK7VWL//FTxLSG3KImrJ4hOTCNPZRkjWUDAhbjT6GdOUIxTlcvcXot8cnEUDy9YuBXWt3
        yb6L8vZIUlbSA2rQq5Cz+/VgHLcdnD9xPI5PrdOOOaouWA1KlY/rNqGEvmkcs3Lq1xuaI2iURHJqR
        q1F+zzoCjQwD4Er+g0MTxOcIEhzJsaHLGLadz73RCramFLrhuc1JEnrMV2k/jx+esiuWpTFQWsZjE
        V0nj4pPQ==;
Received: from [2601:1c0:6280:3f0::7376]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1leTbu-001BiG-Jg; Thu, 06 May 2021 02:19:44 +0000
Subject: Re: [PATCH] MIPS: Loongson64: Fix build error 'secondary_kexec_args'
 undeclared under !SMP
To:     Youling Tang <tangyouling@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1e8a74a8-3139-c77a-3eab-4ae0ff42ee0b@infradead.org>
Date:   Wed, 5 May 2021 19:19:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/5/21 7:02 PM, Youling Tang wrote:
> On the Loongson64 platform, if CONFIG_SMP is not set, the following build
> error will occur:
> arch/mips/loongson64/reset.c:133:2: error:'secondary_kexec_args' undeclared
> 
> Because the definition and declaration of secondary_kexec_args are in the
> CONFIG_SMP, the secondary_kexec_args variable should be used in CONFIG_SMP.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  arch/mips/loongson64/reset.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index c97bfdc..758d5d2 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -126,11 +126,12 @@ static void loongson_kexec_shutdown(void)
>  	for_each_possible_cpu(cpu)
>  		if (!cpu_online(cpu))
>  			cpu_device_up(get_cpu_device(cpu));
> +
> +	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>  #endif
>  	kexec_args[0] = kexec_argc;
>  	kexec_args[1] = fw_arg1;
>  	kexec_args[2] = fw_arg2;
> -	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>  	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
>  	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>  }
> @@ -141,7 +142,9 @@ static void loongson_crash_shutdown(struct pt_regs *regs)
>  	kexec_args[0] = kdump_argc;
>  	kexec_args[1] = fw_arg1;
>  	kexec_args[2] = fw_arg2;
> +#ifdef CONFIG_SMP
>  	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
> +#endif
>  	memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
>  	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>  }
> 


Acked-by: Randy Dunlap <rdunlap@infradead.org>

Yep, slightly better than my version:
https://lore.kernel.org/lkml/20210430205055.13594-1-rdunlap@infradead.org/

-- 
~Randy

