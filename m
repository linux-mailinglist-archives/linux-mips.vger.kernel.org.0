Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0131DF433
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 04:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387490AbgEWCs3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 22:48:29 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54874 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S2387481AbgEWCs2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 22:48:28 -0400
Received: from [192.168.9.172] (unknown [112.65.48.98])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 025F06006D;
        Sat, 23 May 2020 10:48:23 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590202104; bh=S/jmZC9kALKI9eVk6RR2THlVl75mGr79LA4yJ0fI840=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CG86ZoiB7NbLvOqV6g/ZvT9Ut36gZTvd62V/KEdbCYzCwHnDywOaO2iJooFIfIzXH
         C/53NUUAiq94mI1pUISj7mUuCGWK7C5rPo5eOn+JbG2B0kQQKwUgxQkTLj6T8sTndK
         WcQFyeNaQZPGBXT7mkAUFxNwu+tXKRm1DwX2Pocw=
Subject: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
To:     maobibo <maobibo@loongson.cn>, jiaxun.yang@flygoat.com
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
References: <20200521181403.6078-1-git@xen0n.name>
 <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
 <B61EB510-C793-492B-8A3F-4C340190DC21@flygoat.com>
 <42b4126b.f787.1723cbbd44e.Coremail.maobibo@loongson.cn>
 <50F35B43-9313-4083-A98F-45FCA3F516E2@flygoat.com>
 <bedfcdc3-ae99-2920-c08e-94a269406d80@loongson.cn>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <66fc51ec-2626-e8fd-dc36-ba61ead2c6eb@xen0n.name>
Date:   Sat, 23 May 2020 10:48:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <bedfcdc3-ae99-2920-c08e-94a269406d80@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/23/20 10:10 AM, maobibo wrote:

>
> On 05/22/2020 10:34 PM, Jiaxun Yang wrote:
>>
>> 于 2020年5月22日 GMT+08:00 下午10:14:02, "毛碧波" <maobibo@loongson.cn> 写到:
>>>
>>>
>>> &gt; -----原始邮件-----
>>> &gt; 发件人: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
>>> &gt; 发送时间: 2020-05-22 20:57:33 (星期五)
>>> &gt; 收件人: "毛碧波" <maobibo@loongson.cn>, "WANG Xuerui" <git@xen0n.name>
>>> &gt; 抄送: linux-mips@vger.kernel.org
>>> &gt; 主题: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
>>> &gt;
>>> &gt;
>>> &gt;
>>> &gt; 于 2020年5月22日 GMT+08:00 下午8:06:01, "毛碧波" <maobibo@loongson.cn> 写到:
>>> &gt; &gt;Sorry for late reponse.
>>> &gt; &gt;I just want to know how to solve compatibility on older kernel.
>>> &gt; &gt;It is ok to run user application with cpucfg instr on new kernel with this
>>> &gt; &gt;patch, however what if the application is running on older kernel without
>>> &gt; &gt;cpucfg simulation?
>>> &gt;
>>> &gt; Application can firstly probe if CPUCFG is supported by kernel &amp; hardware
>>> &gt; by fork a thread and catch SIGILL signal or HWCAP.
>>> &gt; Then decide use legacy methods or CPUCFG to probe other features.
>>> &gt;
>>> &gt; Similar method have been proofed on Arm.
>>> Sure, if  that works, what is the purpose of this patch? Do we need cpucfg
>>> simulation on older machine since there is proper method already?
>> Because it's more efficient and elegant.
>> Also applications can assume systems without CPUCFG have
>> no Loongson extension support.
>> That can save hundreds lines in various applications.
> You can add add this to hwcap/cpuinfo though it is difficult to add vendor specific
> hwcap. Application can check hwcap and then use cpucfg gracefully.
We only have so much HWCAP bits left, plus it is common to all MIPS. Due 
to fragmentation in the MIPS world, most of Loongson feature bits would 
be useless to others, yet still taking up precious bits.
>
> I do not see usage of cpucfg simulation on older machine, do we add new instruction emulation if there is new instruction?  On the other way is there cpuid simulation on x86 system?

New instructions typically are not emulated FWIW. They exist for a 
purpose, that is, accelerate certain domain-specific workloads; 
trap-and-emulate invariably devastates performance.

But CPUCFG is a different story. It is similar to CPUID, which is to be 
called sparingly but deliver significant value to software. Hence 
back-fitting almost all Loongson processors relevant today with CPUCFG 
is beneficial to a unified feature detection approach IMO.

As for CPUID on x86, it is not emulated, because:

(1) it is possible to determine its presence without executing 
potentially invalid instruction (toggling FLAGS to see if one particular 
bit is preserved); (2) it is present since later 486 and Pentium, which 
covers practically all x86 in use today.

>
>> We can kill ugly probe method in applications when all
>> machine have upgraded kernel.
> I doubt application vendor has the willing of removing so-called ugly code but work broken
> on older kernel.
We are platform builders. We are not in a position to control, or to put 
it bluntly, dictate, what ISVs do or not do. Not removing the code is 
okay, it will not break anything, and (closed-source) apps like this 
simply gradually die out along with the legacy hardware.
>> And as you can see, cpucfg is exporting more config options than any
>> existing methods like HWCAP or cpuinfo.
>> And they may valuable to applications.
>>
>> Btw: Please fix your email client.
>>
>> Thanks.
>>
