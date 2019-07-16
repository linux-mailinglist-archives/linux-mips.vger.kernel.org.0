Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6741B6A797
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2019 13:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387587AbfGPLma (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Jul 2019 07:42:30 -0400
Received: from mail-eopbgr790123.outbound.protection.outlook.com ([40.107.79.123]:38664
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387582AbfGPLma (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Jul 2019 07:42:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAR+wiwErDFrYoBGPyUvIsGb1gS4HK/t7gYyBUxbRvlFYvNKb0yQhN8TUKolgaQ4Lkgp2Y+d4hqQRtSqBwvLyCZty39FnmspnrejtdzNcsO3MzVzfaaBDZyMb2yc5Y8ryPQk3f4MaPb/+lTavhFYzLv7A8nupkzAVusc+3gt540CVO+rrZKMmeu/ez/Di9/vBNNGzwAk+PG0gTDc70s+95ge0i2Azm0uNQSD2YNKEM0mUlnqfNAvTVXLYsrEvjrq/vV6uqofH4c2mhx65Xr0RNczi6OM8g56oljqjhKHDJXlV0Bfl7QQcVXoPIiU/8UTOWA7YUsKOG/nWZ2Jcfxadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h8tABCJzsxE2qmQ9CG9PmZ//DE/W5dzQF1ycVlUs+M=;
 b=RaK/VNm2IvM/AV+Ljs7sBqMFT2SiBORQK2pf3f+GNWZuNIvEcqAx2LkjrG6m9gAVU+XIeXPdHNIfD/0TjHr0XR7CqIK/xl2N7ylZpyo3xWEGLQxarB4AMUsTIaUqDoLxAPYU05QHKKcxMoSxhM1krpjhkxKq4nTE9SvNHi6dTaPU9GxGfhdq18/zt1P4oKfsQV47UMz18rZRFTveaLlW0dayqxixdMicM015rf0jwF6Pib2V7CqxRl31XBLg51mJ8dNIQ1jfts9kVMnks5n4JrWB/4EQTCM0cbf0bcmkdo9rKu6LzPhutR/LdphUh86hFVHRbMdzpO+v0af/KRjOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h8tABCJzsxE2qmQ9CG9PmZ//DE/W5dzQF1ycVlUs+M=;
 b=nORXN4Nc8wEmqwTCDsOfDSTNt7prkYCxo+uWAt/WY7fT/7LvIZnGT+X/e5vJhmxD1phfIwvm9rWk+QSivfyi3Clb74hxAhjE1APi2VV06dYwX06DLoyn0Z8uFxv4ETI2NQpA7yxCco4DF5q2WXLwl3M4v4QH4FOven1igQ2PiT8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1552.namprd22.prod.outlook.com (10.174.170.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 11:42:27 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 11:42:27 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Crispin <john@phrozen.org>,
        Matthias Schiffer <mschiffer@universe-factory.net>,
        =?Windows-1252?Q?Petr_=8Atetiar_?= <ynezz@true.cz>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fix some more fall through errors in arch/mips
Thread-Topic: [PATCH] MIPS: fix some more fall through errors in arch/mips
Thread-Index: AQHVOwtgel77smof50yH54sFVwDx+abNIPEA
Date:   Tue, 16 Jul 2019 11:42:27 +0000
Message-ID: <MWHPR2201MB12779F73ACB565148B256387C1CE0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190715224640.5e086766@canb.auug.org.au>
In-Reply-To: <20190715224640.5e086766@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [212.140.138.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80dbaf4d-f130-4fce-5f23-08d709e2ad36
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1552;
x-ms-traffictypediagnostic: MWHPR2201MB1552:
x-microsoft-antispam-prvs: <MWHPR2201MB155269C46285DB7C539486E6C1CE0@MWHPR2201MB1552.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(39830400003)(136003)(376002)(199004)(189003)(42882007)(5660300002)(52536014)(8676002)(81166006)(66946007)(66476007)(71190400001)(64756008)(66446008)(71200400001)(66556008)(81156014)(8936002)(68736007)(54906003)(316002)(6916009)(74316002)(229853002)(7416002)(7736002)(305945005)(6116002)(3846002)(11346002)(66066001)(4326008)(2906002)(7696005)(52116002)(478600001)(76176011)(99286004)(386003)(6436002)(6246003)(25786009)(186003)(26005)(33656002)(14454004)(9686003)(53936002)(55016002)(4744005)(44832011)(476003)(446003)(256004)(6506007)(102836004)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1552;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yj6zyCOZ1E5Kzfqy4sNNL5T3SCdnVehY/28gRLShhFVQYw8U8fiYY18A0FMjpVpEYvQFAjF/K+5i1SV/SFEBfXSPZ2RN6+c1Zgo3uZZxP4yPTctk+CBM25ppbYrbaGlbKjfWmIHxdSjkcuaTSSUPWan9CQ09FLglQdd1AhE4oTaa11tdapIyKQ58ltLydWdHlcBi/0RRFtkTdef/E9VefYog+N65gYtCauWOK+WgK6uTb+LEPCSpMl9iAv1JEjEP7Pki7eRlzAFPJJQYI1NLFxM0G0kGNma6YLlC9w5T11GzrNVLu1KkEx0Xs0qZJHlZA9CUe+Z5mNYzaDyMBzHOkres5hPA/xvc2zw2Y6LGG+qne9AiB8pxWgnCYNu264Ycc8lV2fYIBLiNk0amxNI5FFvfAVzt065J/ETOmcNp+Yk=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dbaf4d-f130-4fce-5f23-08d709e2ad36
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 11:42:27.5740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1552
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Stephen Rothwell wrote:
> Fix these errors:
>=20
> arch/mips/cavium-octeon/executive/cvmx-pko.c:489:7: error: this statement=
 may fall through [-Werror=3Dimplicit-fallthrough=3D]
> arch/mips/bcm63xx/dev-flash.c:89:3: error: this statement may fall throug=
h [-Werror=3Dimplicit-fallthrough=3D]
> arch/mips/ath79/setup.c:155:17: error: this statement may fall through [-=
Werror=3Dimplicit-fallthrough=3D]
> arch/mips/ar7/setup.c:50:3: error: this statement may fall through [-Werr=
or=3Dimplicit-fallthrough=3D]
>=20
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: John Crispin <john@phrozen.org>
> Cc: Matthias Schiffer <mschiffer@universe-factory.net>
> Cc: "Petr =C5=A0tetiar" <ynezz@true.cz>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
