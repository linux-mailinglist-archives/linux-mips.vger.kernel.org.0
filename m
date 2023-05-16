Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32951705AD7
	for <lists+linux-mips@lfdr.de>; Wed, 17 May 2023 00:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjEPWzK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 May 2023 18:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjEPWzG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 May 2023 18:55:06 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C11459E6
        for <linux-mips@vger.kernel.org>; Tue, 16 May 2023 15:54:51 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5C2D85C00D8;
        Tue, 16 May 2023 18:54:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 16 May 2023 18:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1684277687; x=1684364087; bh=SKfJcuCy+ScL7j4V+NMo40F06MluO8iSZNU
        0NPYNB7E=; b=LbFpGuUPE2idLZ/82IEivlUUeIHrUwG6e/RCdaJ5GTs+JwuCf5q
        TibsCExw3kWyruOQKbc5HmYP9C7MGxFJitKeepkOpof8jFf+a3RjHEJ7pST6a9u5
        pAbwFJPkrYTyf9+EcJ6R9Itq5B3sVZfAxdrEoXO8uRVaeQpsvO6aKTWzZekbKcWW
        K8jI46uFJl/Ymc0PRuD948le2C0xh3ZYhUrmExgpHVc4xsttpuSy3v6GmVGZUgGw
        SJSOzoNHtiEBWLRADAltxV4lLQ4n+wyGOdlfvryUe+GikUkF1exrvPRupzXdzcf8
        wpuyTseo88ifWW9Rio/l7XUYufDjwqSZOZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1684277687; x=1684364087; bh=SKfJcuCy+ScL7j4V+NMo40F06MluO8iSZNU
        0NPYNB7E=; b=fE5p8s3DydYXVnfi2IqreSiBZttUbFymt/WzLCrydQOpFed11+T
        gI2bKmbHcF8w926UL2GxcssZPBffLylSOZE7sZ2ddc95l/OMb1xPA0gP2Rk1wp6a
        pfpG7JBnTDE4h2wruMWHWFmQt5NW67jvQob2edKljnwGp9RJlMqA+Lrn2estyLiZ
        PiIwN44oi0wGHk5crfRQllI9K5SU61WIM1dVpC9iRhga2O4h/ZaqRrxT1vVXiHql
        LYpfMjj/FoBYGEG0AYfqxEwXM1tycHNrKJk5rN73hE3F7Ydyw3cgGYBWnctmgMev
        8I8yZ1kCpxiVaB2nS0wrdWOOQIjOgNu+BTg==
X-ME-Sender: <xms:tglkZEQT4oLkoPMZ8MGKGcg2GuIsgzS2HcnoYsGAm6KqzmBbXF85xA>
    <xme:tglkZBxoN9qbx51QLEs2qa2q2jwUtfL8hqw9sUpVeNgcYdL3JR6MRT2tF0r6gJaz0
    WQ2_S3ljUVyFbSdlPc>
X-ME-Received: <xmr:tglkZB3UUOpdGL3du30zYIPxJkQIZ5R5uD3Gxa9yCshVHlf1HG7QJgrSewg8KR-PAaBH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeitddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepiefftdffveeuffdvleejuefgveevvdegkeffgeevlefgueet
    keekudeihfelgfdtnecuffhomhgrihhnpegtohhnfhhighefrdhmthenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:tglkZIDKm1h_f3RUnGdj4zYPKzWnvqfy66yUG_4Ll7k1pqk-iFI4Ig>
    <xmx:tglkZNj8h5yc-_wRAvImCAZ7UR10eydwHhu6Y2ULSoZaIDjJcwDXfg>
    <xmx:tglkZEpUF7tJfN7kIpVrQSEwPpB12upuLsgtcBc9tSm8p5FbVJ1Csg>
    <xmx:twlkZAvNlBO_NwBRVGF510wDyMHIXpht20xKwU82aXHyve3EibogpQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 May 2023 18:54:46 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <alpine.DEB.2.21.2305162116470.50034@angie.orcam.me.uk>
Date:   Tue, 16 May 2023 23:54:35 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <225B55E5-9140-49C4-BE62-60D82B12A10A@flygoat.com>
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
 <alpine.DEB.2.21.2305161542290.50034@angie.orcam.me.uk>
 <62F0038E-F2A2-4D1E-B53A-E84916598102@flygoat.com>
 <alpine.DEB.2.21.2305162116470.50034@angie.orcam.me.uk>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B45=E6=9C=8816=E6=97=A5 21:47=EF=BC=8CMaciej W. Rozycki =
<macro@orcam.me.uk> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 16 May 2023, Jiaxun Yang wrote:
>=20
>>> Actually the MIPS MT ASE is explicitly from R2 onwards only[1] and =
it has=20
>>> *not* been withdrawn as at R6[2].
>>=20
>> Thanks for the info!
>>=20
>> I=E2=80=99m a little bit confused with relationship of MT and VP =
though, I thought VP
>> suppressed MT, and they look conflicting, does it mean there are two =
possible
>> ways of multithreading in R6?
>=20
> Hmm, interesting point.  I would have thought you can have either but =
not=20
> both, however there is a note along with the description of =
CP0.Config3.MT=20
> in[1] that for R6 the bit has to be 0.  That place and the description =
of=20
> the new CP0.Config5.VP bit seem the only mentions of MT ASE/Module =
removal=20
> with R6 and there is e.g. this paragraph for CP0.Wired:

I=E2=80=99ve heard back from hardware guys, the stated that MT and VP =
are exclusive but
we should not assume VP as only multithreading implementation on R6 (in =
term of
privileged architecture).

Actually I7200 (nanoMIPS) follows R6 privileged spec (Config.AR =3D 2) =
but have MT
implemented rather than VP.

However they assured me that *application processor* level cores that is =
expected
to run Linux in future will only implement VP, so we can omit =
combination of MT
and R6 in kernel. Just perform some basic checks to prevent hardware =
guys change
their mind in future. =20

[=E2=80=A6]

Thanks
- Jiaxun=
