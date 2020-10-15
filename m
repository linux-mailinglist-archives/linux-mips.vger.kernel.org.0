Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C74C28F47A
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 16:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388146AbgJOOK5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Oct 2020 10:10:57 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35727 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388046AbgJOOK4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 15 Oct 2020 10:10:56 -0400
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Oct 2020 10:10:55 EDT
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id F0E285800F2;
        Thu, 15 Oct 2020 10:05:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 15 Oct 2020 10:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Z9xTzrKE90Xd3ra3VJfEuWMqFvx
        8M30d0ikEN/YU2Q4=; b=VpK1rgiG7CnlzeiebRXiMWglDV7yzG7X5v1zpJiZUjW
        NLjv4yySGF5TnuRaMaxipzyOynqWcM8LTNOhO1wLH3hbAE0bfb0lA3gpZtHjr9Vz
        YXCcoOPeGg6Ytvw6qG7uR/e2oKIGnQQb+aXfmcCEcOF3DWjyPawRyaFc3CGg8gaO
        3gaY7tXQ0AYcK3s1UumjHkOaTFNK4cbCEZjQj432SqGxsgs9sb4EWXiqcSTMo5op
        8wVfX0yhhNFIPiMEcOPXF6NFZIQ3BPVfqhTLphS/0okhYqMCBXyhji6h4mn3RgTh
        gjTWPcQktVK+tN/J31qLAPDt3MRtXF2fT/uiP9rkBGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z9xTzr
        KE90Xd3ra3VJfEuWMqFvx8M30d0ikEN/YU2Q4=; b=qkJfUAlRyppCWMNmdIsZDw
        3wF9OAjW5ZbrOkPgof7keJFLQtMj7YVr1h8Ixeokwt+4QOD0AJxU7XxvJrRcXMu9
        4JyW96/V2Yr7jUyGvhOvmNc4sgKccvhDzMR1HRV32Mah4CkH84nk5IF3Z1xWh6xN
        IxrO4bgEAUwE4C6uXOZuvbuFAXjFrwrqW6LpDXmj+03vOtA9hsa5ixDd3c6NSdih
        zZEV94Y3NKXlN8+GugHjVD7QJd8awD7nYz6W9BlA1HFLE5+qdzmzBwhBFWvU0qwh
        BRDqF7I/d7C1sBvxLAxsRNXf/sGA/oKA+UgiCElmzu+i/6xXGQv5QhYQgpfgJPYw
        ==
X-ME-Sender: <xms:CFeIX8oKODlkVSjd0G1WqyqcdB9mZWzKnFunFnBn_DWbLvqoAWGGwA>
    <xme:CFeIXyowvBx2DQ80yck3i4p8icsdU6-rcDtrc-c6xpj0q2_XcFwii78awaNP7k8eU
    S4TxvM6DNP2Kj1fa-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CFeIXxOWfhkddmN7eJ-75GBKo7cSfZpcLWxJKPU5XhJ6hAeGQaeb3A>
    <xmx:CFeIXz5kIq6_CTxLUEiN-M3kWq1KfGqOmEH6WR6oXN8MqSgVJzE9jg>
    <xmx:CFeIX74mIHRmeGiDN8ZIlDsb_SGz1dkETC0lRDqgT1WPX51sTScQcg>
    <xmx:DVeIX8OEcJRjikTroT85KOgZc0Ze9oIXDyey6A75lvN8S3rnYOu05A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E92303280065;
        Thu, 15 Oct 2020 10:04:55 -0400 (EDT)
Date:   Thu, 15 Oct 2020 16:04:54 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
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
Message-ID: <20201015140454.mctkhgkhegwdnfxk@gilmour.lan>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
 <875z7blrqu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7qefs4ajnodpk4f6"
Content-Disposition: inline
In-Reply-To: <875z7blrqu.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--7qefs4ajnodpk4f6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 01:15:37PM +0300, Felipe Balbi wrote:
> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
>=20
> > On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> >>=20
> >> Hi Serge,
> >>=20
> >> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> >> > In accordance with the DWC USB3 bindings the corresponding node name=
 is
> >> > suppose to comply with Generic USB HCD DT schema, which requires the=
 USB
> >>=20
> >
> >> DWC3 is not a simple HDC, though.
> >
> > Yeah, strictly speaking it is equipped with a lot of vendor-specific st=
uff,
> > which are tuned by the DWC USB3 driver in the kernel. But after that the
> > controller is registered as xhci-hcd device so it's serviced by the xHC=
I driver,
>=20
> in Dual-role or host-only builds, that's correct. We can also have
> peripheral-only builds (both SW or HW versions) which means xhci isn't
> even in the picture.

It doesn't really matter though, or at least it does for what the new
name might be, but the old one currently used is still pretty bad.

The DT spec says that the node name is the class of the device. "usb" as
the HCD binding mandates is one, but the current nodes currently have
completely different names from one DT to another - which is already an
issue - and most of them have dwc3 or some variant of it, which doesn't
really qualify for a class name.

Maxime

--7qefs4ajnodpk4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4hXBgAKCRDj7w1vZxhR
xc/hAP46ODmwvjIPqwI5nlO3xwJrtwfpxoSlSPh1JvpLEN72cwEAjRtVXTcj4t09
7kGf6xqLq3NWxWeo2Ic3p5EpiWIBzgA=
=pGih
-----END PGP SIGNATURE-----

--7qefs4ajnodpk4f6--
