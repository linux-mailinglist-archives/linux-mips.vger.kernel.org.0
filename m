Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A22B585B61
	for <lists+linux-mips@lfdr.de>; Sat, 30 Jul 2022 19:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbiG3RXj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 30 Jul 2022 13:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234778AbiG3RXh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 Jul 2022 13:23:37 -0400
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EE917592
        for <linux-mips@vger.kernel.org>; Sat, 30 Jul 2022 10:23:36 -0700 (PDT)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay10.hostedemail.com (Postfix) with ESMTP id C2923C03F0;
        Sat, 30 Jul 2022 17:18:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id A3BB220026;
        Sat, 30 Jul 2022 17:18:11 +0000 (UTC)
Message-ID: <d5f8d6b58a32cdbf6326ccef7d46a58ba753edc7.camel@perches.com>
Subject: Re: [PATCH 2/2] Revert "MIPS: octeon: Remove vestiges of
 CONFIG_CAVIUM_RESERVE32"
From:   Joe Perches <joe@perches.com>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>,
        linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Corey Minyard <cminyard@mvista.com>,
        linux-kernel@vger.kernel.org
Date:   Sat, 30 Jul 2022 10:18:10 -0700
In-Reply-To: <20220725091740.28188-3-alexander.sverdlin@nokia.com>
References: <20220725091740.28188-1-alexander.sverdlin@nokia.com>
         <20220725091740.28188-3-alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Stat-Signature: rn19oi8jdotm5gdjqopn8gwjh47nnmqc
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: A3BB220026
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_NONE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX196ah4jm+vHIS1AIJE2N++tnRGDtQqDgT8=
X-HE-Tag: 1659201491-502993
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 2022-07-25 at 11:17 +0200, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> This reverts commit e98b461bb057aaea6fa766260788c08825213837.
> 
> We actually have been using the CONFIG_CAVIUM_RESERVE32 and previous patch
> defined it in the corresponding Kconfig.

Perhaps all of the uses of

#if defined(CONFIG_CAVIUM_RESERVE32)

should be

#if defined(CONFIG_CAVIUM_RESERVE32) && CONFIG_CAVIUM_RESERVE32

> diff --git a/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c b/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
[]
> @@ -57,14 +57,27 @@ EXPORT_SYMBOL_GPL(__cvmx_cmd_queue_state_ptr);
>  static cvmx_cmd_queue_result_t __cvmx_cmd_queue_init_state_ptr(void)
>  {
>  	char *alloc_name = "cvmx_cmd_queues";
> +#if defined(CONFIG_CAVIUM_RESERVE32) && CONFIG_CAVIUM_RESERVE32
> +	extern uint64_t octeon_reserve32_memory;
> +#endif

Like these

> +#if defined(CONFIG_CAVIUM_RESERVE32) && CONFIG_CAVIUM_RESERVE32
> +	if (octeon_reserve32_memory)
> +		__cvmx_cmd_queue_state_ptr =
> +		    cvmx_bootmem_alloc_named_range(sizeof(*__cvmx_cmd_queue_state_ptr),
> +						   octeon_reserve32_memory,
> +						   octeon_reserve32_memory +
> +						   (CONFIG_CAVIUM_RESERVE32 <<
> +						    20) - 1, 128, alloc_name);
> +	else
> +#endif
> +		__cvmx_cmd_queue_state_ptr =
> +		    cvmx_bootmem_alloc_named(sizeof(*__cvmx_cmd_queue_state_ptr),
> +					    128,
> +					    alloc_name);

[]

> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
[]
> @@ -284,6 +284,11 @@ void octeon_crash_smp_send_stop(void)
[]
> +#ifdef CONFIG_CAVIUM_RESERVE32

here.

> +uint64_t octeon_reserve32_memory;
> +EXPORT_SYMBOL(octeon_reserve32_memory);
> +#endif

[]

> @@ -661,7 +666,9 @@ void __init prom_init(void)
>  	int i;
>  	u64 t;
>  	int argc;
> -
> +#ifdef CONFIG_CAVIUM_RESERVE32
> +	int64_t addr = -1;

here

> +#endif
>  	/*
>  	 * The bootloader passes a pointer to the boot descriptor in
>  	 * $a3, this is available as fw_arg3.
> @@ -776,6 +783,25 @@ void __init prom_init(void)
>  		cvmx_write_csr(CVMX_LED_UDD_DATX(1), 0);
>  		cvmx_write_csr(CVMX_LED_EN, 1);
>  	}
> +#ifdef CONFIG_CAVIUM_RESERVE32

etc...

