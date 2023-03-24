Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0EC6C7EDA
	for <lists+linux-mips@lfdr.de>; Fri, 24 Mar 2023 14:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjCXNc7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Mar 2023 09:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbjCXNc5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Mar 2023 09:32:57 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C118D23A6C
        for <linux-mips@vger.kernel.org>; Fri, 24 Mar 2023 06:32:34 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pfhWt-0001BF-01; Fri, 24 Mar 2023 14:32:27 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 49AFEC1B91; Fri, 24 Mar 2023 14:31:16 +0100 (CET)
Date:   Fri, 24 Mar 2023 14:31:16 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com
Subject: Re: [PATCH v2 06/12] MIPS: c-octeon: Provide alternative SMP cache
 flush function
Message-ID: <20230324133116.GB15949@alpha.franken.de>
References: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
 <20230321104852.25284-7-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321104852.25284-7-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 21, 2023 at 10:48:46AM +0000, Jiaxun Yang wrote:
> Curretly c-octeon relies on octeon's own smp function to flush

typo

> I-Cache. However this function is not available on generic platform.
> 
> Just use smp_call_function_many on generic platform.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Style fix
> ---
>  arch/mips/mm/c-octeon.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
> index c7ed589de882..b7393b61cfa7 100644
> --- a/arch/mips/mm/c-octeon.c
> +++ b/arch/mips/mm/c-octeon.c
> @@ -83,8 +83,13 @@ static void octeon_flush_icache_all_cores(struct vm_area_struct *vma)
>  	else
>  		mask = *cpu_online_mask;
>  	cpumask_clear_cpu(cpu, &mask);
> +#ifdef CONFIG_CAVIUM_OCTEON_SOC
>  	for_each_cpu(cpu, &mask)
>  		octeon_send_ipi_single(cpu, SMP_ICACHE_FLUSH);
> +#else
> +	smp_call_function_many(&mask, (smp_call_func_t)octeon_local_flush_icache,
> +			       NULL, 1);
> +#endif
>  
>  	preempt_enable();
>  #endif
> -- 
> 2.37.1 (Apple Git-137.1)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
