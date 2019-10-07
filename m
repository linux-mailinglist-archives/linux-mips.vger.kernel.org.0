Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329A3CEB0A
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbfJGRxl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:53:41 -0400
Received: from mail-eopbgr710115.outbound.protection.outlook.com ([40.107.71.115]:28393
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728187AbfJGRxl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dG5kkA0lqVJbmGUH80xbTeKoFZOMqrRmi5qygbTn5l2wUJeG9Gt95N33KB4tK9hywtbkMHNl2KUxclvNiwf2gKzwE6nHEllK0KH8pEhw60n0hQ+CR1MG+Yv5iFklzfw6BaVXmMUNLG49PdtXhF/z7XhgXakDUSSWSFuPjQzPsisIF57UecRoDF1CQ+lp6qU/ML1b68BEa8Q3Vro4SHlSexK9oE9UghJ2DPFdsNwFC9RlHxys7YeRZT9qgebSls0PLzgTLmBF3jxLVEJ9AGksS+C+PUlwKd+zf73nD3EGq8CsfQMNqC1JhS2S+JLgm+9E6Bgob6V0Xj9vKcP/6CEyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8pDZjrBAcRtfyCu/A7BsprKjOXum86ZTLPF44wyQx0=;
 b=gl4xMtaj5DDBZ4/ZH7h5c5zN/m7wNJtiAH0vFt1oBbPOwh/hterEnfav4qZU5fWlE+rHK6qjzeTQYlzHDy1uQFWKNXqO1RTy4xIt5Nzd4LwnyyiK+pCFqxAVVRtzFEaHrCe2saX4WE15E3U2EFTecgAo+tzKa9E/J4P7VugY4VWQwjkLY0mzQCkqcHvK0iZqh9ZYnXzJkn+wF+FFM7H17rCr7u2u2woTYuE6d0dc5H0JLu98Arx6Bmd7DDhX8y06UrN4JQ4pQtABI5qoyYteg+TebcWwZ4GbjHMdd9CqI/wwbPKqnkO2PolB+ntiHrfukV34SYBfyW76mIKv66aqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8pDZjrBAcRtfyCu/A7BsprKjOXum86ZTLPF44wyQx0=;
 b=hMixBG7RKj/f2I8Isz/nIn6NXh2cATXOE9ECzAnrYklOyJh/lg+4KQe8yw06LqvcFW/oUBqcwdfHPsIwBcjrIbff1A+wGhy/IFpSf8vV/W5ASGAPt5+/ZxHPif31BEK1YXjtYZOfGWyRj7UBRvpP6r/xfkzzN8TKn+LgsFxKJmM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1470.namprd22.prod.outlook.com (10.174.170.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:53:38 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:38 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Dmitry Korotin <dkorotin@wavecomp.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
Thread-Topic: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
Thread-Index: AQHVabzu21vL1CNsKkWTvmtyhwNF4adPnNCA
Date:   Mon, 7 Oct 2019 17:53:38 +0000
Message-ID: <MWHPR2201MB1277941D6F898B1AC122C067C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
In-Reply-To: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98d006b2-28ac-4e08-3e05-08d74b4f485f
x-ms-traffictypediagnostic: MWHPR2201MB1470:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1470C4DE8F1CCF861BC9AD1CC19B0@MWHPR2201MB1470.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39840400004)(396003)(376002)(366004)(136003)(199004)(189003)(52116002)(33656002)(7696005)(76176011)(99286004)(6436002)(256004)(476003)(74316002)(42882007)(11346002)(4326008)(446003)(229853002)(7736002)(305945005)(44832011)(486006)(102836004)(6116002)(3846002)(6246003)(71190400001)(71200400001)(6506007)(386003)(26005)(2906002)(186003)(52536014)(6862004)(9686003)(4744005)(54906003)(316002)(5660300002)(25786009)(66066001)(6306002)(14454004)(66446008)(55016002)(478600001)(8936002)(81156014)(66946007)(64756008)(66476007)(81166006)(966005)(8676002)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1470;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LfH7IpWHB8sXgyOwh+4XFWz9GA0Y01OAihp+dO8DuFzJAn414+ZxfAiXBjBlrfMCO5TFG/riMBJCsTXMkqdZANoV+1F+yba39Ow+ZVfrxnQVhv0FBBlMunM5B9Y7/SQeFD5JrRgC7fK18S/Tud23Iz0Z6W/fa+My3b4y9zT1dSXdQpatSMuRSxFazUtmb7VOaoNPro1F2baNHvRPS9OpHGy0NPkHXeEDNbXkOaa7wLyhLPDOw8Hy8ZQqljPXnwbQ4Ta5so98H1SCHOAM4aWFFvqj5E1LbvNUWDswpOSCsde45/D5bdn/NEQ9Qg2JcDOYbu0bzsGR5EOviVnyCMfT7gxpfrR6Q37FE+BKfzCtzATFqvmL0xk3+p+f7v6w1Jz7faJA0QPAhxZz7CHtiSoWaS1UMJpve5xmFoIbnIRlD8VoQRztMBy5sl8YIZ+YH/j/8gbCpf9107yJEEjyVDvfXw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d006b2-28ac-4e08-3e05-08d74b4f485f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:38.8004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24PUDwnBHE5r3G4Q6Sp8IghHc1qjmSeUhk82hqJ7MIICycqo3alqCUSnwKhvq49YBTKArZPX8BCiG7KSJTb/Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1470
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Dmitry Korotin wrote:
> FORTIFY_SOURCE detects various overflows at compile and run time.
> (6974f0c4555e ("include/linux/string.h:
> add the option of fortified string.h functions)
>=20
> ARCH_HAS_FORTIFY_SOURCE means that the architecture can be built and
> run with CONFIG_FORTIFY_SOURCE.
>=20
> Since mips can be built and run with that flag,
> select ARCH_HAS_FORTIFY_SOURCE as default.

Applied to mips-next.

> commit a2ecb233e3e7
> https://git.kernel.org/mips/c/a2ecb233e3e7
>=20
> Signed-off-by: Dmitry Korotin <dkorotin@wavecomp.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
