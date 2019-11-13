Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF47EFAE57
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2019 11:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfKMKS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Nov 2019 05:18:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:43574 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726107AbfKMKS2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Nov 2019 05:18:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CE8D6B547;
        Wed, 13 Nov 2019 10:18:26 +0000 (UTC)
Message-ID: <fc488c5ff7dc7e1b9d96660f0da9b423b3f5094a.camel@suse.de>
Subject: Re: unify the dma_capable definition
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
        Russell King <linux@armlinux.org.uk>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Wed, 13 Nov 2019 11:18:25 +0100
In-Reply-To: <20191113073539.9660-1-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-cvyL9zADiQPcce4MqJVv"
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--=-cvyL9zADiQPcce4MqJVv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-13 at 08:35 +0100, Christoph Hellwig wrote:
> Hi all,
>=20
> there is no good reason to have different version of dma_capable.
> This series removes the arch overrides and also adds a few cleanups
> in the same area.

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

for the whole series,
Thanks!


--=-cvyL9zADiQPcce4MqJVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3L2HEACgkQlfZmHno8
x/4wSQf/XC3BfmBQXcl1ZtWzTr+4bUfUUlsKGdPH0jSKURaYqy7S86ww5oUlbFMC
GIc3I7oN23Q6+p5XDoS/T+tZytUy7HyMB8Z6JRrMjigkV8t0gW58PbjzcHeYQxVL
XnfiZTwo/uVYqJyaPQFDmeHn2H8FpeJkX9oGPohHAY4QX6Iw/dc4cO9S6be933vr
ri4Hau+t8D6/9iT2Wkl7x7hUqinW1yo/6MXhyx44tCpT6RxAimXnK01Gb2G35hiO
t+qRXCA6dvnKlkm4wBQExVT9w1hJt0rHQpcnA5Psb16thfClv3X7esvIMAS4NiJO
mn9iwYlDzdlqgyHT8Qz+Q7qTS9YZog==
=EWiZ
-----END PGP SIGNATURE-----

--=-cvyL9zADiQPcce4MqJVv--

