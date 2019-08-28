Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B02A065C
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2019 17:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfH1Pbx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Aug 2019 11:31:53 -0400
Received: from forward104p.mail.yandex.net ([77.88.28.107]:51019 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726429AbfH1Pbx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Aug 2019 11:31:53 -0400
Received: from mxback7o.mail.yandex.net (mxback7o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::21])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id D013B4B0094F;
        Wed, 28 Aug 2019 18:31:48 +0300 (MSK)
Received: from smtp1j.mail.yandex.net (smtp1j.mail.yandex.net [2a02:6b8:0:801::ab])
        by mxback7o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ffjlMBsko1-VlremqIv;
        Wed, 28 Aug 2019 18:31:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567006308;
        bh=7RA0sHF5D03f4tAZfj9rCdvuBWfcitbh3YPyvz8e+CI=;
        h=In-Reply-To:Cc:To:Subject:From:Date:References:Message-ID;
        b=eMmYwxIXwqY9HlvIBMIYRd49H7lhEAeOX2i3qqRcSXP5K2V0nBHs06yPe3mK8trzt
         6/omZIndgJtP4AEB16Cim2Iz9aMzI9F9Y/xjR81E+DDJobtA7eFWJkDUYiNerlOfIp
         uJQYGqzcDbpuCwZl+6eQRSqfPUcTOJ2vsI58TIkM=
Authentication-Results: mxback7o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id gq3U0rBuMO-VcbGsZJ1;
        Wed, 28 Aug 2019 18:31:45 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 04/13] irqchip: Add driver for Loongson-3 I/O interrupt
 controller
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.co, devicetree@vger.kernel.org
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-5-jiaxun.yang@flygoat.com>
 <e6a5862f-0f6c-cab0-9f4a-51b7889d38e7@kernel.org>
 <82c4b9ed-7270-74ce-6e10-165182e540dd@flygoat.com>
 <20190828075940.549e1983@why>
Message-ID: <619b1d35-7bc2-999f-5a51-fb2efdc63f60@flygoat.com>
Date:   Wed, 28 Aug 2019 23:31:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828075940.549e1983@why>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/28 下午2:59, Marc Zyngier wrote:
> On Wed, 28 Aug 2019 08:27:05 +0800
> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>> On 2019/8/28 上午12:45, Marc Zyngier wrote:
>>> On 27/08/2019 09:52, Jiaxun Yang wrote:
>>>> +	chained_irq_enter(chip, desc);
>>>> +
>>>> +	pending = readl(priv->intc_base + LS3_REG_INTC_EN_STATUS) &
>>>> +		readl(priv->intc_base + LS3_REG_INTC_STATUS);
>>> Reading the enabled status from the HW on each interrupt? I'm sure
>>> that's pretty cheap...
>> Seems expensive but to deal with a buggy hardware... That's worthy.
> How broken is it? You very much seem to rely on the HW being correct
> here, since you trust it exclusively. I'd expect the enable mask to be
> a SW construct if you didn't blindly trust it
Hi Marc

Thanks for your answering.

The vendor code did this and said there is a HW issue. I just don't have 
the guts to remove this check.
Seems like sometimes masked interrupt may get ISR set wrongly.
> And if this is truly the right way to do it, please document the
> various problems with the controller so that we don't break it at a
> later time.
Thanks, will do.
>
> Then how comes this comes from the irqchip's DT node? This should be
> part of the endpoint's interrupt specifier.

In theory it should be, However if we set different interrupt 
lines/cores on that controller, interrupts may get lost. It means we can 
only have single parent core/interrupt.

So I'd prefer just set them uniformly by controller's dt-binding to 
prevent confusing.

>> It's parent IRQ (mti,cpu-interrupt-controller) is a percpu IRQ.
> But then why is that interrupt described using the "core" property? It
> should be an interrupt specifier, just like any other interrupt.
The same.
>
>> In design, it allows us to decide affinity at runtime but actually hardware is seriously broken.
> I understand the HW is terrible. But the binding looks pretty bad too.
> This needs fixing.
>
> 	M.
--
Jiaxun Yang
