Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A36B1F924C
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 10:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgFOIyj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 15 Jun 2020 04:54:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42855 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729237AbgFOIyj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 04:54:39 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DAB662000B;
        Mon, 15 Jun 2020 08:54:35 +0000 (UTC)
Date:   Mon, 15 Jun 2020 10:54:33 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, richard@nod.at,
        vigneshr@ti.com, jonas.gorski@gmail.com, linus.walleij@linaro.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200615105433.56fb5310@xps13>
In-Reply-To: <20200612073549.1658336-1-noltari@gmail.com>
References: <20200608160649.3717152-1-noltari@gmail.com>
        <20200612073549.1658336-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Álvaro,

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Fri, 12 Jun 2020
09:35:49 +0200:

> Instead of trying to parse CFE version string, which is customized by some
> vendors, let's just check that "CFE1" was passed on argument 3.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  v3: keep COMPILE_TEST compatibility by adding a new function that only checks
>      fw_arg3 when CONFIG_MIPS is defined.
>  v2: use CFE_EPTSEAL definition and avoid using an additional function.
> 
>  drivers/mtd/parsers/bcm63xxpart.c | 34 +++++++++++--------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
> index 78f90c6c18fd..c514c04789af 100644
> --- a/drivers/mtd/parsers/bcm63xxpart.c
> +++ b/drivers/mtd/parsers/bcm63xxpart.c
> @@ -22,6 +22,11 @@
>  #include <linux/mtd/partitions.h>
>  #include <linux/of.h>
>  
> +#ifdef CONFIG_MIPS
> +#include <asm/bootinfo.h>
> +#include <asm/fw/cfe/cfe_api.h>
> +#endif /* CONFIG_MIPS */
> +
>  #define BCM963XX_CFE_BLOCK_SIZE		SZ_64K	/* always at least 64KiB */
>  
>  #define BCM963XX_CFE_MAGIC_OFFSET	0x4e0
> @@ -32,28 +37,13 @@
>  #define STR_NULL_TERMINATE(x) \
>  	do { char *_str = (x); _str[sizeof(x) - 1] = 0; } while (0)
>  
> -static int bcm63xx_detect_cfe(struct mtd_info *master)
> +static inline int bcm63xx_detect_cfe(void)
>  {
> -	char buf[9];
> -	int ret;
> -	size_t retlen;
> -
> -	ret = mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
> -		       (void *)buf);
> -	buf[retlen] = 0;
> -
> -	if (ret)
> -		return ret;
> -
> -	if (strncmp("cfe-v", buf, 5) == 0)
> -		return 0;
> -
> -	/* very old CFE's do not have the cfe-v string, so check for magic */
> -	ret = mtd_read(master, BCM963XX_CFE_MAGIC_OFFSET, 8, &retlen,
> -		       (void *)buf);
> -	buf[retlen] = 0;
> -
> -	return strncmp("CFE1CFE1", buf, 8);
> +#ifdef CONFIG_MIPS
> +	return (fw_arg3 == CFE_EPTSEAL);
> +#else
> +	return 0;
> +#endif /* CONFIG_MIPS */

What about:

	ret = 0;

#ifdef CONFIG_MIPS
	ret = (fw_arg3 == CFE_EPTSEAL)
#endif

	return ret;

This is for shortening the conditional part.

>  }
>  
>  static int bcm63xx_read_nvram(struct mtd_info *master,
> @@ -138,7 +128,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
>  	struct bcm963xx_nvram *nvram = NULL;
>  	int ret;
>  
> -	if (bcm63xx_detect_cfe(master))
> +	if (!bcm63xx_detect_cfe())
>  		return -EINVAL;
>  
>  	nvram = vzalloc(sizeof(*nvram));

Thanks,
Miquèl
