Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4124DCEAFB
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfJGRvf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:51:35 -0400
Received: from mail-eopbgr680107.outbound.protection.outlook.com ([40.107.68.107]:20806
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfJGRve (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:51:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsTdCiZTWe5j8YVevistzEp2Bc0+6N9JycuAvgAeN1aWyoG8fuqDQv+OzHUE/cx1ylI4o4T0BVOLzBQJKGB6/oXPJr6nzmzeB2HMCue1cKrjQQKNRZfND+ZbN+1CYTDq14dtJHgsc3nIdXcR/GKiYhnZlI3F8UxIEwGiH08K8/nbwm4vRYuGM18QLgwcrxV7mCVJZL8AVe/1AJphpPCzT8QEmMK5vBKpu2WKoRWx2RbPxUo2WWHUNBZORuCdJUQato5WXlSEXGvXlwI5exFhxsWjGOY5suPgDZ8Ow7Q3TthlGsoaMtkZ4w/e9X3aFFqJqTyWmCLfRV4JmNYZYVF+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rMBaopP+fDm6uxIu0/r+2n1AclvJNQ8zRAgn1nXDQs=;
 b=h4hJGG/7clFrKTKxguoVYYrPX8DqhXCcxiIeEOL/hXwNjQAueA9Hb9rr5+fwL0ohlpVyMZuJx7DeAoL7g0YMNtDgwmSu+ykeGC3pljwHNPzRdDqcN1Mk9XvObdWDfev3mBa0ftvLtRVaOwsrJWKTPvVBOrIZjShu9hZVxg9C9dFGW/0aWuBjDv/u1QynzK6YmP5EpakIJYFbmF2ZrXLD5aoWamejD5KAjvql5brPj3E7mtT5+pTkjTi09qvjjXMr4bHK/snSIugKS4/iS/DM2mX8I3nCwu4l6sOebybaTSXH7kxsqapTRnNQDTKlamPlxjbp4pqd3xPR94Bc+Nz6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rMBaopP+fDm6uxIu0/r+2n1AclvJNQ8zRAgn1nXDQs=;
 b=oXpS6NBHGt/GMPrK9mvDXjjmCu76L2azA8zNL06vFeSGSotaoPSUzDhluL9s8DsJgmdyRNd6TMklJDreOC0lhuWsvYcnBcHv+tmJ7nUG/SEi/9CU4iwv/HENQfPlD7ehjUH8tVjvvnCr5+Mb+xnxdgQuTlTSVb83rIsv/5Khx2k=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1232.namprd22.prod.outlook.com (10.174.160.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:51:28 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:51:28 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 00/36] MIPS: barriers & atomics cleanups
Thread-Topic: [PATCH v2 00/36] MIPS: barriers & atomics cleanups
Thread-Index: AQHVeKKaZKEPRGamiECLP4Zg0pCBgqdPfmmA
Date:   Mon, 7 Oct 2019 17:51:28 +0000
Message-ID: <MWHPR2201MB1277091F2B297F9B47063E41C19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191001215249.4157062-1-paul.burton@mips.com>
In-Reply-To: <20191001215249.4157062-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fb286ec-85e9-4140-55fb-08d74b4efa8b
x-ms-traffictypediagnostic: MWHPR2201MB1232:
x-ms-exchange-purlcount: 36
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12328727FB80AA01AFD61190C19B0@MWHPR2201MB1232.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(74316002)(386003)(966005)(71190400001)(44832011)(4326008)(33656002)(102836004)(71200400001)(6506007)(5660300002)(256004)(14454004)(6246003)(8936002)(55016002)(54906003)(6862004)(305945005)(6116002)(11346002)(2906002)(446003)(186003)(14444005)(26005)(3846002)(6306002)(486006)(66066001)(9686003)(476003)(6436002)(66946007)(316002)(229853002)(81166006)(42882007)(478600001)(7696005)(52536014)(25786009)(52116002)(99286004)(8676002)(66556008)(66476007)(64756008)(7736002)(66446008)(81156014)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1232;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s/kbifcJcLhOGHUHHbCEFu2EZh2OgZpvG3Seicpe6D77QmmWTwCXvasGuA1M6vu1SlETYm0nZj2Tse6+/oPY4ELoDtGUKGZbVTBYLHVzTW0fsknKpl+cUK1QVqB+XcbPBm6L9m8C1HKm9/wVG9x4jI41mLcoVMf02BJ9Ceqn4kHL83bDPKWIPDU9oOtu1dfFQ+v9nQzv5oCFM1gzQwSs1Z96kt+dWau2rEJzINHVy46OE0TX6G25Y24YaO75OIIM/oK06bHEjaIbewYFYaw5jIf4m2xnk/0xm1KpwpB1F9hbsF+agJP5P6u/kFtGaZBzzyiyhpUydaBmTamHRgNE1V3BZK4A2NCDXAPX8qKk2KVeEIsHRaD4tIvrgv7Bjg0oZDuejuF2iU+5pHSoc+wzFCL8KTJ4HALfPux5zNuLNpNypZ92EmQVqfYfpnTBhLPumrrPsJzJeI9rVeyURFBUXA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb286ec-85e9-4140-55fb-08d74b4efa8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:51:28.1721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/03j6/Bh2Z4c1banmGWuGR7Np+vAjy6QVhZcIRJzQw2tYpPMUQO5FcnoLNSkSbSkU2pIOFB7fvkzhnezreP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1232
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> This series consists of a bunch of cleanups to the way we handle memory
> barriers (though no changes to the sync instructions we use to implement
> them) & atomic memory accesses. One major goal was to ensure the
> Loongson3 LL/SC errata workarounds are applied in a safe manner from
> within inline-asm & that we can automatically verify the resulting
> kernel binary looks reasonable. Many patches are cleanups found along
> the way.
>=20
> Applies atop v5.4-rc1.
>=20
> Changes in v2:
> - Keep our fls/ffs implementations. Turns out GCC's builtins call
>   intrinsics in some configurations, and if we'd need to go implement
>   those then using the generic fls/ffs doesn't seem like such a win.
> - De-string __WEAK_LLSC_MB to allow use with __SYNC_ELSE().
> - Only try to build the loongson3-llsc-check tool from
>   arch/mips/Makefile when CONFIG_CPU_LOONGSON3_WORKAROUNDS is enabled.
>=20
> Paul Burton (36):
>   MIPS: Unify sc beqz definition
>   MIPS: Use compact branch for LL/SC loops on MIPSr6+
>   MIPS: barrier: Add __SYNC() infrastructure
>   MIPS: barrier: Clean up rmb() & wmb() definitions
>   MIPS: barrier: Clean up __smp_mb() definition
>   MIPS: barrier: Remove fast_mb() Octeon #ifdef'ery
>   MIPS: barrier: Clean up __sync() definition
>   MIPS: barrier: Clean up sync_ginv()
>   MIPS: atomic: Fix whitespace in ATOMIC_OP macros
>   MIPS: atomic: Handle !kernel_uses_llsc first
>   MIPS: atomic: Use one macro to generate 32b & 64b functions
>   MIPS: atomic: Emit Loongson3 sync workarounds within asm
>   MIPS: atomic: Use _atomic barriers in atomic_sub_if_positive()
>   MIPS: atomic: Unify 32b & 64b sub_if_positive
>   MIPS: atomic: Deduplicate 32b & 64b read, set, xchg, cmpxchg
>   MIPS: bitops: Handle !kernel_uses_llsc first
>   MIPS: bitops: Only use ins for bit 16 or higher
>   MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
>   MIPS: bitops: ins start position is always an immediate
>   MIPS: bitops: Implement test_and_set_bit() in terms of _lock variant
>   MIPS: bitops: Allow immediates in test_and_{set,clear,change}_bit
>   MIPS: bitops: Use the BIT() macro
>   MIPS: bitops: Avoid redundant zero-comparison for non-LLSC
>   MIPS: bitops: Abstract LL/SC loops
>   MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
>   MIPS: bitops: Emit Loongson3 sync workarounds within asm
>   MIPS: bitops: Use smp_mb__before_atomic in test_* ops
>   MIPS: cmpxchg: Emit Loongson3 sync workarounds within asm
>   MIPS: cmpxchg: Omit redundant barriers for Loongson3
>   MIPS: futex: Emit Loongson3 sync workarounds within asm
>   MIPS: syscall: Emit Loongson3 sync workarounds within asm
>   MIPS: barrier: Remove loongson_llsc_mb()
>   MIPS: barrier: Make __smp_mb__before_atomic() a no-op for Loongson3
>   MIPS: genex: Add Loongson3 LL/SC workaround to ejtag_debug_handler
>   MIPS: genex: Don't reload address unnecessarily
>   MIPS: Check Loongson3 LL/SC errata workaround correctness
>=20
>  arch/mips/Makefile                     |   3 +
>  arch/mips/Makefile.postlink            |  10 +-

Series applied to mips-next.

> MIPS: Unify sc beqz definition
>   commit 878f75c7a253
>   https://git.kernel.org/mips/c/878f75c7a253
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: Use compact branch for LL/SC loops on MIPSr6+
>   commit ef85d057a605
>   https://git.kernel.org/mips/c/ef85d057a605
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Add __SYNC() infrastructure
>   commit bf92927251b3
>   https://git.kernel.org/mips/c/bf92927251b3
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Clean up rmb() & wmb() definitions
>   commit 21e3134b3ec0
>   https://git.kernel.org/mips/c/21e3134b3ec0
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Clean up __smp_mb() definition
>   commit 05e6da742b5b
>   https://git.kernel.org/mips/c/05e6da742b5b
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Remove fast_mb() Octeon #ifdef'ery
>   commit 5c12a6eff6ae
>   https://git.kernel.org/mips/c/5c12a6eff6ae
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Clean up __sync() definition
>   commit fe0065e56227
>   https://git.kernel.org/mips/c/fe0065e56227
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Clean up sync_ginv()
>   commit 185d7d7a5819
>   https://git.kernel.org/mips/c/185d7d7a5819
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: atomic: Fix whitespace in ATOMIC_OP macros
>   commit 36d3295c5a0d
>   https://git.kernel.org/mips/c/36d3295c5a0d
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: atomic: Handle !kernel_uses_llsc first
>   commit 9537db24c65a
>   https://git.kernel.org/mips/c/9537db24c65a
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: atomic: Use one macro to generate 32b & 64b functions
>   commit a38ee6bb14a4
>   https://git.kernel.org/mips/c/a38ee6bb14a4
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: atomic: Emit Loongson3 sync workarounds within asm
>   commit 4d1dbfe6cbec
>   https://git.kernel.org/mips/c/4d1dbfe6cbec
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: atomic: Use _atomic barriers in atomic_sub_if_positive()
>   commit 77d281b7966e
>   https://git.kernel.org/mips/c/77d281b7966e
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: atomic: Unify 32b & 64b sub_if_positive
>   commit 40e784b4d4bc
>   https://git.kernel.org/mips/c/40e784b4d4bc
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: atomic: Deduplicate 32b & 64b read, set, xchg, cmpxchg
>   commit 1da7bce8591d
>   https://git.kernel.org/mips/c/1da7bce8591d
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Handle !kernel_uses_llsc first
>   commit fe7cd97e68fa
>   https://git.kernel.org/mips/c/fe7cd97e68fa
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Only use ins for bit 16 or higher
>   commit 3d2920cf4fd4
>   https://git.kernel.org/mips/c/3d2920cf4fd4
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
>   commit 59361e9975fd
>   https://git.kernel.org/mips/c/59361e9975fd
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: ins start position is always an immediate
>   commit 27aab27259ae
>   https://git.kernel.org/mips/c/27aab27259ae
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Implement test_and_set_bit() in terms of _lock variant
>   commit 6bbe043bd3f4
>   https://git.kernel.org/mips/c/6bbe043bd3f4
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Allow immediates in test_and_{set,clear,change}_bit
>   commit a2e66b862cc7
>   https://git.kernel.org/mips/c/a2e66b862cc7
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Use the BIT() macro
>   commit d6103510e7cc
>   https://git.kernel.org/mips/c/d6103510e7cc
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Avoid redundant zero-comparison for non-LLSC
>   commit aad028cadb17
>   https://git.kernel.org/mips/c/aad028cadb17
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Abstract LL/SC loops
>   commit cc99987c375e
>   https://git.kernel.org/mips/c/cc99987c375e
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
>   commit c042be02d730
>   https://git.kernel.org/mips/c/c042be02d730
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Emit Loongson3 sync workarounds within asm
>   commit 5bb29275df7a
>   https://git.kernel.org/mips/c/5bb29275df7a
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: bitops: Use smp_mb__before_atomic in test_* ops
>   commit 9026737703ae
>   https://git.kernel.org/mips/c/9026737703ae
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: cmpxchg: Emit Loongson3 sync workarounds within asm
>   commit 6a57d2d1e7c3
>   https://git.kernel.org/mips/c/6a57d2d1e7c3
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: cmpxchg: Omit redundant barriers for Loongson3
>   commit a91f2a1dba44
>   https://git.kernel.org/mips/c/a91f2a1dba44
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: futex: Emit Loongson3 sync workarounds within asm
>   commit 3c1d3f097972
>   https://git.kernel.org/mips/c/3c1d3f097972
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: syscall: Emit Loongson3 sync workarounds within asm
>   commit e84957e6ae04
>   https://git.kernel.org/mips/c/e84957e6ae04
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Remove loongson_llsc_mb()
>   commit 7f56b1235481
>   https://git.kernel.org/mips/c/7f56b1235481
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: barrier: Make __smp_mb__before_atomic() a no-op for Loongson3
>   commit ae4cd0b1a475
>   https://git.kernel.org/mips/c/ae4cd0b1a475
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: genex: Add Loongson3 LL/SC workaround to ejtag_debug_handler
>   commit 12dbb04f2ac1
>   https://git.kernel.org/mips/c/12dbb04f2ac1
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: genex: Don't reload address unnecessarily
>   commit 4dee90d7b579
>   https://git.kernel.org/mips/c/4dee90d7b579
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: Check Loongson3 LL/SC errata workaround correctness
>   commit e4acfbc18fc9
>   https://git.kernel.org/mips/c/e4acfbc18fc9
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
