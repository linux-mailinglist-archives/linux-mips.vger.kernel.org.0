Return-Path: <linux-mips+bounces-14192-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OQ6FBxd4mlM5QAAu9opvQ
	(envelope-from <linux-mips+bounces-14192-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 18:17:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD3741D014
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 18:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA112300AEE9
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 16:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE83534252D;
	Fri, 17 Apr 2026 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4huMo5t"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5F28F5;
	Fri, 17 Apr 2026 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442645; cv=none; b=e0OU0A7LR8WPYIARlk6mZSU7PPkxMJN/Ad9/BEUG4H6k27S9SWjuN3WjB+tCJS27no9YNdp1g1jpGARki1HYKB5r4Xt8RuljXg6A7Z5kofnwN1d6w7gCKTBPEPUyh74QvPFu2CApc97mepkIdGHIO6ISi1hnkowqU3R/bAbgKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442645; c=relaxed/simple;
	bh=8apwD0Uu49O9/L0RV1+lQTrPxFIZu8qTAZBBQWMysOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvPvWFd1MaAYA2815HzY7O25NiZq2TUuQo/jp35r/AKeIPz575pbtdXXeRQ+V0YZhC2pr6DeWOhXI5Gj27mNkiXEHEvU7bQHfzOmlkZeMyDqAkU+4BhndM6GdOU7zFn64J3Xl4htpjwHLV5KhU/qno0+HmF36uhAlUbaMeXpKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4huMo5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FFCC19425;
	Fri, 17 Apr 2026 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776442645;
	bh=8apwD0Uu49O9/L0RV1+lQTrPxFIZu8qTAZBBQWMysOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4huMo5tVUupfqMqLJvJbvXWZepfaZuz0/fPjHxbWIcVpykF+xdD98DT0MVjPhftq
	 Ib6dq2Jx2LjHcQPhXRJavO8y0KAv3jY/DY1bvhlU4Ne2Z2slSeCGsRsoqL3UXZ/Iyo
	 vLerK9pH3UVJq/NwDmk6WgNtE1nFLGsg+jp9ajWZkZ25yfaqsvkYNENWgkaw6IGHan
	 X1DH6gjj5fkKsV4i9RT2bIz2yGMLFrJCgEoa0a/UUOSKRKKuTdEBj0sNdCb4l64QjS
	 dhnS/MdTFZUzqemm/Buxvhk5gl+2a9MnzD7U4uzgmU/vQJHCTAdKYG5o73Tbtwv3ES
	 Q2uxD8ul0csHw==
Date: Fri, 17 Apr 2026 17:17:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com,
	daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Message-ID: <20260417-outlet-ascent-eefba2a4aa19@spud>
References: <20260416175101.958073-1-cjd@cjdns.fr>
 <20260416175101.958073-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ahSFO216kMteIe+a"
Content-Disposition: inline
In-Reply-To: <20260416175101.958073-2-cjd@cjdns.fr>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-14192-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,1fbf0400:email]
X-Rspamd-Queue-Id: DFD3741D014
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ahSFO216kMteIe+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 05:51:00PM +0000, Caleb James DeLisle wrote:
> From conception, this driver supported EN751627 as it is the same
> hardware that is used in EN751221. However, it was expected that
> EN751627 would use a percpu IRQ as does EN751221, this is how it
> works in vendor code. However upon finding that the "mti,gic" intc
> works on EN751627 with no modification - but it provides a unique
> interrupt per-timer, it is deemed best to make this driver use
> multiple IRQs when on the EN751627 platform.

Please drop mention of drivers here, bindings are about hardware,
whether or not the driver uses 1 or 4 interrupts doesn't matter, the
binding should have 4 because the hardware has 4.
pw-bot: changes-requested

Otherwise, this looks fine, so with that stuff culled
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/timer/econet,en751221-timer.yaml    | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> index c1e7c2b6afde..f338739e039c 100644
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> @@ -28,8 +28,8 @@ properties:
>      maxItems: 2
> =20
>    interrupts:
> -    maxItems: 1
> -    description: A percpu-devid timer interrupt shared across CPUs.
> +    minItems: 1
> +    maxItems: 4
> =20
>    clocks:
>      maxItems: 1
> @@ -52,21 +52,31 @@ allOf:
>            items:
>              - description: VPE timers 0 and 1
>              - description: VPE timers 2 and 3
> +        interrupts:
> +          description: An interrupt for each timer (one per VPE)
> +          minItems: 4
>      else:
>        properties:
>          reg:
>            items:
>              - description: VPE timers 0 and 1
> +        interrupts:
> +          description: A percpu-devid timer interrupt shared across time=
rs
> +          maxItems: 1
> =20
>  additionalProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>      timer@1fbf0400 {
>          compatible =3D "econet,en751627-timer", "econet,en751221-timer";
>          reg =3D <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
>          interrupt-parent =3D <&intc>;
> -        interrupts =3D <30>;
> +        interrupts =3D <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&hpt_clock>;
>      };
>    - |
> --=20
> 2.39.5
>=20

--ahSFO216kMteIe+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJdEQAKCRB4tDGHoIJi
0hSOAQCaJODtAPQb5wGy//l8xDIYl60EXO9mwMqpJ7jVMXy+CwEAvkrqwFkte9qD
UOZywla/ZGFA1/MhHGy7LTAp0dwhuQ8=
=EmxE
-----END PGP SIGNATURE-----

--ahSFO216kMteIe+a--

