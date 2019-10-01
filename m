Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BE8C42FC
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbfJAVxJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:09 -0400
Received: from mail-eopbgr730112.outbound.protection.outlook.com ([40.107.73.112]:19088
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726681AbfJAVxJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyjZcAo8LIct20bg9DhPBjs3IIT5d+XULMNcD3/dP7HOjKoavUOWtdL0pwqTdbmRZujdD+vCyFWXDWEU70L/1sU8blDkJCU7NLnSWdI/+B3L5Sm601HxlcMfmvUf/Cqwtqi/gfLji5tJ2mhl8VM/uvji2L57eFJLrTjB132Y/dwh6JPwZEp+sO199M+PCOVu903rvo2pKeEcL1sF0dBH2+7AvfEl39hFzMWyrv0eQwgvd3hHxldfsDLZx+ONysZR6sUZdlLxSUOXm1PNhHsRmuhyDhHHUxldbzEL2PlmAayJv4gmwJtnQOBWwZyf4DPrJWfgTIZKm1Oe2LuR6E5q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeMuagG9Ykp2+mFcYCbVvniDLVktRzk6k7mIirbQ3m4=;
 b=AVTjyVBlZTIccoxL6pnfBQpURE0bB+8j2Ky4W49dX3LWZY/0zFquLvLDweHHCUOAynL67NgsoLY9NFEXNw6CdN/YNtU9EELANDr6P15gOnwOHAEdxxHWqBvHx21o/uELFPoeepZ2R4n5+RNuQqYJpSFqKwmWj+M1diGCP50xVBFAgbbehCGqsnLzQaliUFcvMJjaHnuvG8lUDiOca9BtA1/TRokh4EWqeuz3t4kuBw3JMXaU8rPIGEckpGPuJTKO8ppGrLfRS9sYVVmd1bojSEqgqoS1DTl0eMu5zITd2lm2N2tR/KnwPrniF8CpA7REm3xZj8jmtTg6KgmNN0NcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeMuagG9Ykp2+mFcYCbVvniDLVktRzk6k7mIirbQ3m4=;
 b=KSEbRduiZC9toKGFupQ1izSDtHRa9KqRIcfIAzMAX68NcqrQovLuAeb/csKhA/YsfX1QgDRNW2c0RQfQMp/dNVbvX722DA8mQDDcOuoMTUp9n/PBT0pUQQDNtrRE4pjq/jZULKuPp2zJUxLBwXK3DfzKIBkZ1nkXm3cBnRpJelM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1213.namprd22.prod.outlook.com (10.172.61.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 00/36] MIPS: barriers & atomics cleanups
Thread-Topic: [PATCH v2 00/36] MIPS: barriers & atomics cleanups
Thread-Index: AQHVeKKaZKEPRGamiECLP4Zg0pCBgg==
Date:   Tue, 1 Oct 2019 21:53:04 +0000
Message-ID: <20191001215249.4157062-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 327f40a7-973e-4549-56a3-08d746b9bc7a
x-ms-traffictypediagnostic: MWHPR2201MB1213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB121330EA0061BF60CBCBF067C19D0@MWHPR2201MB1213.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39840400004)(199004)(189003)(6512007)(5640700003)(54906003)(2501003)(3846002)(6486002)(5660300002)(6436002)(66066001)(6116002)(1076003)(50226002)(2906002)(52116002)(6506007)(107886003)(2351001)(4326008)(6916009)(102836004)(71190400001)(8936002)(386003)(25786009)(36756003)(44832011)(8676002)(71200400001)(81166006)(81156014)(186003)(256004)(14444005)(2616005)(7736002)(316002)(42882007)(305945005)(99286004)(66446008)(64756008)(66556008)(478600001)(66946007)(66476007)(486006)(476003)(14454004)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1213;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hyX6vCUdiZ7clVz43VRs7d8HrctaA+ZVM06Ucb4Z0g4xTE2HzLD2+ka7r9b1zeSKFjpNe1CesdmG5GzXGAdRkhGtraxwl/7tB0k+mrVqGJjnZqAe6cy2Tz1C33fHRNCdk8Jg+L5x7RRha2I/8JwHga13gDIZ9LrGy/Cw0EqYwe2P02i4Cm8f/RTvriJPg0e9pjpmIUpnlO9gpswVuSjQtuaznGGDBSSlupbeP52jiqZ6IQl8FzlEHi7e1kGVqgiJfZQcFWcH2aCgZ9+Vh29BqKPwknGVoVr6nNap64QIbY9m0lbNxkgpswkNKlI9/1iPxWHDRkjMHaAzVRumeiMr6s/RH4MTjA7zvCw3uyz+oR2LUio8LeFTUCmCC5L3VxLB+vta8Pptk2LNdZd8CJaLUc/qlqE+OtnqVVFNW5jnjxw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327f40a7-973e-4549-56a3-08d746b9bc7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:04.5091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqrErdsmW7ry+fCzkZ8RKSieF0mekA/njQof6UhREbQoPCgA03qxeRNjAjbl0KQ6BmOXpuNRiV3mkBSYMop3JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1213
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series consists of a bunch of cleanups to the way we handle memory
barriers (though no changes to the sync instructions we use to implement
them) & atomic memory accesses. One major goal was to ensure the
Loongson3 LL/SC errata workarounds are applied in a safe manner from
within inline-asm & that we can automatically verify the resulting
kernel binary looks reasonable. Many patches are cleanups found along
the way.

