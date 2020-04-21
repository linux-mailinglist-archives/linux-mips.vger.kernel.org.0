Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB05C1B2E28
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 19:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgDURTE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 13:19:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:40090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbgDURTD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 13:19:03 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7FE82070B;
        Tue, 21 Apr 2020 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587489543;
        bh=jX75WsUbyBuX7mDPG2wJuZG6PvLcNk/t0JUcx7zHqwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LdmO0c28NFZPb/5vkmiTmMlGrzG1RDnyltbVxvhtp6BvG5lc+CKSxFcwnyig/RfSH
         +x9JzgzY5gqzBfSzlx+Vb5wZgnvHZyZpa5ryKFJA5Bd4mpRxQ+gqoZT1UKn6c3vl6H
         R7ZAdvRBtbmyUmL9xLRzA5hXJ42eA6R9oJmiGCes=
Date:   Tue, 21 Apr 2020 18:19:00 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: txx9: add back the hack for a too small
 resource_size_t
Message-ID: <20200421171900.GF4540@sirena.org.uk>
References: <20200421171136.288216-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
In-Reply-To: <20200421171136.288216-1-hch@lst.de>
X-Cookie: Non-sequiturs make me eat lampshades.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2020 at 07:11:36PM +0200, Christoph Hellwig wrote:
> Looks like I misread the Kconfig magic and this driver can be compiled
> into 32-bit kernels.  Add back the hack to extent the range of the
> resource_size_t, and include the header with the txx9-specific ioremap
> magic for that.

Acked-by: Mark Brown <broonie@kernel.org>

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6fKwMACgkQJNaLcl1U
h9DtTgf7BfvGEuEV5UX+vLAJXzbOGxkp2fia6NUiVsDU307CXn+/Mv31zV7TT/pB
8cUnYrvIzQv0LjKAGkZnjTKeBoWXy4Dvc91EHuLejmcvSUBjIxenFPIXeDgs3KE/
+OASpbRgdfonLMaULe4AZSsbLokerVIFeDihx2oQxSkpOYQFXKO0/+9m2YtwQg8a
LnG4ZAPkhJFQdYMWW01kpTxnIDz+uD0BsI+kswBa4usIuwVzJ3dBDBszGvXeb6Nt
THJoVL469sSymrANmpqH3JuaEZP1oLLtAWDhM/gPUYXY4E1bfkdbnZ+1c+xtT6mB
Bsj9erJHQglEeL0IKDWG/OL8tKsA2A==
=Nqby
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
