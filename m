Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58250CB212
	for <lists+linux-mips@lfdr.de>; Fri,  4 Oct 2019 00:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfJCWzA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Oct 2019 18:55:00 -0400
Received: from mail-eopbgr710096.outbound.protection.outlook.com ([40.107.71.96]:31714
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726393AbfJCWzA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Oct 2019 18:55:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odb22rc8xJ8oGv4Mr8QLs8bdsyhXbMuMaW5o9MT7HS02I3mofCBYc0fWjDJIv66XJUgWqCDUJvnuS56GjxFEKL6BrDk0WMle86rsid6jxv0rkefwCg1i+wPrbhMfXbXa0cJy3yMI0S+OVW80S+mt6+mZrTPqi4NpmR2+zbUXqa9y5/W0FSeuGTC/miN6G3ivGfjtPG7P710qX1EzXqVhymC36xcqVfnCFDFzlktPIr7GsNUFqLOgzSIf4p9EPeZg72EbbRf3lroWRay/HN2TAnRVqbF+my6Mp9nWTgQpwtQzH70tLaYWnBt1JIDrHNha94y4XKhP4FKHJnmSwBGAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/EVpFS9Nj+O68eznLYccfPeWe24dm06pohMxjq4cEk=;
 b=ViRNEHhC2Fl0hntts9qHy1rwN6aC7dnvnStcbE6a+7aoFbv117Ox5O9ko7hK5/0+n5CcwaKL0Je2x41rOQD5TIJ/aCWa6irx7WnwaKvXoD0HsjBGYddWhz5C9S4gGeJJF+Ba1IW+wtpHbZpe/EqVUuSyJs8DyLyBe3CqG6adZdRosstCqrWuFruwFfFZpHGqICaP5QOgmTG+VTNcl5ZuFBTRSJP2dD4XjdxXZ9tztie9bWUehzoisBRQ13fmD4ji3EnXRrOdDd0j0ILZWqer99JrC6h50jelPmGXZMaPcaSG7gq8h+t7786atr9i5o0imHUaJhHHFPawcOFNCXHVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/EVpFS9Nj+O68eznLYccfPeWe24dm06pohMxjq4cEk=;
 b=X1DMiH2tI/PcECXgPoLmaXqCnrCcEYA1PIeSjl5QloI437rfJLJzknW/ljhPTxdpXxz6r2yVFab4BVIJm8DmtISKzSqdSUK/s9dvM4DEgY1JDfRc29LLglV2ponAs63qEDLgVV65ykwXJ2lV+N+mtA55p5vBe/iBpCe7qEBNliA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1152.namprd22.prod.outlook.com (10.174.167.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 22:54:55 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 22:54:55 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2] MIPS: pmcs-msp71xx: Add missing MAX_PROM_MEM
 definition
Thread-Topic: [PATCH 1/2] MIPS: pmcs-msp71xx: Add missing MAX_PROM_MEM
 definition
Thread-Index: AQHVejxhSn0E15lrLUudQM5ULwarY6dJhqsA
Date:   Thu, 3 Oct 2019 22:54:55 +0000
Message-ID: <MWHPR2201MB1277BE98EB8C9747FBD4D7EBC19F0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191003224611.727276-1-paul.burton@mips.com>
In-Reply-To: <20191003224611.727276-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56998f3a-9788-4fad-c251-08d74854b561
x-ms-traffictypediagnostic: MWHPR2201MB1152:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB11525D25ECFCABFFAEDBDE25C19F0@MWHPR2201MB1152.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(476003)(6116002)(66556008)(64756008)(66446008)(3846002)(66946007)(66476007)(2906002)(4744005)(81166006)(4326008)(8936002)(6862004)(33656002)(6246003)(7736002)(305945005)(81156014)(74316002)(6436002)(316002)(8676002)(229853002)(42882007)(99286004)(966005)(386003)(6506007)(102836004)(7696005)(66066001)(52116002)(14454004)(26005)(76176011)(186003)(478600001)(256004)(44832011)(486006)(55016002)(54906003)(9686003)(6306002)(71190400001)(71200400001)(25786009)(52536014)(5660300002)(11346002)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1152;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tynmwgIzK5M2P+2cWG1w93pYJgIQ5QGguvwysz+Dht8b7LeP2yyqAQM6cUod+Z6NuB/W1nejAwXQQe2wnSPZxKGpCVbbFzossCeoDVqAjB1dS6vGF4po41qhc2KzoEYZex0td3KA8YJZjS7IfI1FuGlAqC+I4MJ0PnichGnXQcbX0deEl0MFgWlTrBKXXAohRvfIIL6WVKAcAn7BhJ2WwyCpaV6YWxjNlceuCLleGc0IIKmrbe3Yw4iyq5tSIklqB972gvJjQTDf8uUI1qnrfzvUPgO5VrZ5iOrWSTKtyX0Ag7uQxDNRNfZIFcpTfBqJ4z3aWey7kAdMMKY/ZWRIukMXL/8zZhwJrEIYk5nlVgYP9Zr/718bkJFYSPIUqrx+IfRljMzvvJzYTM8RamI2ununDGfFW2M1ezwhwRUP8l3bxEqq1Kxwg4fk7mVkoYiYa9dMz3QrwXzwtibm0yOQDw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56998f3a-9788-4fad-c251-08d74854b561
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 22:54:55.4999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rjvZfZ/Beh4q1KvyOmOr6Y8SZyuXiK/wZ4JpztNTxJ+bPRGcB/+Vdk5E5C9lFoPz52mFQu7DkVeOUVE25jTIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1152
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Commit b3c948e2c00f ("MIPS: msp: Record prom memory") introduced use of
> a MAX_PROM_MEM value but didn't define it. A bounds check in
> prom_meminit() suggests its value was supposed to be 5, so define it as
> such & adjust the bounds check to use the macro rather than a magic
> number.

Series applied to mips-fixes.

> MIPS: pmcs-msp71xx: Add missing MAX_PROM_MEM definition
>   commit 101c40ed269c
>   https://git.kernel.org/mips/c/101c40ed269c
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Fixes: b3c948e2c00f ("MIPS: msp: Record prom memory")
>=20
> MIPS: pmcs-msp71xx: Remove unused addr variable
>   commit 437450cf09c3
>   https://git.kernel.org/mips/c/437450cf09c3
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Fixes: b3c948e2c00f ("MIPS: msp: Record prom memory")

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
