Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374E826E5B9
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 21:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgIQOwl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 10:52:41 -0400
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:33826 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbgIQOtX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Sep 2020 10:49:23 -0400
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 6E96620DE4;
        Thu, 17 Sep 2020 14:24:29 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 6FCE92008F;
        Thu, 17 Sep 2020 14:24:24 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 12C163F1C5;
        Thu, 17 Sep 2020 14:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id EA7502A0FD;
        Thu, 17 Sep 2020 10:24:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600352659;
        bh=viAHQu2L83R9ESQNfxHMi9ooNlxH9kEpvfY/wdYaq34=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HTvXg4kV0NOh8aCY15bSNzdqFDujXabkSJMbE6oFoVYUjkdPUlqX6y2//OCRVj93z
         A14NMa//JLCIg71Mck2JXvjscT/BIMXJprAFcoUbZd69Tm2QMx4m97IwaXYWRKkBIJ
         GhckXAKo6YLEH10HWyvOE8g+wEq5XYWlMRGSSd2k=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tZ8_4j9BMlXg; Thu, 17 Sep 2020 10:24:16 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 17 Sep 2020 10:24:16 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 772E640EEC;
        Thu, 17 Sep 2020 14:24:12 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="VaxzxN5E";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id BB68140FF5;
        Thu, 17 Sep 2020 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600352477;
        bh=viAHQu2L83R9ESQNfxHMi9ooNlxH9kEpvfY/wdYaq34=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VaxzxN5ErI17+SmxwTOyzK7glLqBmELJ8dsWKWgo0wkglfPIm+yCtvQSabYcsayds
         LTF7ifpDNd8XRXJkpwCtbW0JmxHBsdU6lsC6S1TOaTnVsB/5uVqHfUxpjTub6cFryO
         C6ifDOPgcIssYOU7m97dvQUJEODIsgrZxob9yJiQ=
Subject: Re: [PATCH] MIPS: Loongson64: Add kexec/kdump support
To:     Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Youling Tang <tangyouling@loongson.cn>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kexec@lists.infradead.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1600175263-7872-1-git-send-email-hejinyang@loongson.cn>
 <376B4B91-0736-43FA-87EA-43E12FF24EF1@flygoat.com>
 <7b78c4d4-7ee3-cf57-71d1-95611713de2b@loongson.cn>
 <CAAhV-H5t3KWL1O+JKVp+T2qqGXuW7OiasjnnCLmV0+GE0Ns9xQ@mail.gmail.com>
 <647822a9-bc3b-5da1-95e7-c048a5a3b8fa@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <42ff66fb-a0bf-937f-8415-5d407fb93e03@flygoat.com>
