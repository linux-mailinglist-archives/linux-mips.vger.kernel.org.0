Return-Path: <linux-mips+bounces-10182-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 068ECB211C7
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AA4618A5CD4
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 16:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A89F2E4266;
	Mon, 11 Aug 2025 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fx6M2Shw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102A296BC0;
	Mon, 11 Aug 2025 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928801; cv=none; b=tY+AKdCx/mBgyHkwqn8nVBe+rjB1TBtjcVn0hFzhYwdlqiEvE5Jr1XvAPjZE0pXQqjxQdAi+6/QndmYRaOcUXbU6hons2D+kiPsBZ4JfoprQdcRzB3Sa1zCRnM1/TwEy9X9W1iMIeRmD31nUHen6NiPwWpWdET/uxMH0Lvoj3vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928801; c=relaxed/simple;
	bh=59YF49HsdDea5pFOU5Q6CTqcxNxXxwJGhoboWlXhRm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnVlJW6+SClR0RQ406RTi81F/UrVRKfkZEf8oxM/drEHuhDoEOUVqp2sFzSQ4sVtfaUI+aaBRT6hGzAZdqUnSSqocXd0OqSc2Du/jPu1+mU6jhiHIobAxXFzppY7WFXhiG3DOpC6dsT2Plhan7wVCQtmz2wIQhxUHrROMa0TQvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fx6M2Shw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD96DC4CEF5;
	Mon, 11 Aug 2025 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928800;
	bh=59YF49HsdDea5pFOU5Q6CTqcxNxXxwJGhoboWlXhRm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fx6M2ShwOmKUXCf5H3jPMdm7pdqbczbqR2xhhLGQd++lR7HoAV4EGomKUbnu37X87
	 SpNM0l6Wq64ZW0ul1RaxI5hi/TKhDnEzNUe/8u+UTdlh4sre/C6JGjl9BcFsXfekCE
	 i1EBxN7jcX1XX5Wm8stjslpFCCUEQMlvyp+LCh1BDHg7Q0AgMhtFPFunG050GoMQLe
	 PRLG7Ja2M0khipsU0JCfsfAS4/NbIG310c/grndlhjXAYqnMi+WUARoSrzYRdgGPbO
	 sLhSBDpc7VYVwqVwpLdGZ8rhzAT4BDEgiz0Ez5DW3Qng16qmalPp6BDruBSC2mlz45
	 OwJJ+cWZoTHCg==
Date: Mon, 11 Aug 2025 17:13:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, zhouyanjie@wanyeetech.com,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: cpu: Add MIPS 34Kc Core
Message-ID: <20250811-grandpa-saddlebag-fac89b7ff921@spud>
References: <20250811092048.497087-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rkr/MDJYTRoVj5tS"
Content-Disposition: inline
In-Reply-To: <20250811092048.497087-1-olek2@wp.pl>


--Rkr/MDJYTRoVj5tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 11:20:36AM +0200, Aleksander Jan Bajkowski wrote:
> Document MIPS 34Kc device tree bindings. It is used in the Realtek
> RTL930x SoC.
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Rkr/MDJYTRoVj5tS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJoWnAAKCRB4tDGHoIJi
0rV5AQCxaDznGfmATy89c0TPtXhwaGf/yRXKR/1bUCUtGJ0pagEA6DkTyJiEo13f
RPSkTM8fpROW2Lb8ZddDamy3cxxFPgE=
=G/ck
-----END PGP SIGNATURE-----

--Rkr/MDJYTRoVj5tS--

