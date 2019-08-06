Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB21F83D94
	for <lists+linux-mips@lfdr.de>; Wed,  7 Aug 2019 01:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfHFXCH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Aug 2019 19:02:07 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com ([40.107.74.135]:1255
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725974AbfHFXCG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Aug 2019 19:02:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INmoz4eXM2ntDORtuWJqgBIrQAWAHy+/Rln+hGtjDrWlxfUuuFX0VSsqT3EQJIfujiSWFnCR+iDK25QPAGA4dmDBC6iraaYUFdBmWWSUI93//trWeniXMbQrP2k+HvNaE9tONuDzSViyeR1xUKUspc3ILKA9YRuLDZ1f34c/7CjNW3cSmxggLS56ICmK6xkaMNPCZPXaeez798gFqdHhuKSIUHcZuFS+QJV3oTke4aV4oCN7fDuGoWS5fCGaAwhSeBKdocYF3TmdUNTGnP+65D0prHOKgUQARd+aEJQc3ZqLiCm/57kR71APJDn0yuylUbXYd1xeJ7GWRnruNBxgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUJYuCO7RWte/Ul/XpqQsVcfsqQBozGceOKRqd9EHpI=;
 b=S5BEjO5W0RjeuUyTimRImCSTah5g7GS3IrkTgWXaQC/pI7OERnOwkNXBcsUq2zWPPOfDLAYgyjRvxvscqwvh5bwkf3anitRYlxjyAwVv5HioXfsNDhmKwmMsz13e5eT3exw9GnUwiY/VO2VkS5eVQCy1s/628Ecoakq3e61cHYvrYklzNO6BZ18pBPrlEwaMDPQinYVj19ENQnpDaTpHp0sTCYli43cQANUvz2Gd1fK8y6wOGoIWEb0HC2oiR69lu1wxJ2xEIsV0czLdQH8OS4tsKoqisMuIxtIS7SSqOIep5hDGxctkcsqA/mMzQBps1AFw9GtPFAD0t0U5rLvkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUJYuCO7RWte/Ul/XpqQsVcfsqQBozGceOKRqd9EHpI=;
 b=EvhQhv1xtafmklxngM5yTv/NarO25t8Zs6JepbYqoF/Z8moO4VBiM9z1QNOA6luaTAr0zdVV1vY68feBp9U0ruxPfMr1T65ZvQZO+zDlS9LYfHb3MEB6VU5oehYnGDhuAQhUaM9pNL/6T4wUqCFWfYY1e3ALB3qEv/wF8f3Mr2s=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1519.namprd22.prod.outlook.com (10.174.170.156) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Tue, 6 Aug 2019 23:02:03 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 23:02:03 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "malat@debian.org" <malat@debian.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "syq@debian.org" <syq@debian.org>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2 v4] MIPS: Ingenic: Fix bugs when detecting X1000's L2
  cache.
Thread-Topic: [PATCH 1/2 v4] MIPS: Ingenic: Fix bugs when detecting X1000's L2
  cache.
Thread-Index: AQHVTKr2THW3JwVNBUW249zIXgbWgQ==
Date:   Tue, 6 Aug 2019 23:02:03 +0000
Message-ID: <MWHPR2201MB1277252B4F5EC00386B604E6C1D50@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1564734457-48801-2-git-send-email-zhouyanjie@zoho.com>
In-Reply-To: <1564734457-48801-2-git-send-email-zhouyanjie@zoho.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44b44362-8510-44b8-712d-08d71ac2185d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1519;
x-ms-traffictypediagnostic: MWHPR2201MB1519:
x-microsoft-antispam-prvs: <MWHPR2201MB151953F0CDC21AF21C2551A0C1D50@MWHPR2201MB1519.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(136003)(366004)(346002)(376002)(189003)(199004)(68736007)(33656002)(486006)(256004)(14454004)(7736002)(74316002)(8936002)(81156014)(305945005)(8676002)(66066001)(81166006)(6436002)(9686003)(6246003)(229853002)(53936002)(55016002)(558084003)(4326008)(6916009)(2906002)(71190400001)(316002)(7416002)(6506007)(6116002)(186003)(76176011)(3846002)(71200400001)(26005)(99286004)(25786009)(102836004)(64756008)(54906003)(66476007)(478600001)(52536014)(66946007)(66446008)(5660300002)(44832011)(476003)(7696005)(52116002)(42882007)(386003)(11346002)(446003)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1519;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BEm6M2XzDmw1b5iealTl5e668SNHMILbmYIm4+/K87amMaiefgPViVe7M0qkhQvQRG1GIeg83V6hSaWWmsMpom/+aEYBpi2DyauFrqoMRMPf9x4G8N7uhF6jT16mzTm0bSQNkE0oNaOhppBksl19ArviSkF806cD7nVxnU5aQBbVKzOb7Rii/FuBqdWyjKojo50uAsyRX6hy41Kx0CKrqFg8AsLPSG60h/O9vuznxdT2xpr2ALTK7o/Ho2FIVt4O/G4Q/gjbo8j3Pt95E1hx1lO78CmoAFi1fAKHVJ5yI+VyDGVjYk1AS3zv8cQeh7ZH2vMp4rRE1ki2Nu4ueiSJvHulO83nOwFK/iNNkHrcwCyqlU6hl3Zri1C0SaGdBqTgdp6OEHy9kEnU1hKjJGeimh7xz0+7PGQAFB9UMGG6OHs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b44362-8510-44b8-712d-08d71ac2185d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 23:02:03.3932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1519
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Zhou Yanjie wrote:
> 1.fix bugs when detecting L2 cache sets value.
> 2.fix bugs when detecting L2 cache ways value.

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
