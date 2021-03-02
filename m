Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B70532AF70
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237180AbhCCAWG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:22:06 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59013 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1837117AbhCBHZE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 02:25:04 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E47CC1012;
        Tue,  2 Mar 2021 02:23:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 02 Mar 2021 02:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=Q
        UkkO+HUiTfmvEyeYQhKr2uoeDkoPgcnYhHr2cEfPXA=; b=Cc5HaU7R3g6VjxLuG
        +JprjgLje7gFtX/yfFXjY9DBvWZ5jzcFfb6nA0A4DPTbwE1z8HfpmIgZErUxmW+u
        5Utpnt5bS3wxZHtFmFdo6UoA8IAPJiNsiFDF6yaMziph2Kn+a5C7Yap4Qt3Ycl3h
        AV6Ahd7xKBwu/gqvTCbdKEjRybWiNgaxqVkICn+34tXcwyFxzFN47XGTwQWD8Aas
        5F+1bCev1cw6z/dqAP739dqdljWtC6KKQH/lFKIFKhQgPmUpFIP0Y34SBVC6HCBw
        9f8o15aYVBD8yEh+0t+IkbQXYgVSXUucXOz2gZ0+DSf/gLX9nYiiCQY+T6evYk/F
        IdIkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=QUkkO+HUiTfmvEyeYQhKr2uoeDkoPgcnYhHr2cEfP
        XA=; b=j1pH85GaFMTdCywjPQBLushGk6qOSC1OPiItzyt3JBmOZI8Ze/f1roeAr
        lDS4au5JRb4vEitGSLT2QYouANq9Do6qPTVKYWA2C3/MuzC+ZUWAJpIY1waH/T+2
        jRl2fkSeAqIpoUGAX3UrDLHRPf2+1yC0jJDnzujstn+zvgpBA5BKMC9Q8+DNDpCO
        0kHqfxs0aArptHtXZ3uo4UgSTSTD5PIQSfJMWzEXhWUMQIk1gTPjGGy25XNFvN4W
        rmQNbPXkncHW0aUfVGEWbeg4RfVii7FbYsz7eAww53lWn0MqpU7EgMUgd0cwmhK3
        ygSc/J7kLtV5FmMPxa8OR6Lo0yXvg==
X-ME-Sender: <xms:A-g9YNwPuJfVkrHIaara2nn92HxpMQMSyvAsTALOFLNzP8XkiBm7oQ>
    <xme:A-g9YNSEZKbA-YamUePkCkOOneLRuxdwPZYKXc23AeMZhnACUV_Q0_fB8RieKav9T
    jeiZ7uklYt6pTYBP5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:A-g9YHVe82pGwHdnCHF2dPwdXgthb39O2pkqKH4whhhh_ZHs_nbbTw>
    <xmx:A-g9YPjBO__Qcm22dmfYrnexKfONBXb8QnujKklniJdhPV1g8qU3pA>
    <xmx:A-g9YPAqmnlb8gEc6JI8O43WlWGjkF-7S-ma0fJL4-TnHuNyP4MbBA>
    <xmx:A-g9YGM47ulyk4SdtMByHND1qTb8sYSmufD4v8bLWcLj1LW6Mks9DQ>
Received: from [127.0.0.1] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 01895108005F;
        Tue,  2 Mar 2021 02:23:44 -0500 (EST)
Subject: Re: HELP: MIPS PC Relative Addressing
To:     Jim Wilson <jimw@sifive.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Binutils <binutils@sourceware.org>,
        GCC Development <gcc@gcc.gnu.org>, mfortune@gmail.com,
        syq@debian.org
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
 <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7494335f-703e-f9f8-30dd-6e41249c3873@flygoat.com>
Date:   Tue, 2 Mar 2021 15:23:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2021/2/25 上午5:40, Jim Wilson 写道:
> On Wed, Feb 24, 2021 at 6:18 AM Jiaxun Yang <jiaxun.yang@flygoat.com 
> <mailto:jiaxun.yang@flygoat.com>> wrote:
> 
>     I found it's very difficult for GCC to generate this kind of pcrel_lo
>     expression,
>     RTX label_ref can't be lower into such LOW_SUM expression.
> 
> 
> Yes, it is difficult.  You need to generate a label, and put the label 
> number in an unspec in the auipc pattern, and then create a label_ref to 
> put in the addi.  The fact that we have an unspec and a label_ref means 
> a number of optimizations get disabled, like basic block duplication and 
> loop unrolling, because they can't make a copy of an instruction that 
> uses a label as data, as they have no way to know how to duplicate the 
> label itself.  Or at least RISC-V needs to create one label.  You 
> probably need to create two labels.
> 
> There is a far easier way to do this, which is to just emit an assembler 
> macro, and let the assembler generate the labels and relocs.  This is 
> what the RISC-V GCC port does by default.  This prevents some 
> optimizations like scheduling the two instructions, but enables some 
> other optimizations like loop unrolling.  So it is a tossup.  Sometimes 
> we get better code with the assembler macro, and sometimes we get better 
> code by emitting the auipc and addi separately.
> 
> The RISC-V gcc port can emit the auipc/addi with 
> -mexplicit-relocs -mcode-model=medany, but this is known to sometimes 
> fail.  The problem is that if you have an 8-byte variable with 8-byte 
> alignment, and try to load it with 2 4-byte loads, gcc knows that 
> offset+4 must be safe from overflow because the data is 8-byte aligned.  
> However, when you use a pc-relative offset that is data address-code 
> address, the offset is only as aligned as the code is.  RISC-V has 
> 2-byte instruction alignment with the C extension.  So if you have 
> offset+4 and offset is only 2-byte aligned, it is possible that offset+4 
> may overflow the add immediate field.  The same thing can happen with 
> 16-byte data that is 16-byte aligned, accessed with two 8-byte loads.  
> There is no easy software solution.  We just emit a linker error in that 
> case as we can't do anything else.  I think this would work better if 
> auipc cleared some low bits of the result, in which case the pc-relative 
> offset would have enough alignment to prevent overflow when adding small 
> offsets, but it is far too late to change how the RISC-V auipc works.
> 

Hi all,

After spending days poking with AUIPC, I suddenly found we indeed have 
ALUIPC
instruction in MIPS R6, which will clear low 16bit of AUIPC result.

So the whole thing now looks easier, we can have R_MIPS_PC_PAGE and 
R_MIPS_PC_OFST and avoid  all mess we met in RISC-V.

A pcrel loading could be as simple as:
aluipc     a0, %pcrel_page(sym)
addiu      a0, %pcrel_ofst(sym)

Thanks.

- Jiaxun

