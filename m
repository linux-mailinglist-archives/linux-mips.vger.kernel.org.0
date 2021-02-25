Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68227324811
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 01:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbhBYA4q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 19:56:46 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:33745 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236553AbhBYA4n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 19:56:43 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id A30FB882;
        Wed, 24 Feb 2021 19:55:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 24 Feb 2021 19:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=n
        5fhIkKD8OYQdLnZsY3m61MoU4vQAmxPWtDdsx3pBk8=; b=OYGmqckZowfLFzcAZ
        BKRmJX5pxJTU+lMpQKycu4z0IZu5LYxMlyhZhV4fUDVEvhV/d/VxNib5dw1zOWmH
        Akh/I+saM5jhvkgTKi830WqEHdQFK3ZdJSPoRfWhuL1bY7duE/qmn0WajzuHJvaN
        gOkK/PKFRo81xY5dzJmSxixTQEQTHDzpbP4DnuZH+SfEi8ckKQwAXvgMjXIZauE9
        H0gYG7AgNqGClQBPaiON+BU2a/QU14NRTqG9dBTqcEeDMMXLrLNuA/jYX2pKRY/X
        hmIUX/NDqPi8c6JN7IFcsAf9chrIEw2OuykfILLugYwJ9Z/95qg1lE4cFUgId1Gi
        fHbuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=n5fhIkKD8OYQdLnZsY3m61MoU4vQAmxPWtDdsx3pB
        k8=; b=ggoFveCnszSMzMH2XhXILMGkzNYKQ8xMUDZRxSvbYh1neIuvRaDApzIRJ
        px6f2asMTJIj6h5h6WIRxYWJJzHHplRbZmlqZzsa9iO5oFme6ClMNcw3wCqGaCtc
        y4O4Yr25bsxEqCe53n3tlW3QggPapUP4KsIVMJ8iSBX7rZs6Ddljvy7ePm/RQzCg
        gQtrqmPSRbeW8lw4F+n09hlJgqvNM47N5zIbi4AfruxekzbWpahbZsYfqxFKpMO1
        ZlSdN1+suANBXX+b8kB0rOfK92QgRypKI5QJ8HsCT2dRY3OTbSeci7oreEJ6jVh2
        AJK+wd3HrT0xKtqRp7K2UhNlKLMpA==
X-ME-Sender: <xms:iPU2YMGZSu_Vibu8ojJFlcAPWQwcSnknCkArz98qTLwvPMWnQHPDuQ>
    <xme:iPU2YFX5yEyV_gNlAcW_G9yi8yZSrdFvDMsrc6HXJkNhH2ryhjV7o4rh6xIH8EXIW
    mqAnJkJU94IflXr9RI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecukfhppeduleekrdejgedrhedurdeikeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:iPU2YGLfUMmLI70MOLOeqMJXLaMzMCrcYTpcK7ehsUZjS6X888ArIA>
    <xmx:iPU2YOGUXI_YN1ngZrpKat7x6frlhUbGB9Vf1_5aWiFp4Y8Hm8BiuQ>
    <xmx:iPU2YCVO3dFqc30oN2WgnL1B1FQPZ-RBWZG_rc22eDYhrxdQ1Ty5wA>
    <xmx:ifU2YBRVCRbxs7kO3AwygWO9HNPi7qYZLoXrEr9NeCmEn9xOOjjGNQ>
Received: from [0.0.0.0] (li551-68.members.linode.com [198.74.51.68])
        by mail.messagingengine.com (Postfix) with ESMTPA id 596AC108005F;
        Wed, 24 Feb 2021 19:55:34 -0500 (EST)
Subject: Re: HELP: MIPS PC Relative Addressing
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        binutils@sourceware.org, gcc@gcc.gnu.org, syq@debian.org,
        Matthew Fortune <mfortune@gmail.com>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
 <alpine.DEB.2.21.2102241813420.1900@angie.orcam.me.uk>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b5fcec4c-799f-fb68-6db8-a330b7c84099@flygoat.com>
Date:   Thu, 25 Feb 2021 08:55:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102241813420.1900@angie.orcam.me.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2021/2/25 上午1:30, Maciej W. Rozycki 写道:
> On Wed, 24 Feb 2021, Jiaxun Yang wrote:
>
>> For RISC-V, %pcrel_lo shall point to the label of corresponding %pcrel_hi,
>> like
>>
>> .LA0:
>>      auipc    a0, %pcrel_hi(sym)
>>      addi      a0, a0, %pcrel_lo(.LA0)
>   I commented on it once, in the course of the FDPIC design project, and I
> find it broken by design.  Sadly it has made it into the RISC-V psABI and
> it is hard to revert at this time, too many places have started relying on
> it.
>
>> However, for MIPS %pcrel_lo simply calculate LO16 of the symbol to current
>> PC, thus PC relative addressing will look like:
>>
>> .LA0:
>>      auipc  a0, %pcrel_hi(sym)
>> .LA1:
>>      addi    a0, %pcrel_lo(sym + (.LA1 - .LA0))
>>
>> I found it's very difficult for GCC to generate this kind of pcrel_lo
>> expression,
>> RTX label_ref can't be lower into such LOW_SUM expression.
>   You may want to use composed relocations to refer to .LA1 (R_MIPS_32) and
> .LA0 (R_MIPS_SUB).  There may or may not be linker updates needed; unlike
> the RISC-V one the MIPS BFD backend already supports composed relocations
> with the usual ELF gABI semantics.  It would be good to switch to RELA at
> this point universally too; none of new stuff will work with old linkers
> anyway.

Thanks for your hint;-)

I'm unsure about how should we express composed relocations in assembly :-/

MIPS N32/N64 ABI is already using RELA, do you mean switch to RELA for o32
as well?

Thanks.

- Jiaxun

>
>   HTH,
>
>    Maciej

