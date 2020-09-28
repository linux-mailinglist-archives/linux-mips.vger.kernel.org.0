Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC70027B558
	for <lists+linux-mips@lfdr.de>; Mon, 28 Sep 2020 21:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1TfN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Sep 2020 15:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgI1TfN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Sep 2020 15:35:13 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84469C061755;
        Mon, 28 Sep 2020 12:35:11 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id o20so2011527pfp.11;
        Mon, 28 Sep 2020 12:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7KnjkBBnLzAr5go3fTJ+1FzXKfDtdVLomQPQFEtg6Rw=;
        b=Nr0+InlGarDCYgx5luJOcGubABdXl2JDEAuNjpot+p8CW+PxEa/NUy22QQmi2hdu5W
         GeXCS9dTpfTjINDBTWxuywLNuSGCeyEhLjIQKnCXJRfIkkRGvgaWRhAxcjpGD61prrIV
         0POstsiTWPlvPpQdYE1YjcmgMetgQUKH16/WKv2SQ6b7yNxKjDIQDT/t4lyNZGey2Upu
         dVEKmIVaro2mcHu8nf+iKLVhajrvgJDu80QnSe1ylmNI2s5Wqmbh2C/d+u5fnE6nf2Ra
         zZ3h2q/DQMZ4NOJuSwuoDUXIWBPeC5p83qM6kiI/xF21Oq3LRCRpIekLtpWJstVr3z8B
         MiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7KnjkBBnLzAr5go3fTJ+1FzXKfDtdVLomQPQFEtg6Rw=;
        b=uCwBseuRiXu5RdTS9z4vBOtF+wrRCHb/jkecgMi8+YcdRHGmje4wlq1LC9Z6/H7Lx9
         7WHaJETAL+cawfSHjm4NLygXq2+c53MzoQJb2/ncMl1pKSwRAhhqYDR3DiQ3o1ql3RKs
         CilADhHsOhA+Z7DTUFLAI8xcTcjrVknWCQKCRPYClOSp6pIJxzR4cz4U//+beC6NnTm8
         +b2jYYwkVnelfqiZFHcgQ3+9eqNnaLjBqVc3LoSSv+3L2V6lyxd5RW9vALVJxixbsXaK
         lDxC1zPrsPqdqAsmy8ABWvnpVAtbnknkZdmRUOze/H2jGdmStd8r9px7x/3/GSsA27Yi
         9umA==
X-Gm-Message-State: AOAM530a0k+SuGZUUyGV5xWNVtZ/YL0Hna3ZMiPm/Owwcp8AYxXMriqA
        pXUkOyQNfJ413aMnGsTTHLpa0cVNbtVm6w==
X-Google-Smtp-Source: ABdhPJzpoUu1RBJssvdhZgvuLF4TelxVTyHauOaQ6CAityrII9lxrdh/u+rh7TZKHPANPGdDQmUrcw==
X-Received: by 2002:a63:c74f:: with SMTP id v15mr459413pgg.143.1601321711017;
        Mon, 28 Sep 2020 12:35:11 -0700 (PDT)
Received: from [10.230.29.112] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u71sm2726381pfc.43.2020.09.28.12.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 12:35:10 -0700 (PDT)
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        bcm-kernel-feedback-list@broadcom.com,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, jonas.gorski@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mtd@lists.infradead.org, lkft-triage@lists.linaro.org
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
 <20200814085617.GA129183@roeck-us.net>
 <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
 <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
 <20200928161617.2a1b2244@xps13>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8f25c3c8-f2c6-73a9-a9f5-cf244c53754a@gmail.com>
Date:   Mon, 28 Sep 2020 12:35:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200928161617.2a1b2244@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/28/2020 7:16 AM, Miquel Raynal wrote:
> Hello,
> 
> Guenter Roeck <linux@roeck-us.net> wrote on Mon, 21 Sep 2020 20:26:19
> -0700:
> 
>> On 9/21/20 8:18 PM, Naresh Kamboju wrote:
>>> On Fri, 14 Aug 2020 at 14:26, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On Mon, Jun 15, 2020 at 11:17:40AM +0200, Álvaro Fernández Rojas wrote:
>>>>> Instead of trying to parse CFE version string, which is customized by some
>>>>> vendors, let's just check that "CFE1" was passed on argument 3.
>>>>>
>>>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>   
>>>
>>> We still see mips: allmodconfig build failure on Linus tree
>>>    
>>
>> Yes, same here.
> 
> Perhaps this check should be done by an exported helper so that we do
> not blindly export the variable?
> 
> Alvaro, Jonas, can one of you try to address this issue please?

We should probably just make the parser 'bool' there is no much point 
building this as a module, it will not improve compile time coverage, 
and it will most likely not help with the kernel image size on the 
platforms that require the parser to be there anyway.
-- 
Florian
