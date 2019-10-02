Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2E8C902E
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 19:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfJBRsA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 13:48:00 -0400
Received: from mail-eopbgr720108.outbound.protection.outlook.com ([40.107.72.108]:10863
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727268AbfJBRsA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 13:48:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7rsepOvFm4KUdum7l2ikOnyBOBjZoP6yKwcDXZY/ObTY52IMX5PXQ5W8/d0isyl3cxtrHazzJToOAj6lM9SPqGs5BqCwpz7CzZ8VJWw2r7UWT4KOK2rbe+kqO11Uol10FvaNmAX9y2sAIjtFCyudcGbhRobK+vnzetNt4mUZHe+nY4/+eArZZOPcPmF3/H3Z4t24q8UxeVG0gCrwMWpv1IJfRE9noSS1X6CgNYnz8VkRRGcOAGzEz16FoFTYzHU2ijLIq8Q+e3clwk+IeVXbN99R6Lp0nl38A+0ssqw7o7ALYHz7nnToJhaks1PivKUgBcAxELFyXtobEwFuvT2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGEc5cpQIipOYl33IEtgMeuoA14CpFjtNvqpQZ/WwW0=;
 b=U89nWAwI560qmwgfgqcxO8ePt4c4XBkegavqOtg3+Cp3oSOfRN2+vTuh6rWME2LBH+9UU7WvKc5oDbJdCkCwDpXHHbI6O4hJYCwTMr0m5mngrXxJj5ZAsKafNGXsDjDOAqPlIwuqCth7/66wGFkJnve15yr4PrVd2cYKW38GKlWzKmAOPTAkVMiI+VxmxidKxNytT8fG5f1sbCB2cN6QMiN9/kDFuw504CAw3q/rpvdFO1y2i6Nv5LWN1sKPHfdg4xz3ijyw6YB3LbjRbJwUh4H9fqq21n72XLUbZ2CxSQ/P1+vqsJh9YtIbhzZFsRdiURi4Ux5F4KTdaX+t4eiUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGEc5cpQIipOYl33IEtgMeuoA14CpFjtNvqpQZ/WwW0=;
 b=FSBWxLvLojUPbDC72Tbbw4O3JsNxB4nRbb8Jop/ghGZCspToegHVPYGbKNfIvM/EnnCO79oW6rKW+PTTdJy9Z+kJ0QEjuwpTlOxDOnUzVFVTJA8PQ8bLDiWLxSHPr3ytRBCawY6Na+wXDGnGFfZSE+Li7Onlqa53F02qLQxoLps=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1646.namprd22.prod.outlook.com (10.174.167.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 17:46:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 17:46:17 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH 1/2] MIPS: VDSO: Remove unused gettimeofday.c
Thread-Topic: [PATCH 1/2] MIPS: VDSO: Remove unused gettimeofday.c
Thread-Index: AQHVeUlKziXb77G6g0exbBt6BwBZKw==
Date:   Wed, 2 Oct 2019 17:46:17 +0000
Message-ID: <20191002174438.127127-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5122012b-be29-4233-fafb-08d747606d29
x-ms-traffictypediagnostic: MWHPR2201MB1646:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1646BBDABB747DED2C161E09C19C0@MWHPR2201MB1646.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(39830400003)(376002)(136003)(396003)(189003)(199004)(66476007)(8936002)(6116002)(6916009)(6436002)(5640700003)(3846002)(14454004)(6486002)(478600001)(1076003)(486006)(2351001)(5660300002)(81156014)(8676002)(50226002)(81166006)(66556008)(64756008)(66446008)(66946007)(316002)(36756003)(54906003)(25786009)(44832011)(6512007)(7736002)(102836004)(6506007)(52116002)(26005)(42882007)(66066001)(476003)(2616005)(386003)(99286004)(2501003)(305945005)(71190400001)(71200400001)(186003)(2906002)(14444005)(4326008)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1646;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1k6q+esz27/c7Mr1YPeg56rA12sckcN7wupgHhVr9wFFSQvJYFu9SbkdtPOFOKaGLPiUTn0J2XsYJ26bXo7MrvB4rYtEslEslHoj1IDCUeAPAsMT1jLc1Ochar0A12a32oXxtJfa0nsoxznxucudxm/wbFpt73xnkQLbkKTBVVYP22UMGHKitwT+sTeH8ZZh2G9EJR/SP+8F73tVF5DEyVKBhXEExRAulGwrvIQApx18HYDECS89z8CgsTQsIDsaqsvG/R3vO2ftMZhXtr6ZptMVDf0Z9gaBEHEe/uAYN5Fjs9dRj2zI5U1vaGm20ybKlQzuxY9tvfiClz/ksnKeA2PnuIeUtOKhuYxOOtKpjQmcYQP9ZZfePg8n+LnskqofR7EVia2ur1qt4pjDTxIFbmODm3sJTS2EpLOS0cGwxE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5122012b-be29-4233-fafb-08d747606d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 17:46:17.3403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBqF8Da9YMKrSawnq/PU/uqqNhJFNKQpqA9Sbqu6T1MB+rRMx9/kUBQhJDPGbWXglEMF2Bhfvrp9GlI5+Jo/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1646
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

arch/mips/vdso/gettimeofday.c has been unused since commit 24640f233b46
("mips: Add support for generic vDSO"). Remove the dead code.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 24640f233b46 ("mips: Add support for generic vDSO")
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
---

 arch/mips/vdso/gettimeofday.c | 269 ----------------------------------
 1 file changed, 269 deletions(-)
 delete mode 100644 arch/mips/vdso/gettimeofday.c

diff --git a/arch/mips/vdso/gettimeofday.c b/arch/mips/vdso/gettimeofday.c
deleted file mode 100644
index e8243c7fd5b5..000000000000
--- a/arch/mips/vdso/gettimeofday.c
+++ /dev/null
@@ -1,269 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2015 Imagination Technologies
- * Author: Alex Smith <alex.smith@imgtec.com>
- */
-
-#include "vdso.h"
-
-#include <linux/compiler.h>
-#include <linux/time.h>
-
-#include <asm/clocksource.h>
-#include <asm/io.h>
-#include <asm/unistd.h>
-#include <asm/vdso.h>
-
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-static __always_inline long gettimeofday_fallback(struct timeval *_tv,
-					  struct timezone *_tz)
-{
-	register struct timezone *tz asm("a1") =3D _tz;
-	register struct timeval *tv asm("a0") =3D _tv;
-	register long ret asm("v0");
-	register long nr asm("v0") =3D __NR_gettimeofday;
-	register long error asm("a3");
-
-	asm volatile(
-	"       syscall\n"
-	: "=3Dr" (ret), "=3Dr" (error)
-	: "r" (tv), "r" (tz), "r" (nr)
-	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-
-	return error ? -ret : ret;
-}
-
-#endif
-
-static __always_inline long clock_gettime_fallback(clockid_t _clkid,
-					   struct timespec *_ts)
-{
-	register struct timespec *ts asm("a1") =3D _ts;
-	register clockid_t clkid asm("a0") =3D _clkid;
-	register long ret asm("v0");
-	register long nr asm("v0") =3D __NR_clock_gettime;
-	register long error asm("a3");
-
-	asm volatile(
-	"       syscall\n"
-	: "=3Dr" (ret), "=3Dr" (error)
-	: "r" (clkid), "r" (ts), "r" (nr)
-	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-
-	return error ? -ret : ret;
-}
-
-static __always_inline int do_realtime_coarse(struct timespec *ts,
-					      const union mips_vdso_data *data)
-{
-	u32 start_seq;
-
-	do {
-		start_seq =3D vdso_data_read_begin(data);
-
-		ts->tv_sec =3D data->xtime_sec;
-		ts->tv_nsec =3D data->xtime_nsec >> data->cs_shift;
-	} while (vdso_data_read_retry(data, start_seq));
-
-	return 0;
-}
-
-static __always_inline int do_monotonic_coarse(struct timespec *ts,
-					       const union mips_vdso_data *data)
-{
-	u32 start_seq;
-	u64 to_mono_sec;
-	u64 to_mono_nsec;
-
-	do {
-		start_seq =3D vdso_data_read_begin(data);
-
-		ts->tv_sec =3D data->xtime_sec;
-		ts->tv_nsec =3D data->xtime_nsec >> data->cs_shift;
-
-		to_mono_sec =3D data->wall_to_mono_sec;
-		to_mono_nsec =3D data->wall_to_mono_nsec;
-	} while (vdso_data_read_retry(data, start_seq));
-
-	ts->tv_sec +=3D to_mono_sec;
-	timespec_add_ns(ts, to_mono_nsec);
-
-	return 0;
-}
-
-#ifdef CONFIG_CSRC_R4K
-
-static __always_inline u64 read_r4k_count(void)
-{
-	unsigned int count;
-
-	__asm__ __volatile__(
-	"	.set push\n"
-	"	.set mips32r2\n"
-	"	rdhwr	%0, $2\n"
-	"	.set pop\n"
-	: "=3Dr" (count));
-
-	return count;
-}
-
-#endif
-
-#ifdef CONFIG_CLKSRC_MIPS_GIC
-
-static __always_inline u64 read_gic_count(const union mips_vdso_data *data=
)
-{
-	void __iomem *gic =3D get_gic(data);
-	u32 hi, hi2, lo;
-
-	do {
-		hi =3D __raw_readl(gic + sizeof(lo));
-		lo =3D __raw_readl(gic);
-		hi2 =3D __raw_readl(gic + sizeof(lo));
-	} while (hi2 !=3D hi);
-
-	return (((u64)hi) << 32) + lo;
-}
-
-#endif
-
-static __always_inline u64 get_ns(const union mips_vdso_data *data)
-{
-	u64 cycle_now, delta, nsec;
-
-	switch (data->clock_mode) {
-#ifdef CONFIG_CSRC_R4K
-	case VDSO_CLOCK_R4K:
-		cycle_now =3D read_r4k_count();
-		break;
-#endif
-#ifdef CONFIG_CLKSRC_MIPS_GIC
-	case VDSO_CLOCK_GIC:
-		cycle_now =3D read_gic_count(data);
-		break;
-#endif
-	default:
-		return 0;
-	}
-
-	delta =3D (cycle_now - data->cs_cycle_last) & data->cs_mask;
-
-	nsec =3D (delta * data->cs_mult) + data->xtime_nsec;
-	nsec >>=3D data->cs_shift;
-
-	return nsec;
-}
-
-static __always_inline int do_realtime(struct timespec *ts,
-				       const union mips_vdso_data *data)
-{
-	u32 start_seq;
-	u64 ns;
-
-	do {
-		start_seq =3D vdso_data_read_begin(data);
-
-		if (data->clock_mode =3D=3D VDSO_CLOCK_NONE)
-			return -ENOSYS;
-
-		ts->tv_sec =3D data->xtime_sec;
-		ns =3D get_ns(data);
-	} while (vdso_data_read_retry(data, start_seq));
-
-	ts->tv_nsec =3D 0;
-	timespec_add_ns(ts, ns);
-
-	return 0;
-}
-
-static __always_inline int do_monotonic(struct timespec *ts,
-					const union mips_vdso_data *data)
-{
-	u32 start_seq;
-	u64 ns;
-	u64 to_mono_sec;
-	u64 to_mono_nsec;
-
-	do {
-		start_seq =3D vdso_data_read_begin(data);
-
-		if (data->clock_mode =3D=3D VDSO_CLOCK_NONE)
-			return -ENOSYS;
-
-		ts->tv_sec =3D data->xtime_sec;
-		ns =3D get_ns(data);
-
-		to_mono_sec =3D data->wall_to_mono_sec;
-		to_mono_nsec =3D data->wall_to_mono_nsec;
-	} while (vdso_data_read_retry(data, start_seq));
-
-	ts->tv_sec +=3D to_mono_sec;
-	ts->tv_nsec =3D 0;
-	timespec_add_ns(ts, ns + to_mono_nsec);
-
-	return 0;
-}
-
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
-/*
- * This is behind the ifdef so that we don't provide the symbol when there=
's no
- * possibility of there being a usable clocksource, because there's nothin=
g we
- * can do without it. When libc fails the symbol lookup it should fall bac=
k on
- * the standard syscall path.
- */
-int __vdso_gettimeofday(struct timeval *tv, struct timezone *tz)
-{
-	const union mips_vdso_data *data =3D get_vdso_data();
-	struct timespec ts;
-	int ret;
-
-	ret =3D do_realtime(&ts, data);
-	if (ret)
-		return gettimeofday_fallback(tv, tz);
-
-	if (tv) {
-		tv->tv_sec =3D ts.tv_sec;
-		tv->tv_usec =3D ts.tv_nsec / 1000;
-	}
-
-	if (tz) {
-		tz->tz_minuteswest =3D data->tz_minuteswest;
-		tz->tz_dsttime =3D data->tz_dsttime;
-	}
-
-	return 0;
-}
-
-#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
-
-int __vdso_clock_gettime(clockid_t clkid, struct timespec *ts)
-{
-	const union mips_vdso_data *data =3D get_vdso_data();
-	int ret =3D -1;
-
-	switch (clkid) {
-	case CLOCK_REALTIME_COARSE:
-		ret =3D do_realtime_coarse(ts, data);
-		break;
-	case CLOCK_MONOTONIC_COARSE:
-		ret =3D do_monotonic_coarse(ts, data);
-		break;
-	case CLOCK_REALTIME:
-		ret =3D do_realtime(ts, data);
-		break;
-	case CLOCK_MONOTONIC:
-		ret =3D do_monotonic(ts, data);
-		break;
-	default:
-		break;
-	}
-
-	if (ret)
-		ret =3D clock_gettime_fallback(clkid, ts);
-
-	return ret;
-}
--=20
2.23.0

