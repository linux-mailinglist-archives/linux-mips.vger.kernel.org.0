Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C5A6DF8D5
	for <lists+linux-mips@lfdr.de>; Wed, 12 Apr 2023 16:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjDLOmv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Apr 2023 10:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjDLOmu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Apr 2023 10:42:50 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D3572BC
        for <linux-mips@vger.kernel.org>; Wed, 12 Apr 2023 07:42:37 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 28B875C0071;
        Wed, 12 Apr 2023 10:42:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 12 Apr 2023 10:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1681310554; x=1681396954; bh=qDHFbaQOHjWZdPYFAdMka1/5Fzv9qBoqqxr
        CuC17uUY=; b=nakt9gr9034fnz5xVSMB6caK0yMT2Qf5dXrupO/mZaYn5FKVmxd
        4T8jmM+4kucpj3dQPmyN/mdn463LNbhCrskGbgJxgGNOOGq5UD+A7qDzOm/+0usk
        xwFVrtiP94OxZcVgjIvDgw1QfGtRnF1yMn+iWojwjtaVw1bcHg3UAH5PMYun5kZ8
        8AWgOiT3DqzbViBf4ZpjGwgo5UfuVv8VVCvBinwGUoAn/ulTfi+Wxw951xmIfNR3
        KlAFp2D37Jzy3r/tys1mDt4Q/PNh6FFNYJHqtnVVK4BsOofiaW61jh02IXvrkdEk
        3XPg0GxwN+dDdq2CqJSTDQdpScj4URqeIgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1681310554; x=1681396954; bh=qDHFbaQOHjWZdPYFAdMka1/5Fzv9qBoqqxr
        CuC17uUY=; b=WGkhzRkEjl4fLD++zevPOZXUEbsGJRZQyiBy3SJ1HDLw3aavkd3
        yjlXkAAcpjxOdZFvQQ+Z16eQxEN4ddVDFoCK64jT+dn1XA8Cm0CZfyT5+NMuey8C
        Oh+T3Cx4JE7A2fK0lKRgB2j/mviaZ1Jg+I0+aNxcQ3I0/MJ06uGnVGLjtKEosSqI
        zr718/sGbMt0CKYbGt4BlkqqxIhRZH7+Kz990Pptdofh7b7khZuaFIsG/IYoOZb3
        RN+0Md4iT/w/lo7Mz1nSjtOtAD6nrqj1VMVhq42YUoujG9SuBUfjBYl/BZwFUfc8
        70RtMETlX5FALcYs1qV82Z5Gqd8Wwxmb5lg==
X-ME-Sender: <xms:WcM2ZN2vzDkkbgxOd_Cgkq5FdIo3U725khhHK0xW6UuoH31TUwQfIQ>
    <xme:WcM2ZEGL2Y9ipj8Fa5y2ScAfsp6zUktnRTw1RFyVKkdHUDdPhu_3xkpPdpEaR5IT1
    0p7GZvOaJMH_ws111s>
X-ME-Received: <xmr:WcM2ZN4ICWjJ-ujA27hStWXmnd4cIc95oYKW14Ry_82fCyteWP0VeC6CvbCl2mjEvMtN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:WcM2ZK2mW19iLwuWUc_0JCJU4uuhz2XyAq5ekUYTuLBhgQCjFylvAQ>
    <xmx:WcM2ZAEqhdvh1b0aRdRgYU61bn0lMjODxh9DYzq4SlOTS3VqbaXwDA>
    <xmx:WcM2ZL9kQjOW8O-kzHrI4npg7fUeNQUj4BzRJvL0k6rFk-GGGQFxsg>
    <xmx:WsM2ZKP6rdxe6QO_yeg_ZTD28LzUv8hLDhyfFrEKhpKrRFdjTNopyg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Apr 2023 10:42:32 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: Set better default CPU model and kernel code model
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230412133113.GB11717@alpha.franken.de>
Date:   Wed, 12 Apr 2023 15:42:21 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD69060A-9D15-4610-8AD3-59A8CEE69D0C@flygoat.com>
References: <20230408115936.6631-1-jiaxun.yang@flygoat.com>
 <20230412133113.GB11717@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=8812=E6=97=A5 14:31=EF=BC=8CThomas Bogendoerfer =
<tsbogend@alpha.franken.de> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sat, Apr 08, 2023 at 12:59:36PM +0100, Jiaxun Yang wrote:
>> Set default CPU model to Release 2 CPUs (MIPS64R2 if 64 bit CPU
>> is present, otherwise MIPS32R2) to get better feature coverage
>> on various default configs.
>>=20
>> Also set default kernel code model to 64 bit since nowadays it
>> doesn't make much sense to run 32 bit kernel on a 64 bit system.
>>=20
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> arch/mips/Kconfig | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index ecc7a755fae6..1d681dd87bb0 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -1260,6 +1260,8 @@ menu "CPU selection"
>>=20
>> choice
>> prompt "CPU type"
>> + default CPU_MIPS64_R2 if SYS_HAS_CPU_MIPS64_R2
>> + default CPU_MIPS32_R2 if SYS_HAS_CPU_MIPS32_R2
>> default CPU_R4X00
>=20
> I don't think this makes things better. For systems with multiple
> possible CPU choices it's quite easy to get a kernel compiled for
> the wrong ISA.

Well this is only for best allmodconfig coverage.

Or at least:
default CPU_MIPS32_R2 if MIPS_GENERIC_KERNEL

Can make things better.

>=20
>>=20
>> config CPU_LOONGSON64
>> @@ -2007,6 +2009,7 @@ menu "Kernel type"
>>=20
>> choice
>> prompt "Kernel code model"
>> + default 64BIT
>=20
> I don't buy your "nowadays" argument. My SGI Indy still has 64Bit CPUs
> and has not much reason to run a 64bit kernel.

I see, I=E2=80=99ll leave it here.

Thanks
- Jiaxun

>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not =
necessarily a
> good idea.                                                [ RFC1925, =
2.3 ]


