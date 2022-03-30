Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1D04EBE21
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 11:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiC3J6G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 05:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245109AbiC3J6B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 05:58:01 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3203295A13
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 02:56:16 -0700 (PDT)
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1648634174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hJpFCNPzZlTOP6Aw7XcRG68nXCdiSFjFFB6/6QFjAvU=;
        b=ZYB3satG9f/yQ4+ceEW8ZF9B/TL4c+td2WBg5Cv5wIoXKC6W2K6Eh342S0u3Wci4bpOp5R
        GVZUVK4H2YcCP4cJTgPjovrAvbV8a99GTCvExv5I88mxkOpdgHGtBu7bCHfCGuPc70Q8C3
        FOXS9g0eeeHp9jSdsq8glI7W1IwAqQk=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
References: <20220329014537.4180966-1-liu.yun@linux.dev>
 <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev>
 <20220330064216.GA5811@alpha.franken.de>
 <CAHp75VencGLsfR=9ug1xBeWeSe+zy_vroaqkh2xWR7BojQOGEw@mail.gmail.com>
 <20220330093227.GA8224@alpha.franken.de>
 <CAHp75Vc+Gvte62Smnyi_RN=c0Fpy6LLyqJV2Oy0HP+Yv6CvtxQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jackie Liu <liu.yun@linux.dev>
Message-ID: <f601dcf3-892c-e8de-9028-9e5108322074@linux.dev>
Date:   Wed, 30 Mar 2022 17:56:03 +0800
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc+Gvte62Smnyi_RN=c0Fpy6LLyqJV2Oy0HP+Yv6CvtxQ@mail.gmail.com>
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


在 2022/3/30 下午5:41, Andy Shevchenko 写道:
> On Wed, Mar 30, 2022 at 12:32 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>> On Wed, Mar 30, 2022 at 12:23:59PM +0300, Andy Shevchenko wrote:
>>> On Wed, Mar 30, 2022 at 9:45 AM Thomas Bogendoerfer
>>> <tsbogend@alpha.franken.de> wrote:
>>>> On Wed, Mar 30, 2022 at 09:46:07AM +0800, Jackie Liu wrote:
> 
> ...
> 
>>>> I have a patchset, where the both files will go away. No need to
>>>> clean up now.
>>>
>>> Do you plan them to be backported? If not, I would recommend applying
>>
>> no plan for backporting
>>
>>> this patch in order to have it backported and then do whatever you
>>> want we those files.
>>
>> why ? This doesn't fix anything, doesn't it ?

Like the patch I submitted in the first version, there are some gcc
errors.

[...]
drivers/iio/adc/da9150-gpadc.c:254:13: error: ‘DA9150_GPADC_CHAN_0x08’ 
undeclared here (not in a function); did you mean ‘DA9150_GPADC_CHAN_TBAT’?
    254 |  .channel = DA9150_GPADC_CHAN_##_id,   \
        |             ^~~~~~~~~~~~~~~~~~
  drivers/iio/adc/da9150-gpadc.c:273:2: note: in expansion of macro 
‘DA9150_GPADC_CHANNEL’
    273 |  DA9150_GPADC_CHANNEL(_id, _hw_id, _type,   \
        |  ^~~~~~~~~~~~~~~~~~~~
  drivers/iio/adc/da9150-gpadc.c:281:2: note: in expansion of macro 
‘DA9150_GPADC_CHANNEL_PROCESSED’
    281 |  DA9150_GPADC_CHANNEL_PROCESSED(GPIOD, GPIOD_6V, IIO_VOLTAGE, 
NULL),
        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

make[4]: *** [../scripts/Makefile.build:288: 
drivers/iio/adc/da9150-gpadc.o] Error 1
make[3]: *** [../scripts/Makefile.build:550: drivers/iio/adc] Error 2
make[3]: *** Waiting for unfinished jobs....

> 
> It fixes compilation breakage in some cases. I think the author of
> this patch can (should) elaborate.
> Also, it might need a Fixes tag.


Um, it's really hard to say which commit is fixed, just because this
header file defines a GPIOD, and someone else uses this later.

> 
>> But if it makes people happy, I'll apply it.
> 
> Yes, please.
> 

--
Jackie Liu
