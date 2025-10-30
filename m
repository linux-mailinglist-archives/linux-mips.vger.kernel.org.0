Return-Path: <linux-mips+bounces-11926-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01BC1FF63
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 13:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222E819C381D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 12:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04A22C21FA;
	Thu, 30 Oct 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjSmw1H+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6942882B6
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761826580; cv=none; b=A6qRHLqBjlhuMUx2CL4ZHojKkWg4wkbWYt/BPWsp1t1+u3TbjWBSDgbXVEt4I48PKxcTfUR0SHKYZbn2lgisV6iJcaSZAcuKfYGzn/+IyDIUll8HdGJPZlBDC1q4fer4ZLGPmtAjzenTRQAucVZAS9rEQfwF43qRbv9R7jTuugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761826580; c=relaxed/simple;
	bh=75RLQB8GL2/gKDokgbvRHwaJGve5LAaTdeXDRa43ZHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u97xQxmz0BAkmIpNmSaaNHtXxl3QxOI0vR5pW0zi7zZVSign5yjmwc5eKbwqvGNXP9aTcsoHGtVJ/5lIkokoUKwBBGH2hXprdxw5NZDmKjilSLcX8RfVNWdRulDxFWg0tSGvIkAOSe6eN6G6LMizsKtX/Aq35E6PvblCDSwnBDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjSmw1H+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso5214065e9.0
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761826577; x=1762431377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=;
        b=BjSmw1H+oSJWgVd1IrMyroPlGTUOAanDENsbBWo7rTuli+Dz7jZHxZ18wwNfAjBfA+
         ZV1ZiwLPpnH4yFr5SlUHHb3SnjMQ3F7gsoGvFH4Fp9LiQ9ITSG3QI5XMsKQeOLE4eKrH
         MJ8cFCPkhWx6jN82tcaU5bTZOn5ktQhEvPExqa8rvHihMvNEAvd1fX1acRnmVe4zI/Nn
         qWH/522uN61qnug51y9k/9K/WlEEX3Wv18tw7uSaN2FRLiJj0Gsfpsx9Y6oooKU8ySI1
         dUMFfsajNf+BQTKfbWC7ICJHBBCMbVNvViWqsm/7klUXXcwYKfDWnixudoeAg+Dt/lNz
         Hv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826577; x=1762431377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2h4BnseYLvI915SuwI6txSi2xO1Lp6zcqUfBWQt5q8=;
        b=qdKOuVQ8vUEyAK6ZeEONlBC7UrxRMmCnXce3NNAF3sKX7UNH0Qoi/Dx9g4xTfBaztB
         626kMJ55Pc467YYEN4aDaBO5M5lN95KJkGHAIVu1iKNnG08pdOGgLjGM6htA4QCai4ro
         eS5dsvI5UhV7C/HlObkbyKacOk57MqqCIBKwUJcBHd4MSl5vMXY/rMcCZWLRxz8CmXpZ
         6Jd58X+hckYfQMh5cCz8IeTycuX0ukWTimC8ZZauBTRwrFLkLiH6OKOB7HsqzXuuWgis
         dSqWDzRstKU+8JdPoxAvEaM8bLsJuwHjBRnAYAZUgtjUW6b1crdGlTsrmsIrOqGtqtC6
         vdzw==
X-Forwarded-Encrypted: i=1; AJvYcCWWvAVCSNJhg3w7qSdQ2s59TzQZ8UstWmnu105NMT1X0y+pr5psu9Q3eyxQAhLImLwRzMScU1JCB3pl@vger.kernel.org
X-Gm-Message-State: AOJu0YynWHH9+5svOBWHufcRD4XBKTKt1avKswIiwujxvuXAB1BdtQ/1
	svcboZ343BvsgwkAiUQZd3JRKk7teeyWCUDxe0s2r6wzQFfNKH4MYaC+xMMCIQ==
