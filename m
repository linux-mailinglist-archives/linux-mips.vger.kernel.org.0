Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DC92F5F85
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 12:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbhANLMA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 06:12:00 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:41989 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbhANLMA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Jan 2021 06:12:00 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id D82D515C4;
        Thu, 14 Jan 2021 06:10:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 14 Jan 2021 06:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=B
        qQzzuWX2kO0HaNadmxmmoDR0AFGMMPe8h3OBjM3sSA=; b=ttSviun0lCJ4QgOg9
        wSoZ5kwcC9RXkb8soiQfFVjuzsOh8NJeFYSJeXe+3ToO4WymBGE39oNKlc2SnLFk
        9rohq06o8tHsDvHw1iJrYOiI/uFmiKDIA6uc9SnOGJk7JeN6Uy8gILCSUQe5bwjS
        3GQsvkfGwyxiy/+h9MbEP3dD8vmCGhzbQ6+JKUKBweXmh6UsSjP40oW9liNZu7ry
        10n+PGIw0jo1m/5N7xk7JbTZyL28p+P45grG259gtRWWWCjkm1xD/VFBLNQBRb1h
        c7zO0iYmbdEWuyAWAb0FTxzTkBfYlxvcjBmCeorZfOl8ZL1Boj3Q9I1IWDb0CVA6
        9OZxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=BqQzzuWX2kO0HaNadmxmmoDR0AFGMMPe8h3OBjM3s
        SA=; b=BVuSwzhLaWBEywmXVc0tI2ftWhwIMuN3pgCqjRkewwAfGTdH8q0usQcSv
        Wza1rI9SydcWMYD9dQNAPjqxtG5/c8A9T9cTqrRtPmawGq2xU+N8sa2u5AXPemHU
        kFxPKaPSWHXoq6H/lWhDRpVoBatBm/QKEP1pOm/UI/wuO7mPiK/9bU4mKxFLG5MT
        0LT3cluLshsj2ryJhKX2o4gBc/WR7q5IT2J3XVj/uAlOYDrATY0Uu23AjaLxh2JL
        D4AOKntG4w/lnvMF4o9QjqZ8b3RZG9qTZ4EPmg8ujrqvb/1AjShZB4XNIXzaRnft
        hiXt4AJqJs7NL2US/Ak/c5dXQIQyQ==
X-ME-Sender: <xms:vCYAYOAUaq14SUUr1wolXBEsK0hAET6REE_8PmC7fKza1HhoLWLaoQ>
    <xme:vCYAYIg_YutRrAj3h3f9LLphnKoRtvLI_BZ_2wZQ25F9zxL0RrH1bPar5yqk8zV2W
    -SlHA1UPZBddEFHTYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdehgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:vCYAYBmVqfaXzcQnyrJGJjMYyAPRd0HHxGAWasiC3487h3FT2qt5kw>
    <xmx:vCYAYMxdGMhfmEP70oJ3PfvJMs91PIlqYat_QIsGqDUb10DHalM4Ng>
    <xmx:vCYAYDT8-LKFHRFcMv_ZZBNZqOdjXtGfHEWSJlujXqEPb9rvAkiZ0Q>
    <xmx:vSYAYKLWOEv_4P07gN5Bo-0T_9Ers6tUHmI8NvJofjcGLcKLY-HZRVqexoQ>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id A252F108005B;
        Thu, 14 Jan 2021 06:10:49 -0500 (EST)
Subject: Re: logical PIO code for mips question (was Re: [PATCH RESEND v3 3/3]
 MIPS: Loongson64: Enable PCI_IO_VMMAP)
To:     John Garry <john.garry@huawei.com>, linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-3-jiaxun.yang@flygoat.com>
 <1a21eaf7-52c0-c032-4405-1b6916628ade@huawei.com>
 <05b37da0-aabd-941f-6fff-47c3b46c95d2@flygoat.com>
 <797e574a-e4fe-df6c-f352-6a5a239c32de@huawei.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <83748d12-eee2-686a-e12d-2abf19aeccd0@flygoat.com>
Date:   Thu, 14 Jan 2021 19:10:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <797e574a-e4fe-df6c-f352-6a5a239c32de@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2021/1/14 下午5:18, John Garry 写道:
> On 14/01/2021 00:13, Jiaxun Yang wrote:
>>>> range->fwnode = &of_root->fwnode;
>>>> +    range->size = MMIO_LOWER_RESERVED;
>>>> +    range->hw_start = LOONGSON_PCIIO_BASE;
>>>> +    range->flags = LOGIC_PIO_CPU_MMIO;
>>>> +
>>>> +    if (logic_pio_register_range(range)) {
>>>> +        pr_err("Failed to reserve PIO range for legacy ISA\n");
>>>> +        goto free_range;
>>>> +    }
>>>
>>> Hi Jiaxun,
>>>
>>>> +
>>>> +    if (WARN(range->io_start != 0,
>>>> +            "Reserved PIO range does not start from 0\n"))
>>>
>>> Do the mips code still rely on this check?
>
>
> Hi Jiaxun,
>
>>
>> Yes :-/
>
> ok, but I was hoping that this dependency would be removed at some stage.
>
>>
>>>
>>> I was considering changing the logical PIO code to reserve the first 
>>> 64K of PCI MMIO space, but making that change would break this code 
>>> as things stand.
>>>
>>> The motivation is that some drivers, like [0], access IO ports 
>>> unconditionally and can kill systems when no PCI host exists. By 
>>> reserving the first 64K, accesses by those drivers could nullified.
>>
>> Actually we're trying to deal with almost the same problem.
>> The reserved region on MIPS is used to serve these driver that access
>> I/O ports bypassing resource subsystem.
>
> Yes, so reserving the first 64K of IO space would break mips, as 
> things stand. Has any work been done for these drivers that bypass 
> resource subsystem (or directly access hardcoded IO ports)?

Not yet.

>
> I may just do this (reserve 64K) under INDIRECT_PIO for now, not sure 
> yet.

Probably we can make the first page of LOGIC_PIO a special region. It 
could be a
reserved region when no legacy ISA bus present or overlay by MMIO in 
case like
MIPS here.

Thanks.

- Jiaxun

>
> Thanks,
> John

