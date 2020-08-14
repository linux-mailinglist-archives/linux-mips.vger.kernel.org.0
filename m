Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F722446A4
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 10:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgHNI4V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 04:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgHNI4U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Aug 2020 04:56:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE96C061383;
        Fri, 14 Aug 2020 01:56:19 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 17so4249336pfw.9;
        Fri, 14 Aug 2020 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zTcT2yb4VlahiZ+8x3DiZcJOZkmeuTPvsJD8D2PV1jQ=;
        b=oc/++NNgtI8v6eFrM0KIqAXlLPm2RknS/SV/lh/tUXDQHB8pdqmlxlheAvtfix/5OM
         tLzhnCft3oe37d3qXf8+l2t5J1sMEmkoMEGS8geSLxgl8sB6PAChS1CPjmvrXFbEpR+y
         wjjjZ2rG5DHJoEdIEyYJjoh3w1DWc24UyiyzLuB8MyeLfo7uFVzXZewZkiG4dEN8MFUo
         Gqtf1ez/+cJr/WCQCHpUTzl92NvKY+ZXVgEVd4ZwEHGiVtSv24CJqm12bVfjavCkMQPo
         BMPs7crTzHlHKtw9WAVBafFsZdiz9VNy0mzmcKGUUy4r7tV3NcK4fukNDbqRJsBMVAEe
         uz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=zTcT2yb4VlahiZ+8x3DiZcJOZkmeuTPvsJD8D2PV1jQ=;
        b=c2saxJ57njuQO8sD3zq0ydc7KH3vs8Ry2heTV6MguSoYFFXjmV+Qz537HEfP6WQtMG
         +ytcKxuz2+ZXAi467h9ZMpKdg70OUii1CEU1lOWuq2gCKH3pjZJc3G1PWzdBzLCJz70y
         Iudw7GnKEl8x4j3jMdiJjGG54KS9ILVXVUYxfz6utXd53oSmTEkRrdrZAH4lb4SMKHP+
         yE7uvEl+gLDfwiC8xii7OdgPmGu7J/h8u3ULQpbdRlOqURjv9ubZhNuPZdAroOXvzQnN
         8MImDZG44lt+zhK6xKeNTxRevOn3TSCVil4Pc0J2E7TwiYvgqdTcP8IHQDA6aoLwjI0Z
         mPSg==
X-Gm-Message-State: AOAM533yKlqoc31EhlNrpLJtKnh1b1+dbKHt/HWHSw7RZrQ7NHADpSXV
        iGwh4A+Gk7NovlItOvezlPavZ37IzXw=
X-Google-Smtp-Source: ABdhPJyfJw+JRCcHRK5mYeqXgxZBEKbhdNI+zRQErExZOJKxYHQqSs2GplRu196nml01FcKc6RgA3g==
X-Received: by 2002:a62:e704:: with SMTP id s4mr1165962pfh.177.1597395379200;
        Fri, 14 Aug 2020 01:56:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n2sm7349968pgv.37.2020.08.14.01.56.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 01:56:18 -0700 (PDT)
Date:   Fri, 14 Aug 2020 01:56:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200814085617.GA129183@roeck-us.net>
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200615091740.2958303-1-noltari@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 15, 2020 at 11:17:40AM +0200, Álvaro Fernández Rojas wrote:
> Instead of trying to parse CFE version string, which is customized by some
> vendors, let's just check that "CFE1" was passed on argument 3.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

mips:allmodconfig:

ERROR: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko] undefined!

This is not surprising, since fw_arg3 is not exported.

Guenter

> ---
>  v4: shorten conditional compilation part as suggested by Miquèl.
>  v3: keep COMPILE_TEST compatibility by adding a new function that only checks
>      fw_arg3 when CONFIG_MIPS is defined.
>  v2: use CFE_EPTSEAL definition and avoid using an additional function.
> 
>  drivers/mtd/parsers/bcm63xxpart.c | 32 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
> index 78f90c6c18fd..b15bdadaedb5 100644
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
> @@ -32,28 +37,15 @@
>  #define STR_NULL_TERMINATE(x) \
>  	do { char *_str = (x); _str[sizeof(x) - 1] = 0; } while (0)
>  
> -static int bcm63xx_detect_cfe(struct mtd_info *master)
> +static inline int bcm63xx_detect_cfe(void)
>  {
> -	char buf[9];
> -	int ret;
> -	size_t retlen;
> +	int ret = 0;
>  
> -	ret = mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
> -		       (void *)buf);
> -	buf[retlen] = 0;
> +#ifdef CONFIG_MIPS
> +	ret = (fw_arg3 == CFE_EPTSEAL);
> +#endif /* CONFIG_MIPS */
>  
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
> +	return ret;
>  }
>  
>  static int bcm63xx_read_nvram(struct mtd_info *master,
> @@ -138,7 +130,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
>  	struct bcm963xx_nvram *nvram = NULL;
>  	int ret;
>  
> -	if (bcm63xx_detect_cfe(master))
> +	if (!bcm63xx_detect_cfe())
>  		return -EINVAL;
>  
>  	nvram = vzalloc(sizeof(*nvram));
