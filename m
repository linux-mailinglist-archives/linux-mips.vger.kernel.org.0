Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A33A1A32D7
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 12:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgDIKxs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 06:53:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgDIKxs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Apr 2020 06:53:48 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29C1320857;
        Thu,  9 Apr 2020 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586429628;
        bh=BZVpag0qQETEDSuxALqBEW3mh5PAYg0YPSQ6u6hT+os=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tTiZNE4MZTrKG51Y9OasNhBTM4o2bQLbPf4Wf7/YAQELzNOT+AZAkgn2K0xhT4IA2
         HuyI4p0Y0c92dYiCkVqvymJQgjD6EbHBHAoaHwPXk/+7v+O7zifx1qUnqixV55VStn
         4PNGjE29VSHGt8vR/xAWJjchP4WQ81ol1wBUKig8=
Date:   Thu, 9 Apr 2020 11:53:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
        linux-m68k@lists.linux-m68k.org,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 07/10] clk: Allow the common clk framework to be
 selectable
Message-ID: <20200409105346.GC5399@sirena.org.uk>
References: <20200409064416.83340-1-sboyd@kernel.org>
 <20200409064416.83340-8-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <20200409064416.83340-8-sboyd@kernel.org>
X-Cookie: HUGH BEAUMONT died in 1982!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 11:44:13PM -0700, Stephen Boyd wrote:
> Enable build testing and configuration control of the common clk
> framework so that more code coverage and testing can be done on the
> common clk framework across various architectures. This also nicely
> removes the requirement that architectures must select the framework
> when they don't use it in architecture code.

Reviwed-by: Mark Brown <broonie@kernel.org>

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6O/rkACgkQJNaLcl1U
h9C8bAf/SJkvvbTRmpOunw3fAHei1NkJ2RUZ/Ax5l+NwzvC+fSezjkGHKH+2LVOV
6vTimPH4EKoGc/4RRBVRSrlp20QY/mz4/7+/Ojsrfp9KsWdcH167Zd26sYP3kSy2
8jxnHBccoWJ8B9p9YVYslrMb0+y1mjnfLOsBioILN1wa6R2vuv7/JXuu1FmaeYLl
geaZWL7Aw8Knj421ywLqEbg57Zd7M/2ei5gI/plDWIS+UoeuPPPhsUCVkza76DOE
pyvpA21x2ceFOmCTq0O5O2a/WlM8xwfklNLML6wx3NSS02WWiqnAbMS3sZ9Adk50
k7m1LMdfWu/q1CQwp58kVOsZJVWZ4g==
=+bDI
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
