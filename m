Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE69B43FB80
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 13:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhJ2Lli (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 07:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbhJ2Llg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 07:41:36 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B09CC061745;
        Fri, 29 Oct 2021 04:39:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bi35so20465188lfb.9;
        Fri, 29 Oct 2021 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=qJzklZpGj5IXKN74jgp5chH+GE9GUHfg2wVqbEJMfWc=;
        b=JWQ80sVeiD8+A8HH6SUb9qpLmSibGoLqbpi4IzK8Pz9YuhmrlBR+eX0SvfUfbObWeU
         lseL7LCw0EvwbFQHwrMBJ71bieM6gO/QUcHo4aJhQVSaO9gCYUiEvcInvo3XOMaYCnV7
         1RJociLasj0B02ca0TR17ZyaXgihQmoxPm5zTPvfckaPykwAqVZY9yEd44jpb0j/5ULB
         8/IuWoAxt1MIy/7dhRGgOT+20Q0H4KHQjvN7W+C10pUa+uNwmqFIs65ObwmTKccxvSGm
         wYSyBYnViU5+ehcSTsk+kqD1L1RXJXYT4XptVxjqBuLesMV0YZL01iV1QhhF2c8TvPQC
         ER/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qJzklZpGj5IXKN74jgp5chH+GE9GUHfg2wVqbEJMfWc=;
        b=wC7vUyAyriOal5mv/roslOTvjqaPqV5DtmOJxj3hyMPpBjHodGuhfazJ5yAx6rpN3y
         ZzLQUy4YSQCvr3MX4yu3mNGrKblQZ0tud8O3zFWNcTBck5Z/7xdW33RDfnotpk7p93of
         cRwdiC40mHaYo2Lp63udrceFoxFtfgml3kX9bF68PgRX3D70ohvMhH/hQpQLytatKU+z
         cubFtuj1dNtNGm10uOoqM0CGb4WbL6iFvC/VoXgxwPeLi0SByi8pFv83wa9fszrh9GzU
         5f5id+hmBXvf+uF+dkwqjLiU0DC9O31k8X6xwgRjYPF5UKnU1oqV2U/d71xDXuvuFjH8
         DkAQ==
X-Gm-Message-State: AOAM531tPYgE2ssn5xIHXzfp6UCc9GbWDpJfP8IoK1QxlXo7Zx6As2ua
        uBoMQKWyihD410Yk0j+FhPQ=
X-Google-Smtp-Source: ABdhPJy5/b5lP4aTitbmcfJyxV+6UrNtq64C/L6kmlRQh+ReKmVLVbSqNKOwvG5PQq5w+6mczTkHLg==
X-Received: by 2002:a05:6512:b01:: with SMTP id w1mr10026569lfu.508.1635507546409;
        Fri, 29 Oct 2021 04:39:06 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id s26sm481858ljc.59.2021.10.29.04.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 04:39:05 -0700 (PDT)
Message-ID: <9d57d026-19f3-e92d-4c02-d7e8e2c2bc25@gmail.com>
Date:   Fri, 29 Oct 2021 13:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211028093059.32535-1-zajec5@gmail.com>
 <20211028093059.32535-3-zajec5@gmail.com>
 <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[Rob: please kindly comment on this]

On 28.10.2021 18:29, Florian Fainelli wrote:
> On 10/28/21 2:30 AM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Hardware supported by this driver goes back to the old bcm63xx days. It
>> was then reused in BCM7038 and later also in BCM4908.
>>
>> Depending on SoC model registers layout differs a bit. This commit
>> introduces support for per-chipset registers offsets & adds BCM4908
>> layout.
>>
>> Later on BCM63xx SoCs support should be added too (probably as platform
>> devices due to missing DT). Eventually this driver should replace
>> bcm63xx_wdt.c.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
> 
> [snip]
> 
>> +
>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>> +	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,
>> +	[BCM63XX_WDT_REG_CTL]		= 0x2c,
>> +	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,
> 
> I don't understand what you are doing here and why you are not
> offsetting the "reg" property appropriately when you create your
> bcm4908-wdt Device Tree node such that the base starts at 0, and the
> existing driver becomes usable as-is. This does not make any sense to me
> when it is obviously the simplest way to make the driver "accept" the
> resource being passed.

I believe that DT binding should cover the whole hardware block and
describe it (here: use proper compatible to allow recognizing block
variant).

That's because (as far as I understand) DT should be used to describe
hardware as closely as possible. I think it shouldn't be adjusted to
make mapping match Linux's driver implementation.


So if:
1. Hardware block is mapped at 0xff800400
2. It has interesting registers at 0xff800428 and 0xff80042c

I think mapping should use:
reg = <0xff800400 0x3c>;
even if we don't use the first N registers.

That way, at some point, you can extend Linux (or whatever) driver to
use extra registers without reworking the whole binding. That's why I
think we need to map whole hardware block & handle different registers
layouts in a driver.


Now, that is something I learnt from various DT discussions but I still
may got it wrong. I'd like to ask Rob to comment on this.


Let me also paste my summary of BCM4908's block I extracted from
Broadcom's header:

typedef struct Timer {
	uint32	TimerCtl0;		/* 0x00 */
	uint32	TimerCtl1;		/* 0x04 */
	uint32	TimerCtl2;		/* 0x08 */
	uint32	TimerCtl3;		/* 0x0c */
	uint32	TimerCnt0;		/* 0x10 */
	uint32	TimerCnt1;		/* 0x14 */
	uint32	TimerCnt2;		/* 0x18 */
	uint32	TimerCnt3;		/* 0x1c */
	uint32	TimerMask;		/* 0x20 */
	uint32	TimerInts;		/* 0x24 */
	uint32	WatchDogDefCount;	/* 0x28 */
	uint32	WatchDogCtl;		/* 0x2c */
	uint32	WDResetCount;		/* 0x30 */
	uint32	SoftRst;		/* 0x34 */
	uint32	ResetStatus;		/* 0x38 */
	uint32	ResetReason;		/* 0x3c */
	uint32	spare[3];		/* 0x40-0x4b */
};
