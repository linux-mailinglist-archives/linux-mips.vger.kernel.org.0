Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C0832AF89
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238082AbhCCA0U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377883AbhCBRAw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 12:00:52 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F3DC061224;
        Tue,  2 Mar 2021 08:59:55 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id u11so12349942plg.13;
        Tue, 02 Mar 2021 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8gWR6Kzn0jIzbRxXpdexC7ibHjhyEDkp0W0OIrKhXEc=;
        b=o6XlXwN1v88Z0tSTaNO+BQHhbdwTQX1muwWIziOK7MBW2Rb4+d9FIA2S65BcI1JW3X
         PYKXnkIElFOgmHscqU3e37aRvt9udtmTP8t4hdPcpu6Exvm8tbZ/CyFUBs20nECy3xiA
         c2h8pr1Tfkzp/arbNTLLO2rtMscbogJGp6fZNw/gvW9axhqvzZF4AFLl99CgADL7/rtN
         7JI9SmbFoTAfsQuyjeNLcWrAnY5Utff+yVrNjsMjs7x/bo6J2hc9ZOMD9tHla1tqNuiE
         R5EMm7USjhP/op2UQX9RxyvYpYjr52eM2YeW/VWuJ/om0g4p1L2jXXGaRsmkHd6cqhuC
         pKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8gWR6Kzn0jIzbRxXpdexC7ibHjhyEDkp0W0OIrKhXEc=;
        b=ePOKKd6y46S2D6v2xlkcjsp27r5K9Jc0EvlT0f99xft42e27/1PzgsAJR2pR61ja83
         e31mRpbOU/tWvT6gCPnHLlAbyUa/ANHjKaTWPYNKnDqVUW5asdY9xeWyb6lTeyUqz2uV
         Q+30HwnE53kRAiUQzGjEeiIugqj+LAY6eGcSIqiEAF4WDZ+a4ZF0L18UxS1+zqiAI0ut
         ZZb7pKwjcjFwKQAiYD8zFzVaUADBhaNTk+WHGEkyfF1YV2KgdzjgFd2xeBxrQsBP5+TG
         5Bg12AtnJKBozeWgW0dByRVbJvS+FYqAxy7wSP0fOGhko+EDVzxLHaSCz5pVOwYi/qwq
         S6wA==
X-Gm-Message-State: AOAM533Dfk+jld4Fkj3wpXbJtaQy2jYcALnyutkb577/byyXdtusmKWJ
        MZ5C7DEiHR3pWgHOa4HhYEM=
X-Google-Smtp-Source: ABdhPJy/K3LJ51GTWDq7qpDJOrZxjdxqcSaGAtmMTjQI0JfpGe4SbVnnHCGRJzPoZe45H60K4Zxkng==
X-Received: by 2002:a17:90a:f18d:: with SMTP id bv13mr5484609pjb.13.1614704394617;
        Tue, 02 Mar 2021 08:59:54 -0800 (PST)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p184sm21144278pgp.13.2021.03.02.08.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 08:59:54 -0800 (PST)
Subject: Re: [PATCH stblinux.git 2/2] firmware: bcm47xx_nvram: support
 platform device "brcm,nvram"
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Vivek Unune <npcomplete13@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20210302074405.18998-1-zajec5@gmail.com>
 <20210302074405.18998-2-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8e17b978-a527-97df-3f31-1fb2123a23e9@gmail.com>
Date:   Tue, 2 Mar 2021 08:59:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302074405.18998-2-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/1/21 11:44 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add support for platform device providing mapping resource. This allows
> reading NVRAM based on DT mapping binding. It's required for devices
> that boot depending on NVRAM stored setup and provides early access to
> NVRAM data.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> bcm47xx_nvram driver was originally added through MIPS tree, but this
> change doesn't affect BCM47XX (MIPS) as it doesn't use DT. It targets
> ARCH_BCM_5301X so I suggest this goes through the stblinux.git tree.

Can you see if this change can be replaced by the nvmem-rmem work that
Nicolas recently did to support something similar for the Raspberry Pi 4:

https://lkml.org/lkml/2021/1/29/235

> ---
>  drivers/firmware/broadcom/bcm47xx_nvram.c | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
> index 835ece9c00f1..d5d19dd1b9e1 100644
> --- a/drivers/firmware/broadcom/bcm47xx_nvram.c
> +++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/string.h>
>  #include <linux/mtd/mtd.h>
> +#include <linux/platform_device.h>
>  #include <linux/bcm47xx_nvram.h>
>  
>  #define NVRAM_MAGIC			0x48534C46	/* 'FLSH' */
> @@ -162,6 +163,60 @@ static int nvram_init(void)
>  	return -ENXIO;
>  }
>  
> +static int brcm_nvram_probe(struct platform_device *pdev)
> +{
> +	struct nvram_header __iomem *header;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *mmio;
> +	size_t copy_len;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "Failed to get resource\n");
> +		return -ENODEV;
> +	}
> +
> +	mmio = ioremap(res->start, resource_size(res));
> +	if (!mmio)
> +		return -ENOMEM;
> +
> +	header = (struct nvram_header *)mmio;
> +	copy_len = DIV_ROUND_UP(sizeof(*header) + header->len, 4);
> +	if (header->magic != NVRAM_MAGIC) {
> +		dev_err(dev, "No NVRAM found at %pR\n", res);
> +		return -EPROTO;
> +	} else if (copy_len > resource_size(res)) {
> +		dev_err(dev, "NVRAM size exceeds %pR\n", res);
> +		return -ERANGE;
> +	} else if (copy_len >= NVRAM_SPACE) {
> +		dev_err(dev, "NVRAM size exceeds buffer size %d\n", NVRAM_SPACE);
> +		return -ENOMEM;
> +	}
> +
> +	__ioread32_copy(nvram_buf, mmio, copy_len);
> +	nvram_buf[NVRAM_SPACE - 1] = '\0';
> +
> +	iounmap(mmio);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id brcm_nvram_of_match[] = {
> +	{ .compatible = "brcm,nvram "},
> +	{},
> +};
> +
> +static struct platform_driver brcm_nvram_driver = {
> +	.driver = {
> +		.name = "brcm_nvram",
> +		.of_match_table = brcm_nvram_of_match,
> +	},
> +	.probe	= brcm_nvram_probe,
> +};
> +
> +module_platform_driver(brcm_nvram_driver);
> +
>  int bcm47xx_nvram_getenv(const char *name, char *val, size_t val_len)
>  {
>  	char *var, *value, *end, *eq;
> 


-- 
Florian