Applies atop v5.4-rc1.

Changes in v2:
- Keep our fls/ffs implementations. Turns out GCC's builtins call
  intrinsics in some configurations, and if we'd need to go implement
  those then using the generic fls/ffs doesn't seem like such a win.
- De-string __WEAK_LLSC_MB to allow use with __SYNC_ELSE().
- Only try to build the loongson3-llsc-check tool from
  arch/mips/Makefile when CONFIG_CPU_LOONGSON3_WORKAROUNDS is enabled.

Paul Burton (36):
  MIPS: Unify sc beqz definition
  MIPS: Use compact branch for LL/SC loops on MIPSr6+
  MIPS: barrier: Add __SYNC() infrastructure
  MIPS: barrier: Clean up rmb() & wmb() definitions
  MIPS: barrier: Clean up __smp_mb() definition
  MIPS: barrier: Remove fast_mb() Octeon #ifdef'ery
  MIPS: barrier: Clean up __sync() definition
  MIPS: barrier: Clean up sync_ginv()
  MIPS: atomic: Fix whitespace in ATOMIC_OP macros
  MIPS: atomic: Handle !kernel_uses_llsc first
  MIPS: atomic: Use one macro to generate 32b & 64b functions
  MIPS: atomic: Emit Loongson3 sync workarounds within asm
  MIPS: atomic: Use _atomic barriers in atomic_sub_if_positive()
  MIPS: atomic: Unify 32b & 64b sub_if_positive
  MIPS: atomic: Deduplicate 32b & 64b read, set, xchg, cmpxchg
  MIPS: bitops: Handle !kernel_uses_llsc first
  MIPS: bitops: Only use ins for bit 16 or higher
  MIPS: bitops: Use MIPS_ISA_REV, not #ifdefs
  MIPS: bitops: ins start position is always an immediate
  MIPS: bitops: Implement test_and_set_bit() in terms of _lock variant
  MIPS: bitops: Allow immediates in test_and_{set,clear,change}_bit
  MIPS: bitops: Use the BIT() macro
  MIPS: bitops: Avoid redundant zero-comparison for non-LLSC
  MIPS: bitops: Abstract LL/SC loops
  MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
  MIPS: bitops: Emit Loongson3 sync workarounds within asm
  MIPS: bitops: Use smp_mb__before_atomic in test_* ops
  MIPS: cmpxchg: Emit Loongson3 sync workarounds within asm
  MIPS: cmpxchg: Omit redundant barriers for Loongson3
  MIPS: futex: Emit Loongson3 sync workarounds within asm
  MIPS: syscall: Emit Loongson3 sync workarounds within asm
  MIPS: barrier: Remove loongson_llsc_mb()
  MIPS: barrier: Make __smp_mb__before_atomic() a no-op for Loongson3
  MIPS: genex: Add Loongson3 LL/SC workaround to ejtag_debug_handler
  MIPS: genex: Don't reload address unnecessarily
  MIPS: Check Loongson3 LL/SC errata workaround correctness

 arch/mips/Makefile                     |   3 +
 arch/mips/Makefile.postlink            |  10 +-
 arch/mips/include/asm/atomic.h         | 571 +++++++++----------------
 arch/mips/include/asm/barrier.h        | 228 ++--------
 arch/mips/include/asm/bitops.h         | 443 ++++++-------------
 arch/mips/include/asm/cmpxchg.h        |  59 +--
 arch/mips/include/asm/futex.h          |  15 +-
 arch/mips/include/asm/llsc.h           |  19 +-
 arch/mips/include/asm/sync.h           | 207 +++++++++
 arch/mips/kernel/genex.S               |   6 +-
 arch/mips/kernel/pm-cps.c              |  20 +-
 arch/mips/kernel/syscall.c             |   3 +-
 arch/mips/lib/bitops.c                 |  57 +--
 arch/mips/loongson64/Platform          |   2 +-
 arch/mips/tools/.gitignore             |   1 +
 arch/mips/tools/Makefile               |   5 +
 arch/mips/tools/loongson3-llsc-check.c | 307 +++++++++++++
 17 files changed, 981 insertions(+), 975 deletions(-)
 create mode 100644 arch/mips/include/asm/sync.h
 create mode 100644 arch/mips/tools/loongson3-llsc-check.c

--=20
2.23.0

