Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A943D4340D4
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhJSVzL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 17:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhJSVzK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 17:55:10 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E246DC06161C;
        Tue, 19 Oct 2021 14:52:56 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so925453pjc.3;
        Tue, 19 Oct 2021 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w522X2nG4IQsRMZlyKb9GT+f9KOrClbgsHRAWFAk+IQ=;
        b=JS05GGLzlL/0nlGpl4TuOExaFbAWvUVzy5uFh52GUzZkliErec672yzDfpgVp3HP1/
         oy7P9zgnBxjnLPhJAzd2qD63Pb93IjLjUVfYNVQhI1884/HqcgfagtJgz+FKsXnOvlwR
         peWJaPalfXxGVGyL4r0ZxixzWYowmGFBN6nn1eAyakUcK38bmTTYWpL2e3J2DjV6WyGf
         k2j81/i7oPiQLz1DC/RYXVpbBvHYFT4V5OlsCGJXH9eDqEoSB9PiPofZ2D7WRV41pJ2B
         j9I7ei9WWNZz9OfDP/lSpUbJPzkPIa1mt4Ul4mGby6Fumdabws42YqCr0RRQA5rDOxBS
         slng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w522X2nG4IQsRMZlyKb9GT+f9KOrClbgsHRAWFAk+IQ=;
        b=M0SH3UjB/KYrvdBUgNdOAm4jru43i5wXysPeXkxpNuTn1hHSU/M3vmZU5BXh41OHfo
         G/P+Tkg/BEvcGUgJM4553EGdXKMOC7KOV07xPuKnGT/KoId6cxnmXPoNyhqpV/00CaKr
         MgltnhueYh8RhIIs5EWHgnVGnuaO6Z/VM9xS+yPB8uwZoPm6aTGhcVMKURNRJyGQtMFQ
         xwJk8M+7KmW3VJnu/6r/Nslhyu6dcVTsL35oYzEkE9kfAQ+pQyrusY3gCNJnTAckS/wV
         sl6YWI//Y3Yg3kP5D4pg1+G4odv3u0YNQiSzcU8hyJd4Zqsx8KKFHpjpEP0v+93JEntQ
         rjxA==
X-Gm-Message-State: AOAM533DklHL2iwpBU5APUKXXJGuTp68sX9+BEm6tsWgDoKeNAEWaH8B
        jbEjY7J3RC3Vzg1eBKFz6WqTKkUivVQ=
X-Google-Smtp-Source: ABdhPJyKlqZiDvRxriBiWqbjHMkpZ7H/bMq4TsUcMFscmBbehbLX6xSQLuhRnqKrWXL4hm6HxEN69A==
X-Received: by 2002:a17:902:ec82:b0:13f:663c:87cc with SMTP id x2-20020a170902ec8200b0013f663c87ccmr35450758plg.24.1634680375823;
        Tue, 19 Oct 2021 14:52:55 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id z2sm190542pgn.8.2021.10.19.14.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 14:52:55 -0700 (PDT)
Subject: Re: [PATCH v4 09/14] irqchip: Provide platform_device to
 of_irq_init_cb_t
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
 <20211009022023.3796472-10-f.fainelli@gmail.com>
 <871r4gvggb.wl-maz@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <52edd412-4ffa-2f5e-4466-bca71abb5e66@gmail.com>
Date:   Tue, 19 Oct 2021 14:52:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <871r4gvggb.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/19/21 2:43 PM, Marc Zyngier wrote:
> On Sat, 09 Oct 2021 03:20:18 +0100,
> Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> Provide the platform device mapping to the interrupt controller node to
>> the of_irq_init_cb_t callback such that drivers can make use of it.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/irqchip/irqchip.c  | 2 +-
>>  drivers/irqchip/qcom-pdc.c | 3 ++-
>>  drivers/of/irq.c           | 2 +-
>>  include/linux/of_irq.h     | 5 ++++-
>>  4 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
>> index 3570f0a588c4..289784eefd00 100644
>> --- a/drivers/irqchip/irqchip.c
>> +++ b/drivers/irqchip/irqchip.c
>> @@ -55,6 +55,6 @@ int platform_irqchip_probe(struct platform_device *pdev)
>>  	if (par_np && !irq_find_matching_host(par_np, DOMAIN_BUS_ANY))
>>  		return -EPROBE_DEFER;
>>  
>> -	return irq_init_cb(np, par_np);
>> +	return irq_init_cb(np, par_np, pdev);
>>  }
>>  EXPORT_SYMBOL_GPL(platform_irqchip_probe);
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 173e6520e06e..819a93360b96 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -359,7 +359,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>>  	return 0;
>>  }
>>  
>> -static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>> +static int qcom_pdc_init(struct device_node *node, struct device_node *parent,
>> +			 struct platform_device *pdev)
>>  {
>>  	struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
>>  	int ret;
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 352e14b007e7..18f3f5c00c87 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -538,7 +538,7 @@ void __init of_irq_init(const struct of_device_id *matches)
>>  				 desc->dev,
>>  				 desc->dev, desc->interrupt_parent);
>>  			ret = desc->irq_init_cb(desc->dev,
>> -						desc->interrupt_parent);
>> +						desc->interrupt_parent, NULL);
>>  			if (ret) {
>>  				of_node_clear_flag(desc->dev, OF_POPULATED);
>>  				kfree(desc);
>> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
>> index aaf219bd0354..89acc8b089f0 100644
>> --- a/include/linux/of_irq.h
>> +++ b/include/linux/of_irq.h
>> @@ -9,7 +9,10 @@
>>  #include <linux/ioport.h>
>>  #include <linux/of.h>
>>  
>> -typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
>> +struct platform_device;
>> +
>> +typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *,
>> +				struct platform_device *);
> 
> Having added some type-checking to the IRQCHIP_MATCH() #definery, I
> end-up with warnings such as:
> 
> In file included from ./include/linux/kernel.h:16,
>                  from drivers/irqchip/irq-bcm7038-l1.c:12:
> ./include/linux/minmax.h:20:28: warning: comparison of distinct pointer types lacks a cast
>    20 |  (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>       |                            ^~
> ./include/linux/irqchip.h:41:2: note: in expansion of macro ‘__typecheck’
>    41 |  __typecheck(typecheck_irq_init_cb, fn) ? fn : fn
>       |  ^~~~~~~~~~~
> ./include/linux/irqchip.h:44:12: note: in expansion of macro ‘typecheck_irq_init_cb’
>    44 |    .data = typecheck_irq_init_cb(fn), },
>       |            ^~~~~~~~~~~~~~~~~~~~~
> drivers/irqchip/irq-bcm7038-l1.c:459:1: note: in expansion of macro ‘IRQCHIP_MATCH’
>   459 | IRQCHIP_MATCH("brcm,bcm7038-l1-intc", bcm7038_l1_of_init)
>       | ^~~~~~~~~~~~~
> 
> Clearly, you didn't update the drivers you just converted to
> IRQCHIP_MATCH(), and only fixed the QC driver.

Yes, I will re-order the patches a little bit and update the drivers as
they are converted.

> 
> FWIW, I'm planning to take something like the hack below into the tree
> to detect this sort of stuff early.

Sounds good, thanks!
-- 
Florian
