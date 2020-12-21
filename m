Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB982DF97B
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 08:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgLUHcE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 02:32:04 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:43971 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725791AbgLUHcD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Dec 2020 02:32:03 -0500
X-Greylist: delayed 552 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Dec 2020 02:32:03 EST
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 59BA3614;
        Mon, 21 Dec 2020 02:22:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 21 Dec 2020 02:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=n
        B714MSBqlX8wmMNfLsfvDUtwKt9mT5LD90W+DCBA+w=; b=Ofm6aU7m+do/7RKxT
        Uh4y7Ksj6oJfaLLmGhpX5HSonopYGdRhKMQWjFqLdnzSyvAMa1vYfgGf9AtEkVOH
        OsE9rXsDx4HVaO0diLU6xH6XOQ/bSK/fNYQ0tfHWvT5czQKbTJ1SXp6RyFcZll6E
        2hneGThrRRBmV6kSj7yuL/sjx+d/+s2YPCuw+HL+581f3R8bejbWjZqpuo2lMp/7
        HawLJ+4glEfafPbgoO7WxEiP2x1r/uNEaqaH0w7ed4JHCz1QzMmhhzH6Yj8vtGb3
        87mbfQw0cT0ShUhgjGEjCCkq9qbvC2JbtuE657aEJcP7YfG681BdHCd2C+WWsWGV
        wziJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=nB714MSBqlX8wmMNfLsfvDUtwKt9mT5LD90W+DCBA
        +w=; b=JYaBIzNi5z0Ht6sS6eDKshdTkwAKSpYXBtXA+yX14b6SjKdSBzrhunxMt
        2nLA8y/lxKr7sR8kWFANzjrfR/En4WJDF40uEDLY9yet7/L45g/LelCm93ftfCjK
        F/20MRC53Qu+KnaJ5kX7kURTexkeDg4qQIV3ehwPpS4ncpu99Rgt0A5JSt6M52FC
        BNx5wLfPGjGzjyQBHBmevJVmjsOX5WwACmSR6yMf3SGjW0Xif2hqQsqBNM90L1Wk
        /6YsRM9Ze4c7Qeh1DxsWa1qOWvHXWRWuIznT3xzeQ+mRKVm56tXl4Q3FxvCwpAU5
        zpNO+BEfV7SiiBryJufpqOvHadpLA==
X-ME-Sender: <xms:G03gX-HKhN0xV0eXVp1ZQWMPX9ri6lxNdKwenxxmT68-Dfne8Eonqg>
    <xme:G03gX_WjMg3cL5dRNL5OxzvzWUhqselIQujsKLZ6Bd4PV1pffzyfCmmHYVzTeEYBQ
    u1y8OBzM5skCCNqrOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepteeghfekffffudejheffuddujeekudfhgeevledtveefkeev
    ieffkeevgeejieeinecuffhomhgrihhnpegvlhgvtghtrhhonhhitghsfigvvghklhihrd
    gtohhmnecukfhppeduudeirddvvdekrdekgedrvdenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorg
    htrdgtohhm
X-ME-Proxy: <xmx:G03gX4JFGrFE6nYFHUMaU_qSRNY7G9mvHu_aMILw6aW8p4XqXRgiOA>
    <xmx:G03gX4HQXRfa3lNR2-aYvVf7HMiQ0eoWBgK09hv8PmU7XMV21qnSpw>
    <xmx:G03gX0VxdY3BfpCV4FQQdnPAnMQQa7nNrU0lTyA8Oyzct4YUWZdNzA>
    <xmx:HE3gX9fQpRfa8l894TjQKrv87AXr0Sf913gbpdbuFFZ8JHtIRhl2k2K-swGofoW9>
Received: from [10.20.194.111] (unknown [116.228.84.2])
        by mail.messagingengine.com (Postfix) with ESMTPA id AAEC4108005F;
        Mon, 21 Dec 2020 02:22:02 -0500 (EST)
Subject: Re: CPUs with EVA support
To:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, syq@debian.org
References: <20201220193201.GA3184@alpha.franken.de>
 <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
 <20201221070434.yom3neoeir43ek2k@mobilestation>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <60a46e43-10da-f86e-d2b5-827d0e810b6d@flygoat.com>
Date:   Mon, 21 Dec 2020 15:21:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221070434.yom3neoeir43ek2k@mobilestation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/12/21 15:04, Serge Semin 写道:
> Hello Thomas, Jiaxun
>
> On Mon, Dec 21, 2020 at 08:38:00AM +0800, Jiaxun Yang wrote:
[...]
> (Today I've got a suspicious message on my corporate inbox from a guy
> - Yunqiang Su with email domain @cipunited.com, who stated that CIP
> United wants to purchase one or more of them for you and requested to
> give them the company sells contacts. I didn't response, because the
> message structure looked more like a spam, than an official request.
> It was also strange not to see you in CC.)

+ Yunqiang's Debian mailbox

Yunqiang is well-known as Debian-MIPS maintainer, I just informed him
a kernel developer is looking for EVA enabled hardware.

Probably something went wrong with his company email?

CIP United is running all MIPS business in China[1].

Thanks.

[1]: 
https://www.electronicsweekly.com/news/business/mips-lands-china-2020-08/

- Jiaxun

>
> Regarding the Baikal-T1 boards being finally supported in the kernel.
> I am still working on it. There are several more SoC-device drivers
> to fix and I'll be ready to submit the CSP/BSP code to the MIPS arch
> subsystem.
>      
> -Sergey
>
>>> How good is EVA support in qemu ?
>> EVA is functional in QEMU.
>> I had tested it with P5600 malta system.
>>
>> - Jiaxun
>>
>>> Thomas.
>>>

