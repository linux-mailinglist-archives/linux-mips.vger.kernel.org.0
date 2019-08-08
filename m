Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB50B86D92
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2019 01:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404579AbfHHXDD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 19:03:03 -0400
Received: from mail-eopbgr760133.outbound.protection.outlook.com ([40.107.76.133]:55054
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732796AbfHHXDB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Aug 2019 19:03:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP7kh4L8r0cKyb+7tZvwDoMlhDs4wFZzz9r2FaXXjm1BbHTn3Vf4jMiJTlIcAEpBM0bhLRdmTI8BD2wpRcMKgFa7e1YTiSr3eydXTAfziWSwbx5XnQoJgI6Bk9+umoxoHXW7EAdfg8uWugWRkswDWqrSbl+kb/bI+w42gRtwmUPLtTETH6Ys/e1799RHK29cJ7I6uq9w77A3N6PwS+xIr+u2szakW/4a/MjW9aR9TADylc54K/PTXirOaPvV/H2i3Kzj2iuTrxUjUWn05W3fXWWcwUghxUNiJQr0twKVCQFVJu6s3YWxHEIZqKVSGoR20zM/qGdz1v/M1x49ywsg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2Us1fcbZ0oA9O/Ov32Tvv+defUi7PRsGKZB9h/VRtM=;
 b=ltM3MqQ2jTWRu6q1ZF8i1OUSg1tTGdjHbpZ67vDA9rIlaDeTK2103HoD3eRZa5sd7lF2d1/PUMQWBFvhK2gx8spMwvl/V2woHvTKxs7eSwu+wjNiTZRxZj6+KB3pprRum6dgiglsjoaNt+SaZSL0tDyJtK2lXNh7b/bQs4Nar9Htq1joALMj05kWT+vwRAa3krhG8spTepmMtqVbT85B+a4LNtjd7Lb1DCY0AL6bSICBSEiRZuekGovg0iDrLgBzg38VWPf7Em4l6ztKzT9sFxtag7R+CDvssOUEJXcUBJk6qwzf4bcSgM60QPiA1be5fLhpNreMGZ+aTUCu3u0XeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2Us1fcbZ0oA9O/Ov32Tvv+defUi7PRsGKZB9h/VRtM=;
 b=OfFQZ2+66AX0YhDIhz3KIiLZ8J1pDQTfdkN/0v9cxOebC6e+/jZHKB0PYQfzPCLEf462PLzBjbLuzkt7fE3uksXHqbfxHJjBXJI+FY7NruuExJcB//BInra0qBwa0dw3Eg70aCp8p05morDEeLOqszpRSu0dXZ7W/UJ4KrkBIrk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1279.namprd22.prod.outlook.com (10.174.162.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 23:02:58 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 23:02:57 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
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
        "od@zcrc.me" <od@zcrc.me>, Mathieu Malaterre <malat@debian.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v15 00/13] TCU patchset v15