X-Gm-Gg: ASbGncsrQLi/Xegivo8BhWLUZHMtQ3USKKaNJ05h8/e88wuTAVtTkYlL4sDpjjjk6H/
	onNtr4Ik4yIQhTwr8Um1oVyOy3rxMtY4K6GgxivLd8tt85MXTHtLYlITZHwZXkQzg7AwHkifkVe
	8aKe7IyH2Mrg/OwyT0Ripzoz7SLFndD+H8gC3+scYq37pJSA7cQD1KJO4qnSE8O5R82+VIpYDax
	mMHanQaTXswaDGRCTAHvCwDlX2d1kSufWliI23seHAjzezikUIAuRq4Uxwgq4aAl1EpP14IexIT
	ibja6hqScMZXfZYumFnbozA+sfRMN4ZV5lwCLH2mPtbW9HsuGTyUwga5f5wi44HXWOa+BE0dk+L
	Go6AnrpCgs/y/S/6J5cvxkMC8+uhUZy0y1mfg2JlTqkEcf91QzC8AlUM6bo4A8kilj9/UbKHtlh
	OMjcZ1LoGuZPOMNFivwTC7whxLSrv4HeVc8tCLuK9t1vgRKDoGUExBTnxSy0XM7fDdy/MqLUPoU
	d5QFRLoMgwt
X-Google-Smtp-Source: AGHT+IFFiHEvNPjKUlWf15eT6QrZW2LM5hHmfdRjCPGtpfvtcJfaix0mKpAwNuPfyTcNYpcwrmxIZg==
X-Received: by 2002:a05:6000:2508:b0:3fb:aca3:d5d9 with SMTP id ffacd0b85a97d-429aef76469mr4752945f8f.1.1761826576503;
        Thu, 30 Oct 2025 05:16:16 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db839sm33617710f8f.34.2025.10.30.05.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:16:14 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:16:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
Message-ID: <t3la3jte5tia7rh5ftuv5cchrwdxe4cxa2v3g6lxgoh5u6rmcy@hzw7lbke2vac>
References: <20251029163336.2785270-3-thierry.reding@gmail.com>
 <20251029174654.GA1571737@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="stoiegldli5skly3"
Content-Disposition: inline
In-Reply-To: <20251029174654.GA1571737@bhelgaas>


--stoiegldli5skly3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
MIME-Version: 1.0

On Wed, Oct 29, 2025 at 12:46:54PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 05:33:31PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Pass the driver-specific data via the syscore struct and use it in the
> > syscore ops.
>=20
> Would be nice to include the "instead of global variable" part here so
> the commit log includes the benefit and can stand alone even without
> the subject.

Good point.

> Awesome to get rid of another global variable!  More comments below.

\o/

