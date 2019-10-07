Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC0CBCEB0B
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbfJGRxp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:53:45 -0400
Received: from mail-eopbgr770104.outbound.protection.outlook.com ([40.107.77.104]:52462
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728187AbfJGRxp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMyldptAUJNaK0ivMcRno6vqnpvSor1jdWmw/N7dMykZxqB735TiJdH/E4ggTevUbTN5fiZlxS0tTARJzL7ZREjw0oArhoNzzE99HIKPUX68U64hlpMAO0N7/HUQSnz7EUyOVClrhYw3pg8Gn1GSvvLOsEloAKiytUkXetdlMBQouXMEGGHcr6VhZC4Ip/oPNSrORMGreSGJEYuFxjP2nSeegiLF04s/3F7n5CdGxqCEk3jkWmvdkb6SCioqzaaIB1LsxxkE5HNpbsnzXjU1g9WQp/KXWk4pmwYlQ0Nbz7iRcNAizSV7FaN79tUsus0tc6CH7f5yEm5mRjFpJuCZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K0p1KMBpzqIzOgk0I1kDi0pvINJTVttqPl2CPPmhzw=;
 b=i6BliKmJlF5Jj4VaKU26Dc96FMELa6qFqAI45tBT/lNmR0Qe+ajENj61G0A+ES8NotoYgF+0DGUmt/GtPCJj7msbLfDR6uP6WsbLXP2BbgcIZLW/32mgIBtRM6UfWAkfLKmYLQuTvvyeJRjugn3/Mv3/LWzTjHHXv468z9+DSJ2odxkIHKGUf71qJS6RFPA878eyF0l1+KGAMl5DtyqvbZIpslG6YrZrJyb3JnPz3uQ/747b6ObRo+7oLp1Cy/Ov6KXM7Q6gmUFGqUvTrp2sTPT0+Fs7iYB1PFmDoVuMOn/ZVlMiZ8FMdAaq37yHF3v8p5YevYzUIHnQPXftOaL+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K0p1KMBpzqIzOgk0I1kDi0pvINJTVttqPl2CPPmhzw=;
 b=BhWRdZx2s8XuYB8KyZ64sd0p4WYrCK0yHf3FG8F35xCNY4bIiK/97dEX0DqdwUIjELuV+KqQZKU+souEUV5SoJJfRMGPfvUU2ebvQ+YoHdvDYpZU6K/SA2GDGSB4Evm0zwtkufqnyAB1yz6saY0l6LSTfPB9sDx5MJSFevg0VaM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1549.namprd22.prod.outlook.com (10.174.170.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:53:43 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:43 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Alexandre GRIVEAUX <agriveaux@deutnet.info>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "agriveaux@deutnet.info" <agriveaux@deutnet.info>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] MIPS: JZ4780: DTS: Add I2C nodes
Thread-Topic: [PATCH v2 1/5] MIPS: JZ4780: DTS: Add I2C nodes
Thread-Index: AQHVfTgpfX6EIYydg0e4aPXoU5s8TA==
Date:   Mon, 7 Oct 2019 17:53:43 +0000
Message-ID: <MWHPR2201MB12771202FA4C736E46EA69F0C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <b5ffdad6c22a64975e374dc5d2cff878d3ff3312.1569955865.git.agriveaux@deutnet.info>
In-Reply-To: <b5ffdad6c22a64975e374dc5d2cff878d3ff3312.1569955865.git.agriveaux@deutnet.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0070.namprd11.prod.outlook.com
 (2603:10b6:a03:80::47) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4230a9e-658f-440b-df49-08d74b4f4b3a
x-ms-traffictypediagnostic: MWHPR2201MB1549:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1549421698443ECE085A1BDFC19B0@MWHPR2201MB1549.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39840400004)(189003)(199004)(52116002)(99286004)(476003)(7736002)(305945005)(54906003)(76176011)(25786009)(486006)(33656002)(42882007)(478600001)(2906002)(11346002)(446003)(52536014)(5660300002)(6246003)(7696005)(4744005)(71200400001)(71190400001)(66066001)(316002)(14454004)(229853002)(102836004)(9686003)(81156014)(6436002)(81166006)(6116002)(55016002)(74316002)(3846002)(44832011)(4326008)(8676002)(186003)(6916009)(26005)(966005)(386003)(8936002)(6506007)(14444005)(6306002)(66946007)(66556008)(64756008)(66446008)(66476007)(256004)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1549;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: toGSmN8IROsVXJfxLnTzTTJq6FWAkazMlxvwSt83JveW3cqFZ/Rb+J0lpE+vU6497ezYWdTNj+Tx3wy2ecKyrYI3JUV62mN5FcQLC7VZ500MdbYTr3rooGNGpBU5Y3V/L4ftmZxuMbglI12zKOfkw9pOOru0CBiWi3bZZf/QZkPBaCrWkxTdkS7p5xXsoRgJuPiAs+jaGUVeqDW+/WRg4VwVEWD7WyP8mSIoRJBK8S49dT38dVpY71Tg9S9gNvt8lzVyfwsNKZjfoksxmXDX9zckebqrb+riwclemkDZF3c66bzxhIM6qkONn+EfJRW1E86sUwcNfKyT6tAkxY2ov5pKmGlTIUDEIp/hmsOiTQmRHT/gRe/twEwx8K5tVqwfriw+QCaEJWmmyJ9s7aht2Xx1ne3v/Acmy2ZMWtwIpIIXeMezZUAqm+5cP6I4pOECP+zXrIBbRxH2tA0NwewoFg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4230a9e-658f-440b-df49-08d74b4f4b3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:43.7951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yO/Dx4vQxiyBXY3xkBEkKisncb2wUR59vGXEB2x4Nd6X6QoiN729Dq3Ppt0l5TaCIu/DTJj9kyBYz9UTMqXAdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1549
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Alexandre GRIVEAUX wrote:
> Add the devicetree nodes for the I2C core of the JZ4780 SoC, disabled
> by default.

Applied to mips-next.

> commit f56a040c9faf
> https://git.kernel.org/mips/c/f56a040c9faf
>=20
> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
