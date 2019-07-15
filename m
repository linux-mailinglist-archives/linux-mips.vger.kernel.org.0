Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1753068810
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729837AbfGOLU2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 07:20:28 -0400
Received: from mail-eopbgr820102.outbound.protection.outlook.com ([40.107.82.102]:56313
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729756AbfGOLU2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Jul 2019 07:20:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBC7N6ApxgruKVGwI7udCNBhGWEEyc7kTUdT5i/P7USjn+YDeO1gE2mXkA/OvtS/Y+ssFdzT64GjYZeisDKHozf+dn1OBoVjNiYr57iLC4a4DjuV+t6iv/Vw3S119NRfh33p8B6ZMXsjaLnRqDBXivquK0MRtEqA6j4WOGtGuVmJGswnm7xM4xz5EbLi0r5hNy6OYhkkcDPoeXKhEWyoIP1WYuL0MF/uKtyQNt2CByizL0mVaVVVNYBPsnbnB8a86ZV/+dXPSLZtv4RNxyh6iWwqIHFPGkJiB+sl7a+tjVzyH0+u9NCVoMLIlVCBYv7Mq54aX2tqTw2OgVEXLYY4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxaX8F2NgcCtkZbTG7UWxgFVvpGQS2Noj8yvgkoMqYc=;
 b=D3JrYx2IUx8NEwA5zw0ffE2uYJtOkb39qQAhJLy8F5PgQmyAjF0dGB4mle0sMUavHrOKv4KeZzRv/SmkFWgiGABS5fAaztxOO4I1xYOTvlutDPVD0dqi7TjEw3i4KFB7PM08Tjk6aQdYC2/sLVb2wG8Cvyv7F0jrBnAS04hQj7Lq29EKq4iqU9hAkSPGgKepoR+HUMrU3/GAQAY73xdOhjVWcet4nP+No9T/CyYzZn2QYHOF3S2iDHspptjHuuJYf2OReTaABAKRhnxlAEB3UNBj8kNSToa2iFjVHXw76KeRwRWhz5IqyFpIkJcqwTxKFhS4QX9arSVbztPYIs85Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxaX8F2NgcCtkZbTG7UWxgFVvpGQS2Noj8yvgkoMqYc=;
 b=I25kFIGjcUvEk5wJgbYWYv0UoHdE9hPftparGa74C1u+BgD4LX3KkOna5HpQSKoRozqb/9fwO06w5eIzPqE2NyfRJ2TaBHXNNHrjEeRH+qprYoOYNOL+6ItomZUZXI3+oRMSLBcnOdDTH0BlPptYcKuI4buOmhdSp06MGc6/ago=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1261.namprd22.prod.outlook.com (10.172.60.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 11:20:25 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 11:20:25 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips/kprobes: Export kprobe_fault_handler()
Thread-Topic: [PATCH] mips/kprobes: Export kprobe_fault_handler()
Thread-Index: AQHVKEu2eh9RzrG0MEKfVg9WqAObeabLrfYA
Date:   Mon, 15 Jul 2019 11:20:24 +0000
Message-ID: <MWHPR2201MB12774E1E320594611842D690C1CF0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1561133358-8876-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1561133358-8876-1-git-send-email-anshuman.khandual@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWLP123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:5b::25) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [188.30.202.102]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e00871f0-1722-4db4-8d82-08d709166e94
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1261;
x-ms-traffictypediagnostic: MWHPR2201MB1261:
x-microsoft-antispam-prvs: <MWHPR2201MB12610E31B075EE3F284A2CF7C1CF0@MWHPR2201MB1261.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(396003)(136003)(39840400004)(366004)(189003)(199004)(478600001)(4326008)(44832011)(33656002)(66066001)(71190400001)(71200400001)(4744005)(53936002)(68736007)(6246003)(52536014)(7736002)(305945005)(2906002)(229853002)(256004)(8676002)(6916009)(74316002)(102836004)(14454004)(6116002)(3846002)(186003)(99286004)(55236004)(26005)(11346002)(54906003)(55016002)(476003)(9686003)(25786009)(81156014)(81166006)(486006)(64756008)(66556008)(66476007)(8936002)(66946007)(66446008)(52116002)(7696005)(42882007)(386003)(76176011)(6506007)(5660300002)(316002)(446003)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1261;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sJOYNKg9JNgh4n9gJ2k/r1FS3MIkc0xnjNrdqN13E///KDtT4dZaIZwXZ8+EV0SGge2J4DYxKmIi7UZ47YILKCvVvM+Zs2EOxLHEQDUOz+2+1F0wWhNTvLttOGvFeyYXesbjpq6l5TquTon7hmvZLUDm9ZG7xaiwmUODoJ+/8mlGm4oiko1F/SPAqQ93nXKqLuYooptxGwQgG6ACwa42c1MShuxPG7KiDOh+pt8YNg8FDuywgxq3e8glOC1fmtH07ZdRgdmc3Y7XM5694WTPnMJ0kYo+3Pxwd/e/ixQTl3t+Ujwom7H5xo1fMSqis/OdUvpSVb4gEo7m3oShKeQxpRJfnM5j4F91d57AnC0tdP9EXKzogffpjlfx378QFenTmB4QJBfE1wYPvgBXTp23yDOGVsZT1dvLTj6cd44xzUo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00871f0-1722-4db4-8d82-08d709166e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 11:20:24.9327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1261
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Anshuman Khandual wrote:
> Generic kprobe_page_fault() calls into kprobe_fault_handler() which must =
be
> available with and without CONFIG_KPROBES. There is one stub implementati=
on
> for !CONFIG_KPROBES. For CONFIG_KPROBES all subscribing archs must provid=
e
> a kprobe_fault_handler() definition. Currently mips has an implementation
> which is defined as 'static inline'. Make it available for generic kprobe=
s
> to comply with the above new requirement.
>=20
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mm@kvack.org
>=20
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
