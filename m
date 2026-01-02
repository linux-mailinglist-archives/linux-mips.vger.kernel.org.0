Return-Path: <linux-mips+bounces-12717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16456CEF65A
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 23:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 605B33001BD0
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 22:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEF02D6E7E;
	Fri,  2 Jan 2026 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Oiqxx2qF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02DD3597B;
	Fri,  2 Jan 2026 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767391412; cv=none; b=uj1aCy26vU/TqO6ADlton/VDpS1/tOvx5amdKMfpCzPA9g4Q162uEYhty1PZ6xbeanSM2ixttwvR11xmS0GSBSPu2zzVQV2iD84I4cMQQ+KSj/4GCdlH5/ZxT9aqfLSsXFIdxw11Kgy/zM4FkAS6GnYICAuy0ecH3Y65U0sFDuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767391412; c=relaxed/simple;
	bh=3IttiT3Nu4XseUo8hCXiX7c/hNKsQtyXN94ILpvt1Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUZgJrIn1bYa+XtTbpnCgbUT2cVJ1lRrR+QhBpjHRLxU4UYIg6wK9HIrmlhZJjEKbcFtEsdV/kx58ONhuvhCc4zMnUIkpr+FmeSzrURRARW1ev/FTXslxHqYs/6aDHvCHTskH2JSP/LHUgs9il68MSNQ1oMw9toHkraMpvIWjrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Oiqxx2qF; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3EEBAC1C3BC;
	Fri,  2 Jan 2026 22:03:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6A27606C7;
	Fri,  2 Jan 2026 22:03:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46A97113B023E;
	Fri,  2 Jan 2026 23:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767391406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DzBEEZRd/TfGbBRgPI1LV+yJYKfoYamGrcNf95MHCek=;
	b=Oiqxx2qFMOdFkK4UejUswt++zRt7vL1iotMTqjcQp816p/MwR1lgtC/4Kq1U/3h5x/ca0s
	ce3mSKWFmIxgOWdBejoJCqKhCUbBmo6MDmk45qLpfeY6xY1FTbUYG90finTAnRNDPfN8Ji
	Lx7b+BEyQeaXjP7/ahuciacxyO1ZfryINNKu+zWay1n3ez6WBAbkXIp9lchABcHYJPyVAv
	gxSq9P2h/+9W96fDOMUnPQv94GvsCxSHQ5wKTwxTKNwKC+W1uJfiF08tP//V0CS78gqeo8
	ckhQPYFjmF0xNftTyJW2sF1r3sf3gVjgHSvh8SgIX33w/MNawfPE9zbizLlMnQ==
Date: Fri, 2 Jan 2026 23:03:22 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8=?= Lebrun
 <theo.lebrun@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
Message-ID: <20260102230322.29d2ea65@windsurf>
In-Reply-To: <CAD++jLnBMXQAv75a8k=mbEt8pAxS0UXhayQPz1YWCiLic9_+ig@mail.gmail.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
	<20251223-eyeq6lplus-v2-6-cd1fd21d182c@bootlin.com>
	<CAD++jLnBMXQAv75a8k=mbEt8pAxS0UXhayQPz1YWCiLic9_+ig@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Linus,

On Fri, 2 Jan 2026 22:57:44 +0100
Linus Walleij <linusw@kernel.org> wrote:

> On Tue, Dec 23, 2025 at 11:02=E2=80=AFAM Beno=C3=AEt Monin <benoit.monin@=
bootlin.com> wrote:
>=20
> >  static const struct of_device_id eq5p_match_table[] =3D {
> >         { .compatible =3D "mobileye,eyeq5-olb", .data =3D &eq5p_eyeq5_d=
ata },
> > +       { .compatible =3D "mobileye,eyeq6lplus-olb", .data =3D &eq5p_ey=
eq6lplus_data }, =20
>=20
> Which patch can I find this new binding in? Or is it already upstream?

In the same series, PATCH 02/13:

  https://lore.kernel.org/all/20251223-eyeq6lplus-v2-2-cd1fd21d182c@bootlin=
.com/

Best regards,

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

