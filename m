Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B910F2FAE57
	for <lists+linux-mips@lfdr.de>; Tue, 19 Jan 2021 02:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731954AbhASBaY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Jan 2021 20:30:24 -0500
Received: from mail.loongson.cn ([114.242.206.163]:43760 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731402AbhASBaY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Jan 2021 20:30:24 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxBb3+NQZgRxoHAA--.8645S3;
        Tue, 19 Jan 2021 09:29:34 +0800 (CST)
Subject: Re: [PATCH 0/4] MIPS: process: Some fixes and improvements about
 get_frame_info()
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
 <ab6e4efb-98b5-3ad6-5bad-2338c57d9392@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <3397a977-939c-b9e5-cadb-11191765d338@loongson.cn>
Date:   Tue, 19 Jan 2021 09:29:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ab6e4efb-98b5-3ad6-5bad-2338c57d9392@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxBb3+NQZgRxoHAA--.8645S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry8Wr47Xw47tFW3Ww4xCrg_yoW8Ww1xpr
        43ArnxGF1rJry3Jr17J3yUJr15Jr4rJwn8JF47t340vrn8Cr1UAw1UJr40y34DXryUAF18
        JF45Jr1UGr15JrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
        uYvjxU70tCUUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01/18/2021 09:51 AM, Jiaxun Yang wrote:

> 在 2021/1/12 下午8:29, Jinyang He 写道:
>> Not familiar with microMIPS. Not test on microMIPS.
>
> Hi Jinyang,
>
> I was messing around QEMU microMIPS and found kernel stuck
> at loading init process after applied your patches :-(
>
> Thanks.
>
> - Jiaxun
>

Hi, Jiaxun,

Thanks you for test.
I think the last patch went wrong.

+    if (ip->r_format.opcode == mm_pool32a_op &&
+        ip->r_format.func == mm_pool32axf_op &&
+        ((ip->u_format.uimmediate >> 6) & GENMASK(9,0)) == mm_jalr_op &&
+            ip->r_format.rs == 31)

There is no POOL32A format in uapi/asm/inst.h, so some bits here use the
format of r_format instead.

---------------------------------------------------------------------
|    format      |  31:26  | 25:21 | 20:16 |    15:6    |    5:0 |
-----------------+---------+-------+-------+------------+------------
| pool32a_format | pool32a |  rt   |  rs   |   jalrc    | pool32axf |
-----------------+---------+-------+-------+------------+------------
|    r_format    |  opcode |  rs   |  rt   | rd:5, re:5 |    func |
---------------------------------------------------------------------

I mistakenly thought that r_format.rs and pool32a_format.rs are the same.

+        return 1;
+    return 0;

Could you help me test it again?

Thanks,
Jinyang

>>
>> Jinyang He (4):
>>    MIPS: process: Reorder header files
>>    MIPS: microMIPS: Fix the judgment of mm_jr16_op and mm_jalr_op
>>    MIPS: Fix get_frame_info() handing of function size
>>    MIPS: Add is_jr_ra_ins() to end the loop early
>>
>>   arch/mips/kernel/process.c | 92 
>> +++++++++++++++++++++++++++++++---------------
>>   1 file changed, 62 insertions(+), 30 deletions(-)
>>

