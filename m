Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9631D48E0
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 10:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgEOIyO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 04:54:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48878 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727116AbgEOIyN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 04:54:13 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb2ixWL5eHQ41AA--.8S3;
        Fri, 15 May 2020 16:54:10 +0800 (CST)
Subject: Re: [PATCH v2 2/2] MIPS: Fix build errors under
 CONFIG_HAVE_STD_PC_SERIAL_PORT
To:     jiaxun.yang@flygoat.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1589512985-27419-1-git-send-email-yangtiezhu@loongson.cn>
 <1589512985-27419-2-git-send-email-yangtiezhu@loongson.cn>
 <20200515073938.GA8289@alpha.franken.de>
 <7715fe64-5d28-f8c8-3b04-0bf2b9f16497@loongson.cn>
 <5AA0EB3A-DF33-4BE7-804C-45F6B51A0CF7@flygoat.com>
Cc:     Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <db6fda56-27da-3705-1270-805e61defe4b@loongson.cn>
Date:   Fri, 15 May 2020 16:54:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5AA0EB3A-DF33-4BE7-804C-45F6B51A0CF7@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb2ixWL5eHQ41AA--.8S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw18GFy8AFW5Kr4UJrW8WFg_yoWkArX_Wr
        1jkr9rCw4rZw4Yy34DKws3JF9FgrZrCrW8Wa4Igw4Iq3s0vFy3Grs5G34SqF4rWr48Arsx
        CF4rZa9IkwsI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbsAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
        z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUjxwIDUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/15/2020 04:19 PM, Jiaxun Yang wrote:
>
> 于 2020年5月15日 GMT+08:00 下午3:54:46, Tiezhu Yang <yangtiezhu@loongson.cn> 写到:
>> On 05/15/2020 03:39 PM, Thomas Bogendoerfer wrote:
>>> On Fri, May 15, 2020 at 11:23:05AM +0800, Tiezhu Yang wrote:
>>>> When CONFIG_HAVE_STD_PC_SERIAL_PORT is set, include linux/module.h to fix
>>>> the following build errors:
>>> how are you doing this ? To me it looks like this CONFIG option isn't
>>> used anymore.
>> Because I will use arch/mips/kernel/8250-platform.c in the near future,
>> so make MACH_LOONGSON64 selects HAVE_STD_PC_SERIAL_PORT, then
>> I find the build errors.
> Please never use it.
> If you are willing to add serial port then please do it
> in devicetree.
> Platform devices in wild is dangerous and it will break everything.

Hi Jiaxun,

OK, Thanks for your suggestion. I will rethink my plan.

Hi Thomas,

Because CONFIG_HAVE_STD_PC_SERIAL_PORT is not used anymore,
(1) Is it necessary to fix this possible build error?
or
(2) Should we remove this arch/mips/kernel/8250-platform.c?

Thanks,
Tiezhu Yang

>
>> Thanks,
>> Tiezhu Yang
>>
>>> Thomas.
>>>

