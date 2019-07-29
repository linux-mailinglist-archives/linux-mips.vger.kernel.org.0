Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D772979191
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 18:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfG2Qzp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 12:55:45 -0400
Received: from mail-eopbgr760121.outbound.protection.outlook.com ([40.107.76.121]:27014
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727165AbfG2Qzp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jul 2019 12:55:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOUxBqGB/W1B33Ly1dXke6d75rIsHeFfAKNzSXv1a+WU6ApedAamDgVjXCvTTCFp6Vh4tC4dpl+mvkZHpZXJhFag4BBs7C22gUw4cJY08Ds6bkTaIRgb/pDQ342yolLNrWOFU7hqeaS2/Y7B9ZTCgMjaYk9HCl8ZI60PIoV050CVtdHtky/ZoVJUQky7qjgyrSdDQWSxdLoYCePl70dNZCWyoyUePB663UFYC6iPzBAijMlDpLl1c8G8sMcjtQB8TvE0h72ajhp9Y7JGW0++1YQX68ylTbDEM5ZhX2uNpR56CRxxp4yd7XjOxKWf/E3aNN151uw0EXRsYaBZKGZavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rklX2Dc2cLJUXF9CYrQvcVKY/ewkRO7kaZqqUfrxL5s=;
 b=Wq8eq1sVH1m7V2k1dfuekTuXgVQU5gyBC2rAPRpGq07pjSuN/Omypjrv+J3EfamRs2pxwXgKo8k5k59sHGCARsMtyXTiyGOH4pk8H6aUnHLLSAqcxT7RR8lM5I7hsBk3KHGpVbrrvDUjmv9HQiZlK+i6XMHBNIz9ALf5chKnmsKzACqGGciRYp2Rh0Fj3nm2cJqRgVnkknMkl86ur6Xqqgd+mtWYR+9Piwpy6bQ0EPygZfv6bXKnDryWbGeG/doqL1sTHcokuo2e0v1VaGunnZRoUB1Y1NVRp22crOTyzXwG7+ABwZJwMky7W3qKD5dBlZH6ijWwtPOr5tBR/+dd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rklX2Dc2cLJUXF9CYrQvcVKY/ewkRO7kaZqqUfrxL5s=;
 b=NRnkCzGJZJZCyScA2R8PyAVSZJUR8ovG97kd/r9pvrCBFZcQOY9zKqWazBboT4Roqd9kvucWJ2KTIR1oXAbRj/CCPqg7IMbT5bo65hIm1y/fRUe5XEwG0TiyWnJeFBM8rgTQ+U0hTTj4EVkfTiFQfV/4DmtoQJjbaHdxzoNvSzI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1710.namprd22.prod.outlook.com (10.164.206.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 16:55:37 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 16:55:37 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>, Mathieu Malaterre <malat@debian.org>
Subject: Re: [EXTERNAL][PATCH v15 04/13] mfd/syscon: Add
 device_node_to_regmap()
Thread-Topic: [EXTERNAL][PATCH v15 04/13] mfd/syscon: Add
 device_node_to_regmap()
Thread-Index: AQHVQkOeBz0GEUktg0S7o0z63oJyZKbh2FsA
Date:   Mon, 29 Jul 2019 16:55:37 +0000
Message-ID: <20190729165536.dd67ws6nr2msx4pk@pburton-laptop>
References: <20190724171615.20774-1-paul@crapouillou.net>
 <20190724171615.20774-5-paul@crapouillou.net>
In-Reply-To: <20190724171615.20774-5-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0016.prod.exchangelabs.com (2603:10b6:a02:80::29)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56255b03-ae58-498a-33a5-08d714459465
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1710;
x-ms-traffictypediagnostic: MWHPR2201MB1710:
x-microsoft-antispam-prvs: <MWHPR2201MB1710CB6AC7969373AB8FE733C1DD0@MWHPR2201MB1710.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(25786009)(66446008)(305945005)(66066001)(6116002)(52116002)(3846002)(68736007)(6486002)(33716001)(99286004)(229853002)(1076003)(7416002)(256004)(5024004)(66556008)(66476007)(58126008)(66946007)(5660300002)(110136005)(64756008)(316002)(14454004)(54906003)(53936002)(6436002)(6512007)(9686003)(486006)(11346002)(44832011)(478600001)(2906002)(446003)(42882007)(8676002)(81156014)(81166006)(7736002)(8936002)(186003)(6246003)(102836004)(386003)(6506007)(71190400001)(76176011)(4326008)(476003)(26005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1710;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qWDD0MtifxIWI0Q4xzGSQJIwFT1L17OdWkhoY2x56WabbiF7bwVUdChoPQnvTuFhD9PrSXCSdwnV5mxebnG5INpv87X1ICiE/Uorkt6tCyjDfG62b4DFx3KfF7p68sVvqndre0gckyf/qPTFJXDXgwtAd4XBSRs8sWqzU+aA1kHJfrXa6oncqrcn/2pUSFvMq72JvngOD4/g7X/yh/4zcUBlEK6XI+9kwUlGzK4bGpLnm3WU48mVpbbNF0Pso5IflE7/SYSR8ce7OK2019Z20CYg4uJEsy2zBFJKcNMVeNBa5z9XqO+TDW7XlaElExAxQiQVCATySJWyNGxJ1ux8Mtx3Ffzf3kyIQ/PrsQd9tv/OxyHroLNAIQo0SjN2Rhga6aWXsabxN9h1xJtsKYChvMXzk3w2mXM0z7LczsHsmWs=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <32FB9FC5C16F79419150751ABA1AF071@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56255b03-ae58-498a-33a5-08d714459465
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 16:55:37.5887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1710
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Lee, Arnd,

On Wed, Jul 24, 2019 at 01:16:06PM -0400, Paul Cercueil wrote:
> device_node_to_regmap() is exactly like syscon_node_to_regmap(), but it
> does not check that the node is compatible with "syscon", and won't
> attach the first clock it finds to the regmap.
>=20
> The rationale behind this, is that one device node with a standard
> compatible string "foo,bar" can be covered by multiple drivers sharing a
> regmap, or by a single driver doing all the job without a regmap, but
> these are implementation details which shouldn't reflect on the
> devicetree.

Does this looks like a good path forwards to you? Its use in this case
is described by Documentation/devicetree/bindings/timer/ingenic,tcu.txt
in patch 3 of the series.

If you're OK with it an ack would be appreciated so I can take the
series through mips-next, otherwise I guess we'd need to go back to the
v14 approach.

Thanks,
    Paul

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>     v15: New patch
>=20
>  drivers/mfd/syscon.c       | 46 +++++++++++++++++++++++++-------------
>  include/linux/mfd/syscon.h |  6 +++++
>  2 files changed, 36 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index b65e585fc8c6..660723276481 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -40,7 +40,7 @@ static const struct regmap_config syscon_regmap_config =
=3D {
>  	.reg_stride =3D 4,
>  };
> =20
> -static struct syscon *of_syscon_register(struct device_node *np)
> +static struct syscon *of_syscon_register(struct device_node *np, bool ch=
eck_clk)
>  {
>  	struct clk *clk;
>  	struct syscon *syscon;
> @@ -51,9 +51,6 @@ static struct syscon *of_syscon_register(struct device_=
node *np)
>  	struct regmap_config syscon_config =3D syscon_regmap_config;
>  	struct resource res;
> =20
> -	if (!of_device_is_compatible(np, "syscon"))
> -		return ERR_PTR(-EINVAL);
> -
>  	syscon =3D kzalloc(sizeof(*syscon), GFP_KERNEL);
>  	if (!syscon)
>  		return ERR_PTR(-ENOMEM);
> @@ -117,16 +114,18 @@ static struct syscon *of_syscon_register(struct dev=
ice_node *np)
>  		goto err_regmap;
>  	}
> =20
> -	clk =3D of_clk_get(np, 0);
> -	if (IS_ERR(clk)) {
> -		ret =3D PTR_ERR(clk);
> -		/* clock is optional */
> -		if (ret !=3D -ENOENT)
> -			goto err_clk;
> -	} else {
> -		ret =3D regmap_mmio_attach_clk(regmap, clk);
> -		if (ret)
> -			goto err_attach;
> +	if (check_clk) {
> +		clk =3D of_clk_get(np, 0);
> +		if (IS_ERR(clk)) {
> +			ret =3D PTR_ERR(clk);
> +			/* clock is optional */
> +			if (ret !=3D -ENOENT)
> +				goto err_clk;
> +		} else {
> +			ret =3D regmap_mmio_attach_clk(regmap, clk);
> +			if (ret)
> +				goto err_attach;
> +		}
>  	}
> =20
>  	syscon->regmap =3D regmap;
> @@ -150,7 +149,8 @@ static struct syscon *of_syscon_register(struct devic=
e_node *np)
>  	return ERR_PTR(ret);
>  }
> =20
> -struct regmap *syscon_node_to_regmap(struct device_node *np)
> +static struct regmap *device_node_get_regmap(struct device_node *np,
> +					     bool check_clk)
>  {
>  	struct syscon *entry, *syscon =3D NULL;
> =20
> @@ -165,13 +165,27 @@ struct regmap *syscon_node_to_regmap(struct device_=
node *np)
>  	spin_unlock(&syscon_list_slock);
> =20
>  	if (!syscon)
> -		syscon =3D of_syscon_register(np);
> +		syscon =3D of_syscon_register(np, check_clk);
> =20
>  	if (IS_ERR(syscon))
>  		return ERR_CAST(syscon);
> =20
>  	return syscon->regmap;
>  }
> +
> +struct regmap *device_node_to_regmap(struct device_node *np)
> +{
> +	return device_node_get_regmap(np, false);
> +}
> +EXPORT_SYMBOL_GPL(device_node_to_regmap);
> +
> +struct regmap *syscon_node_to_regmap(struct device_node *np)
> +{
> +	if (!of_device_is_compatible(np, "syscon"))
> +		return ERR_PTR(-EINVAL);
> +
> +	return device_node_get_regmap(np, true);
> +}
>  EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
> =20
>  struct regmap *syscon_regmap_lookup_by_compatible(const char *s)
> diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
> index 8cfda0554381..112dc66262cc 100644
> --- a/include/linux/mfd/syscon.h
> +++ b/include/linux/mfd/syscon.h
> @@ -17,12 +17,18 @@
>  struct device_node;
> =20
>  #ifdef CONFIG_MFD_SYSCON
> +extern struct regmap *device_node_to_regmap(struct device_node *np);
>  extern struct regmap *syscon_node_to_regmap(struct device_node *np);
>  extern struct regmap *syscon_regmap_lookup_by_compatible(const char *s);
>  extern struct regmap *syscon_regmap_lookup_by_phandle(
>  					struct device_node *np,
>  					const char *property);
>  #else
> +static inline struct regmap *device_node_to_regmap(struct device_node *n=
p)
> +{
> +	return ERR_PTR(-ENOTSUPP);
> +}
> +
>  static inline struct regmap *syscon_node_to_regmap(struct device_node *n=
p)
>  {
>  	return ERR_PTR(-ENOTSUPP);
> --=20
> 2.21.0.593.g511ec345e18
>=20
