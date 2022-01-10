Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CA9489EE3
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jan 2022 19:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238786AbiAJSNM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Jan 2022 13:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238833AbiAJSNL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Jan 2022 13:13:11 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3F0C06173F
        for <linux-mips@vger.kernel.org>; Mon, 10 Jan 2022 10:13:11 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id q14so13154635plx.4
        for <linux-mips@vger.kernel.org>; Mon, 10 Jan 2022 10:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cxHGoCKPeejXxn5ep9tK45CMa9YRfaVUDgYewv3YftQ=;
        b=C0Thjxa3dCGz67AdkuR74RfRQ7KlkfeMXGWaPiALi5GgyYYn6Wf4TWwUspA9OGwQL1
         tplKF9rQ5IIpbOeSi6LT3MiFV4G6BxzpqGx03ayATy/ZKjE3JyoNywkAquc+MztVX/ZX
         uXguxTxcjttnpLxrRPDUUjPVudN+B+88gs9d85RHvqBCXWM3koRvSPxiSX3TehGJXXYi
         7k7llEmMn62tUxGI3S9jNC6Q/2IHzbVqaUIsBuCpeu9b1ffOLsUeXPf6BKWj3mKuGMf5
         mOs5c9AVi1sgfn/XdFffzhHhUwY+IPGoOKfvUDaXBtIRN8exi0+TvERDLouR5nIxyAZT
         eYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cxHGoCKPeejXxn5ep9tK45CMa9YRfaVUDgYewv3YftQ=;
        b=fCtkzQvJ3tk7WF48bqPZ2lxOvlv9CgFhBEmSSIRyrutJ2i/7CtVPrZ/pu6GraJVXHg
         RaO9dmw/ZlN7ldd7daP8+NwrygPjNdbDej5vooNBqWdb7dIZO8ohXTW2ATPQA24ekkR9
         iIbMReWxMGeQG3aQRaAkW3iApMHpNy9sfwUWn+NTtWB9fgWOe3wKUg9+A5l0leTJwb7S
         XoVYBmCuvbapshwPNDGm+NQiFwDnI5LGRPpl1SmYyrXxmZSzuwf6hXNdsob1lSpIXBZf
         ik+FCc7GJY45JDvWKloC0xzJXs8asl/87CpK0n1q173FpEwVklWAWhfJIjtvwYKXlg23
         O8NA==
X-Gm-Message-State: AOAM533/khgKKLWMzgzvWGLkEhb/H8lIxtrHUwdKeTeLXcwpwqWQZRaZ
        hPV1iNPn2A1D1AF0XKq6cJaCfdN25cU=
X-Google-Smtp-Source: ABdhPJz7mSiSxbHL+EUfHqVArK20ih0VFUCQryotdM1xWwPm8JRS7U8Ydo0bOtO0sSMgE+2j1XqDng==
X-Received: by 2002:aa7:8084:0:b0:4bc:9423:96b2 with SMTP id v4-20020aa78084000000b004bc942396b2mr833557pff.45.1641838390676;
        Mon, 10 Jan 2022 10:13:10 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q19sm7755137pfk.83.2022.01.10.10.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 10:13:10 -0800 (PST)
Subject: Re: [PATCH] bcma: get SoC device struct & assign dma_mask
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220107041744.2388470-1-f.fainelli@gmail.com>
 <20220110090955.GA7422@lst.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bcae2722-c2c5-5cb9-805e-8e8a06bccd2a@gmail.com>
Date:   Mon, 10 Jan 2022 10:13:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220110090955.GA7422@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/10/22 1:09 AM, Christoph Hellwig wrote:
> On Thu, Jan 06, 2022 at 08:17:44PM -0800, Florian Fainelli wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> For bus devices to be fully usable it's required to set their DMA
>> parameters.
>>
>> For years it has been missing and remained unnoticed because of
>> mips_dma_alloc_coherent() silently handling the empty coherent_dma_mask.
>> Kernel 4.19 came with a lot of DMA changes and caused a regression on
>> the bcm47xx. Starting with the commit f8c55dc6e828 ("MIPS: use generic
>> dma noncoherent ops for simple noncoherent platforms") DMA coherent
>> allocations just fail. Example:
>> [    1.114914] bgmac_bcma bcma0:2: Allocation of TX ring 0x200 failed
>> [    1.121215] bgmac_bcma bcma0:2: Unable to alloc memory for DMA
>> [    1.127626] bgmac_bcma: probe of bcma0:2 failed with error -12
>> [    1.133838] bgmac_bcma: Broadcom 47xx GBit MAC driver loaded
>>
>> This change fixes above regression in addition to the MIPS bcm47xx
>> commit 321c46b91550 ("MIPS: BCM47XX: Setup struct device for the SoC").
> 
> How did it take so long to notice this?
> 
>> I don't know if this is what you had in mind. I am also not sure if we
>> should have the bcma_bus_type implement .dma_configure and set it to
>> platform_dma_configure?
> 
> Unless you have an OF tree that declares DMA limitations there is no
> need to call platform_dma_configure.

OK, so we may have to implement that callback then because on ARM-based
Devices we have BCMA plus Device Tree being used. Although none of those
ARM platforms define any DMA apertures or restrictions, I suppose

> 
>> --- a/drivers/bcma/host_soc.c
>> +++ b/drivers/bcma/host_soc.c
>> @@ -191,6 +191,8 @@ int __init bcma_host_soc_init(struct bcma_soc *soc)
>>  	struct bcma_bus *bus = &soc->bus;
>>  	int err;
>>  
>> +	bus->dev = soc->dev;
>> +
>>  	/* Scan bus and initialize it */
>>  	err = bcma_bus_early_register(bus);
>>  	if (err)
>> diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
>> index 8e7ca3e4c8c4..6793c2ff60fd 100644
>> --- a/drivers/bcma/main.c
>> +++ b/drivers/bcma/main.c
>> @@ -253,6 +253,8 @@ void bcma_prepare_core(struct bcma_bus *bus, struct bcma_device *core)
>>  		if (IS_ENABLED(CONFIG_OF) && bus->dev) {
>>  			core->dma_dev = bus->dev;
>>  		} else {
>> +			if (!core->dev.coherent_dma_mask)
>> +				core->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> 
> Is there any way coherent_dma_mask could already be set here?

On MIPS-based devices (not using Device Tree), I don't see a way this
could be set, however on ARM based devices, since they use Device Tree,
maybe this value could be different than 0. I will run some tests on
both types of devices and post an updated patch if relevant.

Thanks!

> 
>>  			core->dev.dma_mask = &core->dev.coherent_dma_mask;
>>  			core->dma_dev = &core->dev;
> 
> Not really needed for the quick fix, but pointing the dma_mask to the
> coherent_dma_mask is a bad idea as it removes the often used feature
> to use a different mask for the cohernent allocations vs the streaming
> mappings.

OK.
-- 
Florian
