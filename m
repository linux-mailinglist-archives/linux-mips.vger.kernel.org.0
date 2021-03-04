Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFF732CADA
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 04:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbhCDDeV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 22:34:21 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58945 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232398AbhCDDeA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 22:34:00 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 600B75C00A5;
        Wed,  3 Mar 2021 22:33:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 03 Mar 2021 22:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=s
        2Bb2MaTlkLbU7oEO8Jrli4ODRD1vbdcppRjTPJlg2s=; b=UMHQEVusqj9uDqsdW
        DxOgZGxZYk5PJA1F6jj+Sxy5XIzEf9uApZJS1q8k5+loGv9Y1yeBlfZC86VxPTIm
        rd/tizQDNbQ3qMpbfiJt8qIClN3GffcZajH3DR20DEk4UX39uIIMALbjv8sAQztO
        0IEEM8BiQZ+YLEv2B6/1/bWtewKf/F/1NX8Oep5xZKf/xj2XtRoJ7xZX2OaX1aPM
        L3TKwPTmeS559jqhq7uWIOTw+vt8yc8W+cr7kYXGjxD5E8yL9pA1fVVf3dljW9NV
        e3jtTRVoqT+UwRXpET5PiTA3CrfNEGtq27xofsIYKQR5FPUtV7I5c48W/dpGkGMw
        y97Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=s2Bb2MaTlkLbU7oEO8Jrli4ODRD1vbdcppRjTPJlg
        2s=; b=KzYgQHkSaM6IWzo9GBF60Tk7ZBPIhmIEhEvwrh9Hz4S/C72/+6fpWLw9p
        yO5/wAu9/FaXy/jvW4uD15B/z3fi4VkLH7/8NhVJvRlR9n6AVk5RxpCspWpaJSf9
        GT1mZM3JLMNFv6BwiZT9NFfeA3Fz4M/7bfPKvcwJ3lqqA8iy71baap8GJ7V/gR+2
        l+m+S7OfcDo155Okof6+9lQt+ucaTqxbS3HsbeLj6rlT/aKEhhhgQeAadCS8scd3
        H/oze3x1k3CnLJAzUhsPOTed3ccwbIYjx8wuhjkImGQus9q7S1lfN7mOYy5Gpndh
        pgKa8LzMd/rGGLxObCkH6iGOYN+yA==
X-ME-Sender: <xms:-VRAYOFSZzXLwOTtZm7leKW8C8o-tb6VoIcIEIKk44CB83aXT1uc4w>
    <xme:-VRAYPWL1l7s-H8LCWc6ofGKDn9w6geqbDEF8__oFITIfDcJPvqTGP6xCojtcmFb9
    eKBoB9Z_XPXBffAbfY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:-VRAYIINVJYc-rYzjTgRr9fOpWc4w59UlVZsNK6us1VQpriFfB4ceg>
    <xmx:-VRAYIH4p_r2rbzjy1K-SZ_GtGBQrmpwtCE0E_r8tAnY2VA0YR3bQA>
    <xmx:-VRAYEV5-NP42GIAREf2X-aUnLhye_YV8Sh0OP5_4FIgPRHvu6sUSg>
    <xmx:-lRAYCylgk0lHiqH_YWbTWqlYaI5W7dzE0nJ_2ihzuE4G5xx0dhJaA>
Received: from [127.0.0.1] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 415E2240057;
        Wed,  3 Mar 2021 22:33:11 -0500 (EST)
Subject: Re: HELP: MIPS PC Relative Addressing
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Jim Wilson <jimw@sifive.com>, GCC Development <gcc@gcc.gnu.org>,
        syq@debian.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
        Matthew Fortune <mfortune@gmail.com>,
        Binutils <binutils@sourceware.org>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
 <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com>
 <7494335f-703e-f9f8-30dd-6e41249c3873@flygoat.com>
 <alpine.DEB.2.21.2103021335450.19637@angie.orcam.me.uk>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c890859e-f306-62df-0462-5a2eb6a5cbcc@flygoat.com>
Date:   Thu, 4 Mar 2021 11:33:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103021335450.19637@angie.orcam.me.uk>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/3/2 ÏÂÎç11:30, Maciej W. Rozycki Ð´µÀ:
> On Tue, 2 Mar 2021, Jiaxun Yang wrote:
> 
>> After spending days poking with AUIPC, I suddenly found we indeed have ALUIPC
>> instruction in MIPS R6, which will clear low 16bit of AUIPC result.
>>
>> So the whole thing now looks easier, we can have R_MIPS_PC_PAGE and
>> R_MIPS_PC_OFST and avoid  all mess we met in RISC-V.
>>
>> A pcrel loading could be as simple as:
>> aluipc     a0, %pcrel_page(sym)
>> addiu      a0, %pcrel_ofst(sym)
> 
>   Yes, it should work, but you'll have to 64KiB-align the module in the
> static link.
> 
>   You may not need a new relocation for the low part as it looks to me like
> the semantics of plain LO16 fits (though its REL handling peculiarities
> may indeed favour an entirely new "clean" relocation"), but it's a design
> detail and the general principle seems right to me.

Let me take a look ;-)

> 
>   I'm not sure though why you try to avoid composed relocations given we've
> had them for 20+ years now.  Relocations are just calculation operators
> for expressions evaluated at link time rather than assembly or high-level
> language compilation time.  And just like we don't invent single operators
> for complex combinations of `+', `&', `%', `<<', etc. and instead compose
> the exiting ones in expressions used in various programming languages to
> get the desired calculation, we don't need to do that for relocation and
> we can just have a collection of simple relocation operators to choose
> from and combine.

Well just because binutils code drives me crazy:-(
I tired very hard to understand those stuff but when I trying to modify them
I just got endless assert failure or other unreasonable errors :-/

Thanks.

- Jiaxun

> 
>    Maciej
> 
