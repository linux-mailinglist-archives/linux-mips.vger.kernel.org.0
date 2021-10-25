Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC42B438D61
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 04:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhJYCOH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Oct 2021 22:14:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34686 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231516AbhJYCOG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Oct 2021 22:14:06 -0400
Received: from localhost.localdomain (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx9OVXEnZhn5IfAA--.56913S3;
        Mon, 25 Oct 2021 10:11:37 +0800 (CST)
Subject: Re: [PATCH 4/4] MIPS: Add is_jr_ra_ins() to end the loop early
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
 <1610454557-25867-5-git-send-email-hejinyang@loongson.cn>
 <alpine.DEB.2.21.2110232023171.38243@angie.orcam.me.uk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <228e5765-6fe6-9cdc-4d37-2a0e4406ee8e@loongson.cn>
Date:   Mon, 25 Oct 2021 10:11:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110232023171.38243@angie.orcam.me.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Cx9OVXEnZhn5IfAA--.56913S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1kuryDKw1kKw1fWr4xXrb_yoW8uF4UpF
        45A3Z8KrW8X34fK3sxtrWrXryYqrs5KwsxKFWxtrW0v3Z8Wr1xZrySyrs0k3y8Ar1Fk3W0
        vF90vr1jkw1qv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU56c_DUUUU
        U==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/24/2021 02:32 AM, Maciej W. Rozycki wrote:

> On Tue, 12 Jan 2021, Jinyang He wrote:
>
>> For those leaf functions, they are likely to have no stack operations.
>> Add is_jr_ra_ins() to determine whether jr ra has been touched before
>> the frame_size is found. Without this patch, the get frame_size operation
>> may be out of range and get the frame_size from the next nested function.
>>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>>   arch/mips/kernel/process.c | 34 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
>> index bef8f8d..9e6f194 100644
>> --- a/arch/mips/kernel/process.c
>> +++ b/arch/mips/kernel/process.c
>> @@ -205,6 +205,36 @@ struct mips_frame_info {
>>   #define J_TARGET(pc,target)	\
>>   		(((unsigned long)(pc) & 0xf0000000) | ((target) << 2))
>>   
>> +static inline int is_jr_ra_ins(union mips_instruction *ip)
>> +{
>> +#ifdef CONFIG_CPU_MICROMIPS
>> +	/*
>> +	 * jr16 ra
>> +	 * jr ra
>> +	 */
>> +	if (mm_insn_16bit(ip->word >> 16)) {
>> +		if (ip->mm16_r5_format.opcode == mm_pool16c_op &&
>> +		    ip->mm16_r5_format.rt == mm_jr16_op &&
>> +		    ip->mm16_r5_format.imm == 31)
>> +			return 1;
>> +		return 0;
>> +	}
>> +
>> +	if (ip->r_format.opcode == mm_pool32a_op &&
>> +	    ip->r_format.func == mm_pool32axf_op &&
>> +	    ((ip->u_format.uimmediate >> 6) & GENMASK(9,0)) == mm_jalr_op &&
>> +            ip->r_format.rs == 31)
>> +		return 1;
>> +	return 0;
>> +#else
>   Without looking into it much, this is likely missing the point, because
> while technically inteed JR and JR16 can be used with $ra in microMIPS
> machine code (there's JRS too), in reality either JRC or JRADDIUSP will.
>
>   [Wading through e-mail recovered from mid-Jan linux-mips.org crash.]
>
>    Maciej

You are right, I missed the point. I have refered to microMIPS64
Instruction Set. JRC and JRADDIUSP also can be used with $ra in
microMIPS. I am not sure what compiler do at epilogue. But when
we call $ra without saving $ra, it means return, I think.
I will fix it later.

Thanks,
Jinyang.

