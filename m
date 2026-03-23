Return-Path: <linux-mips+bounces-13892-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOPtLcl1wWkQTQQAu9opvQ
	(envelope-from <linux-mips+bounces-13892-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 18:18:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2D2F9B39
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 18:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1007631B1711
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 16:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3F23C060D;
	Mon, 23 Mar 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n00EbOpm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD0B38F62C;
	Mon, 23 Mar 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284367; cv=none; b=Qm433KqJOX0Zg9i1cxcqWoT+pvMwXSUzW3R6R+FEz0yJZTZYoR4sOTqx4wuc5j8d5udW92LRri1zn/kONJY5oAjKoUZVbqH7McE108EgzUOGTnhAnasEs98VKGrdLbLcN40PjmHWLKYROx+VCIDzIj82ORBFuskRKukKqAoJng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284367; c=relaxed/simple;
	bh=UQ/ZOtbTSd55Z3dQmxKybwjS+KwdP/Gv1h4aUvDQhFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCAby2ewJY+x3+CiWYELT2q8pt2s2G8Nve/keUZvXorOFNdxxZiQwHUbi9GTyeiBLf1lLgdNHRyHJVLBOLy55vd+yB2jHQAVOw+MHWzpUth9FWLGoc+dWoB+JFVJWqfFL00k4iksDFwOi9Wi+kxF1RQfNDQRgeeYT6voUBwHTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n00EbOpm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFF7C4CEF7;
	Mon, 23 Mar 2026 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774284367;
	bh=UQ/ZOtbTSd55Z3dQmxKybwjS+KwdP/Gv1h4aUvDQhFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n00EbOpmZSb6zJBZfrw86P01oXC6xCUEjdaib5l4M4+rN5fpbHpuPSNCQILCVw82w
	 Oz+1/mL838OYGpHCGPBP8DOiBj1Fi5N0//QYkDq+tcFVEbk54UeuHsV3y8qi/a2/6b
	 zZSdcALKKX8l6mCgIudWCEAjcfGMVy33sxbJ+Sa88ZDwjsd6UdGtnwczmeS+NT8din
	 +XkdBuLmJgfj0jF9l05br3qdl2Nw13QDgug+fqOP+6BudC06s3CsVvEZTNM2JtZgFJ
	 ky1EFRH53HP6koh0lc/TPvaIJnMa0hcfki2OuxOOYf98TjNxQHg46lo1c+ITBCRhqZ
	 f4YnnOAbpmeQQ==
Date: Mon, 23 Mar 2026 16:46:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: paul@crapouillou.net, linux-mips@vger.kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: jz4725b: Convert to devm_clk_get_enabled()
Message-ID: <6ea39b8f-289e-4327-9495-384f30866d4f@sirena.org.uk>
References: <20260323161551.47181-1-jihed.chaibi.dev@gmail.com>
 <20260323161551.47181-2-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mBuvFgwUMqJUbsYq"
Content-Disposition: inline
In-Reply-To: <20260323161551.47181-2-jihed.chaibi.dev@gmail.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13892-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[crapouillou.net,vger.kernel.org,gmail.com,perex.cz,suse.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2BC2D2F9B39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--mBuvFgwUMqJUbsYq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 05:15:49PM +0100, Jihed Chaibi wrote:

> Use devm_clk_get_enabled() instead, which combines the get, prepare and
> enable operations into one call whose lifetime is tied to the device.
> This removes the need for explicit enable/disable in the component
> probe/remove callbacks, and ensures that clock enable failures are
> propagated as errors rather than silently ignored.

This will increase power consumption a little bit in the case where we
don't actually instantiate a sound card, the clocks will be turned on at
device probe time.  How often these systems don't have a sound card, and
how noticable the additional power consumption from running the clocks
is, are separate questions - it might not be worth worrying about.

--mBuvFgwUMqJUbsYq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBbkoACgkQJNaLcl1U
h9C2hgf/aYHeTJjUrJwQgXfP4I2Z21GE2xQiTs7Dxkp+mC3ZZiH7qjpMBtSCHYLb
F6Zrp3KMWFCg6IZt3AmqABsiXIF6nKx1vJCLf0R6Sq5AYLduKHq2Sswwv3/aJYVC
SLSn5D+iK+ZJHvOHOFcokWArwHO6r2TIMco0mzWkR8xFUBG1oUQ4k1izPi2ksNK2
m/UMpwKVGvqZlXrjTrKOAAH90brvz+sGCnoKqEvbCNNXdKMGdwoUKBNHgFuGXRwy
a7HKyg4zEbGDyCapJEQpwCQ8rhatcdrThxucf2nyjuUxYavh2puPKsNaKZwrKKqX
NlL2KOT04kgrhxmsLb8yk0F4F+nwsw==
=fuRS
-----END PGP SIGNATURE-----

--mBuvFgwUMqJUbsYq--

