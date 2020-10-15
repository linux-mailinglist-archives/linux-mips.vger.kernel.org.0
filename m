Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EA828EFF4
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 12:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389183AbgJOKPy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Oct 2020 06:15:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:60946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389099AbgJOKPx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 15 Oct 2020 06:15:53 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2533920BED;
        Thu, 15 Oct 2020 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602756952;
        bh=Z6L85tl0hUzxc/Wf2yAWwRbRBy0g42YVSMNsAOso/ic=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WCURctuRAO7apKBpnigKSW4w0RrSEIpplBnDIjs+ve/o+8+46MlY5TmxYzakNSnGt
         wshd18tKRcbQS+ist8JlaxoOpSixojILJcBphDceJNvzEVJ7nc77SPULh7DZu7zIN5
         MdYW0FZqoioit4bvm377ZfhSD1iKvlH90Ra8372k=
From:   Felipe Balbi <balbi@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Wei Xu <xuwei5@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
In-Reply-To: <20201014143720.yny3jco5pkb7dr4b@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
Date:   Thu, 15 Oct 2020 13:15:37 +0300
Message-ID: <875z7blrqu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:

> On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
>>=20
>> Hi Serge,
>>=20
>> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
>> > In accordance with the DWC USB3 bindings the corresponding node name is
>> > suppose to comply with Generic USB HCD DT schema, which requires the U=
SB
>>=20
>
>> DWC3 is not a simple HDC, though.
>
> Yeah, strictly speaking it is equipped with a lot of vendor-specific stuf=
f,
> which are tuned by the DWC USB3 driver in the kernel. But after that the
> controller is registered as xhci-hcd device so it's serviced by the xHCI =
driver,

in Dual-role or host-only builds, that's correct. We can also have
peripheral-only builds (both SW or HW versions) which means xhci isn't
even in the picture.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+IIUoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZO3Q//SiuQrPc8kbjk55HntU2Nq2ql7KHubHOj
ZhrcegAbPbzA0vqIIasxjkXAC8Abbz3Bn59kDuu0ohRtTG1sKXMrN1aqkIo1tTh+
zkF7t+k5cdunzJ19jb0lohFu/eDK0JPuXRoByJfUhbxIZfWbacO7bG8TkClU7zhL
denO6pfQG1nOetdAaHZV9imMuTKJOrnl+bcHx5tNcV9sH02sC6OVXBn4dN5ZnABf
/FdDd671tZMcz43t7jm1vNk7yxgZPSqQ6myBeXQ45ZL2mn9i0gyi4eEWy29vLwu9
kVUhb9nrliaBsf/X/+oh05qRACLg/noIcuSpXMtu8tmR2DIcwDijYG8XOsBaDLEj
ZYSJju7/JQ2XUmrS2s/xWtjcqQN0ZxVsJx0Vy4JZNRQ404qs2cqjDeUFdclP+fdJ
90W74TKzXS1/t52pQyG84LSM648I/7PhUWara2RV9jds7XPgFuFCwWTxEKkyQCSW
ayPWVASHrKX0Kzp77GW2UUILCIo+luyMMd7V/BraTI6L+PMBL6+etB/O72UUXdb9
E2hQyJojMpg7BZ6dnpLcvbtHetLtW1hLisTOfD3NbPUyJzPJAgLt8D77SN5ncTUy
nC8/57GA0Bs2uzYEB6TlPV4i7c9tLT3MJrlVE/p4uziQ7R/b34xbHDX3xNcspk9Q
vO7uMM8lF9I=
=XrV0
-----END PGP SIGNATURE-----
--=-=-=--
