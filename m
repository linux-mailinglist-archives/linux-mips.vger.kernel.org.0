Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B727770B11
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbfGVVNs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:13:48 -0400
Received: from mail-eopbgr710120.outbound.protection.outlook.com ([40.107.71.120]:50394
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728001AbfGVVNs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:13:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy9NhRshzTklmPscFRSgppZTfKFO84dMq+E5REPeUKclZqrTJaGsOG0IIzmpB1C/gOMhfgmHUmOoYshZoZzxmv/zjC5xOVqoT6C2qc/utnzgvXlYfJ6bkqSjSLo2S/AqEHhMmt0TzjrTeBjOc0rczBsqeaMtHxO69MIv1e6Zy0BikmaFXxsmOQXt09TdZ/RxCQ4HGBHkulscHe4TOE8SiE74E94FF+ILVjbeO1bndc2+ej4/dmhGu5hYE7pkMVKuQ1IscSdM3n3dM5OB4YKnCnt5pBUn01UqDcdekjVP8aWQCna/ivA1DSbthUJK2d3yPB0fcBciBUcDn+OftvM6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jITQvDSj0IJ24zFNXEy5mooVKxSUqjjEjk0w3wgFpVQ=;
 b=ED+r/gJj6rZ/6z0I+LctyKWFBnzFLIFL7xVpBwFp/Yttpip0xf9P9lZFWw15hiXFOSh7Hndr2Q62gVBoe2Bqe+mcBwB8Q1Trijj5v+EcVWktFk2wFKAnxuxYqiTUsJKinIae42kkCo+GWOJkJ7Fg313pIoOy95TilLFQPLr2wTmuz0Vw/5tidHZwC+55Sjkd47fQN9h0ynX9fGiFH/Bc7dyzddEL8SKE9P/5nn6c8o1eHjvouR1vlAaSyFFtZ0cTAmOJGbfT4iwvCY3KH4PYKEofXpe0x+JOHBxrDiS0B3UNlEga1F88iHkS/TmQAfEcq/I6agdP+iD1XMeJ9oLAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jITQvDSj0IJ24zFNXEy5mooVKxSUqjjEjk0w3wgFpVQ=;
 b=rbl7cmeydhlrTp2e7tien99ioMDaPNIXeaaQLdZL42K2gmvOIsJuxtd+NuEMMAtUDI9cjfnUCDPPK02vwrYQ66Yftq1jqjPcdzlXXNLgcC9E4nNHMMRoMw8yjksR4tJU5m6FEOS/1Y2Dz/zS4UY2CeupsIb5aDUIN3xlyKT+EGs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1504.namprd22.prod.outlook.com (10.174.170.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:13:46 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:13:46 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>, "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2] MIPS: Rename JZRISC to XBURST
Thread-Topic: [PATCH 1/2] MIPS: Rename JZRISC to XBURST
Thread-Index: AQHVBSZrV//oDl1AOkCny9Jo631A7qbXmmSA
Date:   Mon, 22 Jul 2019 21:13:46 +0000
Message-ID: <MWHPR2201MB12777764E50A96AAA1A5A048C1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190507224357.23778-1-paul@crapouillou.net>
In-Reply-To: <20190507224357.23778-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b89d3b9-3e90-4292-14bd-08d70ee97bba
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1504;
x-ms-traffictypediagnostic: MWHPR2201MB1504:
x-microsoft-antispam-prvs: <MWHPR2201MB1504723B6A904D624C690D14C1C40@MWHPR2201MB1504.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(366004)(39850400004)(346002)(376002)(199004)(189003)(8936002)(256004)(3846002)(6116002)(81166006)(2906002)(81156014)(25786009)(44832011)(8676002)(99286004)(68736007)(14454004)(33656002)(386003)(54906003)(486006)(102836004)(76176011)(6506007)(229853002)(7696005)(52116002)(4326008)(71190400001)(26005)(316002)(64756008)(4744005)(66946007)(66446008)(42882007)(52536014)(66476007)(476003)(186003)(11346002)(446003)(66556008)(5660300002)(71200400001)(55016002)(9686003)(6916009)(53936002)(7736002)(305945005)(66066001)(6436002)(6246003)(74316002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1504;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H/eSNgNIqaNt1jIPygObDZvuZgLR2WI28Vd+HBYwvIkxsdzaNJfbQxHikPPrp/ZHeSEHGxsvCcWBtX7kq5y2qFNaWk/7Z6Fs/VRWUblYP9ubYjA/Zd1u5/XP+oaB8w56NuaCsfWqOnPv1PEkeOENxVhLI7nemMnvyRCOa+/HIsADKcClLqfybcq+wRbbt5BorSOwsj30kg64Y7sp5kDFhHPpwY4gFXExF4KGVCjr3BxSGmobkQEsuXvsjb/vi+rbJ1qQdg3pTR2sktureSD+RQe3Mg6zPQsRXUWfQESxAQbo8CGvlLa2hbU5f1axEBMAzSUGF0fSHVfl1U/VqHqhiEA4Nj5tFZzncujg0+VxCTCR8oaGCtLT/vmHz6oC+mNrM3m3/YkqUpSsAcY/AozP9vKIvVhOjmN6Cw1pQ0EbWsI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b89d3b9-3e90-4292-14bd-08d70ee97bba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:13:46.5768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1504
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Cercueil wrote:
> The real name of the CPU present in the JZ line of SoCs from Ingenic is
> XBurst, not JZRISC.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
