Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E74A6BBE
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 16:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbfICOpP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 10:45:15 -0400
Received: from mail-eopbgr810108.outbound.protection.outlook.com ([40.107.81.108]:6377
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725782AbfICOpO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Sep 2019 10:45:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tyz9D8VJpMtrMoavplpuK09A2Lm1peIaZOXGABHFNYuUknNBpwahAz3u2LvHOaKu7qyCSNByB0Ci0rKc6hwjLD45pEo8M3TzITcB/deh21OU+TK+EqhRPpZrbpgF7K0m782+aRRowHwQIjvl5MOSkyfN3rr3te3ewy/CVQ0bKYBY/gizbRKM0pT/W+l6GUPC+zwKSMwR3SOxvd+4gw939k5GVXsaa9qp5kGPfawFPAzUdNKL+khmrn8H3t6J9TGa/I6XndX/NvvCC4Rj1MvXiO6MCvrZTZSCyLLOApLmnjZxsLqp73UMt/np9JWqzPLM0yhFhDsVwkMGpYqvkhnJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK15Py5WLDTzSEWKoqtxarGh2i5XbBaH7TXM9SAJezc=;
 b=hyr1hPhAjh99Z9+qI6pPasij6xvLy70BdA95eRmmiUBvH8X4R/mOVzVW7yRbs9myU1/Nn0EIli4TQhnM2fGJDJD8bjCMMqag7Y95ZkK3UpovKpp3ex6SWWkPTjQ+3/EcvlnW0ZTZFQWU4v6RlcbVFB0+UUbZIFct8qAEms65Vzfzgkj0mrT8I+VDcdNnTYLcd1efcQ0qQoktzGLU75B1hL64RzhmOlziITEClZ/zbdC7as1B1orN3z2IGqWLMhPj5KHl4xjFCAL7wJLnNTX29ROU/yskfyGFKrtO95p7c2H52dAq74DR59wKiP99Lo7J80IfqzN0ip1u1PoRsJ5x1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK15Py5WLDTzSEWKoqtxarGh2i5XbBaH7TXM9SAJezc=;
 b=DgpR5trULApTjfBYUR/2Hng0nNVlLzjJZwr44tkTIlVaFNmet/YaDOu+at6lq29fOU5iGtXEKhVKXjLkXaMQ+cRCmARbeFiwfMNIN17RRIJ4Hd3Q10LCgW4amAz/z7njQzEm2JS1z6DiojlGfI/wnSzrAeeMlaC1kvhK4MTxhog=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1038.namprd22.prod.outlook.com (10.174.167.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 3 Sep 2019 14:45:12 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 14:45:12 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/3] MIPS: Select R3k-style TLB in Kconfig
Thread-Topic: [PATCH 1/3] MIPS: Select R3k-style TLB in Kconfig
Thread-Index: AQHVYBJy2mKp+srajkmCkRUcVHwG5qcaCckA
Date:   Tue, 3 Sep 2019 14:45:12 +0000
Message-ID: <MWHPR2201MB12775B698259FDB4E79C4DD5C1B90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190831154027.6943-1-paul.burton@mips.com>
In-Reply-To: <20190831154027.6943-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::32) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.196.167.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07e0a28f-e0ac-4420-4044-08d7307d5377
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1038;
x-ms-traffictypediagnostic: MWHPR2201MB1038:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1038E33CF37A3ED20B00C27CC1B90@MWHPR2201MB1038.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(366004)(376002)(136003)(39840400004)(189003)(199004)(8676002)(9686003)(55016002)(55236004)(102836004)(6506007)(6306002)(386003)(66946007)(6116002)(52536014)(305945005)(7736002)(3846002)(4326008)(33656002)(74316002)(71200400001)(5660300002)(71190400001)(81166006)(76176011)(81156014)(66476007)(229853002)(66446008)(64756008)(66556008)(256004)(486006)(478600001)(8936002)(44832011)(446003)(11346002)(476003)(14454004)(53936002)(966005)(25786009)(2906002)(186003)(42882007)(6862004)(316002)(54906003)(66066001)(6436002)(99286004)(26005)(6246003)(52116002)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1038;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ti97H1XmId/u8RLa1CRbtaSQtAFzQDY+pepKip7Rt3+eHprLiwOEkSF8DDiSzRiUD3Em3ZU5ymK+xTNNvk5OLQe9ovt/F4Yr8mwtDiIj2h7zv2GdY+p5SPVkG3V1cgmgzRR7hDgaxdctWCqECttDMiqAPaIX6XeqllD3OflxWx9Z/nRqRcMolPEPKtTHzbKJgJLRNcAOsndmhgurfjpILZzu3GZcaP2b2ZQVgA61buSBhznv4Y6QcsL/X/orDL/NTeLNjsEshkrsYhPkV/xCgr2OT8KTRD1ZFx1arxSlMN7G/EEn/sN/sW2bugnbka7fTmwBfYEgCyEJBmQtn0v7uTtcuW83XyZT1i997brLzd+Uyw7FNlRDPKDWoj9tmaaxUjoSS9A0wcLqP5v/flCnRETJGH+BSUf4Sh1QsV7RsZE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e0a28f-e0ac-4420-4044-08d7307d5377
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 14:45:12.7742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1ZYGShzaJK2WZ6h1Ixzr5Sk45NplrclbRwCJTBUbwqyciT4zlzHCnBCfTerCahBX3CfyV3sDCs4yPvOV85sew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1038
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Currently areas where we need to determine whether the TLB is R3k-style
> need to check for either of CONFIG_CPU_R3000 || CONFIG_CPU_TX39XX.
>=20
> Introduce a new CONFIG_CPU_R3K_TLB & select it from both of the above,
> allowing us to simplify checks for R3k-style TLBs by only checking for
> this new Kconfig option.

Series applied to mips-next.

> MIPS: Select R3k-style TLB in Kconfig
>   commit 547468293475
>   https://git.kernel.org/mips/c/547468293475
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> MIPS: tlbex: Simplify r3k check
>   commit 54e8d9f07d8a
>   https://git.kernel.org/mips/c/54e8d9f07d8a
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: tlbex: Remove cpu_has_local_ebase
>   commit 775b089aeffa
>   https://git.kernel.org/mips/c/775b089aeffa
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
