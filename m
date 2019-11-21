Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45CA5104F12
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 10:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUJTE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 04:19:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:49138 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbfKUJTE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Nov 2019 04:19:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 134B7B324;
        Thu, 21 Nov 2019 09:19:01 +0000 (UTC)
Message-ID: <f7c09f06913fa1ed5e98c55ebe6d9db81bf232c0.camel@suse.de>
Subject: Re: [PATCH] dma-mapping: treat dev->bus_dma_mask as a DMA limit
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
        Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Paul Burton <paulburton@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
        phil@raspberrypi.org, linux-acpi@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
        James Hogan <jhogan@kernel.org>, Len Brown <lenb@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Hanjun Guo <guohanjun@huawei.com>,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        iommu@lists.linux-foundation.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        linuxppc-dev@lists.ozlabs.org
Date:   Thu, 21 Nov 2019 10:18:54 +0100
In-Reply-To: <20191121073152.GB24024@lst.de>
References: <20191113161340.27228-1-nsaenzjulienne@suse.de>
         <dd074ef5c23ba56598e92be19e8e25ae31b75f93.camel@suse.de>
         <20191119170006.GA19569@lst.de>
         <7609007d-52f5-bb10-e8d5-96fadbfab46d@arm.com>
         <20191121073152.GB24024@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-lq+O6sjXzX+AgzEMEd7n"
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--=-lq+O6sjXzX+AgzEMEd7n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-11-21 at 08:31 +0100, Christoph Hellwig wrote:
> On Tue, Nov 19, 2019 at 05:17:03PM +0000, Robin Murphy wrote:
> > TBH I can't see it being a massive problem even if the DMA patch, drive=
r=20
> > and DTS patch went entirely separately via the respective DMA, PCI, and=
=20
> > arm-soc trees in the same cycle. Bisecting over a merge window is a big=
=20
> > enough pain in the bum as it is, and if the worst case is that someone=
=20
> > trying to do that on a Pi4 has a wonky PCI controller appear for a coup=
le=20
> > of commits, they may as well just disable that driver for their bisecti=
on,=20
> > because it wasn't there at the start so can't possibly be the thing the=
y're=20
> > looking for regressions in ;)
>=20
> Agreed.
>=20
> Nicolas, can you send a respin?  That way I can still queue it up
> for 5.5.

Oh, I thought it was too late for that already. I'll send it in a minute.

Regards,
Nicolas


--=-lq+O6sjXzX+AgzEMEd7n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3WVn4ACgkQlfZmHno8
x/6kBwf/SKtubLT3BK6PDi2kFxS7U1Nuy9X/MqsOPMdQNIIzccK4WqpweJsn3fn7
WUh4Tsn5H2fjaeqsOCLpG5PeYLO6nDWDmCzVszhsyBjqWczikEWQ8reuCbXbbW6G
rUh1wlp8+VDFDs0reFtW9POlYcvxixcMmbkSjKPEtZCh/GjdgIcjdkCtvwGkdrE1
8E8Z6K9lqyiB2WQ0z7tdOf3fglQwJ7HxRgsmlYm1u0UQCm3+Hdrvy2hO7X/OYhtB
4JbPmzPk62RNUjdmnuJ8t2ar57gMQ4VwRi7hjfCir9Iq8t/B7vCzCAQnzREpL05w
BEUfJlvCYEvS3eArOErmv3Mm+/ugdg==
=NUIQ
-----END PGP SIGNATURE-----

--=-lq+O6sjXzX+AgzEMEd7n--