Date:   Thu, 17 Sep 2020 22:21:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <647822a9-bc3b-5da1-95e7-c048a5a3b8fa@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 772E640EEC
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/9/17 20:41, Jinyang He 写道:
> Hi, Huacai,
>
>
> On 09/16/2020 01:39 PM, Huacai Chen wrote:
>> Hi, Jinyang,
>>
>> On Tue, Sep 15, 2020 at 10:17 PM Jinyang He <hejinyang@loongson.cn> 
>> wrote:
>>>
>>>
>>> On 09/16/2020 09:33 AM, Jiaxun Yang wrote:
>>>> 于 2020年9月15日 GMT+08:00 下午9:07:43, Jinyang He 
>>>> <hejinyang@loongson.cn> 写到:
>>>>> Add loongson_kexec_prepare(), loongson_kexec_shutdown() and
>>>>> loongson_kexec_crashdown() for passing the parameters of kexec_args.
>>>>>
>>>>> To start loongson64, CPU0 needs 3 parameters:
>>>>> fw_arg0: the number of cmd.
>>>>> fw_arg1: cmd structure which seems strange, the cmd array[index]'s
>>>>>           value is cmd string's address, index >= 1.
>>>>> fw_arg2: environment.
>>>>>
>>>>> Secondary CPUs do not need parameter at once. They query their
>>>>> mailbox to get PC, SP and GP in a loop before CPU0 brings them up
>>>>> and passes these parameters via mailbox.
>>>>>
>>>>> loongson_kexec_prepare(): Alloc new memory to save cmd for kexec.
>>>>> Combine the kexec append option string as cmd structure, and the cmd
>>>>> struct will be parsed in fw_init_cmdline() of 
>>>>> arch/mips/fw/lib/cmdline.c.
>>>>> image->control_code_page need pointing to a safe memory page. In 
>>>>> order to
>>>>> maintain compatibility for the old firmware the low 2MB is reserverd
>>>>> and safe for Loongson. So let it points here.
>>>>>
>>>>> loongson_kexec_shutdown(): Wake up all present CPUs and let them go
>>>>> to reboot_code_buffer. Pass the kexec parameters to kexec_args.
>>>>>
>>>>> loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.
>>>>>
>>>>> The assembly part provide a way like BIOS doing to keep secondary
>>>>> CPUs in a querying loop.
>>>>>
>>>>> This patch referenced [1][2][3].
>>>>>
>>>>> [1] arch/mips/cavium-octeon/setup.c
>>>>> [2] https://patchwork.kernel.org/patch/10799217/
>>>>> [3] 
>>>>> https://gitee.com/loongsonlab/qemu/blob/master/hw/mips/loongson3a_rom.h 
>>>>>
>>>>>
>>>>> Co-developed-by: Youling Tang <tangyouling@loongson.cn>
>>>>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>>>>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>>>>> ---
>>>>> arch/mips/kernel/relocate_kernel.S | 19 ++++++++
>>>>> arch/mips/loongson64/reset.c       | 88 
>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>> 2 files changed, 107 insertions(+)
>>>>>
>>>>> diff --git a/arch/mips/kernel/relocate_kernel.S 
>>>>> b/arch/mips/kernel/relocate_kernel.S
>>>>> index ac87089..061cbfb 100644
>>>>> --- a/arch/mips/kernel/relocate_kernel.S
>>>>> +++ b/arch/mips/kernel/relocate_kernel.S
>>>>> @@ -133,6 +133,25 @@ LEAF(kexec_smp_wait)
>>>>> #else
>>>>>       sync
>>>>> #endif
>>>>> +
>>>>> +#ifdef CONFIG_CPU_LOONGSON64
>>>>> +#define MAILBOX_BASE 0x900000003ff01000
>>>> Please avoid hardcoded SMP information. You're breaking Loongson 3B 
>>>> support.
>>>>
>>> Ok, I see. Since my machine is Loongson 3A. I'll send v2
>>> after I test it in 3B.
>> 1, My original version can work on both Loongson-3A and Loongson-3B,
>> why you modify my patch and hadn't discuss with me?
>>
>> 2, With this single patch both kexec and kdump cannot work reliably,
>> because kexec need this patch:
>>     https://patchwork.kernel.org/patch/11695929/
>>
>>     and kdump need my first patch in my original version:
>>     https://patchwork.kernel.org/patch/10799215/
>>
>>     You may argue that you have tested. Yes, I believe that, I'm not
>> saying that you haven't test, and I'm not saying that your patch
>> cannot work, I'm just saying that your patch is not robust.
>>
>> 3, I'm the original author and paying attention to kexec/kdump
>> continuosly, I will send a new version once the above two patches be
>> accepted. But you re-send my patch without any communication with me,
>> why you so impatient?
>>
>> Huacai
>>
>
> 1, Your original version:
>    https://patchwork.kernel.org/patch/10799217/
>
> This patch can work on Loongson-3A, I tested it.
>
> But it works wrong after the follow behaviors,
>    kexec -l vmlinux --append=cmdline_kexec
>    kexec -p vmlinux --append=cmdline_kdump
>    kexec -e
>
> It works but cmdline_kdump merged cmdline_kexec.
>
> And this patch memcpy from fw_arg2 to kexec_envp and later memcpy from
> kexec_envp to fw_arg2 when fw_arg2 was not changed, it's redundant.
>
> However, I have not Loongson-3B now, and did not test it. For this patch,
> does it work well on Loongson-3B3000/Loongson-3B4000?

Hi Jingyang,

Well for Loongson-3B I meant 3B1000/3B1500, which have different layout
of SMP registers. For 3B3000/3B4000 everyone know they're just different
branding to the same silicon.
>
> 3, I try to fix Loongson64 kexec function since I joined the community.
> I fell sorry to not do enough research on Loongson64 kexec. My first 
> patch:
>    https://patchwork.kernel.org/patch/11684849/

I'm glad to see Loongson staff joining the community and enhance our code.
It is common practice to investigate historical changes before do something
to the upstream code :-)

>
> It fixed problem about "Crash kernel" which can be traced back to 
> linux-5.4.
> At that time, I thought there is no developer work on Kexec. Thus, I 
> did a
> lot on Kexec. Are you really continuosly paying attention to kexec/kdump?
> With the exploring and developing deep, I found your patch several 
> days ago
> after I did a draft patch witch referenced:
>    arch/mips/cavium-octeon/setup.c
> https://gitee.com/loongsonlab/qemu/blob/master/hw/mips/loongson3a_rom.h
>
> There is no doubt that your patch gives me confidence and suggestion 
> while
> it gives me worry. As a newcomer, I do not know if should communicate 
> with
> you since your patch was committed one year ago. And now it may be a good
> chance to do some communication.

You should *always* try to *credit* others properly, that's the first thing.
Communication is optional but highly recommanded.

Recently I can smell there are some tensions raised between the 
community and
the Loongson company, mainly about GPL violation and Loongson's attitude
towards the community. Personaly I don't hold any hostility to Loongosn's
practice in the community but I'd also like to see Loongson show their 
respect
to the community.

Thanks.

- Jiaxun

>
> Thanks,
>
> - Jinyang.
>
