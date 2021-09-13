Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655B5408354
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 06:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhIMEKp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 00:10:45 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:39879 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229563AbhIMEKo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Sep 2021 00:10:44 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id F23EF580BD1;
        Mon, 13 Sep 2021 00:09:28 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Mon, 13 Sep 2021 00:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=FcCk0
        LaLdkPUFjTRHtFg2txyA3szlfRycXt8jAHqfxw=; b=ETkMT62hKhwoy+RlrDADD
        Vp8aPxMF4meLwqihsEqYT0bbKzBF+VVaM8mW8meQyRktp1aQi3fdZ5t30GDGVSKM
        p9M+Xyn7ogBxJ3Gb9B5e5jfUfreRZtc66sgBsgJm5QeRvy1yI9b3G6DR9AI/yd7n
        q5hQgYCLsSxUQhRzKzBhQ0yOtS/s2TLJewpeKy/avL9Y0Qno3N9gu9IiapGIWNXC
        K+NgDl8o/wgTVs5cGzoUrdiMShuspBoFIjoHr5Kv++efkkhFruefou0J/PuHGyUk
        TRyE23vEDSsnhjygV5TygEkeF4rR4jiCYGRyhgZs+orR+tb3X//wGarTkD8hC9GA
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=FcCk0LaLdkPUFjTRHtFg2txyA3szlfRycXt8jAHqf
        xw=; b=ZbJwhPk7ooEOZSsgwX7dqEvzCWgsG+yADJxzKSB7dXpklzdU9EAvJ6bdM
        p+WAD1kFwH/KIFonRdYpHqaAM+x9AxhG5tY6ZIHAA04taN037zqalm/KHSyMdjt/
        8Be9iBT9H+elFfk7vV1htjWP4uoCMpSQmertSomdThJslTp1L+P6/vwq0uJVZvjf
        8nHGJNPW3bV/6U70HAdOxV2GxJhVbHe2/lbEpficJsEL4Zl9YEEnAspIP2sIdfpH
        heVWntA66L/w5kEraBk3IkyWsKCVFDajl6zPEggQ75tjUaJTluhng+qSA1xPTy1u
        7qgshn0rP1i//mNQoz1aXDeNtJYOw==
X-ME-Sender: <xms:984-YXCbaI2ZddbrqVKp-Qi6mVh-BezyQ_P9oFmdvlKCZY1eAvFIsA>
    <xme:984-YdjqZuT5CRE_cBeojjxWO-Mcz6XWMc8bsL5fcW4iSrKdImRN2iyJKY2EAE-9L
    nl-toslXvPzSnw9wKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
    feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:984-YSlmUH0EXQzIlvP_3Quwvp6K4WPZrt4jNBth4UZmqjfVdyxjiw>
    <xmx:984-YZzBs5ePkQ4tX9_mVyp3CaqOqMtTB75dAKeUHjnuFyvXwM2M6A>
    <xmx:984-YcRbjxdf_gctZJkEk0dTiylPivOJ7sHpNkKLg3uXivBXmIsyjQ>
    <xmx:-M4-YSf_Juw6anPHyeR8uPsGjb2dY6_IUiTlf1OdfCfG3cx1Uxs3Zg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DC536FA0AA5; Mon, 13 Sep 2021 00:09:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1229-g7ca81dfce5-fm-20210908.005-g7ca81dfc
Mime-Version: 1.0
Message-Id: <65fc84a6-23cd-4cf3-b7e3-02764d73c958@www.fastmail.com>
In-Reply-To: <CAPhSAwvJmfCD5yF21r79qgG+MkAYD-0L32hHU58m_4Hocuwhug@mail.gmail.com>
References: <20210912061356.1723912-1-wanghaojun@loongson.cn>
 <eea34c97-bb3c-4b36-9f85-18a07fd004a8@www.fastmail.com>
 <CAPhSAwvJmfCD5yF21r79qgG+MkAYD-0L32hHU58m_4Hocuwhug@mail.gmail.com>
Date:   Mon, 13 Sep 2021 05:09:09 +0100
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Wang Haojun" <jiangliuer01@gmail.com>
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Wang Haojun" <wanghaojun@loongson.cn>,
        "Xuefeng Li" <lixuefeng@loongson.cn>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: loongson64: Fix no screen display during boot-up
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82021=E5=B9=B49=E6=9C=8813=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8A=E5=
=8D=882:32=EF=BC=8C=E6=B1=9F=E6=B5=81=E5=84=BF=E5=86=99=E9=81=93=EF=BC=9A
> Hi Jiaxun,
>=20
> CONFIG_FRAMEBUFFER_CONSOLE  is enabled in this config file, but
> CONFIG_FRAMEBUFFER_CONSOLE depends on CONFIG_FB and CONFIG_FB is not
> selected in this file. This which causes CONFIG_FRAMEBUFFER_CONSOLE to
> be unchecked, So it causes these problems.so I selcted CONFIG_FB in
> this config file.

Oops, Sorry I get your point now.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks.


>=20
> Jiaxun Yang <jiaxun.yang@flygoat.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=88=
12=E6=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=883:57=E5=86=99=E9=81=93=EF=
=BC=9A
> >
> >
> >
> > =E5=9C=A82021=E5=B9=B49=E6=9C=8812=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=
=8A=E5=8D=887:13=EF=BC=8CWang Haojun=E5=86=99=E9=81=93=EF=BC=9A
> > > This is no display on the screen during boot-up when using latest
> > > loongson3_defconfig, because CONFIG_FRAMEBUFFER_CONSOLE=3Dy depends
> > > on CONFIG_FB=3Dy in this file.
> >
> > Hi Haojun,
> >
> > It won't work unless you get LS7A dc driver upstreamed or amdgpu fir=
mware resolved.
> >
> > Thanks.
> >
> > >
> > > Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> > > ---
> > >  arch/mips/configs/loongson3_defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/mips/configs/loongson3_defconfig
> > > b/arch/mips/configs/loongson3_defconfig
> > > index f02101ff04b3..25ecd15bc952 100644
> > > --- a/arch/mips/configs/loongson3_defconfig
> > > +++ b/arch/mips/configs/loongson3_defconfig
> > > @@ -282,6 +282,7 @@ CONFIG_DRM=3Dy
> > >  CONFIG_DRM_RADEON=3Dm
> > >  CONFIG_DRM_QXL=3Dy
> > >  CONFIG_DRM_VIRTIO_GPU=3Dy
> > > +CONFIG_FB=3Dy
> > >  CONFIG_FB_RADEON=3Dy
> > >  CONFIG_LCD_CLASS_DEVICE=3Dy
> > >  CONFIG_LCD_PLATFORM=3Dm
> > > --
> > > 2.27.0
> > >
> > >
> >
> >
> > --
> > - Jiaxun
>=20


--=20
- Jiaxun
