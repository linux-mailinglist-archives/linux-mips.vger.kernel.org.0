Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3BEF3F1ED7
	for <lists+linux-mips@lfdr.de>; Thu, 19 Aug 2021 19:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhHSRRo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Aug 2021 13:17:44 -0400
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:12261
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230416AbhHSRRn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Aug 2021 13:17:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwRoozyLzpqe+pMd9WSdKTWCYe3Fo3wVlMtpVRTV1kg4jcfNtGZj8w5Pe/QxMgJ4va3m1VlgIDQg2ZuYvUby7/9xjPSV1x8rSM2yvDTA2xflhgp7kEu6SvsHmFDovQv2QlzZSY90X3XIDM9iHcEy9l0ZYNKAa0S4euA0CKwDI4vzJvKg/Fcr/SvfqPLZMl89buyFzOyYkvluJ25zNRsqui5KRIxwKMDAbC8amjeInAf0CgIoUNXF8EE2sv5y4z0T2F0fsW9f0oXKKTIWc8dPrGJduOkOuslF05DdjZxLwK3QP0Nne+KzMd3+a70VIixjnlq0+PAir653ydlX5EJOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpZ5ZZvI8Gx65QGDkbSBJtKF20xU7jP47mcnpNrRYdc=;
 b=YAW4gZLtyzXN3qyuMfUkAwOWfn/ZHFDZp4/mJzf+WvzMFTw1xjrvak5Q9RoGq8iSHEYirlAcWKdh1vifIbZIBecHSjDWcUcmhEKZABU/RJ/s2iHfY2UEfirS6uZZWZZF6pgn9jK+fqYRK71Y+ygWBrXrzK8Qini5AdnMPzF+590bw7ABofbVlUiaUxGdVgwzULk454f+5p5uwIgSnOv5W2XDxLmOOb1vQfemB7TJRL/53iVUeOJCgcUOex7A2dvLr+9P7hzYn47mN+dCiGlftdSFNGIlr59NC/0Ybn/riCoa2IqaSc6etmn9WiJljRcVSs8Hv41a9W+XkeeHJl23Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpZ5ZZvI8Gx65QGDkbSBJtKF20xU7jP47mcnpNrRYdc=;
 b=HIEiG6PeT2gDaIYuQmzgL7yjktPxW7KOtA5oNLBWX4GHsrCXBmVeh+rI1F6MCOEQNzAv7GEdayZZCiEKr+TkVmqVR/ofDL2cOkds/mS/3r13ziEayy/EHGPPLEqDUIxbdWX50GjkzvEDtD3O8hny5qGoEOU9fz+ks8Jst46IojA=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR0402MB3712.eurprd04.prod.outlook.com (2603:10a6:803:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 17:17:05 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0%2]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 17:17:05 +0000
From:   Vladimir Oltean <vladimir.oltean@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH devicetree 2/2] MIPS: mscc: ocelot: mark the phy-mode for
 internal PHY ports
Thread-Topic: [PATCH devicetree 2/2] MIPS: mscc: ocelot: mark the phy-mode for
 internal PHY ports
Thread-Index: AQHXlRxE6gwTVobZAUmt38ortI/KCKt7EdYA
Date:   Thu, 19 Aug 2021 17:17:05 +0000
Message-ID: <20210819171704.z3avr2b5jur6dohl@skbuf>
References: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
 <20210819170416.2252210-2-vladimir.oltean@nxp.com>
