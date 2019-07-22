Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A00870B2E
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfGVVVv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:21:51 -0400
Received: from mail-eopbgr730121.outbound.protection.outlook.com ([40.107.73.121]:51675
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732382AbfGVVVv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:21:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TID0HurzVHnx38K9PmXHq0dsS4WOUa+9FLMtsWl9Te5p316XuaAYGr9TSJ7dI/iadJ4bdISfkqPZcsMdy2Lj2LLz5j5WWaYT8zavsjrP4DICPHGqZI7Tr3WD8gsZNzxRI8RoghcjUBcbeRtbNOCRYhCKAZqt4pDqCM74Q3c9+oUsKKXRcObcyu65DZrcvB6aJ+dOm1pGTCquKXTBHHWhxHuE7Mzbeu7RKduW7EOvypnCzEkrNtDsUGL/Rr8lrdlVpZQssKiZzMS92p2tZfnWRNOMhzqGpMhWVfVD5BGXKCPVgCVxxE7S7vJMb29vFzkGQsaW+VrSMvK6FiGkRa9kJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRvwkt88Z7Nx21/g6IRaM9CnM9GErwDFA4WQfCjpJ34=;
 b=YGIa8ghBS8Fe6SXBbJAJW7WDcbdKrGe+ULwad0x1oSatimcMEc8+ZQ5xp1E/kXDcswFp5dKMojfvKyMucXzqd41adNDwQObjBZSYo7ruPHyxMov3ejX/JmnaDUrv54k2l87hyMSRqLAb0rotomgH4dUWj1gz4E+x6mCgXGSAYbSXNRJi8Ia70Iis9vFa6wH1G0MZXyMgBgNcGoClI/sGCr2XuFJvHc9BfgfbNGP09sXDw9qoL6AzraoLUDYUFFMXnVBspQRsoxnrTilskBwctkC/ULay9X8NLIGH036Iy7uLirLvGAaBY772RK6RFkG0gdsOUvfRWEEdLKKywLnlyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRvwkt88Z7Nx21/g6IRaM9CnM9GErwDFA4WQfCjpJ34=;
 b=nO0/JjTAQ4RlN01oV1QhMuoz9yZBAIEAIVdTC7A3IJMLdSZSAHKZbjtEWFvsKFv6Auvgmtz8LdAgmoX3DfiG55z6x0peJ2yU6h7nuvLIuaTiN/WjLNkwMpTsT2PmlA0jQH6Ym8hHBRw87N8pmnNyToM8aEJWPJtMamaEVlvh5gI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:21:49 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:21:49 +0000
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
Subject: Re: [PATCH 4/5] MIPS: ingenic: Add support for huge pages
Thread-Topic: [PATCH 4/5] MIPS: ingenic: Add support for huge pages
Thread-Index: AQHVO1Xxy3leCmZFC06YEjspcVPv9abXMEQA
Date:   Mon, 22 Jul 2019 21:21:49 +0000
Message-ID: <MWHPR2201MB12770CF90DEB69A65D8B7A59C1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190715214003.9714-4-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-4-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43f040a3-87fa-4aca-ac52-08d70eea9b7b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB1757D8C77475D3B04B0E4AEFC1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39850400004)(346002)(136003)(366004)(199004)(189003)(66446008)(66476007)(3846002)(6116002)(4744005)(66556008)(66066001)(6436002)(64756008)(66946007)(52536014)(25786009)(14454004)(476003)(8676002)(6916009)(9686003)(305945005)(74316002)(7736002)(99286004)(71190400001)(52116002)(256004)(71200400001)(4326008)(6246003)(26005)(81156014)(68736007)(186003)(8936002)(81166006)(2906002)(478600001)(486006)(11346002)(446003)(5660300002)(55016002)(53936002)(316002)(54906003)(42882007)(33656002)(386003)(7696005)(6506007)(102836004)(76176011)(229853002)(44832011)(14583001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 50jsMb+i4cAyucnpk6uENmqf/6lZEzSvXlBQ53KyvI6kXwZhMSVel6ir0t8TIOKsLfJ5CwxgKBRTTAEu+/08fXxuXeb6S5cmsRC8NfI2XOG9LQqwUZsbt6sQS1Lc/aEx9NGW7ZkOBtAUQC0uPxXUuXQHxOoJykRewWliJ1MssZut6RONBNnkjEwXuADeaPJmVEJMUpcN43itDa7RecJyuYReeJbHvEZ3HZqmKOAmcfrc6/Z9DXk16I7f2KNb1+9BP57ShabZUSNsLx+C3qcFaRJplP5uawwFHn1kkZk3pb1h0hscOd48anwkJ1I66zY87SkML+xQCtN3ZqbHXrc2fFn7P8PBNDskQfo+UWayDMRs284dlEoNhoeqWyCijv9ZVkYIioGKmsRaEcGGQbcB1iVFOCJKcCD5Izpz41SECWc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f040a3-87fa-4aca-ac52-08d70eea9b7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:21:49.2396
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
> The Ingenic jz47xx SoC series of 32-bit MIPS CPUs support huge pages.
>=20
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
