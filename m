Return-Path: <linux-mips+bounces-12977-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBGXDEYScGlyUwAAu9opvQ
	(envelope-from <linux-mips+bounces-12977-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 00:39:50 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E64DF82
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 00:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D25948616A2
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jan 2026 23:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCF641C30B;
	Tue, 20 Jan 2026 23:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ofou5bRu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB0C312828;
	Tue, 20 Jan 2026 23:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952377; cv=none; b=nWfvVA6KFGmV5XCNfK7y7evkO2lZg7O0jCZCi+l5kmTyDXkeEdMGlCLwQeLF2ovacAvBJGYDfB/xYbd4ejH4iXRYhdRzfxU0PAtzL3rx0FXiPI+JRIaHKRwJo5J2Lwyr8I039dnc2Gsz3cO5bvvyatEx8riW+JJ9wLeM/6M5mUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952377; c=relaxed/simple;
	bh=HIDptQyxrl7l/EyyrCmFy4C2HhqwWYyybCVYMiH9RDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQORVyCWqulvFDevf3KSNG9BM5c0wUC7JjD/e0CsFWtr7yqFAZxPcXYvbr/35pgZuLCbR5XNe9oc4KCHOeFs8Wl9xNcUOWBRhch6mLm58wf2Wbs5Ksqu2wnnefj0qVbGctZo8Fz/mCi0bFxiVdFu9/Kt97Z8yrZl/N2YWcDnihU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ofou5bRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C94C16AAE;
	Tue, 20 Jan 2026 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768952376;
	bh=HIDptQyxrl7l/EyyrCmFy4C2HhqwWYyybCVYMiH9RDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ofou5bRu6mNASNchMBpMdKFge85/CDtJYpoL7z083Csq0rHXZT0Pge5nLG3WfPxS5
	 w9bdNnfQfdqbb34Ujrrr2Sy2t2anfTsFpwsmm33CJDIPCkta5v+gkKdNz+03t75FtC
	 JNO/j7HFoa4xLlPNl0kCzD2dcNqzdf4dopSOZM7vwKFgYjYPUc/ixiIRKi5D08IwWJ
	 fSCO/c8hdGwlBeaW8HCafvug79cDbZOVzQC6i1RJt0MIYUB8gKX1MCZDVOUet1MvXO
	 obA3WCP3gVJxp7ifrJYDN1yAfSVmsiQHX/9t7kNGOY/lhgBkyMz/3mdhUnxKn8YJf2
	 6ZJ9Y8YZB0VQA==
Date: Tue, 20 Jan 2026 23:39:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: loongson: Correct Loongson-1C
 interrupts property
Message-ID: <20260120-proposal-retry-d0a1f3de10ea@spud>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
 <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud>
 <20260120075045e7e864ba@mail.local>
 <20260120-cubical-harmonica-a7b7bbb26b08@spud>
 <20260120224920df0cf2ac@mail.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lnVaNHpePim2zo65"
Content-Disposition: inline
In-Reply-To: <20260120224920df0cf2ac@mail.local>
X-Spamd-Result: default: False [-2.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12977-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[loongson.cn,gmail.com,kernel.org,vger.kernel.org,xen0n.name,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-mips@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D17E64DF82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--lnVaNHpePim2zo65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 11:49:20PM +0100, Alexandre Belloni wrote:
> On 20/01/2026 19:24:09+0000, Conor Dooley wrote:
> > On Tue, Jan 20, 2026 at 08:50:45AM +0100, Alexandre Belloni wrote:
> > > On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> > > > On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > > > > The `interrupts` property indicates an RTC alarm interrupt, which=
 is
> > > > > required for RTCs that support the alarm feature, which is not su=
pported
> > > > > by the Loongson-1C RTC. We exclude it for a more accurate descrip=
tion.
> > > > >=20
> > > > > Changing the `allowed` property is ABI-breaking behavior, but
> > > > > throughout the existing Loongson DTS{i}, the description of the R=
TC
> > > > > nodes conforms to the modified bingding rules.
> > > >=20
> > > > Right, changing properties is an ABI break, but when following the =
ABI
> > > > would've produced something non-functional, breaking it is not real=
ly
> > > > relevant.
> > >=20
> > >=20
> > > But the HW has the interrupt, the fact that is not functional doesn't
> > > mean it isn't there. I thought we should describe the hardware?
> >=20
> > Does the hardware have it? My interpretation of the commit message was
> > that it didn't have the alarm feature and thus no interrupt? Unless the
> > interrupt has some other purpose, in which case yeah we shouldn't accept
> > this change and only the new device should permit there being no
> > interrupt.
>=20
> The datasheet shows the interrupt coming out of the RTC and it has the
> proper registers. Why it is not functional is not clear to me.

Right.. Perhaps Binbin can explain that then? If the interrupt is
actually there then the dts should get fixed instead IMO.

--lnVaNHpePim2zo65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXASMgAKCRB4tDGHoIJi
0oRlAP9p3ULEJ4S1rYcPHyjv7qsgCkCsdws862oF5id1UCAfTgD7Bs1fxn8Fbfh9
P5o3JDKXXNSLklqH3ahOVJRH4BaNyAs=
=wCOM
-----END PGP SIGNATURE-----

--lnVaNHpePim2zo65--

