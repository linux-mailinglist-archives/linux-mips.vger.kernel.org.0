Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEFFD83D96
	for <lists+linux-mips@lfdr.de>; Wed,  7 Aug 2019 01:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfHFXCT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Aug 2019 19:02:19 -0400
Received: from mail-eopbgr820139.outbound.protection.outlook.com ([40.107.82.139]:20346
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726133AbfHFXCT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Aug 2019 19:02:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0WFXQaNKEqfyfWfox8sqqBlOtnQAg5m9KM6mmBHJ/mfi2UXA2JyfGNuKZi+M6EZRKp0YDS0xHACdZsv0sY8YlVYWR+bHWF7YsuMYGHZYl9URVxGBHyMi0TcWlh6gKbgZwomKs1cOSKwc4sFskhAY7sEUdv6c4xsoQxdeyoI0pIYYwOFYaF6tiNWRxJrbg5cHnMVzZQsSp0pCkvOeLw3/LTgx0GvgaJxaMejD29+MciJYn1moyIXZSJD17KBcdM5IUOVVyKce+j/U0jM/+D6txaXe0iQ5zAnKuJSijMq0ravbvcl6Dn6itZzwAHiz74UR2VZHOiKjEEEqZgSSkzlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7euFI8OYUm+NEXNwmTz+51gG4WX56Of7uCZEObQmnc=;
 b=QLLXvebMREqeZVaHGe/FEyqD+oXy+ljUz0cqpOvcL6xf8vDLGlJtz9RRy7gvh7uuHKdjgCbF3v7MO9uzTB5P2oYy8ePWrIfh/BiOrwb37rmYr/vcQtDqMYZPIi7zzLhJVcgDzzutrzVFO9zLCtnPN1nb4zcbk0rRlvBf2i5x4f4WCsPoMnrQRMMXjJVvpJcPzfyLmtu/le9WDA2W1SHlI2zefxbDKGSDce4ceXeWK+Xxt4UfE8fOr+EA48gDEYmEJyhj4lA6pTBD+Dzo7Gp8F3Ydp/mW2xPFBaQMefPPDpYIwiJhFCXw8v1anEfnwEu1Cw6cBk+/R3McxqHZlC1MwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7euFI8OYUm+NEXNwmTz+51gG4WX56Of7uCZEObQmnc=;
 b=DvQR+/tdes/iPgDAIqNxnyjfH8cK23jp7/ASblZnY9mL799VkcZlT4XyBvYBI9mUnKjjM5HWixSOvOSK7DaAWImwXTLGJ1tHrGdYtRq1zzZ6yTmkwAQ10xnvXd+EWQ+mwsKGstgvE7j4n2dqfj0Nqe+HagePeCQcCPwFWZz3v5c=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1198.namprd22.prod.outlook.com (10.174.169.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 23:02:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 23:02:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: fix vdso32 build, again
Thread-Topic: [PATCH] mips: fix vdso32 build, again
Thread-Index: AQHVTKr84D2YQOWUbke1AwqGjUbDnQ==
Date:   Tue, 6 Aug 2019 23:02:14 +0000
Message-ID: <MWHPR2201MB1277159F069EC421016593A9C1D50@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190806112509.3244608-1-arnd@arndb.de>
In-Reply-To: <20190806112509.3244608-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cf3d4e4-bf96-423c-bdc5-08d71ac21f45
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1198;
x-ms-traffictypediagnostic: MWHPR2201MB1198:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB1198E94046C94889E8C3D1F7C1D50@MWHPR2201MB1198.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(366004)(376002)(136003)(346002)(199004)(189003)(486006)(54906003)(229853002)(102836004)(7736002)(966005)(446003)(186003)(25786009)(4326008)(42882007)(11346002)(99286004)(26005)(81166006)(4744005)(5660300002)(305945005)(71200400001)(52536014)(81156014)(71190400001)(44832011)(256004)(8676002)(476003)(8936002)(316002)(478600001)(66066001)(68736007)(52116002)(7696005)(6916009)(2906002)(66946007)(3846002)(66476007)(66556008)(64756008)(66446008)(6116002)(7416002)(9686003)(6306002)(55016002)(53936002)(6436002)(76176011)(6506007)(386003)(14454004)(74316002)(6246003)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1198;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /BwxiPuj1MTmZsWOZAPWNXKSfxEwTVcz+ogEvkv8Pf8wVxMkHIw0cmyLT8rKUEsvyEXR8T8CUEoiNh0yunWCMr/JTVWzkRTu294Y9VRV9p/zIBmZQIAg1eC1HJHLSeQ1OZm2IK03ZtrIsnYyGIDyuKutdxQyq6WXyAoNGEtv2Ww48lmjoblh35uvNpXUrmq8GczintFDeYiZhH2oxqZC4ObrssuloYGZyA1W+Pcy9Jdhxj98EWa6OLzrIKf3doEnk8iQEp7E/gYA6JA13GsbzxiKwfmiseZJPeyBy8fBIYia02z27Nym+a7uXfJuIB1Jfm/4z5sfWjQAx/ai2MHcIDGOM2t2p0+k8x9zPwZtpF5KUIE5pSxLWrqg80u0O9KGtcdYqsag6JhWbNU5bfQzTGYoQSiXHP+Tgf6VuVi+eqU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf3d4e4-bf96-423c-bdc5-08d71ac21f45
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 23:02:14.8650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1198
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Arnd Bergmann wrote:
> The generic vdso support adds the same #if hack in two places,
> asm/vdso/vdso.h and config-n32-o32-env.c, but only the second
> is actually used. The result lacks the BUILD_VDSO32_64 macro,
> and that triggers a build error:
>=20
> ./include/linux/page-flags-layout.h:95:2: error: #error "Not enough bits =
in page flags"
>=20
> Move the macro into the other place, and remove the duplicated
> bits.

Applied to mips-next.

> commit 6393e6064486
> https://git.kernel.org/mips/c/6393e6064486
>=20
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: ee38d94a0ad8 ("page flags: prioritize kasan bits over last-cpuid")
> Fixes: 24640f233b46 ("mips: Add support for generic vDSO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
