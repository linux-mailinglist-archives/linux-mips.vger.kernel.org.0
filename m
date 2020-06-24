Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40674206FD9
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388372AbgFXJRE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:17:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60472 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387886AbgFXJRE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:17:04 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2gCGvNexTBJAA--.646S3;
        Wed, 24 Jun 2020 17:16:51 +0800 (CST)
Subject: Re: [1/7] irqchip: Fix potential resource leaks
To:     Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
 <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
Date:   Wed, 24 Jun 2020 17:16:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT2gCGvNexTBJAA--.646S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gry8Jw4xZr1DWrWUGw18Grg_yoWfuwbEk3
        WxK34DW397AF4UCr17tr4jqr98G3sxGa45tw4DtFW2gryavwsxCFZ7WrWrJw18WrZ7Crnx
        Arsrt34fXw1xujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbfAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
        wI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_GcCE3sUvcSsGvfC2KfnxnUUI43ZEXa7VUbdOz3UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/24/2020 04:42 PM, Markus Elfring wrote:
>>> Can it helpful to add jump targets so that a bit of exception handling
>>> can be better reused at the end of this function?
>> OK, no problem, I will do it in the v2.
> It seems that the software evolution will be continued with another
> update suggestion like the following.
>
> [PATCH v3 10/14 RESEND] irqchip/nvic: Fix potential resource leaks
> https://lore.kernel.org/linux-mips/1592984711-3130-11-git-send-email-yangtiezhu@loongson.cn/
> https://lore.kernel.org/patchwork/patch/1263191/
>
>
> Can it matter to omit the word “potential” from change descriptions
> after you detected that specific function calls were missing
> in if branches?

Oh, I find this issue through code review, I have no test environment
to trigger the error path, but I think it is better to release the resource
in the error path, so I use "potential" description.

>
> Regards,
> Markus

