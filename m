Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83066FC2F0
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 10:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfKNJrI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Nov 2019 04:47:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:36710 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726057AbfKNJrI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Nov 2019 04:47:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B254CB14D;
        Thu, 14 Nov 2019 09:47:04 +0000 (UTC)
Message-ID: <33ba915ee84839286c69d048b15758a911c02844.camel@suse.de>
Subject: Re: [PATCH] dma-mapping: treat dev->bus_dma_mask as a DMA limit
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Robin Murphy <robin.murphy@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Paul Burton <paulburton@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
        phil@raspberrypi.org, linux-acpi@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>, Len Brown <lenb@kernel.org>,
        devicetree@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Date:   Thu, 14 Nov 2019 10:47:00 +0100
In-Reply-To: <f74cd8a6-00bf-46c3-8e2e-d278e72d6e0e@arm.com>
References: <20191113161340.27228-1-nsaenzjulienne@suse.de>
         <f74cd8a6-00bf-46c3-8e2e-d278e72d6e0e@arm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-wOQXYnHdB19ozhE01VMB"
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--=-wOQXYnHdB19ozhE01VMB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-13 at 20:34 +0000, Robin Murphy wrote:
> On 13/11/2019 4:13 pm, Nicolas Saenz Julienne wrote:
> > Using a mask to represent bus DMA constraints has a set of limitations.
> > The biggest one being it can only hold a power of two (minus one). The
> > DMA mapping code is already aware of this and treats dev->bus_dma_mask
> > as a limit. This quirk is already used by some architectures although
> > still rare.
> >=20
> > With the introduction of the Raspberry Pi 4 we've found a new contender
> > for the use of bus DMA limits, as its PCIe bus can only address the
> > lower 3GB of memory (of a total of 4GB). This is impossible to represen=
t
> > with a mask. To make things worse the device-tree code rounds non power
> > of two bus DMA limits to the next power of two, which is unacceptable i=
n
> > this case.
> >=20
> > In the light of this, rename dev->bus_dma_mask to dev->bus_dma_limit al=
l
> > over the tree and treat it as such. Note that dev->bus_dma_limit is
> > meant to contain the higher accesible DMA address.
>=20
> Neat, you win a "why didn't I do it that way in the first place?" :)

:)

> Looking at it without all the history of previous attempts, this looks=
=20
> entirely reasonable, and definitely a step in the right direction.
>=20
> [...]
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index 5a7551d060f2..f18827cf96df 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> > @@ -1097,7 +1097,7 @@ void iort_dma_setup(struct device *dev, u64 *dma_=
addr,
> > u64 *dma_size)
> >   		 * Limit coherent and dma mask based on size
> >   		 * retrieved from firmware.
> >   		 */
> > -		dev->bus_dma_mask =3D mask;
> > +		dev->bus_dma_limit =3D mask;
>=20
> Although this preserves the existing behaviour, as in of_dma_configure()=
=20
> we can do better here since we have the original address range to hand.=
=20
> I think it's worth keeping the ACPI and OF paths in sync for minor=20
> tweaks like this, rather than letting them diverge unnecessarily.

I figure you mean something like this:

@@ -1085,19 +1085,15 @@ void iort_dma_setup(struct device *dev, u64 *dma_ad=
dr,
u64 *dma_size)
        }

        if (!ret) {
-               msb =3D fls64(dmaaddr + size - 1);
-               /*
-                * Round-up to the power-of-two mask or set
-                * the mask to the whole 64-bit address space
-                * in case the DMA region covers the full
-                * memory window.
-                */
-               mask =3D msb =3D=3D 64 ? U64_MAX : (1ULL << msb) - 1;
+               /* Round-up to the power-of-two */
+               end =3D dmaddr + size - 1;
+               mask =3D DMA_BIT_MASK(ilog2(end) + 1);
+
                /*
                 * Limit coherent and dma mask based on size
                 * retrieved from firmware.
                 */
-               dev->bus_dma_limit =3D mask;
+               dev->bus_dma_limit =3D end;
                dev->coherent_dma_mask =3D mask;
                *dev->dma_mask =3D mask;
        }

> Otherwise, the rest looks OK to me - in principle we could store it as=
=20
> an exclusive limit such that we could then streamline the min_not_zero()=
=20
> tests to just min(mask, limit - 1), but that's probably too clever for=
=20
> its own good.

Yes, that was my first intuition and in a perfect world I'd prefer it like
that. But as you say, it's probably going to cause more trouble than anythi=
ng.

Regards,
Nicolas


--=-wOQXYnHdB19ozhE01VMB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3NIpQACgkQlfZmHno8
x/4XNggAtctjofJ4XldVo+K1/P/rLILA/Y+cKWu8qACkyx4o0VedANdaK2iANvY3
NSFryeYrZSSQS9AGVUcXKwxvBIuLvE2BX6jm7CLSMgir0EIWBOQLWq/RidFZYqm7
OGFkiOaN1/+XW8Gh8tLu63CtAYXisZ7O7jsxv+qqlXqAmBpChHR3+NimdDsxevgf
zm6Uk7GEgwPcenlzAFYGaVyhIelfXxB64OJoGJZ3xybsLmBBoa8nlL/vC1QfzNsj
kGlc4Mc3c6ySI9vpf2Mgn/9pSkOoFvoOsXGEsrbz/qtrpQrC+gpBvYbeLZicVl6G
Z5EX/OFky1O9iMZTL99Sb2tEonSNlw==
=17Ah
-----END PGP SIGNATURE-----

--=-wOQXYnHdB19ozhE01VMB--

