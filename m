Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384293B8F69
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jul 2021 11:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235728AbhGAJHD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 05:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235696AbhGAJHC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Jul 2021 05:07:02 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF73C061756;
        Thu,  1 Jul 2021 02:04:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id k21so7436323ljh.2;
        Thu, 01 Jul 2021 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6MkLiP3ymZwqDvJ+I8tc53epX5kkABkdmMMY77TRJ4c=;
        b=ZBAxgD7kim1Pz0VpXSCJ7LEzSHIpVB+Cfy3agLO2utHTL50Lu3PH4eob5ymLowl8Ri
         fduGqMaoGflNGZVVfLI+DdbA+twJ5P9FddWwONO5KrWu16O9LhbnIeYpvi39wM51uW83
         kifcB7mvrukFc/hTsYfS8AsL+xygRPxUuKfMGKiGSoNEjV9vWIWtLb2x6ps7P8sSk5lQ
         pBxZBYeukG+3yKaV9BUbGeRqfcpY0pg+5Nn17gxV9csS4K+1PRR2YlR6k1/mezOqPIAj
         QcphB58A7KkIRy4Bp99azOBvyjiWj9GqihdwnUU/coxAUjZ+flBt+O/QOwT/T4SmrJJj
         fdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6MkLiP3ymZwqDvJ+I8tc53epX5kkABkdmMMY77TRJ4c=;
        b=nCHD+Mm9lnFv09jy48QXEXK0AbApbonFOAi0HdXFQGNo8BLmzsNGlQLi7a7Gxotokv
         8zkgVPR2t//qR+o2DWtxZmQDSEvNzyIbk2PTG220snZdYagePB7UkHTBUFzmYDbjXZtl
         lmXsCZ0z3MB4fwv3Hlqq7+YguRTPzwMJ0mi9UfBqsBb8jLKeMv7nkZeWqbQFeJnXZaXL
         T+qDC7GZYpVQ1wuOrFhZjAgWr7DjRnvtHQvoQjwmiRoS63n5AX44qPOH82wPTRByoXi9
         eXThvrbmxmhUQtEOVf+I4e/r6L3YKbeTlPnMn1hBLvHQQZbIdPLw2EFyB2NVqJU9lIzs
         9yRg==
X-Gm-Message-State: AOAM5333KRWAyYIiE8I5vE0wgqq2GNPg0OMOe18mmbliNP1uOc026D1a
        kwVUJVByTHln+JjUg9WDKNfc9ZhBKO8=
X-Google-Smtp-Source: ABdhPJz4LEiyzODortXJKDAcf+gZZZnN253gvfYVi18Tdr6ApN7//JnpwIpBJ8sFLpEBZNMYcZfObQ==
X-Received: by 2002:a2e:3017:: with SMTP id w23mr11232653ljw.166.1625130268738;
        Thu, 01 Jul 2021 02:04:28 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.85.177])
        by smtp.gmail.com with ESMTPSA id c13sm2477877ljf.47.2021.07.01.02.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 02:04:28 -0700 (PDT)
Subject: Re: [PATCH v7 1/3] MIPS: Loongson64: Add Loongson-2K1000 reset
 platform driver
To:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210701030137.10566-1-zhangqing@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <3e48b6b3-62e4-8a15-6c73-e2f35c07b842@gmail.com>
Date:   Thu, 1 Jul 2021 12:04:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701030137.10566-1-zhangqing@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 01.07.2021 6:01, Qing Zhang wrote:

> Add power management register operations to support reboot and poweroff.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
[...]
> diff --git a/drivers/platform/mips/ls2k-reset.c b/drivers/platform/mips/ls2k-reset.c
> new file mode 100644
> index 000000000000..286d47bf6964
> --- /dev/null
> +++ b/drivers/platform/mips/ls2k-reset.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2021, Qing Zhang <zhangqing@loongson.cn>
> + *  Loongson-2K1000 reset support
> + */
> +
> +#include <linux/of_address.h>
> +#include <linux/pm.h>
> +#include <asm/reboot.h>
> +
> +#define	PM1_STS		0x0c /* Power Management1 Status Register */
                                                         ^ space missing?

> +#define	PM1_CNT		0x14 /* Power Management 1 Control Register */
> +#define	RST_CNT		0x30 /* Reset Control Register */
> +
> +static void __iomem *base;
> +
> +static void ls2k_restart(char *command)
> +{
> +	writel(0x1, (void *)base + RST_CNT);
> +}
> +
> +static void ls2k_poweroff(void)
> +{
> +	/* Clear */
> +	writel((readl((void *)base + PM1_STS) & 0xffffffff), (void *)base + PM1_STS);

    Are the pointer casts really necessary above?

> +	/* Sleep Enable | Soft Off*/
> +	writel(GENMASK(12, 10)|BIT(13), (void *)base + PM1_CNT);

    Spaces around that | are needed.

[...]

MBR, Sergei
