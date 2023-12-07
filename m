Return-Path: <linux-mips+bounces-572-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB480843F
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 10:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E727B1C21F88
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 09:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AE333090;
	Thu,  7 Dec 2023 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sv2QlZb+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52E32C76;
	Thu,  7 Dec 2023 09:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799F6C433C7;
	Thu,  7 Dec 2023 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701940804;
	bh=nl+7zRM+RUou0hee7Fw3E82iCj4CZDlgNOvJ1QEoImg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sv2QlZb+Ob2LJQaMP7IvnHXktcQOXq3LyiBJd+WHY3aNDCVRrPmmsXjbd4sThhsWO
	 Mv2qjo9pUGyudeNAvyNSFUmY/lYDmpqW13Hc43AahvCQiQdTaCP07u/aS4zapvGQux
	 +zY5i/GLh0RNXMRL5KTtWzsaxu+TjnNwM1gErk4xdSbeqvzlbBhz2X0QnyhbqHD94N
	 vj+hHSQ9gpLcZegPXaMgbUywNkAgWTTYCvKRbuK4BkzOpUjke1o5/ZZh9WeiDXVMig
	 E0hqdib+4jKIQ4V4GOaa5Zi52YOvhzBGyzVEULYeGXsPYGfPhJSDJcJjSMyVGXb1f0
	 Zww7wMw+b4LsQ==
Date: Thu, 7 Dec 2023 10:20:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>, 
	Donald Robson <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Adam Ford <aford173@gmail.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="at7ezwmqtv5cf653"
Content-Disposition: inline
In-Reply-To: <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>


--at7ezwmqtv5cf653
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 02:50:08PM +0100, H. Nikolaus Schaller wrote:
> Hi,
>=20
> > Am 05.12.2023 um 14:29 schrieb Maxime Ripard <mripard@kernel.org>:
> >=20
> > Hi,
> >=20
> > On Tue, Dec 05, 2023 at 09:18:58AM +0100, H. Nikolaus Schaller wrote:
> >>> Am 05.12.2023 um 07:57 schrieb Maxime Ripard <mripard@kernel.org>:
> >>>=20
> >>> On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
> >>>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs fr=
om
> >>>> multiple vendors. Describe how the SGX GPU is integrated in these So=
C,
> >>>> including register space and interrupts. Clocks, reset, and power do=
main
> >>>> information is SoC specific.
> >>>>=20
> >>>> Signed-off-by: Andrew Davis <afd@ti.com>
> >>>> ---
> >>>> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++=
--
> >>>> 1 file changed, 63 insertions(+), 6 deletions(-)
> >>>=20
> >>> I think it would be best to have a separate file for this, img,sgx.ya=
ml
> >>> maybe?
> >>=20
> >> Why?
> >=20
> > Because it's more convenient?
>=20
> Is it?

It's for a separate architecture, with a separate driver, maintained out
of tree by a separate community, with a separate set of requirements as
evidenced by the other thread. And that's all fine in itself, but
there's very little reason to put these two bindings in the same file.

We could also turn this around, why is it important that it's in the
same file?

> >> The whole family of IMG GPUs is PowerVR and SGX and Rogue are generati=
ons 5 and 6++:
> >>=20
> >> https://en.wikipedia.org/wiki/PowerVR
> >=20
> > That's not really relevant as far as bindings go.
>=20
> But maybe for choosing binding file names. Well they are machine readable
> but sometimes humans work with them.

Heh. It's something that can also be easily grepped, and the name is
never going to reflect all the compatibles in a binding so it's what
you'll end up doing anyway. But feel free to suggest another name to
avoid the confusion.

> > We have multiple
> > binding files for devices of the same generation, or single bindings
> > covering multiple generations.
> >=20
> > The important part is that every compatible is documented. It doesn't
> > really matter how or where.
>=20
> Yes, and that is why I would find it more convenient to have a single
> "img,powervr.yaml" for all variations unless it becomes filled with
> unrelated stuff (which isn't as far as I see).

Again, hard disagree there.

Maxime

--at7ezwmqtv5cf653
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXGOQQAKCRDj7w1vZxhR
xbE8AQCZfNo9oCxq0vvLhGlgv/lmiS2j6lzTN0TCD3qEYXuWvgEA8HDEG22nAn5t
tKqxvYUa7HNULBEgPKYPdGXjaC67bgw=
=r0f1
-----END PGP SIGNATURE-----

--at7ezwmqtv5cf653--

