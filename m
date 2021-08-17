Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D4C3EE73A
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 09:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238675AbhHQH3l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 03:29:41 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:55975 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238686AbhHQH3g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Aug 2021 03:29:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id AD03F3200A53;
        Tue, 17 Aug 2021 03:29:01 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Tue, 17 Aug 2021 03:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm2; bh=f4BJm
        aXPeOR0NzrRNCFBmQihQRU+JQae6tFVvnTRcXE=; b=HpmX2HLrbLl19k+TW1zN7
        iDJv20yl72UUgmFm+DZ3gaNbRuu+SKUTO2IrsT5UCgC7sy24yeEqFcnQ7tIiTF4e
        VOqLlcmU9kCJk+ADDYHlz5nwAkZ7+nyIKIYFLpeeuB/YI58VH8QhSuo7IDOgLkpS
        WHSgNm2KZLLFTTgbApWsY9GCAQWneZHNxoWlLe3YTkZhWKW3ihJ9s/kobkKuA9Le
        XEaNBgvgVw2EBhPAIYvCLobLlSoIeoBz/U9rQqAq09MSeTj3ibF9mksE09jKzmZF
        eThi2EBXRwHlV1S9okgoBAr/juC6kbpHNk9pjPXsSG67T3sbIAvxMOGZeCKcshGf
        A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=f4BJmaXPeOR0NzrRNCFBmQihQRU+JQae6tFVvnTRc
        XE=; b=a1dLufU4G2nsgv0uxDDar5JoLCigSU9rdki55zMTOcKb5eK49HLN4KmGz
        O2SprD01GwWyVywf3yaCnHgzW0AdIjHqv27On26mYYeWGkwj1L73g/ONLQP1EP/A
        jGjL+kQMfDGO0dEW1gsbJ7i/DtJHKGcPWX6hyNAv91+icClYWWBBdQDLAgyzcy9+
        /aApxHNo8djfCJDqFPJu4UzjEzyzzEsHxNfFezbMe+23ejUqnaIUDMYI5ttEr/C0
        Ny4lry78s+cZ93VZ/keMgeldACwnx/pvpQCDJo7AZf630W4unxV6U3rl/lu0wgCO
        nMgzLgFaIq1fRoy/yoxJ68Lw5eLKw==
X-ME-Sender: <xms:PGUbYcSlGpC4sv0TnOofBycewgqqnXO45rCrvA8vnRB5STcDSeczjQ>
    <xme:PGUbYZzI7FyHxYYLd8BLAEd9-ycOIvFkCIUN8uUAiBTYNlXZk7uya0RFxgKf4cuWd
    JRE_HxM-U6Yr4whOYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
    feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:PGUbYZ3qPXz_MDS8jwfPSPOj3kYBh4XQFBaQzntdM5HDaOU-VjET0g>
    <xmx:PGUbYQBfxTpyT-Yj8dc_x2MJbVqIm3K7FXNs44BlYCFV6ZgNJlQHHg>
    <xmx:PGUbYVg3pylnscJ89HfttXCq7dQL7qkX-8wk149U0f7SEgdMWhluzA>
    <xmx:PWUbYaux1SRbqGkzutCQ3IDFfBOC-nuCzzmOaQpbbaWvlIDOlOfsOw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7E34AFA0AA4; Tue, 17 Aug 2021 03:29:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <fba1c1da-3943-4d33-a65d-422fcacfc7e3@www.fastmail.com>
In-Reply-To: <20210816105326.8050-1-lukas.bulwahn@gmail.com>
References: <20210816105326.8050-1-lukas.bulwahn@gmail.com>
Date:   Tue, 17 Aug 2021 15:28:37 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Rahul Bedarkar" <rahulbedarkar89@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2]_MAINTAINERS:_adjust_PISTACHIO_SOC_SUPPORT_after?=
 =?UTF-8?Q?_its_retirement?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82021=E5=B9=B48=E6=9C=8816=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=886:53=EF=BC=8CLukas Bulwahn=E5=86=99=E9=81=93=EF=BC=9A
> Commit 104f942b2832 ("MIPS: Retire MACH_PISTACHIO") removes
> ./arch/mips/pistachio/ and ./arch/mips/configs/pistachio_defconfig, but
> misses to adjust the corresponding section PISTACHIO SOC SUPPORT
> in MAINTAINERS.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:
>=20
>   warning: no file matches    F:    arch/mips/configs/pistachio*_defco=
nfig
>   warning: no file matches    F:    arch/mips/pistachio/
>=20
> As James Hartley is not reachable with the provided email address, the
> remaining dtsi file, arch/mips/boot/dts/img/pistachio.dtsi, must be
> maintained by its only user pistachio_marduk.dts, which is part of MAR=
DUK
> (CREATOR CI40) DEVICE TREE SUPPORT.
>=20
> Add maintenance of pistachio.dtsi to that section and drop the PISTACH=
IO
> SOC SUPPORT after its retirement.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210816
>=20
> Jiaxun, Rahul, please ack.=20

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks

> Thomas, please pick this minor non-urgent clean-up patch on mips-next.
>=20
