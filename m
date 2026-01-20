Return-Path: <linux-mips+bounces-12975-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JA6G6Pqb2m+UQAAu9opvQ
	(envelope-from <linux-mips+bounces-12975-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jan 2026 21:50:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3164BC08
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jan 2026 21:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C3411A0C8DE
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jan 2026 19:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2D7478E31;
	Tue, 20 Jan 2026 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeCjTyYn"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E5633D503;
	Tue, 20 Jan 2026 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937055; cv=none; b=WN00EveBp2gfJyNElRFvZ1kOs5Ebk/QpUdqp1RKnhnlR/JOB/EX8ouITYu4Fqri9WweaWadz6TQVouHcs7Mr+RftFwKRmVaHTFZuPen4gEfoOmgGuBCIhVb4/7ZyZwTqzHA9qLHV6P5xn4PR+WdHf5YXVqunR7Mii/EQc9fGOfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937055; c=relaxed/simple;
	bh=LSPGDVxdxLZfskYwh4ntJXztlGxHOonJ/Pc/EAyXgrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZZCmqT5sqGn1r1g8CnJt10cjLUxP9vNw6H00UrE1aSv4BV20Y/B2qHJ6wZ64JvWgdJh22gKL4QfEnWj66GxHQmSSPBCFV9IT7SYLft3K8ygOIjWqgfeG93anp5mm7IKrMznMWAqWJKmkJRIbA5C8WJe/of2xVtyxIRDiKx+kAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeCjTyYn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3030BC16AAE;
	Tue, 20 Jan 2026 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768937055;
	bh=LSPGDVxdxLZfskYwh4ntJXztlGxHOonJ/Pc/EAyXgrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeCjTyYnH6/h/8uF6l6ik0fo2x93XB0OqqG24S+3Ram+dhWrkIGplP+ddtkceb7Tl
	 lUlb96gKz7eLqtRAUtD0tsAW0+Db0PfdUIRQCTDHqxVIXodkB7fPth/GLpcrMV5x0d
	 EUtdREmOIDqTxbRQOqhLKZpAy5rXwXqpbfQ+j8mluc8JxCXZHfAear09HZJ3bbRYTJ
	 ON/gS/gPgz44dufE6UuqY4wTIiDqbD3QvqZj+ISoXZw2/sCXPEcL8GSo0C351yjBx3
	 pxQaaabowXCH+6Dt4FVJXwu/yfyL/OTMKR6dDhSF/tluReZy/dZLKqRFqyK/7X3Ihp
	 qaBbj/qZmUh6g==
Date: Tue, 20 Jan 2026 19:24:09 +0000
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
Message-ID: <20260120-cubical-harmonica-a7b7bbb26b08@spud>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
 <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud>
 <20260120075045e7e864ba@mail.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wAUtleroU8i/CJJy"
Content-Disposition: inline
In-Reply-To: <20260120075045e7e864ba@mail.local>
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
	TAGGED_FROM(0.00)[bounces-12975-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,bootlin.com:url,microchip.com:email]
X-Rspamd-Queue-Id: EE3164BC08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wAUtleroU8i/CJJy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 08:50:45AM +0100, Alexandre Belloni wrote:
> On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> > On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > > The `interrupts` property indicates an RTC alarm interrupt, which is
> > > required for RTCs that support the alarm feature, which is not suppor=
ted
> > > by the Loongson-1C RTC. We exclude it for a more accurate description.
> > >=20
> > > Changing the `allowed` property is ABI-breaking behavior, but
> > > throughout the existing Loongson DTS{i}, the description of the RTC
> > > nodes conforms to the modified bingding rules.
> >=20
> > Right, changing properties is an ABI break, but when following the ABI
> > would've produced something non-functional, breaking it is not really
> > relevant.
>=20
>=20
> But the HW has the interrupt, the fact that is not functional doesn't
> mean it isn't there. I thought we should describe the hardware?

Does the hardware have it? My interpretation of the commit message was
that it didn't have the alarm feature and thus no interrupt? Unless the
interrupt has some other purpose, in which case yeah we shouldn't accept
this change and only the new device should permit there being no
interrupt.

>=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
> >=20
> > >=20
> > > Thus, the existing Loongson DTS{i} will not be affected.
> > >=20
> > > Fixes: 487ef32caebe ("dt-bindings: rtc: Split loongson,ls2x-rtc into =
SoC-based compatibles")
> > > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  .../devicetree/bindings/rtc/loongson,rtc.yaml         | 11 +++++++++=
++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml =
b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > > index f89c1f660aee..fac90a18153e 100644
> > > --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > > @@ -42,6 +42,17 @@ required:
> > > =20
> > >  unevaluatedProperties: false
> > > =20
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > > +          - loongson,ls1c-rtc
> > > +
> > > +then:
> > > +  properties:
> > > +    interrupts: false
> > > +
> > >  examples:
> > >    - |
> > >      #include <dt-bindings/interrupt-controller/irq.h>
> > > --=20
> > > 2.47.3
> > >=20
>=20
>=20
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--wAUtleroU8i/CJJy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/WWQAKCRB4tDGHoIJi
0mn/AP43jnywh9Iriywei4qmEhxIxv4dAHCkLsmZAd9rkv4/IQD+JwBwbjIW1k5/
8nNDMbQlTAQNEYfUnJQFA4IRoYdODAM=
=Xl/3
-----END PGP SIGNATURE-----

--wAUtleroU8i/CJJy--

