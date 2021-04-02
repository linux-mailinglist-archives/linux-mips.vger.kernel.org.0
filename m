Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A69352E72
	for <lists+linux-mips@lfdr.de>; Fri,  2 Apr 2021 19:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbhDBRca (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Apr 2021 13:32:30 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:19038 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236523AbhDBRcP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Apr 2021 13:32:15 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FBnDW1HYQz9v3qR;
        Fri,  2 Apr 2021 19:32:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id JHnZja8v_c6i; Fri,  2 Apr 2021 19:32:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FBnDW0PJdz9v3qQ;
        Fri,  2 Apr 2021 19:32:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E6368BB77;
        Fri,  2 Apr 2021 19:32:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id ipqYX6I0tWmG; Fri,  2 Apr 2021 19:32:13 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 32C7A8BB6F;
        Fri,  2 Apr 2021 19:32:12 +0200 (CEST)
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
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
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6d50809a-eb6b-b8bb-bb8b-88f66c52c0fa@csgroup.eu>
Date:   Fri, 2 Apr 2021 19:32:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 30/03/2021 à 19:56, Daniel Walker a écrit :
> It looks like there's some seepage of cmdline stuff into
> the generic device tree code. This conflicts with the
> generic cmdline implementation so I remove it in the case
> when that's enabled.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   drivers/of/fdt.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index dcc1dd96911a..d8805cd9717a 100644
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
> @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   
>   	/* Retrieve command line */
>   	p = of_get_flat_dt_prop(node, "bootargs", &l);
> +
> +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> +	/*
> +	 * The builtin command line will be added here, or it can override
> +	 * with the DT bootargs.
> +	 */
> +	cmdline_add_builtin(data,
> +			    (l > 0 ? p : NULL), /* This is sanity checking */
> +			    COMMAND_LINE_SIZE);
> +#elif defined(CONFIG_GENERIC_CMDLINE)
> +	strlcpy(data, p, COMMAND_LINE_SIZE);
> +#else

Ugly.

Linux codying style recommend to limit the use of #ifdefs to headers as much as possible.

Why do we need so many alternatives ? Allthough they are temporary, can we order the changes in 
another way to reduce that ?

>   	if (p != NULL && l > 0)
>   		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>   
> @@ -1070,6 +1083,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>   #endif
>   #endif /* CONFIG_CMDLINE */
> +#endif /* CONFIG_GENERIC_CMDLINE */
>   
>   	pr_debug("Command line is: %s\n", (char *)data);
>   
> 
