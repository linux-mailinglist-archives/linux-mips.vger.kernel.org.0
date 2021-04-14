Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B507C35F616
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 16:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhDNOWJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Apr 2021 10:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231770AbhDNOWI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Apr 2021 10:22:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEC2660E09;
        Wed, 14 Apr 2021 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618410107;
        bh=YNNRj2u7BdAHG59JR6BW6NVLzaJPqdTTe1vruxvvEIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VirPXHKVg7Yl9/9H/rjVIwdD5sFnOSy3vub+O2Q+1KqrtOGnHwF5T0l2GW7Q1gJQ5
         uPAXicvZaGuSZNyy4guPJSH/h8IIAafz/o9Aa+6QeV+CrkNopFwQvtOjMMt75hFwQL
         Vz02zlVeg6Rc3orHqG3oXU2zUG2W5pZX5hdhSIKHj9WZmic1KotQ4VxUs5UXFL5zfm
         uoT3Fx9NmjUK6OpRIezGIbBrVmlAJ2eqCiD9Mt0cvjsjJpmriPTi5qrLD9rwAk5wwX
         kL0Y/yljbaHpQ48SZLtUHk6z3RBIxAxkMArF2XK+3Is4vc3l2lTKAhlukNFhaOaDZx
         Z5064ocdwT72w==
Date:   Wed, 14 Apr 2021 15:21:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     paul@crapouillou.net, alsa-devel@alsa-project.org,
        lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH] ASoC: codec: remove unused variable
Message-ID: <20210414142125.GA13758@sirena.org.uk>
References: <1618370677-4559-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <1618370677-4559-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Cookie: Ginger snap.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 11:24:37AM +0800, Jiapeng Chong wrote:
> Fix the following gcc warning:
>=20
> sound/soc/codecs/jz4760.c:201:6: warning: variable =E2=80=98ret=E2=80=99 =
set but not
> used [-Wunused-but-set-variable].

This doesn't apply against current code, please check and resend.

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB2+mQACgkQJNaLcl1U
h9C+yAf+JzMtHCR7yqmPgEcucV/uizpLuRZd0CNMXys5FR9O6YTwaGV4Vk5A+Zi/
Yyt6vOGywVWmu0Yh5kKGN+ZmtcTKnbf2L7e5OlvfQd5s13rwYgOXCvLoo+aPHfcs
Tc1JNo8jDJN2qlmxgIlKvN2TmBEqTNmCixRsG03EhpdJB1z41ltT4FSoUeJVC73q
IuX9UVk8ikUEJdkNMdm3XukrWyewvFb9a7HZdq8HVn14Pv3arLKA/k3V82kPyYTI
W8YEvu+VmCc3iPLvPEu3MgmsZjkHt4iGaBtOOKnCIOSfc5icSOaaZPV0vneJVRah
/fQerNIlNwjuQDJCRCz4U/s7X7tuqw==
=WYPm
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
