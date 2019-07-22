Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3C5D70B30
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732382AbfGVVWE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:22:04 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:38141
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729658AbfGVVWD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:22:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbO4vGvFazIOTzmwNW7+YCMyOGP8VgdkzMUpPkzUaad9lFPif/5d0cCK1BxC76XUp0mlMU7U3bJmEv2JgOrOx4MZf1adgQa3nN/3bRbk33hIqieRlg9xHEahzEXvl/XZVCbxxraL+lS8o9Xi38wkM8pgZXXYr1f/p/R5P2rtV4JZEFKec7dOaDAokd4x75ZoAgB7EzCimJFfr0ZKkiWPyXdfzWHhqT98LaovXF1HtTBPBcHSa35JIuXfJG5jLTADjvBUSi41r2ypeFY5npiCNObW35pgXZEBo6/ejNYBVRFzQZmR4jRRV4DeIbTM0f2QwoJOkxwGL38XNQZefsGeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mFVBJK6yyGjv4+q3VaE06dSoBaGbLx0wKKl3Rgl/ZE=;
 b=SpRS6T0bo1cdMkpXl+oXoA/2ChbJAHXyOlN7g0/bCjSWYdd274QAueD9SjYHQGUk5J3EcAwe8PtfElKMeCzvGxYyr6P12ky0v12alnPnurCOLcpbPrM4r0xoled1s+aXHUPk7qgIF0yy5mmTT4iVhybhuf7q2VqJ1GFE5O1K7W2P4o9P7/dyWiRsRomGx863Vbmbj8Hkv+bJMLqyr5ZOYbb5NSC54nxdmiTN26ye3hfxLo5c4PlJ4Dt2M93xV95R8oyI8/gZ6ibcNpsiWIT5ZlT91Iqwvighh+qFBFDE6lN5Dce+ZvIt2b62wqdh1PzKeAq1t8gqT90/Iql5A7tqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mFVBJK6yyGjv4+q3VaE06dSoBaGbLx0wKKl3Rgl/ZE=;
 b=d6kMHbtUknT0qePkzoNLel0L2KtTQEm4YynzIIRFNBZl1iKqOe1U6UXZQ2XUfLBYL6KjMqanSAcurZ8Cy+WU+wzySKJT8bCN4hdGEHhKNbfEGzwp8PqCQ7QUOoht55QvsiSOfw6xgjV3K0hvGa4lOeaGT9MuX0TpLuPm6BM0Z6w=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:21:54 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:21:54 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>, "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 5/5] MIPS: Undefine PMD_ORDER for 32-bit builds
Thread-Topic: [PATCH 5/5] MIPS: Undefine PMD_ORDER for 32-bit builds
Thread-Index: AQHVO1X1jPzZU0lnaUSKEiTxJqQBZqbXMEkA
Date:   Mon, 22 Jul 2019 21:21:54 +0000
Message-ID: <MWHPR2201MB12773D46ADA8877F351BA55FC1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190715214003.9714-5-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-5-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0042.namprd07.prod.outlook.com
 (2603:10b6:a03:60::19) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dffae790-4a51-459f-f35f-08d70eea9e5e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB1757EA23DA41D2BE7ABF565DC1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39850400004)(346002)(136003)(366004)(199004)(189003)(66446008)(66476007)(3846002)(6116002)(4744005)(66556008)(66066001)(6436002)(64756008)(66946007)(52536014)(25786009)(14454004)(476003)(8676002)(6916009)(9686003)(305945005)(74316002)(7736002)(99286004)(71190400001)(52116002)(256004)(71200400001)(4326008)(6246003)(26005)(81156014)(68736007)(186003)(8936002)(14444005)(81166006)(2906002)(478600001)(486006)(11346002)(446003)(5660300002)(55016002)(53936002)(316002)(54906003)(42882007)(33656002)(386003)(7696005)(6506007)(102836004)(76176011)(229853002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 29rD6wPgE21rvXKGm30TAx+hfRb09z2OUAyFZpowDAOnLBUf/TBp5REtTulS1EIAoZ11JmQr2MsOAaxiechvVc4NQXv4zwB+TT2anV2SQs8OQQnQWulnyBzArEu6qeyz2MshW4EFW0j7cNu3eu4aCxVBufE0ySGPx6D2zxA2ApPg3pd2q3dBOzMVAIA4VtCM3DR+ltskyVCUiHmsrBVgbCHl9No8C33Nw8ex4BhLlV8x5vdE3/0yf0e/U6CfaC9UvmeZVIUBy04zvmWWPdXdHpoYYIQCj1mWssrY6yDEscDl26EVuQ5bQA5PuC+3CE38TUQ0R1ksuErz8wGi5BCddVM/5RrUgip3XS6zLE0BYBE7q3anTtsPmraUdjOChaJoz+a3fJVjl4fNdqIPyjOPQWjYkwB/oUwvDoeR2wKQUZ8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffae790-4a51-459f-f35f-08d70eea9e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:21:54.2086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1757
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Cercueil wrote:
> From: Daniel Silsby <dansilsby@gmail.com>
>=20
> During an update long ago to conform to 4-level page code, PMD_ORDER was
> changed from 0 to 1, despite the fact that a PMD table is not used at
> all in a 32-bit MIPS build. PMD_ORDER does not seem to be used in these
> builds. Now, it matches PUD_ORDER, a nonsense #define to give a build
> failure with informative error.
>=20
> The older commit that had redefined PMD_ORDER was
> commit c6e8b587718c ("Update MIPS to use the 4-level pagetable code
> thereby getting rid of the compacrapability headers.")
>=20
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
