Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8898B206FEF
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388353AbgFXJYx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:24:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34264 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728637AbgFXJYx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:24:53 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn97KG_NesDFJAA--.736S3;
        Wed, 24 Jun 2020 17:24:29 +0800 (CST)
Subject: Re: [PATCH 1/7] irqchip: Fix potential resource leaks
To:     Krzysztof Kozlowski <krzk@kernel.org>
References: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
 <1592902276-3969-2-git-send-email-yangtiezhu@loongson.cn>
 <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Kukjin Kim <kgene@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <678f8927-3560-e55b-956f-3e197c7e3244@loongson.cn>
Date:   Wed, 24 Jun 2020 17:24:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn97KG_NesDFJAA--.736S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4UtF18Zr1UKw1fGw4fAFb_yoW8XF4kpF
        4UJ39IvrWrCFW2kr43Cr1jyFy5Jwn3tay7K3yxA3sxXr98W3srGF4UA34kXrn7GryfGw12
        9F4rXa45G3W5CFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
        6cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aV
        CY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuYvjfUOqXHDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/24/2020 05:15 PM, Krzysztof Kozlowski wrote:
> On Tue, 23 Jun 2020 at 10:51, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>> There exists some potential resource leaks in the error path, fix them.
> This should be split per driver and per bug (although mostly in driver
> it's just one bug). Otherwise it is difficult to review, backport and
> revert.

Thanks for your suggestion, I have split it into a patch series [1],
I will resend it some days later due to git send-email always failed.

[1] https://lore.kernel.org/patchwork/cover/1263192/

>
> Best regards,
> Krzysztof
>
>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   drivers/irqchip/irq-ath79-misc.c      |  3 +++
>>   drivers/irqchip/irq-csky-apb-intc.c   |  3 +++
>>   drivers/irqchip/irq-csky-mpintc.c     | 26 ++++++++++++++++++++------
>>   drivers/irqchip/irq-davinci-aintc.c   | 17 +++++++++++++----
>>   drivers/irqchip/irq-davinci-cp-intc.c | 17 ++++++++++++++---
>>   drivers/irqchip/irq-digicolor.c       |  4 ++++
>>   drivers/irqchip/irq-dw-apb-ictl.c     | 11 ++++++++---
>>   drivers/irqchip/irq-loongson-htvec.c  |  5 ++++-
>>   drivers/irqchip/irq-ls1x.c            |  4 +++-
>>   drivers/irqchip/irq-mscc-ocelot.c     |  6 ++++--
>>   drivers/irqchip/irq-nvic.c            |  2 ++
>>   drivers/irqchip/irq-omap-intc.c       |  4 +++-
>>   drivers/irqchip/irq-riscv-intc.c      |  1 +
>>   drivers/irqchip/irq-s3c24xx.c         | 20 +++++++++++++++-----
>>   drivers/irqchip/irq-xilinx-intc.c     |  1 +
>>   15 files changed, 98 insertions(+), 26 deletions(-)

