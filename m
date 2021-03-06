Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A7932F814
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 04:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhCFDZM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 22:25:12 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33632 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229669AbhCFDZK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 22:25:10 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3_EN9kJgxiEVAA--.9962S3;
        Sat, 06 Mar 2021 11:25:02 +0800 (CST)
Subject: Re: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
To:     Huacai Chen <chenhuacai@kernel.org>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
 <20210306023633.9579-6-zhangqing@loongson.cn>
 <CAAhV-H7vrq2GRL0m7ZAhvK2XOELx_3s8-VjmkMJn1ZkL28fwfQ@mail.gmail.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, wangming01@loongson.cn
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <ba049da3-8227-47ed-7576-319e9fb5cc98@loongson.cn>
Date:   Sat, 6 Mar 2021 11:25:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7vrq2GRL0m7ZAhvK2XOELx_3s8-VjmkMJn1ZkL28fwfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx3_EN9kJgxiEVAA--.9962S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWxJFyDKF48Gw4xAw47Arb_yoWxuFXE9F
        ZYgaykAa48JFyIyr9Ikr4293sIq3y7K3y2kryDGr18Z3yFkFyYqF4DCw10qF1SqFWkZrn3
        ur4DKw4Skry8ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxh
        VjvjDU0xZFpf9x0JUco7NUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/06/2021 11:06 AM, Huacai Chen wrote:
> Hi, Qing,
>
> On Sat, Mar 6, 2021 at 10:36 AM Qing Zhang <zhangqing@loongson.cn> wrote:
>> Add IO interrupt controller support for Loongson 2k1000, different
>> from the 3a series is that 2K1000 has 64 interrupt sources, 0-31
>> correspond to the device tree liointc0 device node, and the other
>> correspond to liointc1 node.
> Use the formal name (Loongson-2K1000, Loongson-3A series), please.

Hi, Huacai

Thank you very much for your reply.

I will modify the submission information,
Use the formal name (Loongson-2K1000, Loongson-3A series) in v4,
Before that, I will wait for other people's opinions about this series.

Thanks,
Qing

>
> Huacai

