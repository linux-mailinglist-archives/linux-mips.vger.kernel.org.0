Return-Path: <linux-mips+bounces-12981-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AXML6QvcWmcfAAAu9opvQ
	(envelope-from <linux-mips+bounces-12981-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 20:57:24 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2C5CAEA
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 20:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA741B4B0CF
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 18:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F359B3A1A33;
	Wed, 21 Jan 2026 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNWsEkZ7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF31839B4BB;
	Wed, 21 Jan 2026 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020140; cv=none; b=rBje9tnhu7w67LTFnQ2yE3mYfd/wc3J3dOGg4dxQfTXNjYqXo2S00B47jXxzc5417M0JI3wTJF28xEd9vo7NXofsQpzDq1vdR/TNi56MD9s8/WfPm4kUZyZznrhSvFpAzrd6gDPdPB41ajYlbHaqCqIK7EJLytGminUJ1UtewoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020140; c=relaxed/simple;
	bh=l6+u6Dylp0WfC6wdeLiE99rgNBwsRoiJbYc85FgW5Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbvN3mqkRNEDZO4WMFGLcLPXprsfohaQZ+E0QMYgL8J7fLkF4JfmibTiPLFPPp9HsHWbY8ADZwOxD8/YZ/UoxF7bBU1cVnx35yLlSCxK+wnZmTELUT7CA/iAfEMvLr42E0l3oE5qL9lKWIZikxTY0KvjDqOZLly3JA3Xi7k4z5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNWsEkZ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87027C4CEF1;
	Wed, 21 Jan 2026 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769020140;
	bh=l6+u6Dylp0WfC6wdeLiE99rgNBwsRoiJbYc85FgW5Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNWsEkZ7St50nxE07dRB0tDto39+JiwHq185jDR4NO8xP6EgsbhJohlntKIrEKYm1
	 etWasqI2WlRnwHTinOziFVvUPQv9J5OdDk8Xq05bghdF+VUmy4SYdG7yr871dgfoUC
	 pNmOTv3H6VaioaZ3cfIvePZLY5/nczx1uaneKaDzHmjD3jhgZ9yr15DTgi2UgQ4+yg
	 IOIISPfDlKydxKEH0/zvhU6+CWGoDjzvtQzxYsOmUTm4tKH82uwDjNzafpILD4F6hV
	 saPOq6fcNWWvE3KhYJ8/xx89NJcAJ/tf40mxTYvgB9DZ9KfAp0W9U1beU8U8HTBHmY
	 8zFZ6ib5glnkA==
Date: Wed, 21 Jan 2026 18:28:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
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
Message-ID: <20260121-sadness-operating-8bffd4250085@spud>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
 <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud>
 <20260120075045e7e864ba@mail.local>
 <20260120-cubical-harmonica-a7b7bbb26b08@spud>
 <20260120224920df0cf2ac@mail.local>
 <20260120-proposal-retry-d0a1f3de10ea@spud>
 <CAMpQs4Lm1Oq8L+dY8OnseV-NNUoD3+0QjnZATRkmR-sejCKAdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytcyEvQbqLkTzetR"
Content-Disposition: inline
In-Reply-To: <CAMpQs4Lm1Oq8L+dY8OnseV-NNUoD3+0QjnZATRkmR-sejCKAdA@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-12981-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[bootlin.com,loongson.cn,kernel.org,vger.kernel.org,xen0n.name,lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-mips@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,loongson.cn:url]
X-Rspamd-Queue-Id: 41F2C5CAEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ytcyEvQbqLkTzetR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 02:52:06PM +0800, Binbin Zhou wrote:
> Hi Conor & Alexandre:
>=20
> Thanks for your reply.
>=20
> On Wed, Jan 21, 2026 at 7:39=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Jan 20, 2026 at 11:49:20PM +0100, Alexandre Belloni wrote:
> > > On 20/01/2026 19:24:09+0000, Conor Dooley wrote:
> > > > On Tue, Jan 20, 2026 at 08:50:45AM +0100, Alexandre Belloni wrote:
> > > > > On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> > > > > > On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > > > > > > The `interrupts` property indicates an RTC alarm interrupt, w=
hich is
> > > > > > > required for RTCs that support the alarm feature, which is no=
t supported
> > > > > > > by the Loongson-1C RTC. We exclude it for a more accurate des=
cription.
> > > > > > >
> > > > > > > Changing the `allowed` property is ABI-breaking behavior, but
> > > > > > > throughout the existing Loongson DTS{i}, the description of t=
he RTC
> > > > > > > nodes conforms to the modified bingding rules.
> > > > > >
> > > > > > Right, changing properties is an ABI break, but when following =
the ABI
> > > > > > would've produced something non-functional, breaking it is not =
really
> > > > > > relevant.
> > > > >
> > > > >
> > > > > But the HW has the interrupt, the fact that is not functional doe=
sn't
> > > > > mean it isn't there. I thought we should describe the hardware?
> > > >
> > > > Does the hardware have it? My interpretation of the commit message =
was
> > > > that it didn't have the alarm feature and thus no interrupt? Unless=
 the
> > > > interrupt has some other purpose, in which case yeah we shouldn't a=
ccept
> > > > this change and only the new device should permit there being no
> > > > interrupt.
> > >
> > > The datasheet shows the interrupt coming out of the RTC and it has the
> > > proper registers. Why it is not functional is not clear to me.
> >
> > Right.. Perhaps Binbin can explain that then? If the interrupt is
> > actually there then the dts should get fixed instead IMO.
>=20
> I carefully reviewed the manual again and believe this patch is still nec=
essary.
>=20
> First, the Loongson-1C RTC does not define the timing interrupt
> register (`TOY_MATCH0_REG`)[1], meaning it lacks hardware support for

I don't understand Chinese, so I'll take your word for it that this
particular model doesn't have this interrupt and that there's no other
interrupt used by the rtc via a different register :) My ack for the
patch remains valid.

