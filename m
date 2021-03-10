Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAC633425C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 17:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhCJQDX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 11:03:23 -0500
Received: from mout.gmx.net ([212.227.17.21]:51731 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232470AbhCJQDX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 11:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1615392185;
        bh=ymCVoQ7pfc4SfGtDmpvAX6u9rJS4geKpHugqcu7ATJ0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=DH9ktcb7AOSbyrfpdCpzsx7zTm4/zRo2lRG+N5HGekvSDpmEpVBbCWTDXyZpBjv1k
         R7stpnL9shHHHPnQsNc9kbmzcG2Ljd5uy2HXsESRu+pqtgKiz1ADA6Ju/mIbGqyGHv
         MAmRt7Lzhpk4sx87fvk1ftAQ/12OZ2YnZSG2A5hg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.44] ([95.91.192.147]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKy8-1l8uQL2R4K-00SjWw; Wed, 10
 Mar 2021 17:03:05 +0100
Subject: Re: [PATCH v4 2/7] MIPS: Loongson64: Distinguish firmware
 dependencies DTB/LEFI
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ming Wang <wangming01@loongson.cn>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-3-zhangqing@loongson.cn>
 <2484af69-13d1-09ff-3785-6c89cac4ffbd@rempel-privat.de>
 <49ddbef4-3d2a-4adb-8fd0-37bba0530c4c@www.fastmail.com>
 <7f26fc67-e7b1-d305-90e7-0cfedcc822ca@rempel-privat.de>
 <a2b1ad18-8f4b-8e43-e175-c372580a7168@flygoat.com>
From:   Oleksij Rempel <linux@rempel-privat.de>
Message-ID: <1a9486a4-b35b-f8b1-9f70-2247dbcdebcc@rempel-privat.de>
Date:   Wed, 10 Mar 2021 17:03:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a2b1ad18-8f4b-8e43-e175-c372580a7168@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7EPcA7LJwbgomj4E5VhiKJxmyS6Zciq5BHHfkm0UueLs7142Byw
 KCGn68nSewxpzwp3Dwsoi2pKONu7tVc9LA+zQT/trn6iPppRZ59fTw+ebtBMwFMGFBA4Uhg
 yrbf3cfEE5VecXNxSaNZAmBOHMoPgVUXoC27neoAgYWtcoI0tKzVaIA9Itm2ZTb1ChpRoHM
 +d5+aYekbNPgS96iiCTSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nL8YTZLK3UY=:EDfEMoFPctd+pJui2zgPQR
 SHRzPeE1z51alGmeXggt56ECTTpg0WCNYaMhTjiNBZCCI1Ji/sf+ooZTwo2ts8Dql+4983inb
 MsnbQG695yoEIsJ7MFvQC0SsT0oJ+cbOD5v7od1BcWDvkZq0TTSV+lVbTxEY+LdAbManVAjnS
 xlf/Z4p07JsAkoZS6LZbdnv2DrD/OxZ0PBO0UPS6zg/VTI3VGQEfRcMhA9VN6t/vbT6f2Uy0e
 lRofGI4k5mou4HSDkkFSMJHkfUjIeVKrgrN01fqoteICXrEMQb0YZbbHp3z6rfmxpE9+vTZ+y
 Rag4LWBjPQ3O+zLJDd64hzMZfJ9fN9w9dzTc9gEIDcgYnLwX+gD1NU4BYeFnSidZKnOLK8VBO
 A20W3LBH6LEWjUEhb1+FrYnnKXLwD451G9dZ1U8GYnPv9FW2Jkxz9dpwmPfUfqyQlwzl+92id
 FvLVTKcq6c6rZcEzMDWBR73tpNOPj+SauXrJaeQfTmCBuxvyCJt9oO92eCjDONKC6mkFVmO25
 sE6J2cAuZLIX07qOUaitJq5E6ZMdNeEXeCFN/6yL9cjsaUFj0eMjV1KjJWEa+SnSiLA6lj3nY
 uiAiM99ILNudFhN76JF0lVtuojlce+WT+eW3wi9xLP4HWOVTVZGpnxT5P4CNBpm+LY+FZ/lWy
 jcB1Hg5zOR/kj/e9DvROgp6n531in+/DeQjzhykD8E3B7wpv4k4aJZBmo1czpKW9JyH+HvdvS
 ghsp6sh1Np+ZBeYGtxzReyyp6gRKl7gO8uXiVp8OJHwLUVo4kBNB1K9H1MT6M+TQev5i3kxIT
 ncJDVoEWLoaSdMRZqX3YO6Fwn5bPsjfryGkiJORyN1vfvBKSKSgEuz2yjaytJd+m2nE3W3JzD
 BV0TpukZp9CtXfbWJu9g==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 10.03.21 um 16:58 schrieb Jiaxun Yang:
>
>
> =E5=9C=A8 2021/3/10 21:26, Oleksij Rempel =E5=86=99=E9=81=93:
> [...]
>> I would like to understand, why it is impossible. Do fw_arg0 provide me=
mory address or some kind of
>> count/size? Can it be negative?
>>
>> We already had same situation with ARM and it was fixed. Why this can't=
 be done for MIPS or LS?
>
> Well we can fix it for future MIPS systems but not present Loongson.
>
> Actually I've talked to several Chinese MIPS chip vendors and they
> all agreed to unify the booting protcol.
>
> I raised the same question to Loongson ~3 years ago but got
> negative response.
> The idea got reject in a recent private discussions with Loongson
> about 2K1000 upstream stuff.
>
> Also I realized Loongson's chip comes with too many ISA level
> custom designs which makes it impossible to use MIPS generic
> kernel.
> =C2=A0
>
>>>> This protocol is described here on page 15, "3. Boot protocols"
>>>> https://docplayer.net/62444141-Unified-hosting-interface-md01069-refe=
rence-manual.html
>>>>
>>>> According to this protocol, you should have:
>>>> fw_arg0 =3D -2
>>>> fw_arg1 =3D Virtual (kseg0) address of Device Tree Blob
>>>>
>>>> This would made LS a first grade resident for many boot loaders and
>>>> save a lot of needles headaches.
>>>>
>>> Loongson is stepping away from MIPS and it seems like they're going to=
 use EDK-II for their Loongarch.
>>>
>> It seems to be UEFI related, it seems to be not related to the CPU arch=
, or do i'm missing something?
> I meant they won't invest much to MIPS based chips :-(
>> In any case, if this is true, then it means, that Loongsoon is about to=
 drop support for old boot
>> loaders (PMON?) and do new thing (one more boot protocol?). So argument=
ation, we upstream old own
>> protocol, but will drop it to make some thing new is not really good ex=
ample :)
> Yes, actually many new Loongson desktop machines (3A3000/3A4000) are shi=
pped
> with UEFI and relies on second stage bootloader to convert to old boot
> protocol.
>
> I'm againt to upstraming the "new" protocol as it's non-standard UEFI
> with many
> nonsense design.
>
>
>>> TBH I've checked Loongson's PMON code and realized it can't be ported =
to other projects easily.
>>> Tons of unregonized assembly code.
>>>
>> No need to port it. Here is example of working clean code:
>> https://git.pengutronix.de/cgit/barebox/tree/arch/mips/boards/loongson-=
ls1b/lowlevel.S
> I've ported U-Boot to LS1C as well. But LS1B/LS1C is Loongson32.
> Loongson64 based systems like LS2K is much more complex than it.
> The bootloader is fullfilled with assembly and mostly undocumented.
> LS2K's PMON contains ~50k lines of assembly.

OK, i hope i'll never have customers using this chips. Are there any
reason why do we wont to keep it alive? :D


=2D-
Regards,
Oleksij
