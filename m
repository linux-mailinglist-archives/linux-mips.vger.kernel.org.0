Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D849E51D1C
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfFXVaE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:30:04 -0400
Received: from mail-eopbgr700091.outbound.protection.outlook.com ([40.107.70.91]:51552
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726383AbfFXVaE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czOtUTB2pP352IfPOY2MW9vZBUIUuBQyzv94/5gCahA=;
 b=KRwavBBKsGpqz0AwtzhD0r8edOQT24GizRcYMWwdxp+5z3g6rR660MuisjHrVA4HAiuKsBTGwzeeUP2u+5hs26+laRtDK+i+5TTFxrlmZUdNCQwq4Hdrazmxgk+X7jT/DTtW8NAahrBm9TqwsyZhkGHTlQG8X5SbDVlcxDClIwI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1502.namprd22.prod.outlook.com (10.174.170.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Mon, 24 Jun 2019 21:30:02 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:30:02 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH 8/8 v2] MIPS: ralink: Add GARDENA smart Gateway MT7688
 board
Thread-Topic: [PATCH 8/8 v2] MIPS: ralink: Add GARDENA smart Gateway MT7688
 board
Thread-Index: AQHVFGx4mqLucxlvx0C6jZdoJypdWqarfxsA
Date:   Mon, 24 Jun 2019 21:30:01 +0000
Message-ID: <20190624212959.he2xf4pkm35c7k53@pburton-laptop>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-8-sr@denx.de>
In-Reply-To: <20190527091323.4582-8-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dce0a13-98c0-4d8e-93e3-08d6f8eb1d7b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1502;
x-ms-traffictypediagnostic: MWHPR2201MB1502:
x-microsoft-antispam-prvs: <MWHPR2201MB150229B673484C29698E04C9C1E00@MWHPR2201MB1502.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(7916004)(346002)(366004)(136003)(39840400004)(376002)(396003)(199004)(189003)(51914003)(6512007)(9686003)(33716001)(73956011)(66556008)(64756008)(66446008)(66946007)(66476007)(4326008)(8936002)(5660300002)(8676002)(81166006)(81156014)(3846002)(316002)(68736007)(58126008)(54906003)(14454004)(478600001)(66066001)(6486002)(229853002)(99286004)(6436002)(6116002)(7736002)(2906002)(25786009)(14444005)(305945005)(71200400001)(256004)(476003)(11346002)(446003)(71190400001)(486006)(44832011)(6916009)(1076003)(6506007)(386003)(102836004)(76176011)(42882007)(6246003)(26005)(186003)(52116002)(53936002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1502;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jSIKO5j5r+3oPhbGD1b5yG9nUtW3JPjQDqKA2jkZMbL1gCsci3Vs6xrUPm2mfNFjAMD8sLHG6Gy0opWAQWKgeOBsEFxXh6oYg9umogvYl1uJgqQC138bOg7yjreF25EeEiqPjSvcf5vlSym7D12RmRTB6B8htSRb9bbv2LTRxSWm6W97WRmYtegtnWJqBngzfL5BM08XYC6mW7E/fCOqcIM+giJEjtNm6P0iLWms7y7jA4xzWV0RMEuJ70kKBY5Ci5oUm5wGAISoHut6qTejW4Sn71b31fjUaLG8oEQosm2hfHa5Uy2FEizQWVQUEpUhxf6vdaR3rXdWXksJQ2QWn5TDy8LIrlG19KOAYEfujfkOBmW/hXVZat1i27L5qkiqhLpBaPnRdXUyQA6eSs5/Zt7RoAMaAEjF/xSm5At/FP0=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D0A6F879F48C848922354B4D1E9A35C@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dce0a13-98c0-4d8e-93e3-08d6f8eb1d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:30:01.8137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1502
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stefan,

On Mon, May 27, 2019 at 11:13:23AM +0200, Stefan Roese wrote:
> This patch adds support for the GARDENA smart Gateway, which is based on
> the MediaTek MT7688 SoC. It is equipped with 128 MiB of DDR and 8 MiB of
> flash (SPI NOR) and additional 128MiB SPI NAND storage.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: John Crispin <john@phrozen.org>
> ---
> v2:
> - Use Harvey's new email address (not at imgtec)
> - Use correct linux-mips list address
>=20
>  .../ralink/gardena_smart_gateway_mt7688.dts   | 196 ++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt768=
8.dts

Thanks for the patch - this one sees checkpatch complain about the
Gardena DT vendor prefix being undocumented, as well as the board
compatible string:

WARNING: DT compatible string "Gardena,smartGatewayMT7688" appears un-docum=
ented -- check ./Documentation/devicetree/bindings/
#40: FILE: arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:14:
+       compatible =3D "Gardena,smartGatewayMT7688", "ralink,mt7628a-soc";

WARNING: DT compatible string vendor "Gardena" appears un-documented -- che=
ck ./Documentation/devicetree/bindings/vendor-prefixes.yaml
#40: FILE: arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:14:
+       compatible =3D "Gardena,smartGatewayMT7688", "ralink,mt7628a-soc";

Could you add the entry to
Documentation/devicetree/bindings/vendor-prefixes.yaml & a short
description of the board somewhere like
Documentation/devicetree/bindings/mips/ralink/gardena.txt?

Thanks,
    Paul
