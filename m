Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6EF24418A
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 00:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgHMW4j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 18:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgHMW4j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 18:56:39 -0400
X-Greylist: delayed 320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 13 Aug 2020 15:56:38 PDT
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD691C061757
        for <linux-mips@vger.kernel.org>; Thu, 13 Aug 2020 15:56:38 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BSMHg5x7HzKmhd;
        Fri, 14 Aug 2020 00:51:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id cgPA8JKXJzej; Fri, 14 Aug 2020 00:51:08 +0200 (CEST)
Subject: Re: MIPS: lantiq: add missing GPHY clock aliases for ar10 and grx390
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     linux-mips@vger.kernel.org, john@phrozen.org,
        tsbogend@alpha.franken.de
References: <20200810180946.2766-1-olek2@wp.pl>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Autocrypt: addr=hauke@hauke-m.de; keydata=
 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
Message-ID: <41a2f93e-144d-c75e-54b2-2c709529a5d0@hauke-m.de>
Date:   Fri, 14 Aug 2020 00:50:56 +0200
MIME-Version: 1.0
In-Reply-To: <20200810180946.2766-1-olek2@wp.pl>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="uVnKAT3OUMd45ZElUbzEBXWlhUVDjN93s"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -10.78 / 15.00 / 15.00
X-Rspamd-Queue-Id: 8CAAC175A
X-Rspamd-UID: 0e22c3
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uVnKAT3OUMd45ZElUbzEBXWlhUVDjN93s
Content-Type: multipart/mixed; boundary="fpdpMWka7K3cPcpGRN2bBnf5lFVuxMlDk"

--fpdpMWka7K3cPcpGRN2bBnf5lFVuxMlDk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/10/20 8:09 PM, Aleksander Jan Bajkowski wrote:
> Add missing GPHY clock aliases for ar10 (xrx300) and grx390 (xrx330).
> PMU in ar10 and grx390 differs from vr9. Ar10 has 3 and grx390 has 4
> built-in GPHY compared to vr9 which has 2.
>=20
> Corespondings PMU bit:
> GPHY0 -> bit 29
> GPHY1 -> bit 30
> GPHY2 -> bit 31
> GPHY3 -> bit 26
>=20
> Tested on D-Link DWR-966 with OpenWRT.
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

> Cc: linux-mips@vger.kernel.org
> Cc: john@phrozen.org
> Cc: hauke@hauke-m.de
> Cc: tsbogend@alpha.franken.de
> ---
>  arch/mips/lantiq/xway/sysctrl.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sy=
sctrl.c
> index b10342018d19..917fac1636b7 100644
> --- a/arch/mips/lantiq/xway/sysctrl.c
> +++ b/arch/mips/lantiq/xway/sysctrl.c
> @@ -112,11 +112,15 @@ static u32 pmu_clk_cr_b[] =3D {
>  #define PMU_PPE_DP	BIT(23)
>  #define PMU_PPE_DPLUS	BIT(24)
>  #define PMU_USB1_P	BIT(26)
> +#define PMU_GPHY3	BIT(26) /* grx390 */
>  #define PMU_USB1	BIT(27)
>  #define PMU_SWITCH	BIT(28)
>  #define PMU_PPE_TOP	BIT(29)
> +#define PMU_GPHY0	BIT(29) /* ar10, xrx390 */
>  #define PMU_GPHY	BIT(30)
> +#define PMU_GPHY1	BIT(30) /* ar10, xrx390 */
>  #define PMU_PCIE_CLK	BIT(31)
> +#define PMU_GPHY2	BIT(31) /* ar10, xrx390 */
> =20
>  #define PMU1_PCIE_PHY	BIT(0)	/* vr9-specific,moved in ar10/grx390 */
>  #define PMU1_PCIE_CTL	BIT(1)
> @@ -465,6 +469,9 @@ void __init ltq_soc_init(void)
> =20
>  	if (of_machine_is_compatible("lantiq,grx390") ||
>  	    of_machine_is_compatible("lantiq,ar10")) {
> +		clkdev_add_pmu("1e108000.switch", "gphy0", 0, 0, PMU_GPHY0);
> +		clkdev_add_pmu("1e108000.switch", "gphy1", 0, 0, PMU_GPHY1);
> +		clkdev_add_pmu("1e108000.switch", "gphy2", 0, 0, PMU_GPHY2);
>  		clkdev_add_pmu("1f203018.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB0_P);=

>  		clkdev_add_pmu("1f203034.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB1_P);=

>  		/* rc 0 */
> @@ -496,6 +503,7 @@ void __init ltq_soc_init(void)
>  	} else if (of_machine_is_compatible("lantiq,grx390")) {
>  		clkdev_add_static(ltq_grx390_cpu_hz(), ltq_grx390_fpi_hz(),
>  				  ltq_grx390_fpi_hz(), ltq_grx390_pp32_hz());
> +		clkdev_add_pmu("1e108000.switch", "gphy3", 0, 0, PMU_GPHY3);
>  		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0);
>  		clkdev_add_pmu("1e106000.usb", "otg", 1, 0, PMU_USB1);
>  		/* rc 2 */
> @@ -514,8 +522,6 @@ void __init ltq_soc_init(void)
>  		clkdev_add_pmu("1e10b308.eth", NULL, 0, 0, PMU_SWITCH |
>  			       PMU_PPE_DP | PMU_PPE_TC);
>  		clkdev_add_pmu("1da00000.usif", "NULL", 1, 0, PMU_USIF);
> -		clkdev_add_pmu("1e108000.switch", "gphy0", 0, 0, PMU_GPHY);
> -		clkdev_add_pmu("1e108000.switch", "gphy1", 0, 0, PMU_GPHY);
>  		clkdev_add_pmu("1e103100.deu", NULL, 1, 0, PMU_DEU);
>  		clkdev_add_pmu("1e116000.mei", "afe", 1, 2, PMU_ANALOG_DSL_AFE);
>  		clkdev_add_pmu("1e116000.mei", "dfe", 1, 0, PMU_DFE);
>=20



--fpdpMWka7K3cPcpGRN2bBnf5lFVuxMlDk--

--uVnKAT3OUMd45ZElUbzEBXWlhUVDjN93s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl81w9AACgkQ8bdnhZyy
68fOqwf8CzW1JS7rA9fKRy1l/5oY/Vh7OVA7BMmptwLXM9G/IrDdnkASwFzgrQf1
Vf+3DhLe0DjJKtRXJnG4EQbVQq8xM5MsDnbs1pFbIfRu3f7A2mhccZUVektazYSK
gUCpb8sYnoPLoKaOtHfgSEmiCWsumjy4hPcjyD47tQHPg57Qa2O9G36ghCqYT2FS
LGRJwiMJ9SxlmL0PGYlf2BwJVAL1buNzKCAtaD8yD5InIDeaT9wfRCSZZFrBJcG+
RuCZd9t6zgVOhSn2lk3eJaO6Oq05M76Y04O3JMaRn3i6oZOBfUevumI58aY7vIZy
mjKOTbiGINHiKPDaq9c9AbZAq+pLpQ==
=tdxQ
-----END PGP SIGNATURE-----

--uVnKAT3OUMd45ZElUbzEBXWlhUVDjN93s--
