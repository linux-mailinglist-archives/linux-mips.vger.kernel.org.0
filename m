Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753DF2E2DFB
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 11:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgLZKel (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Dec 2020 05:34:41 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34865 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725823AbgLZKel (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 26 Dec 2020 05:34:41 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 073115802D7;
        Sat, 26 Dec 2020 05:33:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 26 Dec 2020 05:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=e
        b4By+ZVKhaLC7u35jCPtH0+H0jOoSIWvhbUwXu6ur4=; b=NK3wbFfFoXME41frF
        E+Q5kDvxSpleDPhy8XYtwKn4OpGF8QpFZPg4CkIYN5NF5oGDe8OwNd9cj6s6disD
        CmtTg8FKGHQ9bU5llvtx1BFtjOCqyYAQD/jK8sr3Jyy8RmJI43+DIhy3Vw2YeStz
        Bu4LHlknJbsqXYFlpP1w6Hf3+jSl/z1l7u3w6xu0+vFZOmnGRYpkVMjOkTQExcHg
        Ds39CDA/dfD3KYseerOmTf2fM67Wq3yn+aUeSTK65t6L7QKNX0QQ3Lvsrrs1o+Er
        1OLk+l3AdtstSL8s77E+4HYZ1l+7NfeoiC02BzQxXmggurcMPeWGiFlrHdyRrbeL
        ELlAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=eb4By+ZVKhaLC7u35jCPtH0+H0jOoSIWvhbUwXu6u
        r4=; b=MV+l/YMIvhoq7APRkc/cQckRM7NzhbiIg/1Juoe+TV0YfO9awmipC2YGZ
        xEhqu5c22p56hvUdOCC9MXdQaVXvOeBA5UCHALFOG+zBU8bXhNLTM+Ae616H9Hyr
        CT2NBPIt23UW9e6FL7Qk8YLgNDKR2K0vjh7N1rvS440K3eKQwo0DEDK8oKRMuDVW
        3GX83MZ5xS66vhkf1tBCbc0/dxAA3AKjyr8bocAFZ1QiqmFrvF4WIkidOooMYnY6
        zCRIK+DSR5GZx1TKok+Uwt391RS3AQxA5DNjYoA2mns3H4REK4Ol6mKustKBCPaI
        0PTJL0gQt4pQEPw2badyQWeRuiF7Q==
X-ME-Sender: <xms:fhHnXx6Z-D01ROCBPculbQBQESPKjeJr6SIoX4avOZwp5rE5-m0Ygw>
    <xme:fhHnX-5BCDCGcmSQjGIwr0eW4x4WcddYawsRH3AiZx4Kri_dG3NO_5edhazTA9v7o
    cQJRrPWNghshUl6v2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddufedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepudehffejkefgkeeije
    dtjeettdehgfeuiedugeefgfejgefgfeelhfelgfehgeeinecuffhomhgrihhnpehkgidr
    ihhnpdgthhhiphgusgdrohhrghenucfkphepudduhedrudeliedrudegrddujedunecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
    rdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:fhHnX4c-iAEdPNspA2FCTKXKYjIyKPjKgmMpacxBrQs2puN5dRE2HA>
    <xmx:fhHnX6JVhwr4pT1AAG3LuqrahnxdUCxTv4ZaTFJ-QwJB9UWKFno0IA>
    <xmx:fhHnX1LGKrwRcgiZQEJ6JacNDwL1r5Ivg-FpnvGZmwNnEVYbDTvk3A>
    <xmx:fhHnX4mELRt8kjWvBdh6vrGKjYmWfGebIxhLzUNjymbffH3_AZCRtQ>
Received: from [192.168.1.203] (unknown [115.196.14.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8268D24005A;
        Sat, 26 Dec 2020 05:33:32 -0500 (EST)
Subject: Re: [PATCH 4/6] input: Add N64 controller driver
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
References: <20201225190115.efa38e5a0107bec09f993ed6@gmx.com>
 <c1d5fdff-cfee-5252-a9f4-7ea6806a1113@flygoat.com>
 <20201226094136.0559ef9741d95bab38da04f6@gmx.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c9943e54-935a-7ba8-5dca-7894b80aad3a@flygoat.com>
Date:   Sat, 26 Dec 2020 18:33:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201226094136.0559ef9741d95bab38da04f6@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/12/26 15:41, Lauri Kasanen 写道:
> On Sat, 26 Dec 2020 11:25:49 +0800
> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>>> +#define PIF_RAM 0x1fc007c0
>>> +#define REG_BASE ((u32 *) CKSEG1ADDR(0xa4800000))
>> 0xa4800000 sounds like a KSEG1 addr, I think phys should be 0x14800000?
>> For driver it is common to use ioremap, or at least TO_UNCAC.
> TO_UNCAC looks like it wouldn't work for vr4300, the manual says
> uncached 64-bit space is 0xffff ffff a000 0000, when
> include/asm/mach-generic/spaces.h puts the 64bit space start at
> 0x9000 0000 0000 0000.

0x9000 0000 0000 0000 is a part of MIPS ISA defined "XKPHYS" unmapped
region. Accorading to "NEC VR43xx User’s Manual"[1] pp 134-135
it does exisit on VR43xx.

If it doesn't work then it means VR43xx doesn't properly implemented
Status.KX. In this case you shouldn't run a 64bit kernel as many code
in kernel assumed proper KX implementation.

TO_UNCAC is much more clear than CKSEG1ADDR for readers.

>
> ioremap - it looked like needless overhead. Is this a blocker?

Well I assume it isn't, just a common parctice.

>
> The 0xa uncached prefix being in the address already is harmless, it is
> the same on both 32-bit and 64-bit on this cpu. I left it in because it
> makes it clear to me what kind of address it is, coming from the N64
> side.

Than it is not actual physical address, CKSEG1ADDR makes me confusing.

Thanks.

[1]: http://datasheets.chipdb.org/NEC/Vr-Series/Vr43xx/U10504EJ7V0UMJ1.pdf

- Jiaxun

>
> - Lauri

