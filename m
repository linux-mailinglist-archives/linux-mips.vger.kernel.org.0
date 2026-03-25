Return-Path: <linux-mips+bounces-13938-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDHYHh3lw2lvugQAu9opvQ
	(envelope-from <linux-mips+bounces-13938-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 14:37:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4972325EA0
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 14:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D30A131CC3B7
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 12:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278363D6696;
	Wed, 25 Mar 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NB90DRRC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E113D16EA;
	Wed, 25 Mar 2026 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443063; cv=none; b=EADJy2lAajlFQBaeeZVHiRc8S+T1ptM4XVrbC3DdOuvQYemejH6egGBNad2ifuDbYu7lr6/vrl97RqPrZIQg7pb+PBDBT3kX6tPKBjceunmGo7JRz+yowRIg5/tD6uKYZbSGHiKu7ybBQh4vZHaC4O5Onyd5IoOIAhL+dl6WU8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443063; c=relaxed/simple;
	bh=nis1EnGXaiGBbbe98OlND9BRNrjSeGkjUvM8qCuEYHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKZRuWdaVbE3I2oD7747FC2jbul5X7DHdDFZQvjaJ0CPi2ckrMBd7OU54WosfPnKTN3sYH0pDTjtLAwALl/n4Iki598pmhY9OV8xbpNWWXwvuTNncU2udq7fFL5RF2tYDiu3UETShISuMqeHoW3K93XH+gDkgB+bAFg64oGQ+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NB90DRRC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EDD86C5809F;
	Wed, 25 Mar 2026 12:51:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20907601E2;
	Wed, 25 Mar 2026 12:50:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CA161045140B;
	Wed, 25 Mar 2026 13:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774443057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6UOrP8NS5n8uHLOxDqtPTPLp/+9HsWqNfo5o09hCrZw=;
	b=NB90DRRCC8NNSr3AhF4AKuaEqfIN25HFhKvj0nX6/r81xjjvuXWcSg2EwnRgUg+Kbl9FZc
	KTlOzikvFl2LZjCaVHAPuL1Q2WXHa8Hs/COKKlr7SVuBwbvROtwXCSAfRkNOmrDXRg0Lod
	F4ZRHWFXKH9U7QIQ3Z0v0pSBWFYkW0gVi9PlzastXPQxWYUCoYSm9nPF3K9QND4qeaExTj
	byp3jpI7goDteGRV+gmSl3rhpalQipX8fV93e2UOVPm5YhlfS0nZWHXANSddvJUCHN0qGJ
	wTX2GGR9Oi1mVRN4WQQaOX3W6+CzASBaLUDo4lH7rlJsUtoFeVlLwMGrT7WIXA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Linus Walleij <linusw@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
Date: Wed, 25 Mar 2026 13:50:53 +0100
Message-ID: <27303918.1r3eYUQgxm@benoit.monin>
In-Reply-To: <acKZ09NOFF59yZtJ@alpha.franken.de>
References:
 <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
 <CAD++jLmT+4xb3sfa3f1z0vD4qikeB+v0kC6yo6=hSU+==fZOkg@mail.gmail.com>
 <acKZ09NOFF59yZtJ@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13938-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,benoit.monin:mid]
X-Rspamd-Queue-Id: B4972325EA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, 24 March 2026 at 15:04:03 CET, Thomas Bogendoerfer wrote:
> On Mon, Mar 23, 2026 at 10:05:12AM +0100, Linus Walleij wrote:
> > On Mon, Mar 16, 2026 at 4:26=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin=
@bootlin.com> wrote:
> >=20
> > > Add the match data for the pinctrl found in the EyeQ6Lplus OLB. The p=
in
> > > control is identical in function to the one present in the EyeQ5 but
> > > has a single bank of 32 pins.
> > >
> > > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> >=20
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> >=20
> > I don't know your merge strategy for this patch series, if you want part
> > of it applied to the pinctrl tree then tell me which patches and how.
>=20
> as there are also MIPS parts involved and Stephen Acked the clk Patches
> it might be best to merge via MIPS tree
>=20
> Thomas.
>=20
>=20
I proposed to Stephen to take the patches related to the OLB (clk,
pinctrl and reset) in the clk tree[1]. The following patches could go
through the mips tree:

      [PATCH v4 01/13] dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
      [PATCH v4 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
      [PATCH v4 03/13] MIPS: Add Mobileye EyeQ6Lplus support
      [PATCH v4 10/13] MIPS: Add Mobileye EyeQ6Lplus SoC dtsi
      [PATCH v4 11/13] MIPS: Add Mobileye EyeQ6Lplus evaluation board dts
      [PATCH v4 12/13] MIPS: config: add eyeq6lplus_defconfig
      [PATCH v4 13/13] MAINTAINERS: Mobileye: Add EyeQ6Lplus files

=46or the two sets of patches to build properly, the OLB dt-bindings patch
(patch 02/13) is present in both as the clk-eyeq driver and the SoC
device tree use the header introduced in it. I don't know if having a
patch in two trees is a valid merge strategy. Any opinion on that?


[1]: https://lore.kernel.org/lkml/2786053.vuYhMxLoTh@benoit.monin/


Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




