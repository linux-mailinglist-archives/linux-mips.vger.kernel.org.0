Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D7F6D608
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2019 22:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbfGRUwk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Jul 2019 16:52:40 -0400
Received: from mail-eopbgr770121.outbound.protection.outlook.com ([40.107.77.121]:54916
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727762AbfGRUwk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Jul 2019 16:52:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB24cPmBoZeR4Ioe1MtHyR4BeIyigQ0SmlVXlDF5P5ennTM33LKGbZ7e61kVaIphGzUS7GSt/508I22Ij9pPhU89K4h/sDFN2dCqpr7e+EcUWXTIiONHlL4V2x/uFWGZdWo2GyjVoGBVrzEexy+genTn6mXbC8FNKGHODeiEBdpSw6RWBnycGCQ3kqR2Wn5NRwcH30+WF/xH6DCgTT9TsweZqnuOtzsumxQ8eQDSTcCQtZwl4XCq4Sx59oa1z2adDXuh5bvcKzYCvcAKibyxlHO9d4ioVqTuunOGnK2Cm0gKKPeshMDu8axtfyWANRru6n7/4wT4vMBW8nzbnJ5vfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI7T4dFZEKEOUI4/s4E22d91uqY/P/lRnJPim9NqdR4=;
 b=KaAFs1GKeJyB1vukRX3ZQlfYOPWgPa/nG4JAnSd5W7EbkObricxj7rez1rZIp7r33kEkg7lc6kEkCb0+7kIzo8ytMgq3LkbzAnVpPUTq/muWVWP+OXBBaVAMq0fteYJFWHaLzuxUEk01SLkhzfrq+kTsyl181EG+u46UB759ovtjiw+lb7hGRHxwDJ5C7U6btx1mPfrA6SURq7nLlEHAtwWnXvEW5B0xWMqVx6x6/2eIabyOka95WCSin6+CHOaPtQDef2AGv6dd2XAs/oiTUQSL+BDH28dcpE4OkTgod1j0gsfOfgLLJ6kpHk8EneiU+0/6aYnl4E+Qk7SNkCFxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI7T4dFZEKEOUI4/s4E22d91uqY/P/lRnJPim9NqdR4=;
 b=lQ67M2SqOXntyEj6X2F4SK85RreZaCjlYQjryaDViuJbWuSDQYAHdhEzkd+4PceZN+IU/TNRWmcMgib/mKrxSIBCCo3vLLRWQT9GJ+DbtvmBpnSgbhATJtXl08PBnz90GANVNWmrww5W2IhpXPp0/o2BOekkuwwNaDrDcToSpmA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1568.namprd22.prod.outlook.com (10.172.63.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 20:52:38 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 20:52:38 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Annotate fall-throughs in Cavium Octeon code
Thread-Topic: [PATCH] MIPS: Annotate fall-throughs in Cavium Octeon code
Thread-Index: AQHVPNvy4FFQV/ALgE2Z8yTenvwusqbQ270A
Date:   Thu, 18 Jul 2019 20:52:38 +0000
Message-ID: <MWHPR2201MB12774AD630897A6336E980F7C1C80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190717201159.23627-1-paul.burton@mips.com>
In-Reply-To: <20190717201159.23627-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3438d47-ea13-4360-4dad-08d70bc1ddf7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1568;
x-ms-traffictypediagnostic: MWHPR2201MB1568:
x-microsoft-antispam-prvs: <MWHPR2201MB1568C337B6D615C0D97CF663C1C80@MWHPR2201MB1568.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(366004)(39840400004)(376002)(199004)(189003)(68736007)(53936002)(54906003)(33656002)(186003)(229853002)(102836004)(99286004)(316002)(9686003)(26005)(446003)(11346002)(476003)(55016002)(42882007)(305945005)(76176011)(386003)(6506007)(7696005)(52116002)(486006)(44832011)(66066001)(7736002)(5660300002)(8936002)(66476007)(52536014)(71200400001)(71190400001)(8676002)(74316002)(6436002)(4744005)(478600001)(2906002)(6246003)(256004)(4326008)(66946007)(6116002)(3846002)(6862004)(81156014)(81166006)(25786009)(66556008)(66446008)(64756008)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1568;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L/GusH2gSrWRTdazq6IB+LJmdF9rcFlqqjO7YVGwe6ZNKYfWUNNv3HlEfp1Fz5/h2Yvygah9DoIs/BXSjmlDy9S49ovHkfjeAZ/dNlGXWNq56NEEqnzu5Ab0jrZO0F3lUV8gBzVgT7Dr5p8+5X5HhjJcUugWpjq+5+nb7XGMH0kiCGaYkl59lUbTd5BuGbrJ6tBOFNMQaQDTSOcsetDFscTgKDbfWTKk/kaPN+OWfHi51ub4F2WZO6cwlesUm4NoI/EtNyGPORVhnijL6Vk8Nr9ZlBzBm+/b+gtY8/MR/mTLLybaBZqDLBtYrDtAVceHKQH+te6Ci0V/QtfeYPgKq8uBd6s4yR2YEMOkE2YiloOPEqRm8vVW7qyEL3iVzjrMLQpchBKAcv+0Gv9N3DnTQBLmHFXekXTef/h+T54Hxl8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3438d47-ea13-4360-4dad-08d70bc1ddf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 20:52:38.4816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1568
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> There are a couple of intentional switch case fall-throughs in Cavium
> Octeon code, which trigger compile errors with -Wimplicit-fallthrough
> due to -Werror being enabled for arch/mips.
>=20
> These can be encountered when building cavium_octeon_defconfig.
>=20
> Fix the build issues by annotating the intentional fall-throughs.
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