In-Reply-To: <20210819170416.2252210-2-vladimir.oltean@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d81472de-0f92-4fae-506e-08d963352ac5
x-ms-traffictypediagnostic: VI1PR0402MB3712:
x-microsoft-antispam-prvs: <VI1PR0402MB37120E4C80AB7ED53667D51EE0C09@VI1PR0402MB3712.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YMHHbllTby9kGOq4krqv+lZJdNCIXZJJnMnc3eQY/2iyBNEPTmPX4V2M7zRInXclnBjCubNDBkgDVcA4BPa6nc200QMcljzFEwMglrJHEa6E09z1SwRqdgbl5+mD8h9NR6fp0Mt5jmiWBkxg2FzalgIaJIo0qhf2Ei0y6uszz78GfCWPzLwpnjgX2vmHQ7eeSqbf+mKCWI8X8aSDen7x87dCh8NFslPIx3rU2Bmz5q44W2wFcLMNEfEzjHNhhXXkj8u80wyjuJFoIrg1iFtWAlJOijLrRpwp1Lllms6+YIE5u3g2AKwjvl2NMfFevc21J1txorwbf4fxN9jMyArWJtDQMWup44XjmnZ5F2Wf8BCvyULdxwPw4IUxWHf9MmyggPGljwGTuTmnGwG1/hGmpChEkCHMhBtjh1uDYAV2FCFwWQhVKX+RlzYqWu/4IskrqMM2b3kbbk38jMg3I6+GelEwf/Fq/rWEoJ9dF6jPDxYPmEQNWrWvgxOx8yoEje2XMB51Mq9awUCPmolNAt4qPm9JNjb2S5r6o+YtXqjogq7lCFRCV13HDeBxzsTfLFwpTcTsc/qTCxJar510ocj2iBWzQToCIjC1oPsOqJDo9jouHfJE+Crqe6MOlm0TKg4bZgWDk8UOqXhGQVI9Sa0ZIHQkrUcBgcp8+pawbCOFhIAiVHOUtqbfFMVks/4vQ2EN/7VTl9v8L1/D8oCRaNyQeg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(39840400004)(366004)(376002)(346002)(26005)(316002)(76116006)(2906002)(110136005)(4326008)(8936002)(186003)(54906003)(91956017)(8676002)(38100700002)(5660300002)(86362001)(66446008)(66556008)(66476007)(64756008)(478600001)(66946007)(38070700005)(122000001)(33716001)(9686003)(6512007)(1076003)(71200400001)(44832011)(6486002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YAGqc1dPRny5fQ6Plv+AdWE4snfF3o+BJHFXUW1JV35nERLMOHSeZ7Omjwe8?=
 =?us-ascii?Q?yGgscU53QGg7GxuRuKBRmdgUAlt1XXZ6dZh82NtPE/7KeCThFU9u8SxuD692?=
 =?us-ascii?Q?tnSvZdr9T5JIld+AtiuEaBMYRCslftGDk6WpujkBR6yWti8eU7yeULWnPKon?=
 =?us-ascii?Q?cIgh91xt91ZrcfsMhSVJ4qdR82CXYoaG5E/Dw3aT59Oc86lZMAqy23egwtS6?=
 =?us-ascii?Q?xZV0O7UG21gZWa7ewwgZIoLSv6ICfqJll5/flqXGCU6dwXvvoXHpw3l/weDx?=
 =?us-ascii?Q?1kU1MOo2q+nvJZQEquuxtnpYDHar3nSOPHQmSTNPCGS1R5TBO/POZVsRfth1?=
 =?us-ascii?Q?gpqXf3WEz6JaAlVzsiXkWXmE3n4t3dznslzxJxuJBz6iUJSW/8GjmpkthfXf?=
 =?us-ascii?Q?VIpq3X0+W0WrdK4YVRaM8bvIPeYAA3RlsA3n1nZn9yqh+bZ710UZ3zw6NA0D?=
 =?us-ascii?Q?KlciHawCObmYZuS5CUnr6i9zPz/3/SijK8S9w0pkkDeksLEi00mEep/h2Cz4?=
 =?us-ascii?Q?fi+Y2aqlbP0ArTPnsKuwhNLrzDyIlNk/RHem2UYuzGlGLITpu73jFsUs/k+T?=
 =?us-ascii?Q?uxue1ff1kuLzwtdf6teQ55WFOpWfV+kYXpwQiCxSHKiaMb2fMZUCrgvGpJMn?=
 =?us-ascii?Q?SprxKB5UciDCi+P3AM5QNlSiVyfCFErTdIlV+O9489eza9Qf4SEj5diGDKMz?=
 =?us-ascii?Q?w2/bWdRxTlqDqEokILi/qr2961fgpVMLndQbked/UuQjsbb5N0LevJyeliIF?=
 =?us-ascii?Q?8x7iu0Rrwz0CuKqSoeN5NZgk8mDaEYAYOZh/Fe6qiQByt8YppkL47kvIFiAN?=
 =?us-ascii?Q?Rt/HJVdZROOmK9mR3nInWWXajgrwsde9cZ0dJrQ6U02LMM/acZ71GTg3l0F3?=
 =?us-ascii?Q?ARgNpakXI4zjC8ucQmRWCHq+gN4hbhalROxKgPF9mjyu/H1vCsqFMTnAF2g/?=
 =?us-ascii?Q?G13GzQTRtAhMbXb9q8DKVu7lcm/eM+svFsuBioEHsutqY0usec0pYh4QU+hZ?=
 =?us-ascii?Q?srtw5FSBGdKCwc4W8z3GeOeDW2lrT0hbuuNz/V6tXkvwkGxsKoBm2ubuks3v?=
 =?us-ascii?Q?TtdIVlnHTx05egZjceJg7tae4D5VUWaCsndNkwQ/5LBPsXh1chDTOgT4MJuc?=
 =?us-ascii?Q?9BoJ0621kMFVD/hmGMc1lvw4mOdqT+N/H5T0OLbuekgbD2U9QyzR+lBw1x4i?=
 =?us-ascii?Q?i4De/8te8hoULM/WJHln3OECkg+Ksp4LDSY6JLCq8+uyT0hanUkxRBT81z2b?=
 =?us-ascii?Q?mxoKGN8xKQOZoSfEcoPkcum+aaNWrFTSQrZTLz8E/FQ+PJQEVpTlt0YtWbNO?=
 =?us-ascii?Q?Iqh61Io043ZzJEnM0rGgLfhY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E8C1A8DC4A85B84A87A525BDF60329EC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81472de-0f92-4fae-506e-08d963352ac5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 17:17:05.0956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWqEnqxlYKLMyQ628cdKVGp0Z00YGryCVcLH/c6LgANbFSQZBKkuvxARH4zN5M2Sm4p3fWCXNce4fYEL+pV7eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3712
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 19, 2021 at 08:04:16PM +0300, Vladimir Oltean wrote:
> The ocelot driver was converted to phylink, and that expects a valid
> phy_interface_t. Without a phy-mode, of_get_phy_mode returns
> PHY_INTERFACE_MODE_NA, which is not ideal because phylink rejects that.
>=20
> The ocelot driver was patched to treat PHY_INTERFACE_MODE_NA as
> PHY_INTERFACE_MODE_INTERNAL to work with the broken DT blobs, but we
> should fix the device trees and specify the phy-mode too.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---

Please note that the pre-phylink driver has this check:

		switch (ocelot_port->phy_mode) {
		case PHY_INTERFACE_MODE_NA:
			(...)
		case PHY_INTERFACE_MODE_SGMII:
			(...)
		case PHY_INTERFACE_MODE_QSGMII:
			(...)
		default:
			dev_err(ocelot->dev,
				"invalid phy mode for port%d, (Q)SGMII only\n",
				port);
			of_node_put(portnp);
			err =3D -EINVAL;
			goto out_teardown;
		}

So it does not actually expect PHY_INTERFACE_MODE_INTERNAL and will
error out.

Are we okay with the new device tree blobs breaking the old kernel?

Should we instead wait for a few more kernel release cycles before
changing the device tree in this regard?=
