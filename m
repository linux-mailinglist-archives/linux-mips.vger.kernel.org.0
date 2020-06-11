Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D761F6B40
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2020 17:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgFKPmr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Jun 2020 11:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbgFKPmq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Jun 2020 11:42:46 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0E8C08C5C1;
        Thu, 11 Jun 2020 08:42:46 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r18so2684024pgk.11;
        Thu, 11 Jun 2020 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fQ+wsrzemkIPe2q506QN7HeF76dszLO8Devz823zEFU=;
        b=Ec9Owej5gVTLx1LgNfE5z+WQetriTeu1ERovocrLzbYfjsFYQ4SqhApR7I5YxA28Fl
         sTvU3lpjWRcLGD9LEt8x3ZZzyQhrGx0NOrCw7Jp4gFweeYvwLnnkBEgexGXU0A+icWYq
         fRUNXqVgRJRBCKCykhCY3BGZ76l5RWpHM1XmW7rxJegXOvvjhlVIDos+zZXjUFs4c20M
         Y+ZC7RaONrSiu5opRrIKb2Vhp88Rh+h3ND0fEvkfXdZVS8+ui3sjFgeEv+yMhXfU2s8Y
         qoqOts0a3vFDGNEbR4Z682dZBNgWAt3iRDnRuIeP0OM+7H0nsODztVmo1ZAxRfGhTIMG
         ysig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fQ+wsrzemkIPe2q506QN7HeF76dszLO8Devz823zEFU=;
        b=DUuLttg2fPIp0oxNywZuH1Z4eAEEMv6nonzH1tqfIZtx8RMmDjSu3fUgKZ1NZA1Ut0
         0n+L2pB4dNV9rD3jHxC3g9or3SKh1OmnkLu8dCqw/x+y7EuVQlER5PkaO+aV5qmYkmhO
         78yQH/u2/jgffOTw+HDJz1Cboxok4jYAhwN0DyCU9aZlb3ri398dEb1kdE+Hi62/sXeC
         Yhnj2JUSviqelno3G3RNUbgSAqdqlUF/d4QEyZCBRyPWq8jx4u5FDej0A10LYVjrli4L
         ewyhg1j8fYGKxfIMKgs8BCPdqkj4P+9vZAPXIlFoCP6cC2+jOFtVMEQmIES76aKgcxQv
         jmsA==
X-Gm-Message-State: AOAM5316WKVS6ztlbtWF1jg8BOKzwSYaNiKQbBJi2bo8LCbG2oPIaxpU
        o/fEtyNVVGSBPoask/ePWZ0=
X-Google-Smtp-Source: ABdhPJwIRQAPnj3r6aqieKP9UnNBsABbKwe5X6HFBUwRl50yl3r3oJQiOfH59nPr0GARKI5+XAFa/w==
X-Received: by 2002:a63:e34d:: with SMTP id o13mr7215684pgj.45.1591890166194;
        Thu, 11 Jun 2020 08:42:46 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k19sm3749457pfg.153.2020.06.11.08.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2020 08:42:45 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     tsbogend@alpha.franken.de, Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, richard@nod.at,
        vigneshr@ti.com, Jonas Gorski <jonas.gorski@gmail.com>,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com> <20200611095540.250184d2@xps13>
 <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
Date:   Thu, 11 Jun 2020 08:42:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/11/2020 8:16 AM, Álvaro Fernández Rojas wrote:
> Hi Miquel,
> 
>> El 11 jun 2020, a las 9:55, Miquel Raynal <miquel.raynal@bootlin.com> escribió:
>>
>> Hi Álvaro,
>>
>> Álvaro Fernández Rojas <noltari@gmail.com> wrote on Mon,  8 Jun 2020
>> 18:06:49 +0200:
>>
>>> Instead of trying to parse CFE version string, which is customized by some
>>> vendors, let's just check that "CFE1" was passed on argument 3.
>>>
>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>> ---
>>> v2: use CFE_EPTSEAL definition and avoid using an additional funtion.
>>>
>>> drivers/mtd/parsers/bcm63xxpart.c | 29 ++++-------------------------
>>> 1 file changed, 4 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
>>> index 78f90c6c18fd..493a75b2f266 100644
>>> --- a/drivers/mtd/parsers/bcm63xxpart.c
>>> +++ b/drivers/mtd/parsers/bcm63xxpart.c
>>> @@ -22,6 +22,9 @@
>>> #include <linux/mtd/partitions.h>
>>> #include <linux/of.h>
>>>
>>> +#include <asm/bootinfo.h>
>>> +#include <asm/fw/cfe/cfe_api.h>
>>
>> Are you sure both includes are needed?
> 
> asm/bootinfo.h is needed for fw_arg3 and asm/fw/cfe/cfe_api.h is needed for CFE_EPTSEAL.
> 
>>
>> I don't think it is a good habit to include asm/ headers, are you sure
>> there is not another header doing it just fine?
> 
> Both are needed unless you want to add another definition of CFE_EPTSEAL value.
> There are currently two CFE magic definitions, the one in asm/fw/cfe/cfe_api.h and another one in bcm47xxpart.c:
> https://github.com/torvalds/linux/blob/master/arch/mips/include/asm/fw/cfe/cfe_api.h#L28
> https://github.com/torvalds/linux/blob/master/drivers/mtd/parsers/bcm47xxpart.c#L33

The caveat with that approach is that this reduces the compilation
surface to MIPS and BMIPS_GENERIC and BCM63XX only, which is a bit
small. If we could move the CFE definitions to a shared header, and
consolidate the value used by bcm47xxpart.c as well, that would allow us
to build the bcm63xxpart.c file with COMPILE_TEST on other
architectures. This does not really have functional value, but for
maintainers like Miquel, it allows them to quickly test their entire
drivers/mtd/ directory.
-- 
Florian