> > +++ b/arch/mips/pci/pci-alchemy.c
> > @@ -33,6 +33,7 @@
> > =20
> >  struct alchemy_pci_context {
> >  	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
> > +	struct syscore syscore;
> >  	void __iomem *regs;			/* ctrl base */
> >  	/* tools for wired entry for config space access */
> >  	unsigned long last_elo0;
> > @@ -46,12 +47,6 @@ struct alchemy_pci_context {
> >  	int (*board_pci_idsel)(unsigned int devsel, int assert);
> >  };
> > =20
> > -/* for syscore_ops. There's only one PCI controller on Alchemy chips, =
so this
> > - * should suffice for now.
> > - */
> > -static struct alchemy_pci_context *__alchemy_pci_ctx;
> > -
> > -
> >  /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphy=
s_addr
> >   * in arch/mips/alchemy/common/setup.c
> >   */
> > @@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devse=
l, int assert)
> >  /* save PCI controller register contents. */
> >  static int alchemy_pci_suspend(void *data)
> >  {
> > -	struct alchemy_pci_context *ctx =3D __alchemy_pci_ctx;
> > -	if (!ctx)
> > -		return 0;
> > +	struct alchemy_pci_context *ctx =3D data;
> > =20
> >  	ctx->pm[0]  =3D __raw_readl(ctx->regs + PCI_REG_CMEM);
> >  	ctx->pm[1]  =3D __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
> > @@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
> > =20
> >  static void alchemy_pci_resume(void *data)
> >  {
> > -	struct alchemy_pci_context *ctx =3D __alchemy_pci_ctx;
> > -	if (!ctx)
> > -		return;
> > +	struct alchemy_pci_context *ctx =3D data;
> > =20
> >  	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
> >  	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
> > @@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscor=
e_ops =3D {
> >  	.resume =3D alchemy_pci_resume,
> >  };
> > =20
> > -static struct syscore alchemy_pci_syscore =3D {
> > -	.ops =3D &alchemy_pci_syscore_ops,
> > -};
> > -
> >  static int alchemy_pci_probe(struct platform_device *pdev)
> >  {
> >  	struct alchemy_pci_platdata *pd =3D pdev->dev.platform_data;
> > @@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_devic=
e *pdev)
> >  	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
> >  	wmb();
> > =20
> > -	__alchemy_pci_ctx =3D ctx;
> >  	platform_set_drvdata(pdev, ctx);
> > -	register_syscore(&alchemy_pci_syscore);
> > +	ctx->syscore.ops =3D &alchemy_pci_syscore_ops;
> > +	ctx->syscore.data =3D ctx;
> > +	register_syscore(&ctx->syscore);
>=20
> As far as I can tell, the only use of syscore in this driver is for
> suspend/resume.
>=20
> This is a regular platform_device driver, so instead of syscore, I
> think it should use generic power management like other PCI host
> controller drivers do, something like this:
>=20
>   static int alchemy_pci_suspend_noirq(struct device *dev)
>   ...
>=20
>   static int alchemy_pci_resume_noirq(struct device *dev)
>   ...
>=20
>   static DEFINE_NOIRQ_DEV_PM_OPS(alchemy_pci_pm_ops,
>                                  alchemy_pci_suspend_noirq,
>                                  alchemy_pci_resume_noirq);
>=20
>   static struct platform_driver alchemy_pcictl_driver =3D {
>           .probe          =3D alchemy_pci_probe,
>           .driver =3D {
>                   .name   =3D "alchemy-pci",
>                   .pm     =3D pm_sleep_ptr(&alchemy_pci_pm_ops),
>           },
>   };
>=20
> Here's a sample in another driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pci/controller/cadence/pci-j721e.c?id=3Dv6.17#n663

I thought so too, but then I looked at the history and saw that it was
initially regular PM ops and then fixed by using syscore in this commit:

    commit 864c6c22e9a5742b0f43c983b6c405d52817bacd
    Author: Manuel Lauss <manuel.lauss@googlemail.com>
    Date:   Wed Nov 16 15:42:28 2011 +0100
   =20
        MIPS: Alchemy: Fix PCI PM
   =20
        Move PCI Controller PM to syscore_ops since the platform_driver PM =
methods
        are called way too late on resume and far too early on suspend (aft=
er and
        before PCI device resume/suspend).
        This also allows to simplify wired entry management a bit.
   =20
        Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
        Cc: linux-mips@linux-mips.org
        Patchwork: https://patchwork.linux-mips.org/patch/3007/
        Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

So unfortunately I don't think it'll work for this driver.

Thierry

--stoiegldli5skly3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDVwcACgkQ3SOs138+
s6FWDw//asJQ0od9HClRIj0RNLWAbliTk9QI3rUVvZd0krnee9oWFJS6p9gosZi7
Baqb5WJ5xo7atxuHYK6RlAFAina/LUDWNpY9w1up0hM1K/NqVj0D6Ufrx2O4zw2Q
5Ff2rbnpTBndYi8w6kth5MU4p/g3VtsilfSmErNPBQQF2CUQA3qmp3XVvAvbaH8+
aUGS2rLpxX0Q06XGtXMtnvf4LHF4uzbZkX+AC6XqcBFT9BSgSjAKr65vMcYnqRqL
sRxPbqQ9e6iZ2SibX+o61epk7rmO72XUa1v9TpZ24JNuvUIJnLfwm8D96f8NJEzK
EznsDwGuOT/G87UYPvgqTZDbT8hbSvDEjGnlF8a6xtPP14Zm9hlMc0b9ZJ+wgMV4
aMq7WckO8j/yY3NLAIokI/pMm5D11aYCSmk4PS7K4KdubNSeD+18J0QOZ/4cJyIQ
cWI/P6sqD62A0QPMbbbtBa3MP9RbCZ0zhfFwI9dTprNJ7I7bijD/OLo798mkNB2f
71+yECk1VnOKeAj9v80k479HlfUHaGCpRiEzWaKJ3IvLNqgUKH0q8nP8/McNXEKL
8rRCO+5Ona/ND0lf2fue+/QeT44Fi24invQSdsgGdeaxEmcDkW06HSOK3Cp4pZWB
E86uRaPgXuSRgDbxv2MMtv+PNWNWlqYzJ5/Lz0AkTm920p5RAvk=
=Pbyc
-----END PGP SIGNATURE-----

--stoiegldli5skly3--

