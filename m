Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5675971267F
	for <lists+linux-mips@lfdr.de>; Fri, 26 May 2023 14:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243405AbjEZMWo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 May 2023 08:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjEZMWi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 May 2023 08:22:38 -0400
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4025D8;
        Fri, 26 May 2023 05:22:36 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id F18BE2B067F1;
        Fri, 26 May 2023 08:22:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 26 May 2023 08:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1685103750; x=1685110950; bh=9OjPVtcXUXsvJbsxBYn861b3PFL3iRSxocq
        SvkSDhOY=; b=h8IerA6eCZ9zEkm18cIQ/DHlPux1lRB2Eb3ONCu4hETPvcV9qW6
        xuNp5UiRw2wm5bzQ7fdePAz9z5TcqSD7zCNKfmha/mODlmnnLfl53CxPHUPoqdqq
        tEbii24Pcw0iQkJl9ktKANwe3gGqsqrd7ruG2jJ+bZZpqhZaHBHGiQD5HpXe22fK
        hV0mZijIY//jGbqewyhcRk+hkI9ssZdypLFLMVD5KWxn5q6KWHZxNMbLN9cP1GVt
        prkwsimspjmVJBO5F11iwf6SAt6dTxoH+LDhTDwyuxZOm8scoX9EIaUzDVvOZQNQ
        GhW+Fm/HP2dBRqAUMPlVWzkH9X96OKwrsaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1685103750; x=1685110950; bh=9OjPVtcXUXsvJbsxBYn861b3PFL3iRSxocq
        SvkSDhOY=; b=GG1pUEUOIvcGTaaOsY4w7DIfY6DH2oRjCIE87u9TKRDBf7U9cGj
        /awOLAUrNa5yFsf3XWFE2/6eTfUR65UWhhTOBFbEz6U9l8gbNg0jh1VCOAlrt509
        OWR3MUJCrm65m29ps46tYb3YewZwbkVcvvlHmg+4TVY0QsbXSUI460XrMP3SA9gZ
        HYNM/xo1kFsPVzcEqG9zQzVhYs+GiB6GaSqTeyM8Wo/7HXT4eHjMtj1erCKni0AU
        mucwurehc7+FemVunQ3rce6onR8kfVWLgYAKoDxuhfBZ174fnFT8Kg37WoaXh9Ln
        nz470QJy8Ylw4E1wimzT3uSSYNXFATIdH4w==
X-ME-Sender: <xms:hKRwZBkHX7q864GHMR5p2u3KkjNiwNseGwR4_Yorn3ndOiNxScglng>
    <xme:hKRwZM2X2DuYYAjOgsqMUctL9811HpQYfmOdJ0R8Tzk62lHcMODgOhQfrHVIhqHZW
    msl_vuVA-ZopgyAVCE>
X-ME-Received: <xmr:hKRwZHoo98GT0qD4j6Z4lCbq1WOARByS2PnHA66LH2_pDHL3L3i58t1bdZe2f9ebE9In>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejledghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:hKRwZBlE9QVAbJgBJ8y-9T_tNLVtg5lkGA2khaEZHn6Tst8Eo6ggbw>
    <xmx:hKRwZP047JW6BsxZIg4UJhxQEw0dobcJlk1bbIOUMCgjqcZP7-0-VQ>
    <xmx:hKRwZAsu6oBAC6FFrjzgebECkHjq19SRVjlwpom916u8uQeUmJjsGQ>
    <xmx:hqRwZE4xbBHOTKyuwil4E5Dz2hx1jD1q9KzMZSk4eriBc18peDgt4lX5Fy8>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 May 2023 08:22:26 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial
 RTCs
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230526-dolly-reheat-06c4d5658415@wendy>
Date:   Fri, 26 May 2023 13:22:15 +0100
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Kelvin Cheung <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Content-Transfer-Encoding: quoted-printable
Message-Id: <1EAC8FA8-4125-4436-9EE1-13B61B5687AF@flygoat.com>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
To:     Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B45=E6=9C=8826=E6=97=A5 13:06=EF=BC=8CConor Dooley =
<conor.dooley@microchip.com> =E5=86=99=E9=81=93=EF=BC=9A
Hi all,

[...]
My two cents here as Loongson64 maintainer.

>=20
>>> To maintain compatibility with the existing devicetrees, should the =
old
>>> "loongson,ls2x-rtc" be kept in the driver?
>>=20
>> No, It seems that wildcards in compatible are not allowed."
>> loongson,ls2x-rtc" itself was part of this patch series at one time,
>> but apparently it is not the right way to describe these chips.
>=20
> Right, but it has been merged - you are deleting the driver that =
supports
> it after all - which means that any dtb with the old compatible will
> stop working.
It is perfectly fine to break DTB compatibility for Loongson64 systems
As they *only* use builtin dtb. Bootloader will only pass machine type =
information
and kernel will choose one dtb from it=E2=80=99s dtbs pool.

Thanks
- Jiaxun

> I don't disagree with Krzysztof that having wildcard based compatibles
> is bad, but I do not think that regressing rtc support for systems =
with
> these old devicetrees is the right way to go either.
>=20
> Thanks,
> Conor.

