Return-Path: <linux-mips+bounces-14613-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBVyLM/5CGrzCwQAu9opvQ
	(envelope-from <linux-mips+bounces-14613-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:12:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9355E35D
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E7BA3003801
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1838B3932F0;
	Sat, 16 May 2026 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEFngEkD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E53750B2;
	Sat, 16 May 2026 23:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973130; cv=none; b=hMvYgXU3xNpJzqI1OzV4PoPuKnnDbkQh3bSbWFYZJ6J5TsTTSPpGZnbRBmk82z+VyejKvhvMbUnsnPB4SHM3KfEO5CMb0MsJv9cqcRPheqHZrwGFUdJKcI/vTo/Rlw+6P5rV7T7KIOcIcsrkZTJxqJqyYlITRPAKZ0sxDiGdkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973130; c=relaxed/simple;
	bh=LeUa/ZHAxHXoBiN1flUfAXHTIF8MVVncZaDQMDkVAjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MecPQX+a8v36NX70H2JKFmUeyLMMsZtX1URko2LQNlDlSgv0vKbTGH149Ng7XWHO6fzSFp+cdFqrFC9g4niBic8C+1cf1i8Erh+oelB5S6P41rNx9C9/fKZSte1OEKBVkrbuJ4BT87z9fSKxF93+ILsqlJKerxKWruvWzTsQBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEFngEkD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5408EC19425;
	Sat, 16 May 2026 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778973129;
	bh=LeUa/ZHAxHXoBiN1flUfAXHTIF8MVVncZaDQMDkVAjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEFngEkDMStnzVxUs2+OhpDt+1571NDoqVKMfFawIv6pib6mlBiL0UQKsDXkUw6RW
	 qt15C8YNWLs49ammQZ1Pr+e9vZPebeBVn5sy5R6KpPB+XlUVGYmcDE+G+Grigu8NRQ
	 Qv6qGhLVdse0JW3kNFvrYjNwBuzs2Tfce1Iy7Pq+AM1NS/l+UGOtHLlsHkRnMJ+66d
	 AkkpQjeYs/pQ+D3IoAGe94NF8yxDhgQ5nB4Y8MYlD+SqAkoq1m5fy7e3qboKBfpM14
	 INh69kx9yiY86YzkOrjLX48SRJ4CoZ2IRUliSxB0tg6StlolYLczin5lLkI5lWTKYa
	 qCZbN1cN8p/Pg==
Date: Sun, 17 May 2026 00:12:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, conor+dt@kernel.org,
	daniel.lezcano@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	naseefkm@gmail.com, robh@kernel.org, tglx@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Message-ID: <20260517-cathouse-spiral-6a56c30ec223@spud>
References: <20260516215720.4160831-1-cjd@cjdns.fr>
 <20260516215720.4160831-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B5La+Mptp6gvMym4"
Content-Disposition: inline
In-Reply-To: <20260516215720.4160831-2-cjd@cjdns.fr>
X-Rspamd-Queue-Id: BEF9355E35D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-14613-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,microchip.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1fbf0400:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cjdns.fr:email]
X-Rspamd-Action: no action


--B5La+Mptp6gvMym4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 09:57:17PM +0000, Caleb James DeLisle wrote:
> This hardware is found in the EN751221 SoC family as well as the
> EN751627. The former uses a percpu IRQ for all timers while the
> latter uses an individual IRQ number per timer.
>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/econet,en751221-timer.yaml | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> index c1e7c2b6afde..16f32741473f 100644
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> @@ -12,8 +12,9 @@ maintainers:
>  description:
>    The EcoNet High Precision Timer (HPT) is a timer peripheral found in v=
arious
>    EcoNet SoCs, including the EN751221 and EN751627 families. It provides=
 per-VPE
> -  count/compare registers and a per-CPU control register, with a single =
interrupt
> -  line using a percpu-devid interrupt mechanism.
> +  count/compare registers and a per-CPU control register. On EN751221 it=
 uses a
> +  single interrupt line using a percpu-devid interrupt mechanism, and on
> +  EN751627 it uses an interrupt per VPE.
> =20
>  properties:
>    compatible:
> @@ -28,8 +29,8 @@ properties:
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
> @@ -52,21 +53,31 @@ allOf:
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
> -        compatible =3D "econet,en751627-timer", "econet,en751221-timer";
> +        compatible =3D "econet,en751627-timer";

This is not going to pass dt_binding_check.
Please remove my ack until this is fixed.

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

--B5La+Mptp6gvMym4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagj5xAAKCRB4tDGHoIJi
0nHOAPwIJSD2j/JuVJMI0DZeaPv7ZyXJZZnON1vxeZ+Tx1cmUgEA3mCyqTo4QNsL
9lUnnEgrv9jQKrWfb+CcYtMPvj00pwU=
=p6ab
-----END PGP SIGNATURE-----

--B5La+Mptp6gvMym4--

