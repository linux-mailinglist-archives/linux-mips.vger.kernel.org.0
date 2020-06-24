Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8172072DC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 14:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389376AbgFXMIG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 08:08:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60866 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388522AbgFXMIG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 08:08:06 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_2obQvNeQ0FJAA--.12766S3;
        Wed, 24 Jun 2020 20:07:57 +0800 (CST)
Subject: Re: [PATCH v3 03/14] irqchip/csky-mpintc: Fix potential resource
 leaks
To:     Markus Elfring <Markus.Elfring@web.de>, linux-mips@vger.kernel.org
References: <a0ace7a8-5c26-ee20-fe76-7dff57a18ca3@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <be3acb13-2963-ddf1-a867-7e30fd23a0b4@loongson.cn>
Date:   Wed, 24 Jun 2020 20:07:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a0ace7a8-5c26-ee20-fe76-7dff57a18ca3@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_2obQvNeQ0FJAA--.12766S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFykXw13tr13Wr45XryxXwb_yoW8Ar18pF
        4UurWrGrWkGr1UWrs7uw18ZFyfKayfJrW2g3s3Krn5urn0vr9YyFWF9rs8uasFkw15Aayx
        Zrs2yry5uw1DAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr1j
        6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x0JUu5l
        8UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/24/2020 07:43 PM, Markus Elfring wrote:
>> There exists potential resource leaks in the error path, fix them.
> I suggest to improve this change description.
> How do you think about another wording variant?
>
>     Specific system resources were not released in a few error cases.
>     Thus add jump targets for the completion of the desired exception handling.

OK, thank you, it looks good to me.
Maybe I can use this description for other patches of this series.

>
>
> …
> +++ b/drivers/irqchip/irq-csky-mpintc.c
> @@ -247,8 +247,10 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
> …
>   		INTCG_base = ioremap(mfcr("cr<31, 14>"),
>   				     INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=3e08a95294a4fb3702bb3d35ed08028433c37fe6#n257
>
>
> …
> +		if (INTCG_base == NULL) {
>
>
> Would you like to use the following code variant?
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id=3e08a95294a4fb3702bb3d35ed08028433c37fe6#n5756
>
> +		if (!INTCG_base) {
>
>
> …
>> @@ -270,12 +274,22 @@ csky_mpintc_init(struct device_node *node, struct device_node *parent)
>>
>>   #ifdef CONFIG_SMP
>>   	ipi_irq = irq_create_mapping(root_domain, IPI_IRQ);
> …
>> +	if (!ipi_irq) {
>> +		ret = -EIO;
>> +		goto err_domain_remove;
>> +	}
> …
>
> Can the function call “irq_domain_remove(root_domain)” become relevant
> only if the preprocessor symbol “CONFIG_SMP” was defined?

OK, I will do it in the next version.

>
> Regards,
> Markus

