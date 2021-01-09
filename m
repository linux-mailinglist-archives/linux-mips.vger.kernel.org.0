Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC5D2EFE4D
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 08:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbhAIHjd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 02:39:33 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37969 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725892AbhAIHjc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Jan 2021 02:39:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0D401580689;
        Sat,  9 Jan 2021 02:38:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 09 Jan 2021 02:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=k
        OECKZDl45Q53vZHheFMwKVZBI77l1NSRBxlcr+KgrM=; b=FH/zHTLkjQBT+XdG9
        rcRgsoqqvDjhJhdcnMW+o57rqgEMv/V6Nf+2Pi0gF51FqljVA1ksGO3gA44GNcEW
        sNmGukOnicUPqgNkY2B9QnNFm0CCZtebNsNoAqkVhqepja+yItxmC323NLAAnhM5
        6OH+NuuzNEbPyx7UNr0CArOEFTZzyiaxYv9TKbwwrM+UtceP9rn1F77lP1I1FKnF
        07Njdx4aHXaqhIU1VGgQgA/IZfHFXnKRbrqQsct5jbfiyyF2LbWAqR2OWAJ30QsZ
        rMqgmOd99d0J7+3KaIWo4+15+KCBusmqM2ouJJ29JiXCqaxCGJumK6hX+38vnIt+
        ydbAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=kOECKZDl45Q53vZHheFMwKVZBI77l1NSRBxlcr+Kg
        rM=; b=fuFFjU6KkvVxLG0WfH5hOcde9NG4cVmGnASt1oAnPO9LUd7Y1YU5PuQ8Z
        vCcZ/4yplK8/+yYhvaGiCOQC6NPCAm9Wkqulxl3gZnDFG5qIHJWiF+SW4RzUZ5OT
        4rivbkBcI5bOJkSIjrXx90kAzpsmaxGq7wI9A04dGTlrM3Osy769iRFdoLN1CzAM
        oqcctR9kaWmbBaKBGGMQgKNjtsVzFZCMNTPj8f3vwdmmvPw8A+xIT4spxyv8gwAq
        adeyMHnNYRtpCHJXgSnif5qvmMPH7XmU5zDbOJEMhChxLeQAhHlYicKhy/GSf8qa
        4KR3hKjWDJkYs22q1a++Ng/79mGVQ==
X-ME-Sender: <xms:g135X_jKynmbbWz969R_zdYhkKu49-Itq454w1yc1xDCtPGFpxSLLA>
    <xme:g135X8BXSYJTAd2D-olF_i9N43ugnLdv-2s4vw4elPBC4YqFzw3nRyjFEkd9Kuzum
    oueKdH7jsolCoiteH4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegiedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhgffggeehhfekkeelgfegfedtgeduhefgueehgedttdetueev
    veeghedvffeutdenucffohhmrghinhepkhgvrhhnvghlrdhssgenucfkphepgeehrdeffe
    drhedtrddvheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:g135X_E0cbr5OD-Bih3Pp6ipS83xCHNP59vL9deSprBk_w1LBtuKZQ>
    <xmx:g135X8R80yjElLepslpHe7_w56mxC-oGEZs-ICJDtQize1vFwWAtrA>
    <xmx:g135X8z7F51MQFnWle28hEupVKVCuKVV4kTn7ss9eBll8W4ZOEI4sg>
    <xmx:hV35Xzne4CWo5wA7Dl28k9sbhnzFkta1hnJOGEVa8HkBySlo6c7PzQ>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0FBF41080059;
        Sat,  9 Jan 2021 02:38:39 -0500 (EST)
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Youling Tang <tangyouling@loongson.cn>
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
 <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
 <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
 <20210107172620.GA13201@alpha.franken.de>
 <1085845b-2c5a-dbb6-62b7-28b55aeacb4c@loongson.cn>
 <13b3f842-61e8-db13-67ff-7d2a9d894484@flygoat.com>
 <CAAhV-H5VUY20ADeXjNvOO_aP3ubikgpRJkmHJwDo71HhDGx+3A@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <3aed5286-bf91-8e51-7e30-5dbff1ed539c@flygoat.com>
