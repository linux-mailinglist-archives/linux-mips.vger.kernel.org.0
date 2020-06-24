Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4ED12069A9
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 03:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbgFXBpf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 21:45:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48092 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387780AbgFXBpf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 21:45:35 -0400
Received: from [10.130.0.166] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL94ssPJezAZJAA--.243S3;
        Wed, 24 Jun 2020 09:45:17 +0800 (CST)
Subject: Re: [PATCH 1/7] irqchip: Fix potential resource leaks
To:     Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
Date:   Wed, 24 Jun 2020 09:44:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL94ssPJezAZJAA--.243S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw17tw18JFy5JrW5Aw47Jwb_yoWkuFc_CF
        1F9ryDuay8Ar1UGF4xKw17Xr9xKrnrX3sxtFyvya12y34fZa1I9rsagr9aqa4xZr92krn8
        Gr4jv342yr1I9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbakFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
        Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
        x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
        1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyU
        JVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
        IYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/23/2020 11:55 PM, Markus Elfring wrote:
>> There exists some potential resource leaks in the error path, fix them.
> Will the tag “Fixes” become relevant for the commit message?

Hi Markus,

Thanks for your reply and suggestion.

This patch contains many files in drivers/irqchip,
maybe I should split it into some small patches if use the tag "Fixes"?

>
>
> …
>> +++ b/drivers/irqchip/irq-nvic.c
>> @@ -94,6 +94,7 @@ static int __init nvic_of_init(struct device_node *node,
>>
>>   	if (!nvic_irq_domain) {
>>   		pr_warn("Failed to allocate irq domain\n");
>> +		iounmap(nvic_base);
>>   		return -ENOMEM;
>>   	}
>>
>> @@ -103,6 +104,7 @@ static int __init nvic_of_init(struct device_node *node,
>>   	if (ret) {
>>   		pr_warn("Failed to allocate irq chips\n");
>>   		irq_domain_remove(nvic_irq_domain);
>> +		iounmap(nvic_base);
>>   		return ret;
>>   	}
> Can it helpful to add jump targets so that a bit of exception handling
> can be better reused at the end of this function?

OK, no problem, I will do it in the v2.

By the way, I have resent this patch series due to git send-email failed,
https://lore.kernel.org/patchwork/cover/1261517/

Thanks,
Tiezhu

>
> Regards,
> Markus

