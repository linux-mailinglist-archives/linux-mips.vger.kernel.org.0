Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78238449B78
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 19:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbhKHSMM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 13:12:12 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37091 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234952AbhKHSML (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 13:12:11 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 1E5C65C01D2;
        Mon,  8 Nov 2021 13:09:27 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute5.internal (MEProxy); Mon, 08 Nov 2021 13:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=IA1BC
        KsJQMxREs8xS31Gt4ZHG9qoU57aQN3UTqDnlN8=; b=PYA+ZCYG45itYbb1v9w+G
        q86BDpGrgVNtNcvDLtiRymIOoWNiO9Ayo12sZiHK6Q/mhM3DpuPbq1YIEqBxZl48
        XQUAEi5dD2YFjESIe0LaodA9HbZmUWYlNsBk29Zdvu19jdD4521sa6ROyll3MD5P
        SWDVhD+9MkQte1y3u5TzQphoNQthzrP5wjupSef5FKu7B3XFnRNOI6yNipmfdp88
        UN2nZeEPsd/1i8AKAEKg1VLtGmp4TvsSIPr0lxBOA9D2xR8aEk9nlONSJvWlAGyh
        ba8DjIWDDtDwkms7qgWQ2/4b/sUzty173tBvNuxKheQAYyHyY0nJioDsIFkNrBRJ
        g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=IA1BCKsJQMxREs8xS31Gt4ZHG9qoU57aQN3UTqDnl
        N8=; b=Jn6/Nj0vwZsTe5pCO5n5VKFwmvnatYAaXteE0xbx9fnoponjNwROmWVKt
        7yyizXaZuNutGE/8/5ZdJnwJ7lL+2Ad4axQXyEwsjvgJuRaMSTPYFC30EF9Gg2st
        308/wVQuwgLT9B4Shk9l2e+Nl74cxhqNwSzpiuv2YTxaNKRrjQ70e/aLMHwpjAh2
        dKOrmLvHDDPAH+opwTmqBOiqn4q7lyJFEcvHbvd5W1n3o7APfMjujULe+KjYaZ3c
        bnIM5q+J1uAS7vldpIq1M2/5urHehbKPYwyTUar62qZ6iGMfHNkkGEwFmGg2arok
        mbhyl65Nm/RGc3JHCzyjHKghmFS9w==
X-ME-Sender: <xms:1meJYWPMYqdeOqJ9m6EUi50KAsux8ECq3oK16Yq202R7THnBzTcdgQ>
    <xme:1meJYU8U7JV7mTw6Y_ch0K6cpIFzzIFBDovY_h7bYoR3nv6KAXKZ_cJW7tMOfK3gn
    Jn7iWDm10QTN_Yti1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
    feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1meJYdT39yHOIRtP_qQ9E__hrViEKfowRI_1lgBx45fEhpPFVsTpJw>
    <xmx:1meJYWtpkNMsfI-OBHKtwpe2aMVvqpydaNrTFzluyN6KHUXl_cCveQ>
    <xmx:1meJYefIGgiaLMWFkx4F8-Aa-W8zGkpkFkBN5JO_19nCv1hoxbfcrg>
    <xmx:12eJYfprae3CQIch5GQmcZ6h9j7ppE_8cjfrmxC4i97vs_anPz1JoQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 694BEFA0AA6; Mon,  8 Nov 2021 13:09:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <70a3e99c-0682-4f0f-9ba5-186d3e1398b8@www.fastmail.com>
In-Reply-To: <8R092R.UUI0DN154MP31@crapouillou.net>
References: <20211105135232.2128420-1-yunqiang.su@cipunited.com>
 <2JZ82R.JILSE46R0P2T1@crapouillou.net> <8R092R.UUI0DN154MP31@crapouillou.net>
Date:   Mon, 08 Nov 2021 18:09:06 +0000
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Paul Cercueil" <paul@crapouillou.net>,
        "YunQiang Su" <yunqiang.su@cipunited.com>
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [RFC] MIPS: fix generic zboot support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82021=E5=B9=B411=E6=9C=888=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =E4=
=B8=8A=E5=8D=8810:21=EF=BC=8CPaul Cercueil=E5=86=99=E9=81=93=EF=BC=9A
> Hi again,
>
> Le lun., nov. 8 2021 at 09:54:38 +0000, Paul Cercueil=20
> <paul@crapouillou.net> a =C3=A9crit :
>> Hi,
>>=20
>> Le ven., nov. 5 2021 at 09:52:32 -0400, YunQiang Su=20
>> <yunqiang.su@cipunited.com> a =C3=A9crit :
>>> There are 2 problems here:
>>> 1. setting zload-y to 0xffffffff81000000 breaks booting on qemu -M=20
>>> =7Fboston.
>>>    Why it is set here? Any other platform needs this value?
>>=20
>> Is there another place where it should be set?
>>=20
>> With this patch applied, kernels won't boot anymore on Ingenic boards.
>
> Nevermind - it works, I just needed to adapt my tooling.
>
> However, I think there should still be an option to have a fixed zload=20
> address, for the case where you want a vmlinuz.bin.

Hmm how about leave it for Kconfig?

Thanks.

- Jiaxun

>
> Cheers,
> -Paul
>
>>> 2. vmlinux.gz.itb should be appended to all-$(CONFIG_MIPS_GENERIC)=20
>>> =7Finstead
>>>    of replacing. Otherwise, no vmlinuz will be built.
>>=20
>> I build vmlinuz all the time, and never needed this patch.
>>=20
>> Cheers,
>> -Paul
>>=20
>>> ---
>>>  arch/mips/generic/Platform | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>=20
>>> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
>>> index e1abc113b409..0c03623f3897 100644
>>> --- a/arch/mips/generic/Platform
>>> +++ b/arch/mips/generic/Platform
>>> @@ -13,8 +13,7 @@ cflags-$(CONFIG_MACH_INGENIC_SOC)	+=3D=20
>>> =7F-I$(srctree)/arch/mips/include/asm/mach-ing
>>>  cflags-$(CONFIG_MIPS_GENERIC)	+=3D=20
>>> =7F-I$(srctree)/arch/mips/include/asm/mach-generic
>>>=20
>>>  load-$(CONFIG_MIPS_GENERIC)	+=3D 0xffffffff80100000
>>> -zload-$(CONFIG_MIPS_GENERIC)	+=3D 0xffffffff81000000
>>> -all-$(CONFIG_MIPS_GENERIC)	:=3D vmlinux.gz.itb
>>> +all-$(CONFIG_MIPS_GENERIC)	+=3D vmlinux.gz.itb
>>>=20
>>>  its-y					:=3D vmlinux.its.S
>>>  its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+=3D board-boston.its.S
>>> --
>>> 2.30.2
>>>=20
>>

--=20
- Jiaxun
