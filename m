Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696162DFCB5
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 15:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgLUOUI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 09:20:08 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51869 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727070AbgLUOUI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Dec 2020 09:20:08 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id B8C80580515;
        Mon, 21 Dec 2020 09:19:21 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Mon, 21 Dec 2020 09:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm1; bh=Ips+4
        h9qI7oPeVN8j7u2+LFFCTfYFzbZEBk88cu7bKE=; b=NEEHpMesYTCjtW7Lda1re
        rJkLKa6HOX4SH53vSnEv8BJMueM9MnPEFJaO+DLr7Kf3+k+ATdqcFzb7CzNnT/NF
        ovameU0lgpppraSrWJTERgsC9dhfSzwf87V1Ngs3Pk1u6uMvr/cL8xoMGtzUmYB0
        zpJK5Mj70mg4HWLnI06sBAgTvJSRBWkLgLK/UwEedgk04FkVwMJNXi1UywYuZO6v
        nQfP117SJpdfE1gw0LatwaW9++tWaMuM0ddnQR6t30IFaLO7DrbQHRWQ7N7fvxCf
        XHtG6WhQv0/PXNuoZVVGPVHyIx6izb+zkj+HrGZouS4MSRSzQl2CHAuHUyG7EdPm
        w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Ips+4h9qI7oPeVN8j7u2+LFFCTfYFzbZEBk88cu7b
        KE=; b=P5OcROwqhwk1w1ojMdedhBmU+4mT4frCPhJWpNPXYAhYG41JdYd6oaPLb
        ERrTfVwh34Rtj/w46wJ8IP1FqglUuDH2mLb5XR7R7tPzJB+Uh0cVOxxR1JiEPu0w
        s6H/4gqOZcLzk8EFZnSIdzkwemiAnA72jy/hGM0nxkKTaZo/GLEChqsnfwPRg+6N
        eGOETb+J0qSXs4vW7rLcM0h5G/MLeV2FZUWI0p5hATmdf3QTVz7JsmlKRRPsJz0e
        rH7R+uGzycN4tT5vsLOBDNnTfh3LHCm0ZnTcj3tQRH9NxWlcItsDu0jBhwoW35Is
        ogcw5Poa3ud1wtYrprbmbWUupSpdw==
X-ME-Sender: <xms:6K7gX_QEyA4OjKg3dRO6-VVrD6xfB4x6zQCPDf5mQhZPMXlRJAtn1Q>
    <xme:6K7gXwxwg3Bmo6Im1l14LD_T_RDse1Xdg74l9QAVarFWL5NKUPum41GMKL0NQlv3M
    kDTgtQbVPdfDEODX4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepteeltdegleetvdeiffefgeegleehgeegieffveeihfdt
    iefgheekfefgvdfhieehnecuffhomhgrihhnpehhvggrugdrshgsnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:6K7gX03VEanLXZ2kFU_2JiXZiBzW2LPoT3kbejCfsyycYmlP-vLxxQ>
    <xmx:6K7gX_BrGrAhbAgqA-2nmFPnQE1SdcvQkj-OINXyAFNVkk5d7ZoH-g>
    <xmx:6K7gX4hZvZVfzvVDcKfNV5CZERzCQyOQil5s4trDnXTRkaR7NBZrAw>
    <xmx:6a7gXwJvNa7XEcl21IqMrnJQGTfdcl2CvbcJPjyP1BtkdKNtZUwA76Vuz4I>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7BBCFC200A5; Mon, 21 Dec 2020 09:19:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <e5de167a-707b-4668-85a0-3174309b9558@www.fastmail.com>
In-Reply-To: <HO0PLQ.1VZP0U76MARY1@crapouillou.net>
References: <20201221130048.7753-1-jiaxun.yang@flygoat.com>
 <HO0PLQ.1VZP0U76MARY1@crapouillou.net>
Date:   Mon, 21 Dec 2020 22:18:58 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Paul Cercueil" <paul@crapouillou.net>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: zboot: head.S clean up
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Mon, Dec 21, 2020, at 10:09 PM, Paul Cercueil wrote:
> Hi Jiaxun,
>=20
> Le lun. 21 d=C3=A9c. 2020 =C3=A0 21:00, Jiaxun Yang <jiaxun.yang@flygo=
at.com> a=20
> =C3=A9crit :
> > .cprestore is removed as we don't except Position Independent
> > zboot ELF.
> >=20
> > .noreorder is also removed and rest instructions is massaged
> > to improve readability.
> >=20
> > t9 register is used to indirect jump as MIPS ABI requirement.
> >=20
> > Reported-by: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  arch/mips/boot/compressed/head.S | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/mips/boot/compressed/head.S=20
> > b/arch/mips/boot/compressed/head.S
> > index 409cb483a9ff..977218c90bc8 100644
> > --- a/arch/mips/boot/compressed/head.S
> > +++ b/arch/mips/boot/compressed/head.S
> > @@ -15,8 +15,6 @@
> >  #include <asm/asm.h>
> >  #include <asm/regdef.h>
> >=20
> > -	.set noreorder
> > -	.cprestore
> >  	LEAF(start)
> >  start:
>=20
> You can also remove the 'start' label, since it's declared inside the=20=

> LEAF() macro as well. GNU's assembler won't mind, but LLVM will choke=20=

> on that.

Thanks, will do in v2!

I was trying to catch you on IRC but failed every time when it comes to =
my mind :-(

>=20
> Cheers,
> -Paul
>=20

- Jiaxun
