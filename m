Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7717843FC1B
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 14:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhJ2MRr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 08:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhJ2MRo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 08:17:44 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AAAC061570;
        Fri, 29 Oct 2021 05:15:16 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id k13so16490227ljj.12;
        Fri, 29 Oct 2021 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=QgrejLPhmwaonglk/87BMy/DDGpmqiRAYppe9EnRVr4=;
        b=A+ZNKmDogHyLyOqThrIx2im9JmiBZM2RKr6BJSH7qigfuxjA+8f+l07n60V6RFIyuh
         tbuDeeQFb7+dcT1TkkJx9y0amDC9u5nrRiQs530v0pPwKY30ppmJ0Fr6XTbFfXBAn4Ec
         VyrbIxwdnn0coVj4CEi1sH5ac0nEdmo3eBfzORRIh0CURMwmL1Kb8ITgW2KGlbzflVWV
         KgC+62xHdg/V5Mr/IGsoQMdtdYWvwNC5Y5bYwGRC+yuHTwnH1xx/lzdqdiZIQ8kBTZ5G
         xs90qJ7Rzu2lzV0MFcVpdgtwWOE9x4GDkjPXd6/Ac7sUgox/fZBuwgIUwsfMOrXtB+D/
         fQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QgrejLPhmwaonglk/87BMy/DDGpmqiRAYppe9EnRVr4=;
        b=wnR+4tUjSjfyfjrunowKlE56EzWjiV6qCSDfV9+hyDp7fTkQsPf/yHLRVoEAokA1mk
         ASIR6/aE7Lf5rZkPBPF7vK24BsLzbdhxktp3yhRy2vhmAAlrySGm4MAUYrQ+fr5en/z2
         /XONoosGDMcJ7oR/28vsDL6iuP3xqERt+sc5QCeESoyubRizftehtT3zQbUXwHiwjvzK
         RgGf6f2SNxWJjBJzHNTWqPUWINC7vdtr/FBxoMzMlSU0kkMaBuT474/RpTnad/rlzN9C
         jbW18BemfIVJxHVECIrPMUzpeNqU/aKSetBD/ZIGXZfjtEKQCJX0EFaVS1vZrbOMyHPC
         O6kQ==
X-Gm-Message-State: AOAM533icwwSHIdgdb1uKVwbqAFoWf2LOtvti2qe/3+eQW65TiWgpA+2
        B4DJpyeGo/j4NRzh1D3tXQ8=
X-Google-Smtp-Source: ABdhPJwzkAT1GAvW+n6j0hL4OQ+xEvaDsck59irti/Fx/wWDpRJw4y6eDPz7RLt76q/2JVdywsyQBg==
X-Received: by 2002:a05:651c:893:: with SMTP id d19mr11634382ljq.236.1635509713081;
        Fri, 29 Oct 2021 05:15:13 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id x7sm590496lfu.116.2021.10.29.05.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 05:15:12 -0700 (PDT)
Message-ID: <578ae650-e5c0-cb86-8f34-18736e5d9239@gmail.com>
Date:   Fri, 29 Oct 2021 14:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211028093059.32535-1-zajec5@gmail.com>
 <20211028093059.32535-3-zajec5@gmail.com>
 <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
 <ce6ccb22-a81c-336e-4b2e-44f9ad6de246@roeck-us.net>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <ce6ccb22-a81c-336e-4b2e-44f9ad6de246@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 28.10.2021 18:57, Guenter Roeck wrote:
> On 10/28/21 9:29 AM, Florian Fainelli wrote:
>> On 10/28/21 2:30 AM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Hardware supported by this driver goes back to the old bcm63xx days. It
>>> was then reused in BCM7038 and later also in BCM4908.
>>>
>>> Depending on SoC model registers layout differs a bit. This commit
>>> introduces support for per-chipset registers offsets & adds BCM4908
>>> layout.
>>>
>>> Later on BCM63xx SoCs support should be added too (probably as platform
>>> devices due to missing DT). Eventually this driver should replace
>>> bcm63xx_wdt.c.
>>>
> Seems unrelated / irrelevant in this commit log, except maybe after '---'.
> 
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>
>> [snip]
>>
>>> +
>>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>>> +    [BCM63XX_WDT_REG_DEFVAL]    = 0x28,
> 
> REG_DEFVAL is an odd name for this register. I can see that the
> bcm63xx driver uses it, but in reality it seems to be the timeout
> value, not some default value, only the bcm63xx driver doesn't
> seem to use it properly. I think REG_TIMEOUT or similar would
> be a much better name.

I used name used in Broadcom's SDK (and as I guess also in their
documentation too).

Take a look at this BCM60333 example:

typedef struct Timer {
	uint32	TimerInts;		/* 0x00 */
	uint32	TimerCtl0;		/* 0x04 */
	uint32	TimerCtl1;		/* 0x08 */
	uint32	TimerCtl2;		/* 0x0c */
	uint32	TimerCnt0;		/* 0x10 */
	uint32	TimerCnt1;		/* 0x14 */
	uint32	TimerCnt2;		/* 0x18 */
	uint32	WatchDogDefCount;	/* 0x1c */
	uint32	WatchDogCtl;		/* 0x20 */
	uint32	WDResetCount;		/* 0x24 */
} Timer;

I got impression that Linux driver registers names usually follow what
is used in hardware documentation.
