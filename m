Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F9832F7F6
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 04:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCFDNC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 22:13:02 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59728 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229597AbhCFDM2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 22:12:28 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb_EL80JgriAVAA--.9737S3;
        Sat, 06 Mar 2021 11:12:12 +0800 (CST)
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
 <CAAdtpL6xDyYgDdHFkZPjtbbX4tV4K=7YehEoeGSgHdw-rXtURw@mail.gmail.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <b93973ff-eff1-e159-d396-8d375d1dd2d8@loongson.cn>
Date:   Sat, 6 Mar 2021 11:12:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL6xDyYgDdHFkZPjtbbX4tV4K=7YehEoeGSgHdw-rXtURw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb_EL80JgriAVAA--.9737S3
X-Coremail-Antispam: 1UD129KBjvJXoWrZr1rWw1rWrWUtF13CrWrGrg_yoW8Jr4fpa
        1Sg340ga1DGr1fuF1fKrW8uFyfA3WrtFsxGFy2q3WYkr9xXr18tF1Y9F4I93W7Arn5CF9r
        Z34I9r1xKan8CF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2
        jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
        ZFpf9x07j7xhLUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/05/2021 06:01 PM, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On Thu, Mar 4, 2021 at 5:35 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>> The purpose of separating loongson_system_configuration from boot_param.h
>> is to keep the other structure consistent with the firmware.
> This is supposed to be a trivial patch, but the description actually
> confuses me.
>
> Why is the move out of "boot_param.h" keeping it consistent with fw?
Hi, PhilippeMathieu-Daudé

Thank you for your reply.

The boot_param.h file must be consistent in the kernel and the firmware 
pmon/cmds/bootparam.h
In env.c, the loongson_system_configuration structure member gets the 
value passed to the firmware.
eg:
struct boot_params *boot_p;

          loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
          loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;
          loongson_sysconf.suspend_addr = boot_p->reset_system.DoSuspend;

The boot_params structure is consistent with the firmware,
The loongson_system_configuration is filled in the kernel, and there is 
no such structure in pmon-loongson3, it is actually defined in the kernel.

So, remove its definition from boot_param.h.

Thanks,
Qing