Thread-Topic: [PATCH v15 00/13] TCU patchset v15
Thread-Index: AQHVTj1rjdYXClittEGwDcWyx/ar0A==
Date:   Thu, 8 Aug 2019 23:02:57 +0000
Message-ID: <MWHPR2201MB12771581FD6FBA4634D53566C1D70@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190724171615.20774-1-paul@crapouillou.net>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0016.prod.exchangelabs.com (2603:10b6:a02:80::29)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53a3e6b6-3505-4ba2-a0d2-08d71c548d8a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1279;
x-ms-traffictypediagnostic: MWHPR2201MB1279:
x-ms-exchange-purlcount: 13
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12793952A51003A6C0A31D55C1D70@MWHPR2201MB1279.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(366004)(136003)(346002)(376002)(396003)(189003)(199004)(54534003)(53936002)(81166006)(81156014)(8676002)(6436002)(71190400001)(4326008)(74316002)(6916009)(229853002)(66556008)(66946007)(7736002)(66476007)(305945005)(66446008)(316002)(6246003)(26005)(6506007)(386003)(64756008)(102836004)(33656002)(186003)(8936002)(52116002)(76176011)(7696005)(476003)(446003)(486006)(44832011)(11346002)(42882007)(71200400001)(54906003)(9686003)(14454004)(5660300002)(55016002)(66066001)(6306002)(7416002)(966005)(256004)(2906002)(25786009)(99286004)(478600001)(3846002)(6116002)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1279;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DL7Djz/7xrehf61Dp3oVrBnYgW1n9HgIvc5fVkZE1bQw3DcHfmxfols00fyoGZtHKoFTWTugZH6P67STaGEUdFSXZ3s1q76MMVXiY7sgnva5af7nxkM9By/sQ8tm3CTYw6hnOFR1jz+SHiRBpXliaxBnzMVXPqBUFtAWh4B0XGRbGu0FD95kgMYnUw/tSoGRhVpfSdQZde9vZi//wg7A7bvN0zMrwMQN52BUjJAAoa5EOPl2RAfcdSHBYiYvPjmv0Hk4Ru+N+nIA1twavRvRyyVBkZd2yjLXNWDYT6b3BFRhVFd7LRyBKHZBlA7CuifObupVy5wJcx/4Q/bkuMiwlkNukJoTRvMkUmNWHIHWLAqLmJHNj4S+S2kJz8P4y7G2a5XM/pQayikYI7jNp+ay3xS5vsbuf7gr+nKl3EuOGm8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a3e6b6-3505-4ba2-a0d2-08d71c548d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 23:02:57.6136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72u9iSqnxrnJit87qsw5cIa3HSufYiKpG7pgYbHBnNTsNHLqOMgSJXWimVyXZ0izzoX2CNqk6HXdlR0RnPBlJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1279
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Cercueil wrote:
> Hi,
>=20
> This is the V15 of my Ingenic TCU patchet.
>=20
> The big change since V14 is that the custom MFD driver
> (ex patch 04/13) was dropped in favor of a small patch to syscon
> and a "simple-mfd" compatible.
>=20
> The patchset was based on mips/mips-next, but all of them minus
> the last one will apply cleanly on v5.3-rc1.
>=20
> Changelog:
>=20
> * [02/13]: Remove info about MFD driver
> * [03/13]: Add "simple-mfd" compatible string
> * [04/13]: New patch
> * [05/13]: - Use CLK_OF_DECLARE_DRIVER since we use "simple-mfd"
>            - Use device_node_to_regmap()
> * [06/13]: Use device_node_to_regmap()
> * [07/13]: Use device_node_to_regmap()
> * [09/13]: Add "simple-mfd" compatible string
>=20
> Cheers,

Series applied to mips-next.

> dt-bindings: ingenic: Add DT bindings for TCU clocks
>   commit 4bc3c420246e
>   https://git.kernel.org/mips/c/4bc3c420246e
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Reviewed-by: Rob Herring <robh@kernel.org>
>   Acked-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> doc: Add doc for the Ingenic TCU hardware
>   commit 97689a1a3fda
>   https://git.kernel.org/mips/c/97689a1a3fda
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> dt-bindings: Add doc for the Ingenic TCU drivers
>   commit 2e8722a5255e
>   https://git.kernel.org/mips/c/2e8722a5255e
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Reviewed-by: Rob Herring <robh@kernel.org>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> mfd/syscon: Add device_node_to_regmap()
>   commit 39233b7c6112
>   https://git.kernel.org/mips/c/39233b7c6112
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Acked-by: Arnd Bergmann <arnd@arndb.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> clk: ingenic: Add driver for the TCU clocks
>   commit 4f89e4b8f121
>   https://git.kernel.org/mips/c/4f89e4b8f121
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Acked-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> irqchip: Add irq-ingenic-tcu driver
>   commit 9536eba03ec7
>   https://git.kernel.org/mips/c/9536eba03ec7
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>   Acked-by: Marc Zyngier <maz@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> clocksource: Add a new timer-ingenic driver
>   commit 34e9368301d5
>   https://git.kernel.org/mips/c/34e9368301d5
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> clk: jz4740: Add TCU clock
>   commit 73dd11dc1a88
>   https://git.kernel.org/mips/c/73dd11dc1a88
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Acked-by: Stephen Boyd <sboyd@kernel.org>
>   Acked-by: Rob Herring <robh@kernel.org>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: jz4740: Add DTS nodes for the TCU drivers
>   commit 36aafdbd5288
>   https://git.kernel.org/mips/c/36aafdbd5288
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: qi_lb60: Reduce system timer and clocksource to 750 kHz
>   commit a68d3b052b57
>   https://git.kernel.org/mips/c/a68d3b052b57
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: CI20: Reduce system timer and clocksource to 3 MHz
>   commit 157c887aff52
>   https://git.kernel.org/mips/c/157c887aff52
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: GCW0: Reduce system timer and clocksource to 750 kHz
>   commit 967a7100400a
>   https://git.kernel.org/mips/c/967a7100400a
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: jz4740: Drop obsolete code
>   commit abc552284f6b
>   https://git.kernel.org/mips/c/abc552284f6b
>  =20
>   Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>   Tested-by: Mathieu Malaterre <malat@debian.org>
>   Tested-by: Artur Rojek <contact@artur-rojek.eu>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
