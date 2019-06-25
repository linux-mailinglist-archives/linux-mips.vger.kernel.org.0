Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D2D555E3
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 19:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbfFYRad (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 13:30:33 -0400
Received: from mail-eopbgr750122.outbound.protection.outlook.com ([40.107.75.122]:56192
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727652AbfFYRad (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 13:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLaO9QWBVrbx1WHdWWcpHYHC7RcnT/IaFQfxF+WZUWQ=;
 b=GcTgXpx1p5Ev5wCCmWM868S5FeQxAVrewWsehXbfli40a4ZsnjOq+NBw4+Hndw3XXhfsfqRyBkC81NpnLU5LHkdNxJz3g+6FdWscnd1fh1D3h/02oVUW4BcOE4xGGQot60ZckFliV22JXypxbYsMKJqZivDlnf9C5ofCI5M+9QM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1341.namprd22.prod.outlook.com (10.172.63.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 17:30:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 17:30:28 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mathieu Malaterre <malat@debian.org>,
        "od@zcrc.me" <od@zcrc.me>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v13 04/13] mfd: Add Ingenic TCU driver
Thread-Topic: [PATCH v13 04/13] mfd: Add Ingenic TCU driver
Thread-Index: AQHVKuBSgPmYVawSQ0eFKnC+vy7xnKasoZqA
Date:   Tue, 25 Jun 2019 17:30:28 +0000
Message-ID: <20190625173026.dbvx44iwywnijjql@pburton-laptop>
References: <20190624225759.18299-1-paul@crapouillou.net>
 <20190624225759.18299-5-paul@crapouillou.net>
In-Reply-To: <20190624225759.18299-5-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0554db2-ea68-411f-b3a9-08d6f992d0b8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1341;
x-ms-traffictypediagnostic: MWHPR2201MB1341:
x-microsoft-antispam-prvs: <MWHPR2201MB1341128582984F2461DC3983C1E30@MWHPR2201MB1341.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(396003)(136003)(39840400004)(376002)(346002)(199004)(189003)(66066001)(81166006)(446003)(33716001)(58126008)(476003)(8676002)(54906003)(6116002)(44832011)(186003)(81156014)(6246003)(316002)(11346002)(4326008)(7416002)(478600001)(53936002)(3846002)(26005)(305945005)(1076003)(7736002)(8936002)(14454004)(6512007)(6506007)(25786009)(76176011)(486006)(5660300002)(4744005)(102836004)(6916009)(6486002)(2906002)(386003)(6436002)(14444005)(71200400001)(71190400001)(256004)(99286004)(64756008)(66446008)(66556008)(66476007)(42882007)(73956011)(66946007)(9686003)(68736007)(52116002)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1341;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oB4wAzcuoF+S/KJh0iA8dcAOQUARodytMY4ybVoFZGXn4FkT2ZgLYT8cHfpaC/R2XP52B1GzdkuNk50IFMDM+Fr0vV/TMESh58fr7aDlVdC8hLr1e09doRZuk/Z64gh7VchexPbVQ08cTmiqu9yV8QSDW7zeFAeyJnGo7sP6MgmunELcc31UGXx0uCcKi4geXv1LMO2b3XXffrWK559fcTReCLD4vv69bfnHvuDA65GPJbxY83UDHbjNwosA9qzd7vHo8d0v/3hbeIN1zAzz1z2NhE6vyzsSC5cSpvw73YfyZdUw1Tu7BcEYK5MzwikT+pXhY3rv78bsI92u6Fjh21jxkTh7ZIPhHKDfxKf0BP+4QMGhBSjz50UHvmjm8TBHN+im6RfSePZ9RKnqew1Z9mTybRFWVFz5av0Z5yIy448=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9BAE9DD0984EBD4FBCD7F23175005B2A@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0554db2-ea68-411f-b3a9-08d6f992d0b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 17:30:28.7845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1341
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On Tue, Jun 25, 2019 at 12:57:50AM +0200, Paul Cercueil wrote:
> +static const struct of_device_id ingenic_tcu_of_match[] =3D {
> +	{ .compatible =3D "ingenic,jz4740-tcu", .data =3D &jz4740_soc_info, },
> +	{ .compatible =3D "ingenic,jz4725b-tcu", .data =3D &jz4725b_soc_info, }=
,
> +	{ .compatible =3D "ingenic,jz4770-tcu", .data =3D &jz4740_soc_info, },
> +	{ }
> +};

Nit: why not order these numerically? ie. 25b, 40, 70.

> +static struct regmap * __init ingenic_tcu_create_regmap(struct device_no=
de *np)
> +{
> +	struct resource res;
> +	void __iomem *base;
> +	struct regmap *map;
> +
> +	if (!of_match_node(ingenic_tcu_of_match, np))
> +		return ERR_PTR(-EINVAL);
> +
> +	base =3D of_io_request_and_map(np, 0, "TCU");
> +	if (IS_ERR(base))
> +		return ERR_PTR(PTR_ERR(base));

This is equivalent to:

    return ERR_CAST(base);

Apart from those:

    Reviewed-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul
