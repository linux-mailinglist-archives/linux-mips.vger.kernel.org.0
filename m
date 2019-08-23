Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E5D9B263
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2019 16:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393859AbfHWOpO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Aug 2019 10:45:14 -0400
Received: from mail-eopbgr760121.outbound.protection.outlook.com ([40.107.76.121]:22717
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393839AbfHWOpO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Aug 2019 10:45:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOZB5Kiyr9QtEpF3JEzrwhN/Z/5cQSu0ylaDsrITXwbI1u8Yji7c/juTQcLp5aXgoh48+HN6OMXnKr/ex3x+vnfOw8Oy8NKXBiMEmFKuwG6cpkpLxKEaGp2464xLTBmtpvyUTIYuUuYU+ciLWUK4Vmq7I2UqiZP6aYVun82iy3fChaxiKQLUD9tR5g6YSNoFCjl18hJ69yovzWxqd2eXHF4pbg5rXGhk7xz/UdpL+S0fCBh05zSaD27Obdr0/uH6dMqhRIWRxVxPh2e7KIFphE+cqv2ZDnO9U0BIDncsGGCaAT6EDRmIxhsUbpx9b8S8LtIo7kGwk6sz2UtFE8MrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJuqR+9ksljcTgh7nVCW75AyIxsX1AkOj1XwCMsmmLg=;
 b=Uc4brvBWLeXJH5xjq2ZrZ3c5xtXFKTOK9aq/0FbsvkdmZZo8h/Z4N09LcJA3lfaR/5c1LvYrjhb6q1X1uFKcMWk5QgdnpzsNcBNe1byYmcIwFltiax73aLyRZ7Gfsm2MhWw157tXV1zO5aO/21RQle3uGHrXCCWhEa7n9P+SYiKeWITkjwee9lOTs6nFskYzWC4fQ9/2IEABaT+TV7WazVGYujvGKBLClS9gzquEy7EFKSXisPwZoZjqHtGmy+QsGE8PsZvITxM8cVbXPMKPKqfDlxR7NjtaB0MOr01YCAPOxSKcG3V0uGY7PDsXNl8pI3O6e72FutbQhOefNupHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJuqR+9ksljcTgh7nVCW75AyIxsX1AkOj1XwCMsmmLg=;
 b=qG8WdFjQRSs4M+kII8niYVzOhHWJd54L4XWMB+A73BHNjikHqrgveZrA/bhWxdOdxPQ/734C7vW8pjCqwrE4yln9QeX0Z4C0VnSTX8b56q+Zqs3rWApvLkNURdpRwe0jvIsWAghepOOLMwUzH/u+i8sU6gK4uxgi5emltZFkx44=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1494.namprd22.prod.outlook.com (10.171.241.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 14:45:09 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 14:45:09 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "yasha.che3@gmail.com" <yasha.che3@gmail.com>,
        "aurelien@aurel32.net" <aurelien@aurel32.net>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
        "matt.redfearn@mips.com" <matt.redfearn@mips.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v1 0/8] MIPS: Drop boot_mem_map
Thread-Topic: [PATCH v1 0/8] MIPS: Drop boot_mem_map
Thread-Index: AQHVWcFcYE+Lie3YYk6eIa4siUSzuQ==
Date:   Fri, 23 Aug 2019 14:45:08 +0000
Message-ID: <CY4PR2201MB1272B48BC8DCEACB50038F09C1A40@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0458.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::14) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ba360e-699f-4919-af48-08d727d87ea1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR2201MB1494;
x-ms-traffictypediagnostic: CY4PR2201MB1494:
x-ms-exchange-purlcount: 8
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR2201MB149430B1ECDA640E7FD601F9C1A40@CY4PR2201MB1494.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(396003)(39850400004)(366004)(189003)(199004)(25786009)(486006)(6436002)(476003)(54906003)(14454004)(316002)(7736002)(6916009)(74316002)(386003)(6506007)(33656002)(52536014)(186003)(44832011)(229853002)(5660300002)(46003)(11346002)(8936002)(446003)(42882007)(66946007)(66446008)(66476007)(52116002)(64756008)(66556008)(81156014)(81166006)(99286004)(478600001)(4326008)(76176011)(102836004)(305945005)(53936002)(966005)(7696005)(9686003)(6306002)(71190400001)(71200400001)(8676002)(6116002)(2906002)(256004)(55016002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1494;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TkrjHEqVBwDNzwxdhof8y11BPR3FO3nUW5/kYDCo2Kwbu+aEFltBpugxcySIHLhCTSDkb+oaHmaYd5CrwwmTo23mSDss/XOOzUbBfb18y05v8/hDc2GLdzuHnZXLldNwslFZqP5hGvQbTK6DvzKfWaIxgVuZaEE8JwDW0hlYwtYwhDRwdJn6NvVbiDIQqYte/A+xZm2oARjxX7HuxM8QHOH0sjOL266+ALckDMntUr2MgEzW2yqibITylTgvyszoGp++N5otejroRkgh6L0+pWnkiEgvncxVUENNaKtP8sBeo+rljSPXbSFh1K36RhSxlGGw4WzQSvZyqsD9kvtefFGfZgJyvoqPTx0saJTT3M99hEX3n+H6UqppCWFwPbamH/1Akb9fTeE6Syn8a15i5CgicXGbl1yu7SjLvyYN9C0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ba360e-699f-4919-af48-08d727d87ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 14:45:08.9128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WEHOOSNht1ZM4DtDXdhsImGjSOEqiHdbbOiZmdp/7aOao/AYM/kUMFKPch/bA2JBj5Ll28dGac87bfbpJWBAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1494
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jiaxun Yang wrote:
> v1: Reording patches, fixes according to Serge's suggestions,
> fix maar section mismatch.
>=20
> Jiaxun Yang (8):
>   MIPS: OCTEON: Drop boot_mem_map
>   MIPS: fw: Record prom memory
>   MIPS: malta: Drop prom_free_prom_memory
>   MIPS: msp: Record prom memory
>   MIPS: ip22: Drop addr_is_ram
>   MIPS: xlp: Drop boot_mem_map
>   MIPS: mm: Drop boot_mem_map
>   MIPS: init: Drop boot_mem_map
>=20
>  arch/mips/cavium-octeon/dma-octeon.c |  17 +-
>  arch/mips/cavium-octeon/setup.c      |   3 +-
>  arch/mips/fw/arc/memory.c            |  24 +-
>  arch/mips/include/asm/bootinfo.h     |  16 --
>  arch/mips/include/asm/maar.h         |   8 +-

Series applied to mips-next.

> MIPS: OCTEON: Drop boot_mem_map
>   commit 6cda3a5e002f
>   https://git.kernel.org/mips/c/6cda3a5e002f
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: fw: Record prom memory
>   commit 0df1007677d5
>   https://git.kernel.org/mips/c/0df1007677d5
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: malta: Drop prom_free_prom_memory
>   commit 79fd0fe44731
>   https://git.kernel.org/mips/c/79fd0fe44731
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: msp: Record prom memory
>   commit b3c948e2c00f
>   https://git.kernel.org/mips/c/b3c948e2c00f
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: ip22: Drop addr_is_ram
>   commit aa1edac13e5f
>   https://git.kernel.org/mips/c/aa1edac13e5f
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: xlp: Drop boot_mem_map
>   commit a121d6e0caf0
>   https://git.kernel.org/mips/c/a121d6e0caf0
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: mm: Drop boot_mem_map
>   commit a5718fe8f70f
>   https://git.kernel.org/mips/c/a5718fe8f70f
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   [paul.burton@mips.com:
>     - Fix bad MAAR address calculations.
>     - Use ALIGN() & define maar_align to make it clearer what's going on
>       with address manipulations.
>     - Drop the new used field from struct maar_config.
>     - Rework the RAM walk to avoid iterating over the cfg array needlessl=
y
>       to find the first unused entry, then count used entries at the end.
>       Instead just keep the count as we go.]
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: init: Drop boot_mem_map
>   commit a94e4f24ec83
>   https://git.kernel.org/mips/c/a94e4f24ec83
>  =20
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   [paul.burton@mips.com: Fix size calculation in check_kernel_sections_me=
m]
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
