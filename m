Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7529C32CD5C
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 08:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235955AbhCDHKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 02:10:54 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:62641 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235953AbhCDHKk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 02:10:40 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4Drhnr3xRRz9v1Mj;
        Thu,  4 Mar 2021 08:09:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id O2PkTkGHV1vi; Thu,  4 Mar 2021 08:09:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4Drhnr1f4vz9v1Mh;
        Thu,  4 Mar 2021 08:09:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 9307E8B7F7;
        Thu,  4 Mar 2021 08:09:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id Lxx4YMro9UFv; Thu,  4 Mar 2021 08:09:53 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 771458B773;
        Thu,  4 Mar 2021 08:09:52 +0100 (CET)
Subject: Re: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
To:     Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210304044803.812204-2-danielwa@cisco.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2b0081aa-52af-a4ab-7481-6e125bd103d6@csgroup.eu>
Date:   Thu, 4 Mar 2021 08:09:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304044803.812204-2-danielwa@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 04/03/2021 à 05:47, Daniel Walker a écrit :
> It looks like there's some seepage of cmdline stuff into
> the generic device tree code. This conflicts with the
> generic cmdline implementation so I remove it in the case
> when that's enabled.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   drivers/of/fdt.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index feb0f2d67fc5..cfe4f8d3c9f5 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -25,6 +25,7 @@
>   #include <linux/serial_core.h>
>   #include <linux/sysfs.h>
>   #include <linux/random.h>
> +#include <linux/cmdline.h>
>   
>   #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>   #include <asm/page.h>
> @@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   
>   	early_init_dt_check_for_initrd(node);
>   
> +#ifdef CONFIG_GENERIC_CMDLINE
>   	/* Retrieve command line */
>   	p = of_get_flat_dt_prop(node, "bootargs", &l);
> +
> +	/*
> +	 * The builtin command line will be added here, or it can override
> +	 * with the DT bootargs.
> +	 */
> +	cmdline_add_builtin(data,
> +			    ((p != NULL && l > 0) ? p : NULL), /* This is sanity checking */

Can we do more simple ? If p is NULL, p is already NULL, so (l > 0 ? p : NULL) should be enough.

> +			    COMMAND_LINE_SIZE);
> +#else

What does p contains now that "p = of_get_flat_dt_prop(node, "bootargs", &l);" is only called when 
CONFIG_GENERIC_CMDLINE is defined ?

>   	if (p != NULL && l > 0)
>   		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>   
> @@ -1070,6 +1081,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>   #endif
>   #endif /* CONFIG_CMDLINE */
> +#endif /* CONFIG_GENERIC_CMDLINE */
>   
>   	pr_debug("Command line is: %s\n", (char *)data);
>   
> 
