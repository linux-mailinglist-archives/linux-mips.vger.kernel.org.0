Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0024C9CDB8
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 13:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfHZLFc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 07:05:32 -0400
Received: from mail-eopbgr790095.outbound.protection.outlook.com ([40.107.79.95]:51920
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730553AbfHZLFc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Aug 2019 07:05:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zlidj6bOniJbeJ/ayBzkE+MHRHWcxmBhUhKj00DdzCHNhx3e/731yh9obDV3lcOblQ9CGX6LhGD1dYOfwZbOXJLEA0WIg2JJRIk53myDlpQiQFnVCXR0OcODCSPD36JehZzvf59dC+Q3R2DGGjwaNXeC372hubKipwo53yh6P90IXSrLE9HY2+tu3hPIiI0vx25vof8WwLDG03V/xe9LJdIE272fDxESgsphHl4INmDaxFqBmbF/B5U4WytVk16ZDsW4r3MFuOcTpodXe//8V1/jZFjRUX46p1UG7Uwq2WPV+6j97VGQ4u0s1GJHCVZsv4H9xI/80X85SjM5RuDMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV6E4wKRNp0KMjYgzDRBS4vAMOr+ucXkCtTAyF3qDho=;
 b=YFeFGlvpr0Y4ZUQHPjSwbHrpABMtSpQOZIDFEH0OrDltzjgGVGK1DPW1NC0ljYM1jSXAyHjdgBxClH5E54n08xBeRyF8pPfh4k3CRsipbWUNp1fpC/6YgszCkgHhaPfDaM9CyWl85vVgabOxtlydgMvekBYK41wUQQo06BqWsnUyHtx5lKh6TLBZlz86solLNEjZ2iCBu2g9vfklbMEz8AGhr32QiEWn8a52JaPuYJU02gHr4Pm+nd1DKl8Os6xqQ6OGLsrWqCYDAtxOgERcV57U0+lR1TS1sqJ1MJmEwW6rO1AivX15WsyOlJMYg8HPleFZmN0rv2NRPriAMEccaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV6E4wKRNp0KMjYgzDRBS4vAMOr+ucXkCtTAyF3qDho=;
 b=D0kUVJqhLQ5bEF+7O7cJ+XNbwhFXYv1+IeVd4NnStND5Ja7VMERtgEnTWqGgUVPGb6VRTlF/0pgvos6CjGm2bdDhngaPkyHOJkJ52o3p/XkR5cO4at7tcYtFMcVqhYvgsehutQ1Gj6ABbH74oko/1lwfo27mxrhJTA0MYHfxt54=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1469.namprd22.prod.outlook.com (10.174.170.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 11:05:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2199.021; Mon, 26 Aug
 2019 11:05:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stephen Boyd <swboyd@chromium.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v6 08/57] MIPS: Remove dev_err() usage after
  platform_get_irq()
Thread-Topic: [PATCH v6 08/57] MIPS: Remove dev_err() usage after
  platform_get_irq()
Thread-Index: AQHVW/4rkpqoUHHwWUC2lGsBFJJaWQ==
Date:   Mon, 26 Aug 2019 11:05:29 +0000
Message-ID: <MWHPR2201MB12777F732F56751B7306F664C1A10@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190730181557.90391-9-swboyd@chromium.org>
In-Reply-To: <20190730181557.90391-9-swboyd@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [79.77.158.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dde2aa3-552d-4068-2dc0-08d72a154e18
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1469;
x-ms-traffictypediagnostic: MWHPR2201MB1469:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1469DEDAD9A6C12BFCC431B2C1A10@MWHPR2201MB1469.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(136003)(39840400004)(366004)(199004)(189003)(478600001)(966005)(5660300002)(14454004)(2906002)(229853002)(6436002)(74316002)(6306002)(9686003)(55016002)(4744005)(25786009)(54906003)(6246003)(53936002)(66946007)(52536014)(7736002)(3846002)(6116002)(4326008)(66446008)(64756008)(66556008)(66476007)(305945005)(316002)(256004)(71190400001)(71200400001)(486006)(44832011)(8676002)(81156014)(81166006)(8936002)(66066001)(186003)(102836004)(99286004)(386003)(6916009)(6506007)(476003)(26005)(11346002)(446003)(42882007)(7696005)(52116002)(76176011)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1469;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cl6yqXucgvdqCkyvs8tMf2Hscmb8tfPZBsCTnXGnvIHnx8m4/jPlUKOXBe/dbEzXSkJMNcj/2eDLRc/DLIasC10sCbkNlYrMkqN0qSzv+G8PeE6XyFgL0AnvWwEDmbbJPFlar71xf3X8JLpdybbRtfUkzAnT74sxPFppQPz0Tg2bxWLKzItwausHGhwnOvCKExLr+fdo/JVOsCoXhcvoWO9SHnBHakP0PsW3ZUITwv8iomEcapNBmhya2HM/hHs9uiNVuWWP/7pvk8pQ+It1cuz/UELxEmAumlnmw2HB0C0npEtXNvFD5ap3+03kYaScKRdAhjdsZCWCl/7tm/AUEahL3cN3/4/NCyTsScUjudDe+HgpQnXrdz0svZaKFU9eBBLIBrzzr/QsS5YH9tnvhfMbtCPUmDK6x2NeVXUAZHI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dde2aa3-552d-4068-2dc0-08d72a154e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 11:05:29.2230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8A4qZPHh1kp615nDc5elJY5T4DaEJLPW8ygLyyajByIPfx/X+wHlr3Yy3J8vFt4oO3wqpde8Etr2TZaHzvnWbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1469
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Stephen Boyd wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
>=20
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
>=20
> ret =3D
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
>=20
> if ( \( ret < 0 \| ret <=3D 0 \) )
> {
> (
> -if (ret !=3D -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
>=20
> While we're here, remove braces on if statements that only have one
> statement (manually).

Applied to mips-next.

> commit 322e577b02ab
> https://git.kernel.org/mips/c/322e577b02ab
>=20
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
