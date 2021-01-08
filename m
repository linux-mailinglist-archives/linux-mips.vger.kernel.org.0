Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12E12EF082
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 11:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbhAHKQo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 05:16:44 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53205 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726205AbhAHKQn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Jan 2021 05:16:43 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8599958045F;
        Fri,  8 Jan 2021 05:15:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Jan 2021 05:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=C
        W8/vUms1/XyCsx+VuIeHsDwZMMN8itHJftHRPchypU=; b=Rqa/YK8FzGwcy9LnM
        IIkIsFBfVVoo72fOfR4i136GiOPN0Hf2nlvOLYJpKaOdqsX4q8l6GsX6iYvCpX5m
        CnxRaUXnfC2nshkMi1PqFF2SDyx4og7OpuesyDIy2xc6RO3i+fa4ZY4iQK0imJN1
        cqYlf5Coq8hyFcB2KDhG1LQo8jLIeCzCbVvESLzU1iAEgFPlBp6dqq6C/cBnwm6z
        vp6xwNo+LCRPBaaeKIyy5eOgbLTg2ymqWoTnnXS0x/3RQTiarEKFexVodo+/INEt
        orl2KX1HxaJ54EkirQjjnAG9dfnYda8uWq6u6WHVrdwt8UZprImI1+DvwfDpV2gu
        fxa9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=CW8/vUms1/XyCsx+VuIeHsDwZMMN8itHJftHRPchy
        pU=; b=Wr6CvXLrieAn8OcNqo3SPbTBvSFLjPLhtAQ1vzt6cwCc2V2AdRVYUMWvX
        U4XV8GxB+YhxOGbU38eVj4VmnLixoPUz4ZtN4xqt3RnV9pg0dPE4gtNUZk48vgOM
        qV2A61KzxaVDpVrSwJTt0xtNzNsUlDJOfFU4TTP/6HRRvTCIjdi+T1rI5leWqdEw
        wdn/kzNJ4LiQlTJuaVHS7C0B/EocoImTg2cTRp72Gvthlj8T27qOyJUQLCtpBVIn
        W2p2Dd3MYMj+cxa1ui+dip2erCc/eA4m+TVPVvzVL2LuiLGLCd7CS1qFaYY9aW59
        P64nSuqs6JxWJrZOzTWqXTeikkhjQ==
X-ME-Sender: <xms:2DD4XzPpZqaDSKa0Je5wa5wzfxKQRPPXv2gj42kt_AyzxLL_ME7uDw>
    <xme:2DD4X984T8yKC_shl-d4UK0yNPTwyNDJId_-i5kBwI_-t4ZWnEvFeDFNwKpkiXA90
    nlmcmwsS4PXrkrMybY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhgffggeehhfekkeelgfegfedtgeduhefgueehgedttdetueev
    veeghedvffeutdenucffohhmrghinhepkhgvrhhnvghlrdhssgenucfkphepgeehrdeffe
    drhedtrddvheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:2DD4XyTpx_HP4DQLLrQRV8RwAripO8CBqgutKK-JWxzfcgK6ALu5Pw>
    <xmx:2DD4X3sIqPfwCqXuRFGtU8_7iMo80wRA1-uQDbf4sjvI84aWHHXVAQ>
    <xmx:2DD4X7fi0SHCi4s6QfUReDu1VvlKlYAMDgJaBD8QbEFVh7h4JkX7iQ>
    <xmx:3TD4XzQBfYQy-4TMhKnkBUrkEq8DYgw7ctAd-eXupuIoDyK9PkA-Xg>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 60F66240057;
        Fri,  8 Jan 2021 05:15:47 -0500 (EST)
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Youling Tang <tangyouling@loongson.cn>
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
 <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
 <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
 <20210107172620.GA13201@alpha.franken.de>
 <1085845b-2c5a-dbb6-62b7-28b55aeacb4c@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <13b3f842-61e8-db13-67ff-7d2a9d894484@flygoat.com>
Date:   Fri, 8 Jan 2021 18:15:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1085845b-2c5a-dbb6-62b7-28b55aeacb4c@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2021/1/8 下午6:07, Jinyang He 写道:
> Hi, Thomas,
>
> On 01/08/2021 01:26 AM, Thomas Bogendoerfer wrote:
>>>>> --- a/arch/mips/kernel/relocate_kernel.S
>>>>> +++ b/arch/mips/kernel/relocate_kernel.S
>>>>> @@ -6,6 +6,7 @@
>>>>>
>>>>>    #include <asm/asm.h>
>>>>>    #include <asm/asmmacro.h>
>>>>> +#include <asm/cpu.h>
>>>>>    #include <asm/regdef.h>
>>>>>    #include <asm/mipsregs.h>
>>>>>    #include <asm/stackframe.h>
>>>>> @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
>>>>>    #else
>>>>>        sync
>>>>>    #endif
>>>>> +
>>>>> +#ifdef CONFIG_CPU_LOONGSON64
>> Is there a reason why you can't use the already existing infrastructure
>> the way cavium-octeon is doing it ? If you can't please explain why
>> so we can find a way to extend it. But having some sort of poking
>> loongson registers in generic MIPS code is a non starter.
>>
>> Thomas.
>>
>
> Unlike the cavium-octeon platform, the Loongson64 platform needs some 
> changes. Before the kernel starts, (before entering the kernel_entry), 
> each CPU has its own state (the SMP system). For Loongson64, only the 
> boot CPU will enter the kernel_entry, and other CPUs will query their 
> mailbox value in a loop. This is what the BIOS does for the CPU. Here 
> is different from cavium-octeon. All CPUs will enter the kernel_entry 
> on cavium-octeon platform. Then the kernel_entry_setup, the co-CPUs 
> will enter the query loop. I saw the kernel_entry_setup of other 
> platforms, such as ip27, malta, and generic. They are not like 
> cavium-octeon and the co-CPUs entering the loop may be earlier than 
> entering kernel_entry. So I have reason to guess that most SMP system 
> platform CPUs are similar to Loongson64.

Hi Jingyang,

As I commented before you may reuse play_dead logic in Loongson's smp.c.

>
> relocate_kernel.S is like BIOS doing s omething for the CPU. It allows 
> the boot CPU to start from the new kernel_entry and makes the co-CPUs 
> enter a loop. The already existing infrastructure may be more suitable 
> for non-smp platforms. Although we can do something with 
> plat_smp_ops.kexec_nonboot_cpu, more new problems will arise in that 
> case. The kexec process actually runs on a copy of relocate_kernel.S, 
> which will bring a lot of problems...

It won't be a problem as you can keep all data on-stack without external 
reference.

Thanks.

- Jiaxun

>
> Above all just my personal thoughts.
>
> Thanks,
> Jinyang
>

