Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB903D1B4E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 23:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbfJIV7M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 17:59:12 -0400
Received: from mail-eopbgr800099.outbound.protection.outlook.com ([40.107.80.99]:6166
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729161AbfJIV7M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 17:59:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMUoFZ/z4bz5uOlfQ/qi1O05dzxMQ1bWrmnvAYSkaAue+ykKp85DE/A/YH4MJtd6/NyVjx//KRuWFGYePIBiPqZBAah+y4JY1c14iroSUKviJHCABrktDPJ85l+EqZbaRVS39rWso6Z7csXUwXhLQOKKsT+93mWWAe5dFjbq1LG5i7QdwB40iow1icr3dOCzOcYbBtI4cXWSVjWH3AbV+fHqRBvt7PFOopUMouuDroQwqpfPZbNSCHWK2OyOyt7yCJrhPin5r0uB6XeFQLdb5UC35G7p9UYGfVNGcy5LLib7bBJCYokM+gv1HeRLSmiRWbCy7ZMvc105BCFkPbgUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDNpjfUtMsgrqkAyi6iay2BGlBrO+73t+q6BPX7siRk=;
 b=horHhbh0PalaNV+Kl7T6lXHoBZcdWUEXEi59hOJQkI4/ewAhmnbuLLBeqDBt1Hs25zee2G/WlOHx5/YYT4bdTlWSpOiFjq9oTSinzylzBepRdgkEJAcYelYceQ2406NyJKkmMt/Bk5la2XaF5baSTR+1Eq6fsO/c67RKAAumL5SCt/m0heushHWgUDrU1bj7mSdOU+yfhI7K5m6sBw9qJbHKxLDg1UX0kM3txHWLI29DWy48ls6AHErtUUx91TZr+sn6aYnMUD1jZyEJzcAbeWeFmrcYG3BSRtvisPMJIa4qaqsAg6r6M2eNRCdQDU/RJuJefxZj6TIiQFFjw/SozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDNpjfUtMsgrqkAyi6iay2BGlBrO+73t+q6BPX7siRk=;
 b=XbNdCizwz9PDSpl4kBZ4hv5+hheyJE41CBs1taT5oH8MJJD+4blc0sQ193jW+dOZBhD1vBRJTK5HTzNa2CoMMeLerZY6vlB6CPIYotqXb8BQfSb7BxFoApAHYIgp4Ca3dAsN1JQ0I4AugEAaBjNZtozaGSEYz5bdX3l5fQNMlA0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1248.namprd22.prod.outlook.com (10.172.60.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 21:58:28 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 21:58:28 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 0/6] Clean up ARC code and fix IP22/28 early printk
Thread-Topic: [PATCH 0/6] Clean up ARC code and fix IP22/28 early printk
Thread-Index: AQHVfuyukmgOVvdByUe0BOLWKwweCg==
Date:   Wed, 9 Oct 2019 21:58:28 +0000
Message-ID: <MWHPR2201MB127787BAFB6F0B08F13C4B53C1950@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191009132718.25346-1-tbogendoerfer@suse.de>
In-Reply-To: <20191009132718.25346-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b72f6a6d-d511-4409-311b-08d74d03d117
x-ms-traffictypediagnostic: MWHPR2201MB1248:
x-ms-exchange-purlcount: 6
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1248A8E2649008243199131AC1950@MWHPR2201MB1248.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(366004)(136003)(376002)(199004)(189003)(102836004)(33656002)(11346002)(386003)(2906002)(26005)(6506007)(446003)(99286004)(71200400001)(966005)(42882007)(186003)(71190400001)(478600001)(5660300002)(44832011)(54906003)(316002)(476003)(486006)(9686003)(6306002)(305945005)(52536014)(7736002)(66066001)(6436002)(74316002)(8936002)(55016002)(81166006)(64756008)(81156014)(25786009)(6246003)(76176011)(7696005)(52116002)(256004)(6116002)(8676002)(66946007)(66556008)(229853002)(66476007)(6916009)(14454004)(66446008)(3846002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1248;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y81eehNxN7s4zGnArYUvMDyEgBXq5f//1aD1WKndy66zeOBtU2iZt/X5FoE4vvCvwRxkUnEuBUwW+TE6rd6HlO/WT22/MIYZ9eovqAD/H3DOxuXYbOtQnqIBFlHLHio1aWpP5LpLd0oWbxVxbD0Xxn7vZM6tvq0UMN5C13cydOkJCOexAWlLdz/TaGTioOFUVtm0/90MqQMvYqiY9e1BxN5tbpxMNYhTaRYqPszrgZnS0r4ysFJK0iz16EsKwkJDfkmXh2GJwlJGCw1/UQiXe48P+2qHYuafPIO6lmqA4EN9jFHtj5QgZStghA5G1hWBWjQv/eNxnGTUaQGQ5XZob84pej20MTG4oEdczkrP4MWCJXPaN8UgdL3fYxuyCEcZatVw2IzoYG6yeQcnuwTcVDBn/ohUtZSFMURpwL4QFOdWWbOt/1nbSkGA3ZkeIx0HVv3XWHe1lKrinblPQnTvBg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72f6a6d-d511-4409-311b-08d74d03d117
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 21:58:28.7101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBXJumxVF7e8CMQBCMBafHjp2yBcepDQ6c871tFWZaWft28wOZQ/rQQEWMF/7bYyu6rPC9jyjkeYslR+Fn3/OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1248
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> While fixing the problem of not working EARLY_PRINTK on IP22/IP28
> I've removed not used ARC function and made 32bit ARC PROMs working
> with 64bit kernels. By switching to memory detection via PROM calls
> EARLY_PRINTK works now. And by using the regular 64bit spaces
> maximum memory of 384MB on Indigo2 R4k machines is working, too.
>=20
> Thomas Bogendoerfer (6):
>   MIPS: fw: arc: remove unused ARC code
>   MIPS: fw: arc: use call_o32 to call ARC prom from 64bit kernel
>   MIPS: Kconfig: always select ARC_MEMORY and ARC_PROMLIB for platform
>   MIPS: fw: arc: workaround 64bit kernel/32bit ARC problems
>   MIPS: SGI-IP22: set PHYS_OFFSET to memory start
>   MIPS: SGI-IP22/28: Use PROM for memory detection

Series applied to mips-next.

> MIPS: fw: arc: remove unused ARC code
>   commit d11646b5ce93
>   https://git.kernel.org/mips/c/d11646b5ce93
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: fw: arc: use call_o32 to call ARC prom from 64bit kernel
>   commit ce6c0a593b3c
>   https://git.kernel.org/mips/c/ce6c0a593b3c
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: Kconfig: always select ARC_MEMORY and ARC_PROMLIB for platform
>   commit 39b2d7565a47
>   https://git.kernel.org/mips/c/39b2d7565a47
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: fw: arc: workaround 64bit kernel/32bit ARC problems
>   commit 351889d35629
>   https://git.kernel.org/mips/c/351889d35629
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: SGI-IP22: set PHYS_OFFSET to memory start
>   commit 931e1bfea403
>   https://git.kernel.org/mips/c/931e1bfea403
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: SGI-IP22/28: Use PROM for memory detection
>   commit c0de00b286ed
>   https://git.kernel.org/mips/c/c0de00b286ed
>  =20
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
