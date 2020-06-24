Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33726207083
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390100AbgFXJ4T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:56:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41328 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389762AbgFXJ4T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:56:19 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb2k1I_NeAzVJAA--.10278S3;
        Wed, 24 Jun 2020 17:56:06 +0800 (CST)
Subject: Re: [1/7] irqchip: Fix potential resource leaks
To:     Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
 <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
 <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
 <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <423f83e0-c533-c346-ab8b-f2c6ccc828a2@loongson.cn>
Date:   Wed, 24 Jun 2020 17:56:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb2k1I_NeAzVJAA--.10278S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XryfKw45XFWxGFWrCry7Awb_yoWkWFXEkF
        4Sk34kW345Ca1UG3ZIqr4UZF4fG3sxG345J398tFyag343Xw47CrZ7WrZ3Cw1xGrZ7Grnx
        Ar4xt34fXw17ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUba8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
        cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
        04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
        JwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_GcCE3sUvcS
        sGvfC2KfnxnUUI43ZEXa7VU1fgA7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/24/2020 05:23 PM, Markus Elfring wrote:
>>> [PATCH v3 10/14 RESEND] irqchip/nvic: Fix potential resource leaks
>>> https://lore.kernel.org/linux-mips/1592984711-3130-11-git-send-email-yangtiezhu@loongson.cn/
>>> https://lore.kernel.org/patchwork/patch/1263191/
>>>
>>>
>>> Can it matter to omit the word “potential” from change descriptions
>>> after you detected that specific function calls were missing
>>> in if branches?
>> Oh, I find this issue through code review, I have no test environment
>> to trigger the error path, but I think it is better to release the resource
>> in the error path, so I use "potential" description.
> Did you determine that special function calls were generally missing
> in error cases?

Yes, I read many files in drivers/irqchip,
the resource is released in the error path.

>
> Were any known software analysis tools involved for the detection of
> questionable source code places?

kmemleak can detect memory leak,
but I do not know how to detect other kind of leaks.
I think consciously release resource in the error path can avoid leaks.

>
> Regards,
> Markus

