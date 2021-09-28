Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6EA41ADC2
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 13:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240213AbhI1L1r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 07:27:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:58068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231202AbhI1L1r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 07:27:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7925960F4F;
        Tue, 28 Sep 2021 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632828368;
        bh=R8KAqiUVcTbld8SsRhBAD3xBl/gv/DjOFjV7VeJVJDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDP54yBqAPPjJtMo6FUl3/T3DClmyQtNWx6vavSHrpsh16x4kVdk0SYdvj80Ex+M4
         Yj4H6MT1ZJPcH37iU+qXGnSM2i7cgqGyFOddHKn+i/QO+5fhah8KHxPCzdVjGgkiWn
         aadoi/Wq66w2jIYJHDiiK44z8nbbFZj/Zn+f68+nJjuJjCI/dXoDcLZv8L/5PPP6HD
         dU50BkbVZcwtl6As8COrJI8vAUqrmShnCWO6Rk4P7YDBkJL2HLE5piBcI1MWTR6Fsg
         RQhKhavzvBOk0b/x1YjTRPzr9XxB6rjo/MS5icvZViqJ7ZEIAlwE2XccdOvV0T/oeB
         xSvt2+C3tBIdQ==
Date:   Tue, 28 Sep 2021 12:25:19 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <20210928112519.GI4199@sirena.org.uk>
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928083751.GG9223@ediswmail.ad.cirrus.com>
 <CAK8P3a11c6eLRWKvQeSqvEicc9bMDeEEGV5fygTidoRzYf9KnQ@mail.gmail.com>
 <20210928092400.GH9223@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cf0hFtnykp6aONGL"
Content-Disposition: inline
In-Reply-To: <20210928092400.GH9223@ediswmail.ad.cirrus.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--cf0hFtnykp6aONGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 28, 2021 at 09:24:00AM +0000, Charles Keepax wrote:
> On Tue, Sep 28, 2021 at 10:51:36AM +0200, Arnd Bergmann wrote:

> > Other DSPs use the drivers/remoteproc/ subsystem, but that
> > is more for general-purpose DSPs that can load application
> > specific firmware rather than loading a single firmware blob
> > as you'd normally do with the request_firmware() style interface.

> > Not sure if that fits what you do. Can you point to a high-level
> > description of what this DSP does besides audio, and how
> > flexible it is? That might help find the right place for this.

> Hm... wasn't aware of that one, we should probably investigate that
> a little more at this end. From a quick look, seems a bit more like
> it is designed for much larger more general purpose probably memory
> mapped DSPs. I guess our code is a little more firmware parsing
> and loading, and a bit less generic remote proceedure call stuff.

Right, that was why I didn't suggest remoteproc - the DSPs wm_adsp
covers seem much smaller than fits comfortably with remoteproc.  You
probably could make it fit though.

--cf0hFtnykp6aONGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFS+54ACgkQJNaLcl1U
h9A8qQf/YB0k06nBX21Y0D9WiuzfAdegrPLdfUizVJ4VMq/8sIzxSUr3yXB0F0rR
iqS0ArRzG105rz27TluAzsoN7T1TngfvDTrQFvUBG8/xBjhNBbCxMyU7q9n8wNkC
Jjc5ylof97391uxN+1o72Unu/AOe8V6xhR4kqvQ/Sm827dp8UZIJmP0oFFw15Sgy
FCx2FaweLYfuqY4YKLdpPF3/dcvfli6O0itg7FnZHX1PLkqq5K+WKKcG5WEP+Jt2
gKccsPs2YJefc8ecZMLp6NU+T8bQraAKkpph7a2ahTNe6Ltt36E3zahy7cp7wjuZ
Nae3bwDF2mJrxNhyKnTwKBfRZvtAvg==
=SewW
-----END PGP SIGNATURE-----

--cf0hFtnykp6aONGL--
