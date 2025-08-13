Return-Path: <linux-mips+bounces-10257-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5EB2507A
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 19:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FD801C24484
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 16:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F088828C030;
	Wed, 13 Aug 2025 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Shg36sJx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43D31AC43A;
	Wed, 13 Aug 2025 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104284; cv=none; b=OBPtB8FbFhXBB7RE8zXqWZ1aCgPUMUqSb4FJ5zx8izjzvESqfgWpZD5/NMRr0w4BT4iSAXShe4QiycW4CNGqKNSoUqywOO2e7GcFbDuc4052jWaJsR0rbazNtzAQVI4/Ta3oTer9d/aB+Kp+axPpitfNO5oaB4F/L7/RtidGnGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104284; c=relaxed/simple;
	bh=CoxP6KbhVg/eAmqXNJJ1rxsZl1ruuUjtp0Sgdyj4ErA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=codY2iobBba+eEJBcy3g+GhxRRzZAIqBjnyTLPeR7rMWDCt71rhn3mtfTy2Voiv9kMaZv+ibC71GNDdX7fSav8w0bsCgfAmmyNhXSTYb0jAMgSduSuUEhI15NHr3TzknMlprOFf1fJGR3Kr802X+EaIhFO+T6s7C85yqqus8Hyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Shg36sJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357E1C4CEEB;
	Wed, 13 Aug 2025 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755104284;
	bh=CoxP6KbhVg/eAmqXNJJ1rxsZl1ruuUjtp0Sgdyj4ErA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Shg36sJx8GS6+Fg0I3Ht4bA3i5VI8ewmqRqrRE+ks9qST/WACZLAKyXmJWmGOt63Y
	 wJ1lWVL9zgNzXDDaoIUQdZjZH1kAmhXgTEYkEj5UPAZBYjPIJrWaepmKJVaxsp20IZ
	 o5GQOlP2U/gatbaR3zrLMaGnrHmhkP9nXOjLB5fQaVwh8yK034GK3cNvT4hYL0gQ+E
	 T64Z/w+qiQzuEWRTPbzsWlxbSBfJU6bg9ADQu095vVdhNfd4odkk6BL4L4av6pOkjT
	 VRdeoZlgLxvWTmSYv/PzHFtc358ajimEhPS4HCDeWp60JEKcynS31DS0WCARR0NKpC
	 SWOn1uKUlYaDA==
Date: Wed, 13 Aug 2025 17:57:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, heiko@sntech.de,
	kever.yang@rock-chips.com, mani@kernel.org,
	tsbogend@alpha.franken.de, john@phrozen.org, masahiroy@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mips: lantiq: add British Telecom Home Hub 5A dts
Message-ID: <20250813-darkened-whoops-736299c809e9@spud>
References: <20250813142917.2053814-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ZR/OfDlhmdMMO9z"
Content-Disposition: inline
In-Reply-To: <20250813142917.2053814-1-olek2@wp.pl>


--4ZR/OfDlhmdMMO9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 04:21:31PM +0200, Aleksander Jan Bajkowski wrote:
> This series adds a device tree and bindings for the BT Home Hub 5A router.
> It is based on the Lantiq VRX268 SoC. It has 128 MB of RAM and 128 MB of
> NAND memory. At the moment, only the peripherals necessary to run the
> initramfs image have been added. The remaining peripherals will be added
> later. Some of them do not have upstream drivers. This is one of the most
> popular Lantiq-based routers within the OpenWRT community.
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>=20
> Aleksander Jan Bajkowski (3):
>   dt-bindings: vendor-prefixes: add British Telecom
>   mips: lantiq: add British Telecom Home Hub 5A dts
>   dt-bindings: mips: lantiq: Add Lantiq platform binding

This order is wrong, the bindings must come before the users.

--4ZR/OfDlhmdMMO9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJzEFgAKCRB4tDGHoIJi
0g+0APsHW+K4guy0rIHbEfCwAU3gzq6hqZ546t8GtQ6Wr7Y8wgD+M2bj3jGHQ+Pv
SOjmXmI2RaxddzqFilkdGLQqKkuirwA=
=KFmS
-----END PGP SIGNATURE-----

--4ZR/OfDlhmdMMO9z--