Also, I looked at the existing binding again, and there's no ABI break
anyway cos the interrupts property wasn't required in the first place,
so any driver has to be written to permit the absence of an interrupts
property. I think you should remove mention of ABI break from the commit
message, since it's not actually one.

> alarms. Consequently, `interrupts` are also unnecessary.
> The Loongson-2K0300 is different. It defines `TOY_MATCH0_REG`, but due
> to a hardware design flaw, accessing this register causes system
> crashes. Therefore, I must also classify it as lacking alarm support.

This logic also seems fair to me, assuming that this is the only
interrupt that the device has.

> Additionally, in patch-3 [2], I rewrote the alarm logic to decouple
> the `interrupts` property from the alarm feature: I defined
> corresponding workaround bits in `loongson_rtc_config->flags`. This
> should be considered a SoC-specific attribute.
>=20
> Finally, two thoughts:
> 1. Retain this patch; it is correct for Loongson-1C.
> 2. For Patch-2, still add the `interrupts` property to the
> Loongson-2K0300 RTC node (as it exists in hardware), combined with the
> workaround bit setting in patch-3 to avoid the hardware flaw.

Personally, I think what you've done in patch 2 is okay, since that
interrupt is non-functional.

>=20
> Would this approach be acceptable?
>=20
> [1]: https://www.loongson.cn/uploads/images/2022051616223977135.%E9%BE%99=
%E8%8A%AF1C300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%=
8C.pdf
> (section 21.2.1)
> [2]: https://lore.kernel.org/linux-rtc/abff68dda2fe6a6601a9e58b31e278d941=
297fce.1768616276.git.zhoubinbin@loongson.cn/
>=20
> --
> Thanks.
> Binbin

--ytcyEvQbqLkTzetR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXEa4wAKCRB4tDGHoIJi
0r1UAPwNOFlUehj5qXpainyk5Vw+hUB3Cwtlc5EQxTrSF5q6IAD7BzUEiHUCKTUg
z1kTbYXkiG5phJRz1IVmRBTWgLPA2wM=
=zJht
-----END PGP SIGNATURE-----

--ytcyEvQbqLkTzetR--

