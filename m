Return-Path: <linux-mips+bounces-3852-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A606C9133C1
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 14:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F7128320F
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 12:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E62155C87;
	Sat, 22 Jun 2024 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdIPNY/l"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818C155741;
	Sat, 22 Jun 2024 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719058123; cv=none; b=O+8+du9+JNA7ApMu3BWLZgEgH63Ohc4dp69kNTfQT7H6ARQ0X7mhCG16Jcl861UgLxE3JBZ9B6WQAOOInMXL+Iib8qQCjFEbkH4Uddof1rQ7Oeu7bAYQW2j4cmqJ2k5ljrjEk/Pj4HxQ48jzKDOSkMmhWSBQ/dXvXzcVDBRC7Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719058123; c=relaxed/simple;
	bh=9RPPvc9SMnBGZ2bc1d22yHIaQyWFTPR9BFNQZIFnb8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHwVnBHlJvlLmUW/M4WSiEflXicdZpYRJ1shQpAwPgL3GhkB15kawgl53jQhAtzwpIuiK0V116PfsKv+BM2+OAYD36uKT0DmKN3WTNxC/nePd7njhPE6/VvAQJnnZLls5jxI9gmI40DKWokGLF+S7f6+MnUpSiAQl6o2dfzAF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdIPNY/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D08C3277B;
	Sat, 22 Jun 2024 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719058122;
	bh=9RPPvc9SMnBGZ2bc1d22yHIaQyWFTPR9BFNQZIFnb8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdIPNY/lFg38ZtH1vGsnQEr1S0X7q1OnIPI5xqQkq+JQ6e556xvYwPxv/fS1d/T45
	 EDo8PySaP9nU+ZflabwLZBNDS2uwNXdzdqFv9rI+PUqKAcBL66TTr9Tkne5js/o/mR
	 WUg3QJbEb8yIqkizE9bgccccaDY0nrGXeCSP6PlEgkpX7Ru22lAfVcllPEhflq4YnO
	 hctcoAXKDMWAJMnoVpbAlWc8lqAGvuEi0Hm001Uce+9ZfCdRC5oExX/BQ94iRksmQ5
	 miyj2xPk2mYd7/pJCBFq/Q+G66aG81SmPRrkHaA8ljsFHA197zqhjAnCAesArNeQSe
	 hV/bTAKi49L3g==
Date: Sat, 22 Jun 2024 13:08:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org, paulburton@kernel.org,
	peterz@infradead.org, mail@birger-koblitz.de, bert@biot.com,
	john@phrozen.org, sander@svanheule.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
Subject: Re: [PATCH 3/6] dt-bindings: interrupt-controller: realtek,rtl-intc:
 Add rtl9300-intc
Message-ID: <20240622-pointing-undamaged-3a8282b44425@spud>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
 <20240621042737.674128-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nhBZ4Dhi0BcDST1Q"
Content-Disposition: inline
In-Reply-To: <20240621042737.674128-4-chris.packham@alliedtelesis.co.nz>


--nhBZ4Dhi0BcDST1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 04:27:34PM +1200, Chris Packham wrote:
> Add a compatible string for the interrupt controller found on the
> rtl930x SoCs.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--nhBZ4Dhi0BcDST1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZna+xQAKCRB4tDGHoIJi
0vPUAP9DUS0LcodyxmzTAhwQtkd5mEF+2+oG4M8z67BkAtuYUgEAh389p1ZfkJ2v
NHAoULhSy4QF7vWdtFDR6R58bP96vQg=
=RSvy
-----END PGP SIGNATURE-----

--nhBZ4Dhi0BcDST1Q--