Date:   Sat, 9 Jan 2021 15:38:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5VUY20ADeXjNvOO_aP3ubikgpRJkmHJwDo71HhDGx+3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2021/1/9 上午9:36, Huacai Chen 写道:
> Hi, Jiaxun,
>
> On Fri, Jan 8, 2021 at 6:15 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> 在 2021/1/8 下午6:07, Jinyang He 写道:
>>> Hi, Thomas,
>>>
>>> On 01/08/2021 01:26 AM, Thomas Bogendoerfer wrote:
>>>>>>> --- a/arch/mips/kernel/relocate_kernel.S
>>>>>>> +++ b/arch/mips/kernel/relocate_kernel.S
>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>
>>>>>>>     #include <asm/asm.h>
>>>>>>>     #include <asm/asmmacro.h>
>>>>>>> +#include <asm/cpu.h>
>>>>>>>     #include <asm/regdef.h>
>>>>>>>     #include <asm/mipsregs.h>
>>>>>>>     #include <asm/stackframe.h>
>>>>>>> @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
>>>>>>>     #else
>>>>>>>         sync
>>>>>>>     #endif
>>>>>>> +
>>>>>>> +#ifdef CONFIG_CPU_LOONGSON64
>>>> Is there a reason why you can't use the already existing infrastructure
>>>> the way cavium-octeon is doing it ? If you can't please explain why
>>>> so we can find a way to extend it. But having some sort of poking
>>>> loongson registers in generic MIPS code is a non starter.
>>>>
>>>> Thomas.
>>>>
>>> Unlike the cavium-octeon platform, the Loongson64 platform needs some
>>> changes. Before the kernel starts, (before entering the kernel_entry),
>>> each CPU has its own state (the SMP system). For Loongson64, only the
>>> boot CPU will enter the kernel_entry, and other CPUs will query their
>>> mailbox value in a loop. This is what the BIOS does for the CPU. Here
>>> is different from cavium-octeon. All CPUs will enter the kernel_entry
>>> on cavium-octeon platform. Then the kernel_entry_setup, the co-CPUs
>>> will enter the query loop. I saw the kernel_entry_setup of other
>>> platforms, such as ip27, malta, and generic. They are not like
>>> cavium-octeon and the co-CPUs entering the loop may be earlier than
>>> entering kernel_entry. So I have reason to guess that most SMP system
>>> platform CPUs are similar to Loongson64.
>> Hi Jingyang,
>>
>> As I commented before you may reuse play_dead logic in Loongson's smp.c.
>>
>>> relocate_kernel.S is like BIOS doing s omething for the CPU. It allows
>>> the boot CPU to start from the new kernel_entry and makes the co-CPUs
>>> enter a loop. The already existing infrastructure may be more suitable
>>> for non-smp platforms. Although we can do something with
>>> plat_smp_ops.kexec_nonboot_cpu, more new problems will arise in that
>>> case. The kexec process actually runs on a copy of relocate_kernel.S,
>>> which will bring a lot of problems...
>> It won't be a problem as you can keep all data on-stack without external
>> reference.
>>
>> Thanks.
> As I said before, only the control page is safe during kexec, so we
> cannot reuse smp.c. If BIOS provides play_dead(), that is also a safe
> region, but currently there is no runtime service from BIOS.

Sorry, ignored the overlap case :-(

Jumping to 0xbfc00000 to use firmware boot vector seems a little bit 
overkill.

But we'd better delivery it into platform folder, just like 
kernel-entry-init.h

Thanks.

- Jiaxun

>
> Huacai
>> - Jiaxun
>>
>>> Above all just my personal thoughts.
>>>
>>> Thanks,
>>> Jinyang
>>>

