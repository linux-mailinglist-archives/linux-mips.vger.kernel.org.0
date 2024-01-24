Return-Path: <linux-mips+bounces-1104-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A563983A649
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 11:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDC41F21BC9
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 10:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A20B182A1;
	Wed, 24 Jan 2024 10:02:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A3718651;
	Wed, 24 Jan 2024 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706090546; cv=none; b=YuTh/AohmMl5rfCrdBgkjy3vB0QwRKjFoqhtMnjrwIXJOmv9/810ReRgNOFgRq7KnfwV2q6ahQxFptF4RKiAgGrXqFQHVY8YKowkwjGLc1zI1nfaF6LsuwUKT1Dg+qgixp2661fv6dZgNMWAcS65RlwplgocMhfQorr1KDPN/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706090546; c=relaxed/simple;
	bh=h2xRIgUBWah2xuZNBy/h1M5DjGAq7+qqu9ARggmGvTk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EA7iWVARFJHbhJ8c4Aq50988w/1oXvD6MSiDGA8HTX/YyU3NYSbl5BfreyvqAik/p1q6GOuX0UiqRHju/H1o7c22mSPQmv+S+3OG2G/q0faqZcLsSpwJ9gG01wAPDb7dq5F2DwjhCrIu66+NoQ8CbWLmVOeBEq0dW8E62ZfDzg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8DxmfAu4LBltbAEAA--.18903S3;
	Wed, 24 Jan 2024 18:02:22 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxVMwt4LBls6QWAA--.39609S3;
	Wed, 24 Jan 2024 18:02:21 +0800 (CST)
Subject: Re: [PATCH v3 3/3] irqchip/loongson-eiointc: Typo fix in function
 eiointc_domain_alloc
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 lvjianmin@loongson.cn
References: <20240118121542.748351-1-maobibo@loongson.cn>
 <20240118121542.748351-4-maobibo@loongson.cn>
 <CAAhV-H4q0B3fXjkwtEQaCLk789UkLbWe8Zd8L7bMLWea1yq70w@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <7b3f2afe-c82c-e193-6427-0107d1da0bb5@loongson.cn>
Date: Wed, 24 Jan 2024 18:02:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4q0B3fXjkwtEQaCLk789UkLbWe8Zd8L7bMLWea1yq70w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxVMwt4LBls6QWAA--.39609S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrykWw4kAryUuFW8CFykZwc_yoW8GFy8pF
	WUA3Wqkr45AFyUC3sIgr4UZFyav3s0qrZ7KayxtrW2vrZ8Jw1DGF45CayDCrn2yw4xGF12
	9F4Fqr15uF15A3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU



On 2024/1/24 下午5:52, Huacai Chen wrote:
> Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> 
> But I think moving this simplest patch to the first one is better.
Huacai,

Thanks for reviewing the patch, will do in next version.

Regards
Bibo Mao

> 
> Huacai
> 
> On Thu, Jan 18, 2024 at 8:15 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> There is small typo in function eiointc_domain_alloc, and there is no
>> definition about struct eiointc, instead it should be struct eiointc_priv.
>> It is strange that there is no warning with gcc compiler. This patch
>> fixes the typo issue.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   drivers/irqchip/irq-loongson-eiointc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
>> index 86f4faad0695..1a25e0613d50 100644
>> --- a/drivers/irqchip/irq-loongson-eiointc.c
>> +++ b/drivers/irqchip/irq-loongson-eiointc.c
>> @@ -252,7 +252,7 @@ static int eiointc_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>          int ret;
>>          unsigned int i, type;
>>          unsigned long hwirq = 0;
>> -       struct eiointc *priv = domain->host_data;
>> +       struct eiointc_priv *priv = domain->host_data;
>>
>>          ret = irq_domain_translate_onecell(domain, arg, &hwirq, &type);
>>          if (ret)
>> --
>> 2.39.3
>>


