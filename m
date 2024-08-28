Return-Path: <linux-mips+bounces-5123-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D12A961B52
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 03:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49C3285207
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 01:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024EC18638;
	Wed, 28 Aug 2024 01:17:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54731BC20;
	Wed, 28 Aug 2024 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724807873; cv=none; b=nRDbQl7qJvvzR11zor+LHY+jP+pc3ft/wP0xC1N+sMMmwQWdKGAiEuyphs9gzZ+Hz4a+A+tr1AgjXMeFgqLs9/y82S4BEr3YDoc03bEm+LwwQuIOwGjkqK30F57od2ksZr5AD1nfHbWlHO6eheOR/ei50kdBf8Qjhf6GT30+qW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724807873; c=relaxed/simple;
	bh=anBMYk/AkNGIYgIbFQ2vsi883u3+psNqsyojaceT/a4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BaszrwZbuDmxqo2BnB3OYKH7tNPHLSDknzTa/bdqkI8CWfLIQS0dR3UOJbPtoxqJ0ILT7AQ5dfzX2Pgg9xEl1y3Ngumb83mN+3hN3BNfHmpjmJPItxjavW1n556+Vzw3jBcDEhNTx4d/IyLZgsacCAd6LIe8BCeB169Kx+CK5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Axz5u9es5mST8iAA--.43073S3;
	Wed, 28 Aug 2024 09:17:49 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDxmWa8es5mTwQlAA--.1533S3;
	Wed, 28 Aug 2024 09:17:48 +0800 (CST)
Subject: Re: [RFC 0/2] irqchip/loongson-eiointc: Add multiple interrupt pin
 routing support
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20240821101153.2262290-1-maobibo@loongson.cn>
 <CAAhV-H6tMB9ASYFTdRBEFL0tG1jpjaa-iGRGBuUKUu=sCqxJ2Q@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <1bca504f-55ec-6072-09de-97ed5bf79120@loongson.cn>
Date: Wed, 28 Aug 2024 09:17:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6tMB9ASYFTdRBEFL0tG1jpjaa-iGRGBuUKUu=sCqxJ2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxmWa8es5mTwQlAA--.1533S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF43XF1fZr4DGw1kuryUJwc_yoW8Wr18pa
	yUCan09FWUtFyayF9ayF1Uta4Yyr93J39rZa9rJrWUZF98KF1jqr18KFWYyF1Uu34kJw10
	vF1rJw1Uu3Z8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUU
	UUUU=


Jianmin,

We know that you are busy, Would you like spend some time to give some 
feedback?

And I recommend you as maintainer of interrupt controller since you are 
author the this piece of code. Also I am willing to become new reviewer 
about eiointc driver since VM will use it always.

The eiointc driver is important, it need evolution rather than post the 
code and finish job, everything is done.

Regards
Bibo Mao

On 2024/8/26 下午10:46, Huacai Chen wrote:
> Hi, Jianmin,
> 
> What's your opinion on this series?
> 
> Huacai
> 
> On Wed, Aug 21, 2024 at 6:11 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> There are four times about EIOINTC_REG_ISR register group access in
>> eiointc irq handler, in order to get all irq status about 256 interrupt
>> vectors. It causes four times VM-exits since eiointc register are
>> software emulated, here multiple interrupt pin routing is introduced
>> and each 64 interrupt vector is routed to one interrupt pin.
>>
>> With this method, there will be only on one EIOINTC_REG_ISR register
>> group acces in irq handler, it will reduce VM-exits.
>>
>> Bibo Mao (2):
>>    irqchip/loongson-eiointc: Route interrupt parsed from acpi table
>>    irqchip/loongson-eiointc: Add multiple interrupt pin routing support
>>
>>   arch/loongarch/kernel/irq.c            |  3 +-
>>   arch/loongarch/kernel/smp.c            |  2 +-
>>   drivers/irqchip/irq-loongson-eiointc.c | 66 +++++++++++++++++++++++---
>>   3 files changed, 62 insertions(+), 9 deletions(-)
>>
>>
>> base-commit: 1fb918967b56df3262ee984175816f0acb310501
>> --
>> 2.39.3
>>
>>


