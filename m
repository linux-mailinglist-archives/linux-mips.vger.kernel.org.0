Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A964C296D
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 00:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731781AbfI3WXK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 18:23:10 -0400
Received: from mail-eopbgr770123.outbound.protection.outlook.com ([40.107.77.123]:27602
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726590AbfI3WXK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 18:23:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLiqDNEBYq3sCo6kFtYxM/2HkxFvzkQGKALvwoEEB7pJjjPK9Us3MphcfsGrvRMbyj2t72qB7BKmisxR3I8Vqltpf2flHA6/C5AeAH5gHfxJWhhxnrvVw3q9lWUk86gUjXaaqZ52BVTeWXRiABPW4wNumYscmOX9xnUh/qWLdOE36ChOjYnwCR74uGHimvKKEYV3FZjodGo2HIrBHpduiFS87sDVdrpW8mwgejfpdTzkAMTyFiwgMVdKoUB50X1eBNB3NmrlYbYAB4qWh7wgcZB7cpGWD6ApK1C47AmOqbHbesYk9lFum7l+iIvs0WinlkbKozBkMpRHi4QtyXdf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjIeJqFz0YD2vBhdgldufYFAKwa+c7twIwQ+b6mcOPI=;
 b=ARnLIzzRovSXRLpCRLQfQgd/V24EqC66EF1EaVOkBI5KiC0AnoWkClBzNVaTquNskDvjuYrE2si7u26nyF6QsQ1g4rnpLQgVnjgdX1rUWuopv5cvVy5uS4JzH86G86GKAieN+AAiTDlCvwjD5naeL/XZ3xPVVT4KDGpYW76S70kn0wQIR7sYxO1jXIuUCJUp6eIY90IyUX+5Xyo2kxnlyD4o9VBIgaQz+EIGhYeFB+l0mXtmrLlgyyX9LZi3MbxGcxFxAuf0D5XK1a345emzgrFb3gRhbkRPDUJ5eQpHG8o1h16Yc+Q9YZSVC2Ov2A9YTD31ZXNMbmcyRRPn8TZRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjIeJqFz0YD2vBhdgldufYFAKwa+c7twIwQ+b6mcOPI=;
 b=Nyv3MjpMf1oIvj0vVGgf5VCQEB/GQeiCOEE90bBXw1CRlg2A9WuIo99tkNlhI1FD8IWxAxbTcPVVZq55FnoCx9i98ToIRMr+Amgz2tlSJXgyahg80WMn37JFzidqLxIY1xSoQHjkFctTM775y0mcmGRcijuOe1yOSq3Olz8NHiE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1168.namprd22.prod.outlook.com (10.174.168.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 22:23:08 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 22:23:08 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v1] MIPS: dts: ar9331: fix interrupt-controller size
Thread-Topic: [PATCH v1] MIPS: dts: ar9331: fix interrupt-controller size
Thread-Index: AQHVd92icE8wAVdhU0ezG/dYASTkBg==
Date:   Mon, 30 Sep 2019 22:23:08 +0000
Message-ID: <MWHPR2201MB12777F4BB53AEC23CDE5B996C1820@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190930093952.22418-1-o.rempel@pengutronix.de>
In-Reply-To: <20190930093952.22418-1-o.rempel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bea83fa6-ebad-49b6-e452-08d745f4c54d
x-ms-traffictypediagnostic: MWHPR2201MB1168:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB11681BF5591A9B5BC85591ADC1820@MWHPR2201MB1168.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39850400004)(136003)(366004)(199004)(189003)(256004)(7736002)(76176011)(74316002)(305945005)(6506007)(386003)(52116002)(42882007)(26005)(55016002)(186003)(6306002)(9686003)(4744005)(102836004)(7696005)(54906003)(99286004)(316002)(44832011)(476003)(6436002)(446003)(486006)(11346002)(5660300002)(6916009)(229853002)(3846002)(6116002)(478600001)(25786009)(71190400001)(52536014)(71200400001)(33656002)(2906002)(66946007)(66446008)(66066001)(64756008)(66556008)(66476007)(6246003)(81156014)(81166006)(966005)(14454004)(4326008)(8676002)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1168;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dp809ggupFMy6BHOXmTv+jee4+sWcfLFHQrwLyZf8x64oei8XvL8RdRsNscYYh8guQIrN4asEGHLpB4aG4/xbywnZTholVBSdBn23ol0AArP8MDWch95xAB+rJD6My3oQMNd+pAdkldDuYlL3FNZY+/y/2DfGxV+sB2RrksX3pMfQZ/0+6r28bnb09a+7KIOshUbL/LwwZDn0THyUYhNZRm8TFTYdJcI4PAiJC8Y7AN43N6kuipVKFeZTb4wRoC8q4f+M/O8m5EHZMfP+OPweDKSQX+szXJefzEA1B5Uy6lMwpmvQrdI+xSRp4OGlKZ4/haRrjhLOf9m7psuL5gMUgtdlA70zN4Yjumfx9AejmunPthQmn+A58lfdZPuwCVmqMvsdVh0XExGIEkJzkqRFN3xPVPHshRNTQKJM6guIvs7bPHRUVljw0Odxebt8Ll2WylY295qjKpUZi8qAiLSCA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea83fa6-ebad-49b6-e452-08d745f4c54d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 22:23:08.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXx/qlLyw7rF6OO8l6Vwxw03jw+IQdSloGY8z/eoyhAg6eid4KnV+8psviibWMVfsLKnozOPBbdzKhBaXYW6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1168
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Oleksij Rempel wrote:
> It is two registers each of 4 byte.

Applied to mips-fixes.

> commit 0889d07f3e4b
> https://git.kernel.org/mips/c/0889d07f3e4b
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
