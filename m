Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C9C4EBE4E
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 12:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245143AbiC3KGv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 06:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245142AbiC3KGu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 06:06:50 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA30DEBA9
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 03:05:05 -0700 (PDT)
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1648634703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3l57BQDTc2H3DsV7IaMaHCQmDl1v0nJZRFIODHJmecg=;
        b=DiySYVvJxGuqo+MqwkTKzsIyyXNhqrUyrulhGkfCea1RhvQQdhr8ZglNfBWrvORotR0ah1
        z2RAwi4zlLLkaZfNS9vSNIa+Wb0eKSMrByyS5hVxixy96WHRlkeVUrLUtIj+ysUBgF2nVJ
        r3LSVmSqIFt502NJsQ1GeHc0Cj3IcCs=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
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
 <f601dcf3-892c-e8de-9028-9e5108322074@linux.dev>
 <CAHp75VdWBMQWtgL1ejk-2C2v4sfm48RzyJd-Z3hMcSvi=Tm4pg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jackie Liu <liu.yun@linux.dev>
Message-ID: <bb90ecd2-a750-574c-1b1c-6e06461c002a@linux.dev>
Date:   Wed, 30 Mar 2022 18:04:55 +0800
MIME-Version: 1.0
In-Reply-To: <CAHp75VdWBMQWtgL1ejk-2C2v4sfm48RzyJd-Z3hMcSvi=Tm4pg@mail.gmail.com>
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



在 2022/3/30 下午6:01, Andy Shevchenko 写道:
> On Wed, Mar 30, 2022 at 12:56 PM Jackie Liu <liu.yun@linux.dev> wrote:
>> 在 2022/3/30 下午5:41, Andy Shevchenko 写道:
>>> On Wed, Mar 30, 2022 at 12:32 PM Thomas Bogendoerfer
>>> <tsbogend@alpha.franken.de> wrote:
> 
> ...
> 
>>> It fixes compilation breakage in some cases. I think the author of
>>> this patch can (should) elaborate.
>>> Also, it might need a Fixes tag.
>>
>> Um, it's really hard to say which commit is fixed, just because this
>> header file defines a GPIOD, and someone else uses this later.
> 
> I think we may use the original commit where the header in mips
> appeared with a justification that the definitions are not needed to
> be there and it may induce build errors, which in fact happens.
> 

Sure, Thanks, I will send new patch v3 later.

--
BR, Jackie Liu
