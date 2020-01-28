Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA8514B3D5
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 12:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgA1L6T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 06:58:19 -0500
Received: from foss.arm.com ([217.140.110.172]:55802 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgA1L6T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jan 2020 06:58:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AC31101E;
        Tue, 28 Jan 2020 03:58:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D65B03F52E;
        Tue, 28 Jan 2020 03:58:17 -0800 (PST)
Date:   Tue, 28 Jan 2020 11:58:16 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Qian Cai <cai@lca.pw>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Anshuman Khandual <Anshuman.Khandual@arm.com>,
        Linux-MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20200128115816.GA4689@sirena.org.uk>
References: <a7ba6d8a-6443-5994-6a34-2824aa9b054b@c-s.fr>
 <144F3894-7934-4EC7-A9F9-C6A84CA08C65@lca.pw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <144F3894-7934-4EC7-A9F9-C6A84CA08C65@lca.pw>
X-Cookie: Doing gets it done.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2020 at 02:12:56AM -0500, Qian Cai wrote:
> > On Jan 28, 2020, at 1:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> > ppc32 an indecent / legacy platform ? Are you kidying ?

> > Powerquicc II PRO for instance is fully supported by the
> > manufacturer and widely used in many small networking devices.

> Of course I forgot about embedded devices. The problem is that how
> many developers are actually going to run this debug option on
> embedded devices?

Much fewer if the code isn't upstream than if it is.  This isn't
something that every developer is going to enable all the time but that
doesn't mean it's not useful, it's more for people doing work on the
architectures or on memory management (or who suspect they're running
into a relevant problem), and I'm sure some of the automated testing
people will enable it.  The more barriers there are in place to getting
the testsuite up and running the less likely it is that any of these
groups will run it regularly.

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4wIdcACgkQJNaLcl1U
h9Dslgf+KrZOvdjyO1AcLfLIlE2wA+hRmygG3Gh1YQ9wI6n+03XnA4v7f+7zZaQd
9nylNBzkErkupokycsWYhTEFN7o/tfjVGWte16XdQ1QHQE7npjULPGC5NcVVPfyc
qwaW2i5J5TeAuYArz3YCqLvUY6IAJefbxhZbLXTTBnwINIazuBDiAUzsAd/Uy27Y
x0YHtX4gXucyNEepoozxS07544hKbMvjTO0tt7P8egTTGwNHz+Uz6sMfUA/Muri7
hIJbxM03+cRn9ZKlTca/PzsXJN87ZLvWwcB0TGz+xI3Bjx2D2Q7Dn+OROr2O8e0z
WXNLV2W9WAaBOwArY4IHdeORokpCzg==
=j0+e
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
