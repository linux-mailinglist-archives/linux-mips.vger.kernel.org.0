Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8665434ECA
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 17:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhJTPQe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 11:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhJTPQd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 11:16:33 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554B1C06161C;
        Wed, 20 Oct 2021 08:14:19 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id 187so3223723pfc.10;
        Wed, 20 Oct 2021 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TDLzKkefiW2qBcvhl9Mh1B9EpLxuIPGwsH2zNljPvVs=;
        b=DOen5TCfJtA35vSF3dAtiaJkpldhQRHm/jmvb9QBl5DBXxRYX+iQ6/fBeR3GVBMoya
         elnoAqS4D2bVR0BFIpEW+l2RvR/fbtMUaAyEr4vyFLpZnYVfw2OaDzLKqOp4Xfcu+Y5O
         2zjSL4Nz9JUW/GnqjGbiHFXgClpiaGXjulr+jw8wiLrU79DBipcQFXiIXn2szNFZZ94o
         TOEhEOFCBmHjbj/x6Q9g/nIq3Et8Hj1zQagSK+pYlxxOOeQfd2dC8KyIZvjaUAmZfTyP
         mLgoO7IL71dOPbSlkuPj7mFEgl5jZVmwQprG49+aX1NTDdvtoVS6RLaxqr89LxJ04xXR
         mTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TDLzKkefiW2qBcvhl9Mh1B9EpLxuIPGwsH2zNljPvVs=;
        b=A6inxs7luaqi7KqXYzBfZMQFsZ4I1hELFFOcpSuOPj+nX4+PDl0IAVsjcQwBDjLY5J
         WKwt9bXfdLKFRHKQUw25i1+sDlqgRMXZuonBYAwSDx+Y6LUDzNZC8QtynY/dBuYiK00h
         XzbmRgGm0P1fk5OhHKcYfa/Zal7sZ6Qrr7DghlUbD9J90yJ628dvGmVHJdwAZ5qlPNAb
         aHzWgz8Fdrr+xwecX901gNV4aVh/g3uYOHv+PslR3d7JeWSNZ8DopsI3V03D1zAmTjiI
         +JXEWm7rJsylNqJFws9yVygDO3IFwLyMSuUCftVvo8fc2NKhjsmvmC4/SVz5RYIJngBB
         0WjA==
X-Gm-Message-State: AOAM530nIgpjW6oqey3cIk33jsNToPO2F9G5HkWWFGwSupHlemQ3T81x
        X48cHBz4yKlBqZqdupAo+Os=
X-Google-Smtp-Source: ABdhPJzxgXnhqhph34eLaK9uCGeTajw1218Blaf9Oo5OFWjJ/dESKTgwUNGYgmRsel5mrhk1ihQmWA==
X-Received: by 2002:a05:6a00:2181:b0:44d:c18d:7af9 with SMTP id h1-20020a056a00218100b0044dc18d7af9mr25513pfi.16.1634742858719;
        Wed, 20 Oct 2021 08:14:18 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id x6sm3301886pfh.77.2021.10.20.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 08:14:18 -0700 (PDT)
Message-ID: <ef9f4279-1820-3e90-482e-c4e710859af6@gmail.com>
Date:   Wed, 20 Oct 2021 08:14:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 09/14] irqchip: Provide platform_device to
 of_irq_init_cb_t
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
 <20211009022023.3796472-10-f.fainelli@gmail.com>
 <871r4gvggb.wl-maz@kernel.org>
 <CAL_Jsq+CWeFHsHHaAwbb940Zk1thU50gDGcqfO6NdgWQ2FPTWA@mail.gmail.com>
 <87tuhcnlwt.wl-maz@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <87tuhcnlwt.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/20/2021 1:24 AM, Marc Zyngier wrote:
> On Tue, 19 Oct 2021 23:23:52 +0100,
> Rob Herring <robh@kernel.org> wrote:
>>
>>   On Tue, Oct 19, 2021 at 4:43 PM Marc Zyngier <maz@kernel.org> wrote:
>>>
>>> diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
>>> index ccf32758ea85..146a9d80a6a2 100644
>>> --- a/include/linux/irqchip.h
>>> +++ b/include/linux/irqchip.h
>>> @@ -33,7 +33,15 @@ extern int platform_irqchip_probe(struct platform_device *pdev);
>>>   #define IRQCHIP_PLATFORM_DRIVER_BEGIN(drv_name) \
>>>   static const struct of_device_id drv_name##_irqchip_match_table[] = {
>>>
>>> -#define IRQCHIP_MATCH(compat, fn) { .compatible = compat, .data = fn },
>>> +/* Undefined on purpose */
>>> +int typecheck_irq_init_cb(struct device_node *, struct device_node *,
>>> +                         struct platform_device *);
>>> +
>>> +#define typecheck_irq_init_cb(fn)                                      \
>>> +       __typecheck(typecheck_irq_init_cb, fn) ? fn : fn
>>
>> That's nice! Shouldn't it also be used for IRQCHIP_DECLARE?
> 
> Absolutely. And enabling this shows that changing of_irq_init_cb_t
> breaks *all users* of IRQCHIP_DECLARE(). Not an acceptable outcome
> when we're at -rc5. >
> Why can't the relevant drivers use of_find_device_by_node() instead?
> That would allow us to keep the status-quo on of_irq_init_cb_t.

Rob had suggested several solutions, including using 
of_find_device_by_node(), however updating of_irq_init_cb_t was 
indicated to be the better way. I had intentionally not updated 
IRQCHIP_DECLARE() because it would ignore the 3rd argument we passed to 
it (platform_device *) so I thought.

If I am spinning a v6 using of_find_device_by_node() would that be 
acceptable to you?
-- 
Florian
