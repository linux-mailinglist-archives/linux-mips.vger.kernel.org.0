Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B859273938
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 05:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgIVD0X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 23:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbgIVD0X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 23:26:23 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC00C061755;
        Mon, 21 Sep 2020 20:26:23 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x14so19494615oic.9;
        Mon, 21 Sep 2020 20:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NsLOhgLyrsC3y4elp6O/jQnxUTulJL0+nvpYvr5hkXA=;
        b=Pi5SMY8gahJjPqjL51bEyytPDq7zuskWxXDF570j/BfidkyWEphGd/Bdx8395JCwF2
         ejCU6LO+u0Cock2W6kKaJZZC53VdCKzK5FY1QYpdW4A5lPPulIZrA0JQpCmw6X9I7Gms
         s69V3lZ6qWLdNbjh3ph8unhyW3lrvGXiCU/TIRZbp8RCjfA6qPbYaoVb9uwhIV1P4i4l
         o4cHrcp3WTdGaCFidYT8jB2T/NcuLn7tb46hwBVVcosVV628shLNnS7o6zZdbUAvTqgR
         g2mSGGFciH3Cs3qVKx+M7qQeCONJlGbZMVb58/k0yRpPCjwZ+4n54aS84+cNfyoCYWWo
         ebbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NsLOhgLyrsC3y4elp6O/jQnxUTulJL0+nvpYvr5hkXA=;
        b=JFzMTBVd5nZSwN9UdrhbAUUac5C5qXROHTCv4zYd4tSubJBR86gejtKKUihkIKlBNZ
         b20RigzkWbwJbYvEQeA7t1gEEOPQ1zgSpGjBwbABMd91BZAFrEYJxuEbApaGugJsy5lL
         gT4V1CIY+sG/aECnGyqwPs7I+zz69PyoDYBTd/rJSfx0EY+nSYk+g/M8nHNW+V9CrOKL
         3WRvqqXNxSnuDppX4hCUOO43qGF3+sZqYgsrVdFN6B75/VOdnL73cI0wKL5+Wnl1ipn9
         9lBmjUXvWrSnwO/4OuIpKI2Lomq8qaq2r6vf1g0jYJ84FKE7xlOVAM9mMd2Jn//cOfG3
         zBSQ==
X-Gm-Message-State: AOAM533yiAdsFw6tW7sUdg0MAmUbObU+LHsKG1ifX0DkJO6eL+3rgJE9
        v7xqdHtKGrdfnEtmhNrdlG5BT1Z7KA0=
X-Google-Smtp-Source: ABdhPJxJp9NZva5ckfrNyr+MbsHwrsAfPiEmY/nGAsQs2M3vqvGID0GwmBFQ2+MhdJrnucU7moK2JQ==
X-Received: by 2002:aca:ef56:: with SMTP id n83mr1378523oih.89.1600745182535;
        Mon, 21 Sep 2020 20:26:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v5sm7929510oon.32.2020.09.21.20.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 20:26:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Miquel Raynal <miquel.raynal@bootlin.com>,
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
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
Date:   Mon, 21 Sep 2020 20:26:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/21/20 8:18 PM, Naresh Kamboju wrote:
> On Fri, 14 Aug 2020 at 14:26, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Mon, Jun 15, 2020 at 11:17:40AM +0200, Álvaro Fernández Rojas wrote:
>>> Instead of trying to parse CFE version string, which is customized by some
>>> vendors, let's just check that "CFE1" was passed on argument 3.
>>>
>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
>>
> 
> We still see mips: allmodconfig build failure on Linus tree
> 

Yes, same here.

Guenter

> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- HOSTCC=gcc CC="sccache
> mips-linux-gnu-gcc" O=build allmodconfig
> 
> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- HOSTCC=gcc CC="sccache
> mips-linux-gnu-gcc" O=build
> 
> 
>> mips:allmodconfig:
>>
>> ERROR: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko] undefined!
> 
> ERROR: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko] undefined!
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> Full build link,
> https://builds.tuxbuild.com/Sm59_9tjFMpIvT27qf5kNA/build.log
> 
>>
>> This is not surprising, since fw_arg3 is not exported.
>>
>> Guenter
>>
>>> ---
>>>  v4: shorten conditional compilation part as suggested by Miquèl.
>>>  v3: keep COMPILE_TEST compatibility by adding a new function that only checks
>>>      fw_arg3 when CONFIG_MIPS is defined.
>>>  v2: use CFE_EPTSEAL definition and avoid using an additional function.
>>>
>>>  drivers/mtd/parsers/bcm63xxpart.c | 32 ++++++++++++-------------------
>>>  1 file changed, 12 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
>>> index 78f90c6c18fd..b15bdadaedb5 100644
>>> --- a/drivers/mtd/parsers/bcm63xxpart.c
>>> +++ b/drivers/mtd/parsers/bcm63xxpart.c
>>> @@ -22,6 +22,11 @@
>>>  #include <linux/mtd/partitions.h>
>>>  #include <linux/of.h>
>>>
>>> +#ifdef CONFIG_MIPS
>>> +#include <asm/bootinfo.h>
>>> +#include <asm/fw/cfe/cfe_api.h>
>>> +#endif /* CONFIG_MIPS */
>>> +
>>>  #define BCM963XX_CFE_BLOCK_SIZE              SZ_64K  /* always at least 64KiB */
>>>
>>>  #define BCM963XX_CFE_MAGIC_OFFSET    0x4e0
>>> @@ -32,28 +37,15 @@
>>>  #define STR_NULL_TERMINATE(x) \
>>>       do { char *_str = (x); _str[sizeof(x) - 1] = 0; } while (0)
>>>
>>> -static int bcm63xx_detect_cfe(struct mtd_info *master)
>>> +static inline int bcm63xx_detect_cfe(void)
>>>  {
>>> -     char buf[9];
>>> -     int ret;
>>> -     size_t retlen;
>>> +     int ret = 0;
>>>
>>> -     ret = mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
>>> -                    (void *)buf);
>>> -     buf[retlen] = 0;
>>> +#ifdef CONFIG_MIPS
>>> +     ret = (fw_arg3 == CFE_EPTSEAL);
>>> +#endif /* CONFIG_MIPS */
>>>
>>> -     if (ret)
>>> -             return ret;
>>> -
>>> -     if (strncmp("cfe-v", buf, 5) == 0)
>>> -             return 0;
>>> -
>>> -     /* very old CFE's do not have the cfe-v string, so check for magic */
>>> -     ret = mtd_read(master, BCM963XX_CFE_MAGIC_OFFSET, 8, &retlen,
>>> -                    (void *)buf);
>>> -     buf[retlen] = 0;
>>> -
>>> -     return strncmp("CFE1CFE1", buf, 8);
>>> +     return ret;
>>>  }
>>>
>>>  static int bcm63xx_read_nvram(struct mtd_info *master,
>>> @@ -138,7 +130,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
>>>       struct bcm963xx_nvram *nvram = NULL;
>>>       int ret;
>>>
>>> -     if (bcm63xx_detect_cfe(master))
>>> +     if (!bcm63xx_detect_cfe())
>>>               return -EINVAL;
>>>
>>>       nvram = vzalloc(sizeof(*nvram));

