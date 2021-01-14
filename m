Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BE22F56AF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 02:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbhANBvW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 20:51:22 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:38205 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729824AbhANAN6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 19:13:58 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0F8385805BA;
        Wed, 13 Jan 2021 19:13:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 13 Jan 2021 19:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=p
        ypWC89mWsv89lbHBPTc72muy+xPdrAUgcibvQw0ZO4=; b=TwiuMwtMHAreYpGZX
        8zxCMbjH1nhZyWl9OJB3vThIQfu9MS77+Zxlv/6/FIs3jzQoU1OzYqaeUtSuXYIB
        2eIY+T6T/KTCdxTp6rNtGIlhMOtr8a7YDtOGtgKgUDy4AN6OEbYz42cViz1C3Sf/
        initsUbZNbX5ZOv1tIvbDdtl4Rong+EGx3rrOSdIZK9/gLyz1/6B61otYG/vyzcx
        3Pyb5NqSuEtlx9pXJmsDW3LSk7JkCJdpaIqt45SJqw/y+54BTdN/D5YZzsWj3HnB
        /IP1ag0mRqOarsWZrwgxhOwyz6J7kDKDL6FHbPSZAcORPhGhyRGXS0/rs26wuYJl
        w5gOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=pypWC89mWsv89lbHBPTc72muy+xPdrAUgcibvQw0Z
        O4=; b=bwSjN4kxdwapMsbKTdI4s4G6K/6NkL6YdQAmb96xrwpAFtjXMjrzXS7Y8
        bWe4xBB8dBqDuDq08kQXjy437GM12zAiqKfeG3DRmkZnHzElSVflknornvJ1714i
        9lyY//qBpbniK2Hzon8TMlhcnvRjLpbAASOCP3wLU2DK02GrAnxBmQPdl0QSgGaE
        kNLvSiW80JozVSCOEn0yCRmZeTouBY5nFD8ZOSAcCAAasmjY0LAcuxSaB+iFyvgS
        dwJMtjg6TM2oCc6PbE4fyQbwX4YYaS7y5ei34adSnanS/dFbXVIqvdUADZR2NQto
        ajAUks9u3ocSn4xyLbhqPiLF+hxdg==
X-ME-Sender: <xms:k4z_X2yH-emIIcvULN00v5SRqEuC34at3P-4co7z67idEqsvP8z2mQ>
    <xme:k4z_XyTNb5Z_xGgSv3N43cLm_8_3DnQe7vaskzic59SR6VgAECn3Hd7741vmm5bsf
    EDOvkJFt42QvCz6PAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnheptdduffeifefhhfeiudejhefhlefgiefhudeuheejhefhvdduvefh
    hffgieejledunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepgeehrdeffe
    drhedtrddvheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:k4z_X4UIecz66jJExr-tYWIajVcN8mOOzq_UNblqC94l4l6p8VRHjw>
    <xmx:k4z_X8iKr0L6hb5G81vgH-hlZ0csBLTau0KEuPzQMfHsFPLuI2eB1Q>
    <xmx:k4z_X4CLEbi5esBZMWBXI7gveR8DFtmsLtUUSHz3VCG66yz2l7GKjQ>
    <xmx:lIz_Xx4nEgI7tWttjOOfPXt-YKAt7N4BcdpY3f9Gw2tCMwYGBvbEzA>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3BAA024005C;
        Wed, 13 Jan 2021 19:13:05 -0500 (EST)
Subject: Re: logical PIO code for mips question (was Re: [PATCH RESEND v3 3/3]
 MIPS: Loongson64: Enable PCI_IO_VMMAP)
To:     John Garry <john.garry@huawei.com>, linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-3-jiaxun.yang@flygoat.com>
 <1a21eaf7-52c0-c032-4405-1b6916628ade@huawei.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <05b37da0-aabd-941f-6fff-47c3b46c95d2@flygoat.com>
Date:   Thu, 14 Jan 2021 08:13:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1a21eaf7-52c0-c032-4405-1b6916628ade@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2021/1/14 上午2:02, John Garry 写道:
> On 08/05/2020 12:44, Jiaxun Yang wrote:
>
> Replying to an old mail ...
>
>> range->fwnode = &of_root->fwnode;
>> +    range->size = MMIO_LOWER_RESERVED;
>> +    range->hw_start = LOONGSON_PCIIO_BASE;
>> +    range->flags = LOGIC_PIO_CPU_MMIO;
>> +
>> +    if (logic_pio_register_range(range)) {
>> +        pr_err("Failed to reserve PIO range for legacy ISA\n");
>> +        goto free_range;
>> +    }
>
> Hi Jiaxun,
>
>> +
>> +    if (WARN(range->io_start != 0,
>> +            "Reserved PIO range does not start from 0\n"))
>
> Do the mips code still rely on this check?
Hi John,

Yes :-/

>
> I was considering changing the logical PIO code to reserve the first 
> 64K of PCI MMIO space, but making that change would break this code as 
> things stand.
>
> The motivation is that some drivers, like [0], access IO ports 
> unconditionally and can kill systems when no PCI host exists. By 
> reserving the first 64K, accesses by those drivers could nullified.

Actually we're trying to deal with almost the same problem.
The reserved region on MIPS is used to serve these driver that access
I/O ports bypassing resource subsystem.

Thanks.

- Jiaxun

>
> Thanks,
> John
>
> [0] 
> https://lore.kernel.org/linux-input/20210112055129.7840-1-song.bao.hua@hisilicon.com/T/#t
>
>> +        goto unregister;
>> +
>> +    /*
>> +     * i8259 would access I/O space, so mapping must be done here.
>> +     * Please remove it when all drivers can be managed by logic_pio.
>> +     */
>> +    ioremap_page_range(PCI_IO_START, PCI_IO_START + 
>> MMIO_LOWER_RESERVED,
>> +                LOONGSON_PCIIO_BASE,
>> +                pgprot_device(PAGE_KERNEL));
>> +
>> +    return;
>> +unregister:
>

