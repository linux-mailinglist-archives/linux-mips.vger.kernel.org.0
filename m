Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7424EB7EC
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 03:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241532AbiC3BsF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Mar 2022 21:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237034AbiC3BsF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Mar 2022 21:48:05 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6599BF56
        for <linux-mips@vger.kernel.org>; Tue, 29 Mar 2022 18:46:20 -0700 (PDT)
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1648604777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WDanR9NTo8X+Kep+UFnFxSGgahGv1fmlsQMqw/4+lnw=;
        b=FHw3PXcP+WVBOEapf+XSldutqzfFKccCasaULGrgI8B3bVQ3c1fJnvjA/p/7zp3SmMULEc
        RxIXPisZVBR5se15jVEJNLVkm5IqD2HJFjXxhWH0HoGEu+mt99TQPPD5wjIXSXyYrfFHta
        siDr5Nin3CpCJ9/Okao4VskxYXTZHFg=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
References: <20220329014537.4180966-1-liu.yun@linux.dev>
 <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jackie Liu <liu.yun@linux.dev>
Message-ID: <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev>
Date:   Wed, 30 Mar 2022 09:46:07 +0800
MIME-Version: 1.0
In-Reply-To: <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2022/3/29 下午8:54, Andy Shevchenko 写道:
> On Tue, Mar 29, 2022 at 4:46 AM Jackie Liu <liu.yun@linux.dev> wrote:
>>
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> My kernel robot report build error from drivers/iio/adc/da9150-gpadc.c,
>>
>> We define GPIOD in rb.h, in fact he should only be used in gpio.c, but
> 
> he --> it
> 
>> it affects the driver da9150-gpadc.c which goes against the original
>> intention of the design, just move it to his scope.
> 
>> At the same time, GPIONMIEN and IMASK6 are not used anywhere, just delete
>> them.
> 
> While not being used it's good to leave (save) them since it might be
> the only means of the HW documentation. I know that Git history will
> keep that, but it is more explicit just to have them in the code.

Sure.

> 
> ...
> 
>>   #define DEV3TC         0x01003C
>>   #define BTCS           0x010040
>>   #define BTCOMPARE      0x010044
>> -#define GPIOBASE       0x050000
> 
> ...
> 
>> +#define GPIOBASE       0x050000
> 
> I think this one belongs to the header.

I think it would be better to put it in gpio.c, after all it belongs to
the GPIO module and is not used elsewhere. It doesn't feel good if we
put it in the header file.


--
BR, Jackie Liu
