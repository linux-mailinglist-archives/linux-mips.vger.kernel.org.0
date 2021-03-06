Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A3C32F809
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 04:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhCFDTK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 22:19:10 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60826 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229642AbhCFDS6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 22:18:58 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx__CW9EJgJiEVAA--.9853S3;
        Sat, 06 Mar 2021 11:18:47 +0800 (CST)
Subject: Re: [PATCH 1/2] MIPS: Loongson64: Remove unused sysconf members
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-2-zhangqing@loongson.cn>
 <67d0389d-9df4-066d-2c8d-2eda967fb2fc@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <d2f51232-7fd7-a655-c041-9e0e42bbe221@loongson.cn>
Date:   Sat, 6 Mar 2021 11:18:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <67d0389d-9df4-066d-2c8d-2eda967fb2fc@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx__CW9EJgJiEVAA--.9853S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw43GFy3ZFyrJFWDKryfWFg_yoWxurg_CF
        4FywsrC3W8Cr4vyFs8KF4v9r97urZ7JFWDZ34vqr1Fq3sFkF9Fqa4xGrn2ka43AFW8Zr9r
        urnY9w4Fk3yDAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbsxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2
        jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
        ZFpf9x07j7xhLUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/05/2021 10:32 AM, Jiaxun Yang wrote:
>
>
> 在 2021/3/4 下午7:00, Qing Zhang 写道:
>> We don't need them anymore, They are uniform on all Loongson64 systems
>> and have been fixed in DeviceTree.loongson3_platform_init is replaced
>> with DTS + driver.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Hmm, why it comes with my sign-off?
> I assue it's my patch somewhere off the tree?
Hi, Jiaxun

Thank you very much for your reply.

Yes, it is like this.out of tree provides good ideas, and clean up 
others by the way.

Thanks,
Qing

>
> Thanks.
>
> - Jiaxun
>

