Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6A270B26
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbfGVVUU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:20:20 -0400
Received: from mail-eopbgr770107.outbound.protection.outlook.com ([40.107.77.107]:63529
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728441AbfGVVUU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:20:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMWlTsfceOHPHZJG78JghMAgBYdFaa4NOJfTyD7FicZGLJYs7xsM1yrdGJmOVx5+uBiezjmfJiD8L7Q9P/cW9V/Q7eu/xosaWS/Dm541h2JUaBqPsAxQ+qg/BWk8kJoFvi7oDVU4MV8MU+zWZsz99fUclXyxN7dzhfyqz2Ju2yznBX2gk+4dfDF5YGKhYMI5/LsqH34lPbVnUIcth/o2YouSzJM0LT8GTJl6NO7qNywDDYsXPJY5wNCKjOKBR3f9ILpcbn9YwCY/L5pIZPXxl0bUU++EaEnTPUfrRIgkKPXVwOkvWm9tALVJjJ2OKqX+tn8x6jMml8BSkq3JiTaXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLfsi4zAVOwnBv/AfvglnZMkBLrWQ32l6e63oPuuDQ8=;
 b=TB19GHTU/TNQs8dTaPqfIhy2M8+x4p+aI91lwvQb1kGmSTpmk0uILf64rcLrXDZMNFvxr0O6zKVRB4BjNjHv5AM+WNJIe5KFUBGjIHhnWa7psw679phWHgxRiJg+zik1E8TdnOrMfLszbCwgc2Ck6vSAvSBg2WdwukmMnYUkMEZZP/W0nMvqg2z8Wi7HXdlOPE8e2DsD0RktEofyiOdzFkTLL/HhAgs48HfZXHQOsOv35Z0fleNTemOvlh9iII6RSYNEtIFFIR6hgw/mTyBv9UNd/nwf956fMCO5/aQZKYco6atIf+yQeST3XKlAk41K1vqTb/t0mtdWhXpxjtfUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLfsi4zAVOwnBv/AfvglnZMkBLrWQ32l6e63oPuuDQ8=;
 b=awJ6oNEM8o4VNPxJoEQNSQzHRW1+2xQx+Ko5Z/U78F6rZpGwQDJhHpZfkBu9H5st77gZbhpRJWojeyulsfIfmbJryw1mqVDs5WZjkIPGBkabbBHffzjoNIuA2JlxCh4N7H4Lq7ALPNQqKM0po3SJQ3tTDt9P8+xyY1IJdEmw0xQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1247.namprd22.prod.outlook.com (10.174.162.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 21:20:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:20:17 +0000
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
Subject: Re: [PATCH 2/5] MIPS: Add partial 32-bit huge page support
Thread-Topic: [PATCH 2/5] MIPS: Add partial 32-bit huge page support
Thread-Index: AQHVO1XoQ2GfGJeX6ka8ydBED/h9l6bXL9cA
Date:   Mon, 22 Jul 2019 21:20:17 +0000
Message-ID: <MWHPR2201MB127740D80392D2E38E0AB43CC1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190715214003.9714-2-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a39402ce-f8ab-4e57-250a-08d70eea648c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1247;
x-ms-traffictypediagnostic: MWHPR2201MB1247:
x-microsoft-antispam-prvs: <MWHPR2201MB1247957C94E59C3CD6EF9AEEC1C40@MWHPR2201MB1247.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39850400004)(346002)(366004)(376002)(199004)(189003)(33656002)(66066001)(316002)(99286004)(14454004)(256004)(44832011)(66946007)(52116002)(6506007)(386003)(102836004)(4326008)(76176011)(4744005)(5660300002)(52536014)(6246003)(68736007)(229853002)(7696005)(66446008)(64756008)(66556008)(66476007)(54906003)(81166006)(3846002)(6116002)(11346002)(9686003)(53936002)(55016002)(446003)(486006)(8676002)(81156014)(6916009)(2906002)(476003)(42882007)(26005)(186003)(71200400001)(8936002)(7736002)(478600001)(71190400001)(6436002)(74316002)(305945005)(25786009)(14583001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1247;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rrF6v3Roy1IlFjBJqEFqJeVcEDcRKbQ9gcXywfWAtbQQ2JpgoHKMdWXYvOdtVoKDmIZB00KGGa7UZaem+y+PPo7hHk7wnV52I6YJr2YN8XSDlJPnpSNN6Wr2h+STRO8Y62XG0WWO8np4fwwSZqeRI2GBmW82zbtaM5ISt3yKTayms2WA9DaHEHB4bs7V+c3y4svSjA1n6EPl+DQSHcG59bzAEFeqGO+dUDwX+j1HbxEJfDDsdoK22hqjQ44gwNl7kermZRFbnA6w6MPuYUihsXHMADwYu4q65fHwfq2K8uGtknk31DEcow5jqDhyTtjzDjxSSUEw9LDOOVE3UQDY+Nes5aGa3/gfB4hHk3u2ZPi8L2XbBWU9cu6ezvFBzEGldY1C4hNf399yDrZ5mmIoMPZEaq32E+Oi1z2hD3cm1DQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39402ce-f8ab-4e57-250a-08d70eea648c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:20:17.0868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1247
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Cercueil wrote:
> From: Daniel Silsby <dansilsby@gmail.com>
>=20
> This adds initial support for huge pages to 32-bit MIPS systems.
> Systems with extended addressing enabled (EVA,XPA,Alchemy/Netlogic)
> are not yet supported.
> With huge pages enabled, this implementation will increase page table
> memory overhead to match that of a 64-bit MIPS system. However, the
> cache-friendliness of page table walks is not affected significantly.
>=20
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
