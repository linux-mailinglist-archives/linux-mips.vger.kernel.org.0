Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436CF32480C
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 01:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbhBYAtd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 19:49:33 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52241 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236436AbhBYAtb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Feb 2021 19:49:31 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 19BFBA1B;
        Wed, 24 Feb 2021 19:48:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 24 Feb 2021 19:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=f
        wALxhHrB4ahWGoLKH7s2RkSnEdPpYvZALOueOA9V/o=; b=NRvAmLzIL/6yUWTeC
        Fm15xHHByHppHWzWLcaMFf1zoSMqH60aENud4DFMgno8A+QUiPLnYyTuQAVgDeX8
        FK3qq5pIsy2FXcOlw82rY3KHdo3g2QTMockz7Zyf/JYBbgYDe5puAvTZxZO6oMls
        skUioXNv3dt2ggA2M9Cq1Nn4O2YGHbSPekpnIDZodaCaqKE7K/AtEHNIV+/dtuXz
        rChF+XQqTeQMKpAx4Q7fTK0/Sf3Ohou5tL5VJGHqIW04nU4Y1xNa8+jo0u04rjit
        WZ97hiHv3rOUp6ybdFciMfkO+sT7MlQMqYN3WLmRXHfKNv0GqRfWOrUdlZz0r6v5
        Rwr5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=fwALxhHrB4ahWGoLKH7s2RkSnEdPpYvZALOueOA9V
        /o=; b=mzyC4xUzG6rgClGMwl2pXOv2JqdqaBOniwLURQ/5X3fvKLiFCFrbROOLe
        dlzJUll0HUcpA8sCq2jm75o06+UgcNdpc36Lm8wFbTkrb4Z3ssQLsr/Xxk5OEkz2
        q6Hz+2fj1mUp/2c8LuXvutVpRqaMvXoY8ejuyqLDtnESPIHv5GA+uyLndObB+odX
        h0scW7QMnd91s0R8bzs5OxnBpidLrZlvjy5Jk0bh/RA2a2XCwvwK5G0zVPWwZf6P
        wh83k7Iu4k3wyshAHK7DegfrvolTs+0pGiQ5yeK0W0O95QyooXlvmMzu1l/HywJf
        FTl4mFcPYmJTTB9n6WqPvKkk42Gaw==
X-ME-Sender: <xms:2PM2YKjlPcNZX-DPWyzFuQKRJJorRN7PNthbjyy6urNvsTDbpKnUVw>
    <xme:2PM2YLDUhWzjZpaomt4gm-0anikOrJjkVqxUsr0nXmDpKcWpdFS4ajUhBSfgDTZ3n
    XTvMrIthQKH8lvOPqI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecukfhppeduleekrdejgedrhedurdeikeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:2PM2YCEHshv-p6pjOpICW6mPDHTiSFL-qJPbbWgleXosyqogCtQuwA>
    <xmx:2PM2YDQbhDKZbmisp2HABOXmTFhM-LsLYnO8V0eCdbLgdj4OveRs7A>
    <xmx:2PM2YHwR5JoRzzjPcrqPbHXqS_oZ_xrk_ZpD2QwMNZZSZ4uK_Fd1rw>
    <xmx:2PM2YH9BUX8-kuTKJuybNDeU7Fc568EvVmY_QL7TQ--pFRy-urN79w>
Received: from [0.0.0.0] (li551-68.members.linode.com [198.74.51.68])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4BB1924005B;
        Wed, 24 Feb 2021 19:48:20 -0500 (EST)
Subject: Re: HELP: MIPS PC Relative Addressing
To:     Jim Wilson <jimw@sifive.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Binutils <binutils@sourceware.org>,
        GCC Development <gcc@gcc.gnu.org>, mfortune@gmail.com,
        syq@debian.org
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
 <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <db8c2df9-9487-8bfd-e205-3f88854dfa12@flygoat.com>
Date:   Thu, 25 Feb 2021 08:48:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
> number in an unspec in the auipc pattern, and then create a label_ref 
> to put in the addi.  The fact that we have an unspec and a label_ref 
> means a number of optimizations get disabled, like basic block 
> duplication and loop unrolling, because they can't make a copy of an 
> instruction that uses a label as data, as they have no way to know how 
> to duplicate the label itself.  Or at least RISC-V needs to create one 
> label.  You probably need to create two labels.
>
> There is a far easier way to do this, which is to just emit an 
> assembler macro, and let the assembler generate the labels and 
> relocs.  This is what the RISC-V GCC port does by default.  This 
> prevents some optimizations like scheduling the two instructions, but 
> enables some other optimizations like loop unrolling.  So it is a 
> tossup.  Sometimes we get better code with the assembler macro, and 
> sometimes we get better code by emitting the auipc and addi separately.

Thanks all,

I'll take this approach first, add "lla, dlla" pseudo-instructions to 
assembler and seeking optimization
in future.

Btw I found we don't have any document for MIPS pseudo-instructions. 
RISC-V put them in ISA manual
but it is not the case for MIPS. Is it possible to have one in binutils?

>
> The RISC-V gcc port can emit the auipc/addi with 
> -mexplicit-relocs -mcode-model=medany, but this is known to sometimes 
> fail.  The problem is that if you have an 8-byte variable with 8-byte 
> alignment, and try to load it with 2 4-byte loads, gcc knows that 
> offset+4 must be safe from overflow because the data is 8-byte 
> aligned.  However, when you use a pc-relative offset that is data 
> address-code address, the offset is only as aligned as the code is. 
> RISC-V has 2-byte instruction alignment with the C extension.  So if 
> you have offset+4 and offset is only 2-byte aligned, it is possible 
> that offset+4 may overflow the add immediate field.  The same thing 
> can happen with 16-byte data that is 16-byte aligned, accessed with 
> two 8-byte loads.  There is no easy software solution.  We just emit a 
> linker error in that case as we can't do anything else.  I think this 
> would work better if auipc cleared some low bits of the result, in 
> which case the pc-relative offset would have enough alignment to 
> prevent overflow when adding small offsets, but it is far too late to 
> change how the RISC-V auipc works.

Got your point, thanks for the remainder!

>
>     If it looks infeasible for GCC side, another option would be adding
>     RISC-V style
>     %pcrel_{hi,lo} modifier at assembler side. We can add another pair of
>     modifier
>     like %pcrel_paired_{hi,lo} to implement the behavior. Would it be
>     a good
>     idea?
>
>
> I wouldn't recommend following the RISC-V approach for the relocation.

Thanks.

- Jiaxun
>
> Jim

