Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1980C1B385E
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 08:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgDVG7G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 02:59:06 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:35287 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725810AbgDVG7G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 02:59:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 200DC580411;
        Wed, 22 Apr 2020 02:59:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 22 Apr 2020 02:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=OBWSZn5yL6C+0MElTSOqVaCW++0
        OPBYI5fNYvq+pEHg=; b=bMf9CAeA2qQJ910ltYGk8M4n59VpYtkxPbBsMY2mF5k
        C1D31j+DGMJXFMWafxFzzKxiq47wKyniw3lDYVX8i+l1jX6c1eF0tRk1GkWSOZ3S
        qnQx8xbO7JetKyD63x0fh9OS6F1ywCpCjQly2STOccfuJfxgo9yuunQppGqXg5/p
        aKWUxDr/EzH/vdzO1LpnBug8zzlVB0FnmaEbfxetKs+hGkpChF0nmgox7nHMh0O0
        5BIslk4ShM+PagnQp8yKSPoQXx1vQ2fbejnVZAvqDvTACpC4Tz1cGlnqYzsfD0Ne
        tZimuo1fl3eN2YRUbWphh8QQzca/AabtAQoQAn3029w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OBWSZn
        5yL6C+0MElTSOqVaCW++0OPBYI5fNYvq+pEHg=; b=JMyiz1ItUJ7Ylapm1wIlks
        5Bqbb91qhD3ti0a4dYJLooFh978YTL44arqDHJxb2wrgtFsekjdc4tvR6bUzkXch
        pKr6stQFc9E5AWObMnnnMeiQtlNdNTCeBAjqxf/e3wcWvLyH6AIAYP5OLFLju3cx
        xjqn87oFWjlC4nnSyZqKMYPiAUuxjdj1m/SR1lmJr+GFT1tCcQXUpx5euYW26+v9
        j4reObSR2Ltn3FCXLvUK/FXuSOnMR0TUZNUZhmMd+1ujiVzMPTuJz3wjBzztq+sZ
        gmlgJ/hjE9qwacVfNmJMiPU+MQQB1IVRsTxM6IFfwKxhjxmB9FQ5oHAcXFrLjy0w
        ==
X-ME-Sender: <xms:NuufXtusbAAnXI2JkCPqDpOxPo7D3mglz98hgYgAdRfXoRjWfLeTUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeeigdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NuufXjH-t66UOHBgEzUFRXJ645axhWyjb7cMDnr6CdoeY4i6c_gtzA>
    <xmx:NuufXsgu3nRiTBOH0NFEPwI5UmZM_eZxBhcCzlvLV_cUtBqiC8O4Ag>
    <xmx:NuufXoBRoGuUSj9nLG6mchqic8hWu6Lt-T-uN5ZmfffKcxTZlfCEZg>
    <xmx:OOufXq3L1pOYuPd1SrFFc8u4vgA616DBjBNwoqjTW-JY4YSjxXgsLQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id BD3CD3280065;
        Wed, 22 Apr 2020 02:59:01 -0400 (EDT)
Date:   Wed, 22 Apr 2020 08:58:59 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
References: <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2amunzakhfscp3kq"
Content-Disposition: inline
In-Reply-To: <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--2amunzakhfscp3kq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 07:29:32PM +0200, H. Nikolaus Schaller wrote:
>=20
> > Am 21.04.2020 um 16:15 schrieb Tony Lindgren <tony@atomide.com>:
> >=20
> > * Maxime Ripard <maxime@cerno.tech> [200421 11:22]:
> >> On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
> >>> I had a look on genpd and I'm not really sure if that fits.
> >>>=20
> >>> It is basically some bit that verify that the clocks should be enable=
d or
> >>> disabled.
> >>=20
> >> No, it can do much more than that. It's a framework to control the SoC=
s power
> >> domains, so clocks might be a part of it, but most of the time it's go=
ing to be
> >> about powering up a particular device.
> >=20
> > Note that on omaps there are actually SoC module specific registers.
>=20
> Ah, I see. This is of course a difference that the TI glue logic has
> its own registers in the same address range as the sgx and this can't
> be easily handled by a common sgx driver.
>=20
> This indeed seems to be unique with omap.
>=20
> > And there can be multiple devices within a single target module on
> > omaps. So the extra dts node and device is justified there.
> >=20
> > For other SoCs, the SGX clocks are probably best handled directly
> > in pvr-drv.c PM runtime functions unless a custom hardware wrapper
> > with SoC specific registers exists.
>=20
> That is why we need to evaluate what the better strategy is.
>=20
> So we have
> a) omap which has a custom wrapper around the sgx
> b) others without, i.e. an empty (or pass-through) wrapper
>=20
> Which one do we make the "standard" and which one the "exception"?
> What are good reasons for either one?
>=20
>=20
> I am currently in strong favour of a) being standard because it
> makes the pvr-drv.c simpler and really generic (independent of
> wrapping into any SoC).
>=20
> This will likely avoid problems if we find more SoC with yet another
> scheme how the SGX clocks are wrapped.
>=20
> It also allows to handle different number of clocks (A31 seems to
> need 4, Samsung, A83 and JZ4780 one) without changing the sgx bindings
> or making big lists of conditionals. This variance would be handled
> outside the sgx core bindings and driver.

I disagree. Every other GPU binding and driver is handling that just fine, =
and
the SGX is not special in any case here.

Maxime

--2amunzakhfscp3kq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXp/rLwAKCRDj7w1vZxhR
xcRVAP9+eh7XB+uk8H5QIqpRYRnQPao/m3tRHXHCz92z/5kY+QEA3HL1hmXIYsGR
wTCOHiq6ZSI4eoHYRySSWAqNuTf5LwI=
=1ETM
-----END PGP SIGNATURE-----

--2amunzakhfscp3kq--
