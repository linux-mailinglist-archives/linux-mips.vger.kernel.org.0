Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2588070B2C
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731077AbfGVVVr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:21:47 -0400
Received: from mail-eopbgr730100.outbound.protection.outlook.com ([40.107.73.100]:32192
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728441AbfGVVVr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:21:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt762uYVhnN7N9mo1pygdcvG1bALEvH6NTGX89jzdnTywS0nGFZsbvBjMRQVcTxzanHvXugUuaTpVpul+/+xp9OtNjUU+pYoO+jauIgmSrdR5LNFLa5rYn8yhVkW1cRTyVL2auAt1QvCbQc/yOaw/rzHK9BRE+tY+Qymdwd0DvksNkJoBamXpOXqR2NdJyCMArSBQIBpYrj7kaLjfwC0lQfRupOquGcwZ/T2BxNYy8FyctUKCBciH0mpOWqG8MbAOHorAFxfi+hKRNiteai2VW16VuhD7Yh1eW3w8Wx3FPtMf6zWAUeuSYf43Rnrmt7lDXYsRAXkZX3X/NaIdzktXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQCcBS447KnM1HD79qao1QUH7HNECQc77LWZoXVXA1M=;
 b=bX1m6esW+i1n2eRTs0oqo0DPHmdh3mnwzIEPSkC0f3BVeejXvWIp1D9tdIpWZkmP6cVtw5QenO3T06XyR9tnV04+v0dzfmjYOgh88m2AzNQHsygvdlleBC1Jpo0Fytl3wX83WiYRiqGsIVrhdwtXUgtEv08W5a7IzI/eW+fLhz0XsvGDIvX6ftzYM9XslUnjazIclmnrUxmPEqRyMqb8BodSYzVDL4revl8eDZXx48ZnBdID4DoRKifSnnVG/Cly/xNaXkLyOTttHYFJI39TUYe3vqwoIuBG+B+zqpGDbzHZywNJk8rB1zNv/WM2tNt/hdFja8jC08+ix26AaBT7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQCcBS447KnM1HD79qao1QUH7HNECQc77LWZoXVXA1M=;
 b=gNQjjkQbw0SqmJJ7i2yvVUFQnKvSP+/PhDBw1WeVnZafW0aY6yDD+sCGM1Vh6PqV/f53GECcbZI1Iv5i5WwdjXanPLOfLl6wQOx6/FSXvjzMkDJMaajyWy0wSrlYs5oYftZnQlBJLacjycaxZi0rVXrMq0NDBx+KCruFMTSE+E8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:21:44 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:21:44 +0000
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
Subject: Re: [PATCH 3/5] MIPS: Decouple CPU_SUPPORTS_HUGEPAGES from 64BIT
Thread-Topic: [PATCH 3/5] MIPS: Decouple CPU_SUPPORTS_HUGEPAGES from 64BIT
Thread-Index: AQHVO1Xt4RDEdfZ7wk+n1rhHxLuH/qbXMD0A
Date:   Mon, 22 Jul 2019 21:21:44 +0000
Message-ID: <MWHPR2201MB1277EF8CCF37DCBC460B157EC1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190715214003.9714-3-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-3-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:a03:54::24) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d80a4dd-e8c7-4fb7-0a73-08d70eea988a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB1757F6DEB63727259EC8BCA6C1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39850400004)(346002)(136003)(366004)(199004)(189003)(66446008)(66476007)(3846002)(6116002)(4744005)(66556008)(66066001)(6436002)(64756008)(66946007)(52536014)(25786009)(14454004)(476003)(8676002)(6916009)(9686003)(305945005)(74316002)(7736002)(99286004)(71190400001)(52116002)(256004)(71200400001)(4326008)(6246003)(26005)(81156014)(68736007)(186003)(8936002)(81166006)(2906002)(478600001)(486006)(11346002)(446003)(5660300002)(55016002)(53936002)(316002)(54906003)(42882007)(33656002)(386003)(7696005)(6506007)(102836004)(76176011)(229853002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BZd+m9ebGWyQ+O0pA7TkEV6mNwnNUUw4rcym7RghdoMnSBehO3yNoIk1UbY95vAQpA6CxLyZx1/GIAR+2FYVnBuWHQJGDgT3QjKACOkkiLxloU9R6EYIiK0MISfxpzs4KIuev5JjW83RuCGPC+B+GUqLlI5fw64GymbR2EC6jODv7lyZLTgDNWTxPXP1mLRV0tgz5m8Et5t41aKzwXTIAycZHjm9ZwYtmImYKuf+9bzYoXsj3zyBAV/5641kNR1GKKqCvQEeufViHDEgHFGT48Mi9qvy3Rtc9FmbjrZSEyGetBdOwpz2VPFPyIap9/8Zjt8FY903uKH05qVDkupqrlJ6dvy4+Q1VKSMPAPGJrwdQc+eeQtrB9AGFEGXcaiP+K+XM/4dxmTPF/oTe15H/lhXL1agHJFsCeZtBDRAFf5U=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d80a4dd-e8c7-4fb7-0a73-08d70eea988a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:21:44.3016
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
> We now have partial 32-bit MIPS huge page support, so there's no need
> to restrict these config options only to 64-bit systems.
>=20
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
