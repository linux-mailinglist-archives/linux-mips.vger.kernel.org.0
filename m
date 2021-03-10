Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33E133331C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 03:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhCJC0l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 21:26:41 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47472 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231235AbhCJC0j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Mar 2021 21:26:39 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxedRRLkhgUpQXAA--.29562S3;
        Wed, 10 Mar 2021 10:26:25 +0800 (CST)
Subject: Re: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
To:     Marc Zyngier <maz@kernel.org>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
 <20210306023633.9579-6-zhangqing@loongson.cn> <87wnugy9oe.wl-maz@kernel.org>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <5c5b2593-b07c-cd20-cd08-1d6542471260@loongson.cn>
Date:   Wed, 10 Mar 2021 10:26:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <87wnugy9oe.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxedRRLkhgUpQXAA--.29562S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtr48Gw4UWF4kZF4xuF47XFb_yoWkKrc_Cr
        4qg34UXF15ZryfJrs8Cr4UZF93JF9rKr43JFW0g3WIva40vw4UGrWkurZ3t3yIgFn2grna
        kryFkay7CrW2qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUbpwZ7UUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 03/09/2021 05:10 PM, Marc Zyngier wrote:
>
>> +
>> +static void __iomem *liointc_get_reg_byname(struct device_node *node,
>> +						const char *name)
>> +{
>> +	int index = of_property_match_string(node, "reg-names", name);
>> +
>> +	return of_iomap(node, index);
> So if of_property_match_string() returns an error, you feed that error
> to of_iomap()? Somehow, I don't think that's a good idea.

Hi, Marc

Thank you for your suggestion, error handling is missing here,

      +    if (index <0)
      +           return NULL;

             return of_iomap(node, index);

It has been fixed in the fourth version, and I will send V4 soon.

> +	if (of_device_is_compatible(node, "loongson,liointc-2.0")) {
> +		base = liointc_get_reg_byname(node, "main");
> +		if (!base) {
> +			err = -ENODEV;
> +			goto out_free_priv;
> +		}
> +		for (i = 0; i < LIOINTC_NUM_CORES; i++) {
> +			priv->core_isr[i] =
> +				liointc_get_reg_byname(node, core_reg_names[i]);
> Please write assignments on a single line.

In addition, write assignments on a single line

                  for (i = 0; i <LIOINTC_NUM_CORES; i++)
                          priv->core_isr[i] = 
liointc_get_reg_byname(node, core_reg_names[i]);

     It is 92 characters, more than 80 characters...


    Thanks

    -Qing

>
> Thanks,
>
> 	M.
>

