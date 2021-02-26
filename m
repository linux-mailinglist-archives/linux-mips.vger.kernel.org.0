Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E20C325DBA
	for <lists+linux-mips@lfdr.de>; Fri, 26 Feb 2021 07:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhBZGxx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Feb 2021 01:53:53 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33293 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229482AbhBZGxw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Feb 2021 01:53:52 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 2AB935C00C4;
        Fri, 26 Feb 2021 01:53:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 26 Feb 2021 01:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=i
        7m4H3xz7cUcEC09O4w9iOsviObRN/Oa4xlAc5IYr8A=; b=AhHnXf8/jOqDcDiR5
        SuWIOji93zDqi4rYcGnDFqGWTC+D/mI25KUgr9dWJ6vRI7TvrLnjr3SXtyZbafcn
        lUskaPovJGcD3BOATOex+KysktMDf+omj0+3pwFpdQ/3rZYxJr4v6+cjeD+3NazL
        10aMqQv3k7OP53Eswwv6wJf0m24Fq/7MpDwPb6hufvlRiwbgYa6tQ6R6H1vlZK+d
        Y5EV8wRlNrFBa0HUWzrbgBlRAv6On5oSQYeRp4YW0FUvfqt+6aIQuDYVZxzCCbcZ
        Q8Gtxh4JRkyq8mc6Jl+0k8uZllqcS321Lx0k8hoVNPxx7iB0z12Rh70Cr0Bsuerv
        SThhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=i7m4H3xz7cUcEC09O4w9iOsviObRN/Oa4xlAc5IYr
        8A=; b=QIDddVguzSpYbhmGdlrl+OkosoabhMOZN54w+ufqfQWO9mmTbGofihzwa
        0gExUWWKXjjDZrc/t7FCGXEvD3350vMkaiSjEN2VSDoK399zvXo1s1vqfgeA8PKG
        rMToz+R3h1sHGlIleE22qisbvD17lGGMAXAmKjTWbj/rr+8jz6WwO44HSsR3SONG
        UHYZwkTntvuRLeSCc5OaxkpTMpjEntkz3lHL7ifjH3ciAyCY9CBuHOzWk+q6vaz3
        xasvuWSw9JzEsqPvKPvpnhK9JEu25zsg2bHaMNccAp1Kjwg+LBc7xWGagTy7Z0ti
        41798qhHALusTeq1LCh5UAc5Ln7oQ==
X-ME-Sender: <xms:0Jo4YAiO0f3mdc-kQ2xblnP-kaRxWA4M8RbPS_Uy0MMVI1KWoitPvQ>
    <xme:0Jo4YJDFKn9NqU852SFdvyrhMQM2sPephid497z5LPIEN-chkFvDklWLpCzLFyEr7
    f4Qbui-iGINWc4onkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepudelkedrjeegrdehuddrieeknecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:0Jo4YIHW1Yq_AvOLOx6XIcG71dHPBfweWePeDMogY9nYnf12rlcDYg>
    <xmx:0Jo4YBSnkx1ZIEF4PMbJOs4BTp7_ivJagOSH3cdwz-gKCi5oUHlhNQ>
    <xmx:0Jo4YNzfrdqllkqW85IudgwxUw9nbsZ4qpqUWcAYw3AqzXSI_s_orA>
    <xmx:0po4YI-MCuppUHhsyN3uGWX6xfLr-A4NGlW1ZJ1o5tzR5UiFVTJyAA>
Received: from [0.0.0.0] (li551-68.members.linode.com [198.74.51.68])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9996D1080057;
        Fri, 26 Feb 2021 01:53:02 -0500 (EST)
Subject: Re: [PATCH RFC] MIPS: Remove detect_memory_region()
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
References: <1614171720-13221-1-git-send-email-hejinyang@loongson.cn>
 <987b0dc5-9306-4271-afc0-7c44dba644b7@www.fastmail.com>
 <a657ea7c-3d0e-6b92-5ad6-c445e827a845@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ba014ac1-6a83-7b11-e9a7-e6ad9ba1aa62@flygoat.com>
Date:   Fri, 26 Feb 2021 14:52:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a657ea7c-3d0e-6b92-5ad6-c445e827a845@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2021/2/26 上午9:37, Jinyang He 写道:
> On 02/24/2021 11:40 PM, Jiaxun Yang wrote:
>
>>
>> On Wed, Feb 24, 2021, at 9:02 PM, Jinyang He wrote:
>>> detect_memory_region() was committed by Commit 4d9f77d25268 ("MIPS: add
>>> detect_memory_region()"). Then it was equipped by Commit dd63b00804a5
>>> ("MIPS: ralink: make use of the new memory detection code") and
>>> Commit 9b75733b7b5e ("MIPS: ath79: make use of the new memory detection
>>> code"). Its code is based on early ath79 platform code.
>>>
>>> What puzzles me is that how memcmp() detect the memory region. If 
>>> `break`
>>> was touched, the function could make sense. That means memcmp() should
>>> return zero. Otherwise, the loop will be end by size > sz_max.
>>>
>>> I have tested detect_memory_region() on Loongson64 3A3000. On our 
>>> design,
>>> kseg0 low 256MB maps real memory and kseg0 high 256MB maps IO/PCI. The
>>> function runs and last stopped on kseg1 where is uncached. In this 
>>> process
>>> memcmp also returned non-zero when detected kseg0 high 256MB. Then I 
>>> did
>>> another thing. memcpy first and test memcmp then (after &_end). It 
>>> works
>>> well on 3A3000 but badly on 3A4000. Maybe because kseg0 high 256MB maps
>>> IO/PCI and it is dangerous to write like write memory.
>>>
>>> At last, read memory from where is not memory region may always 
>>> return 0.
>>> (Or trigger exception.) This function have been used several years and
>>> seems no error occur. Maybe it's a fallback way.
>> That is not true for other platforms like ath79 or mtk.
>> They'll wrap around or return 0xffffffff for out of boundary accessing.
>>
>> Loongson does not apply to this case as it have special "Address Window"
>> design to accurately describe address regions.
>> Any access beyond described windows will be handled by MC and return 
>> 0 or random stuff.
>>
>> Again, please don't make changes because you can.
>>
>> Thanks.
>>
>> - Jiaxun
>
> Hi, Jiaxun,
>
> Thank you for answering this puzzle for me in detail.
>
> Assume that the machine has 8MB real memory and dm address is (base + 
> 3M).
> When size = 8MB, there will be a phenomenon of `wrap around`, the actual
> content of (dm + 8M + 3M) is content of (dm + 3M), so it will trigger
> `break`, right? At this time, the kernel will add 8M to the memory.

Hi Jingyang,

How can you boot kernel with 8M memory in present days ;-)
(Ohh with respect to Nintendo64 developer who had proven it's possible)

For what I can say, detect_memory_region exists because many devices
doesn't have a way to pass memory size information from bootloader to
kernel. Or their bootloader even don't care about memory size.

Kernel needs it to get memory size correctly. Although it seems fragile.

That's life, we must accept imperfect past and don't repeat it in future.

Thanks.

- Jiaxun


>
> Thanks,
> Jinyang
>

