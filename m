Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82A81ACCF0
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408379AbgDPQMa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:43270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728873AbgDPQM3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:12:29 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29CBC206B9;
        Thu, 16 Apr 2020 16:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587053548;
        bh=UBXmzFhBpFgoY6vyEgZDx/G29gEPaaN/4bc/3OJtawE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VIZX6WdXWGiQrMeDr2VMTqHBvMeh3c2VpUcozveNJsTJeaH7EW4QSN7gl+a5FZuLB
         6trTiRAk9+2FGitd9VrRmDcoYphRYgEFrXs2+/AZMTrMjueRSQwPhx4k43Rxh1xLQ/
         idLywQ7FmJEwBUTYf+Cb8idVbattvmERHkTFWLwk=
Date:   Thu, 16 Apr 2020 17:12:26 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/7] ASoC: txx9: don't work around too small
 resource_size_t
Message-ID: <20200416161226.GN5354@sirena.org.uk>
References: <20200416150011.820984-1-hch@lst.de>
 <20200416150011.820984-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NJSRbAqOy4NeGDns"
Content-Disposition: inline
In-Reply-To: <20200416150011.820984-2-hch@lst.de>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--NJSRbAqOy4NeGDns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2020 at 05:00:05PM +0200, Christoph Hellwig wrote:
> The txx9 sound driver deends on HAS_TXX9_ACLC, which is only set for
> three tx49xx SOCs, and thus always has a 64-bit phys_addr_t and
> resource_size_t.  Instead of poking into ioremap internals to work
> around a potentially too small resource_size_t just add a BUILD_BUG_ON
> to catch such a case.

Acked-by: Mark Brown <broonie@kernel.org>

or can I just apply this independently of the rest of the series?

--NJSRbAqOy4NeGDns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6Yg+kACgkQJNaLcl1U
h9DEbgf+JwzZc2jhXpAP4FvODQGQv1h0Vc/XAbA4UGDH2HWoKz9NJ+pIUCfuCnOw
DAysKMiHzprQKBvLH5LmrsMjHlzCGa8tzGqf3FjRxRTEcTZwwzlHk/1+e12JctPK
QZsERfcmkEvJcJajNoafnFi9DbHHzJvY2hd32zbrY97sgAXhqy7XhkFgvXKJBXZI
sGrWoQS+vxQeQUzLToCWwNLo8akrKGmBX0oSvOf+9vgeqg3PF5ShpxjOyJs74nOc
32mw8r9AB5A+K7QKVIe3Q4x9irWxv5kxQ7O09gqJ/PQZTeaJZ3XqnJ0uMMs5SadH
gV4+DtvO63MROj2M0JdqnVWDPMjvjw==
=uLa8
-----END PGP SIGNATURE-----

--NJSRbAqOy4NeGDns--
