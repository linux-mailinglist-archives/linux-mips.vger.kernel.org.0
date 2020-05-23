Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A201DF423
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 04:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbgEWCKW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 22:10:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41642 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387413AbgEWCKV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 22:10:21 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn90Ihshegw04AA--.385S3;
        Sat, 23 May 2020 10:10:17 +0800 (CST)
Subject: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
To:     jiaxun.yang@flygoat.com
References: <20200521181403.6078-1-git@xen0n.name>
 <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
 <B61EB510-C793-492B-8A3F-4C340190DC21@flygoat.com>
 <42b4126b.f787.1723cbbd44e.Coremail.maobibo@loongson.cn>
 <50F35B43-9313-4083-A98F-45FCA3F516E2@flygoat.com>
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <bedfcdc3-ae99-2920-c08e-94a269406d80@loongson.cn>
Date:   Sat, 23 May 2020 10:10:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <50F35B43-9313-4083-A98F-45FCA3F516E2@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn90Ihshegw04AA--.385S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF13Xw4kGw47XryDCF47XFb_yoW8Kry5pa
        4Ykw4agFZFkF1kAr4DW3WS934FkF4kGw45JFZ3G34rCwsFkF42kr12yF45Aa12vw45Cr1j
        q39xJF1DA3W5AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y
        6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU8pnQUUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/22/2020 10:34 PM, Jiaxun Yang wrote:
> 
> 
> 于 2020年5月22日 GMT+08:00 下午10:14:02, "毛碧波" <maobibo@loongson.cn> 写到:
>>
>>
>>
>> &gt; -----原始邮件-----
>> &gt; 发件人: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
>> &gt; 发送时间: 2020-05-22 20:57:33 (星期五)
>> &gt; 收件人: "毛碧波" <maobibo@loongson.cn>, "WANG Xuerui" <git@xen0n.name>
>> &gt; 抄送: linux-mips@vger.kernel.org
>> &gt; 主题: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
>> &gt; 
>> &gt; 
>> &gt; 
>> &gt; 于 2020年5月22日 GMT+08:00 下午8:06:01, "毛碧波" <maobibo@loongson.cn> 写到:
>> &gt; &gt;Sorry for late reponse.
>> &gt; &gt;I just want to know how to solve compatibility on older kernel.
>> &gt; &gt;It is ok to run user application with cpucfg instr on new kernel with this
>> &gt; &gt;patch, however what if the application is running on older kernel without
>> &gt; &gt;cpucfg simulation?
>> &gt; 
>> &gt; Application can firstly probe if CPUCFG is supported by kernel &amp; hardware
>> &gt; by fork a thread and catch SIGILL signal or HWCAP.
>> &gt; Then decide use legacy methods or CPUCFG to probe other features.
>> &gt; 
>> &gt; Similar method have been proofed on Arm.
>> Sure, if  that works, what is the purpose of this patch? Do we need cpucfg
>> simulation on older machine since there is proper method already?
> 
> Because it's more efficient and elegant.
> Also applications can assume systems without CPUCFG have
> no Loongson extension support.
> That can save hundreds lines in various applications.
You can add add this to hwcap/cpuinfo though it is difficult to add vendor specific
hwcap. Application can check hwcap and then use cpucfg gracefully. 

I do not see usage of cpucfg simulation on older machine, do we add new instruction emulation if there is new instruction?  On the other way is there cpuid simulation on x86 system?

> 
> We can kill ugly probe method in applications when all
> machine have upgraded kernel.
I doubt application vendor has the willing of removing so-called ugly code but work broken
on older kernel.

> 
> And as you can see, cpucfg is exporting more config options than any
> existing methods like HWCAP or cpuinfo.
> And they may valuable to applications.
> 
> Btw: Please fix your email client.
> 
> Thanks.
> 

