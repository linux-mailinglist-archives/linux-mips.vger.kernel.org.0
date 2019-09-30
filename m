Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E89ABC2A44
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731968AbfI3XIR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:17 -0400
Received: from mail-eopbgr710105.outbound.protection.outlook.com ([40.107.71.105]:33459
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726789AbfI3XIQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAEUi2ZkPQCjdlSilF03aQTCH939UzeKmBgw2yYSoDqHcY3EMEfgV6OsGxg2YD6SgogOoS9wkMNhT2/Zgwb8SQ4L+2HE44FAq90xTR4+WFH7L7c58F0+qv/Uz8U06H//Gg56ictsnTuZMf6Z0qPWAoLMNkwdpnXhpZ/b0CVDZo8zedh/w9biQmsSL/lCQNPU/ZXWTXv6465Ftya8z8TNF9rDd1nJa7Fbeo92pGDWbzebfu4HhZxF35Czz39UXhD95S2Yp3GV+2lEGFTnNYpOfe6iTuiKcJ5E8Us3GNClSSPM5EpFN8D92rvAY48Wfq7aPYCQhaycDSRNJW5sJDjLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzcRwqso22wo8GmtuXhuPZeYMvaDoB5ncz9aO4CPbP0=;
 b=biRH0YyO7k5rpXIIGr9+DK2l2qtBll6OF836tbAyomDt+HfoqP4PTfRdwfKTTiy2rQmxBHsiFsurkixt3X/H7xC061rP+MzsmrxS/Gc2CoLYNcwTW0JF/sM1ZuKl/4h3ZxPIxTRfiIgKaLmsMq+ryvAF/hVcsqsWy0ta1NKXDWLYwkxW0nN8F870n2AZpmW5m03smGDhZzPYOb7Ba3bmjhvr2Im8Hch1mpTR3kMqxvDJj6Gyq8rr82MV3tC3BjZ29jKifVgKQdKxZviLJdS+QvIoaQHEXMgNakx2FkhwvuTlweFUH/DvbIrrFdyz0aDjrp6OGLjeJYrkZC5Ayl7pKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzcRwqso22wo8GmtuXhuPZeYMvaDoB5ncz9aO4CPbP0=;
 b=hgevDKvUcC51tqIzmnbaUHy5vjIfIR/n8aB0bBlZOct67mJCCIq9o01HUh5u0/DRXrkoUR6b45f0PpO98X3EGNhy4mP1QX4T8dve8rSZ5JmFuNp3F86XImZa+swQkeEDBYGDY8QXxuh5lLZ+bIqwkjLqxL8zvoj9fl7PM1XI/PA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:14 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:14 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 00/37] MIPS: barriers & atomics cleanups
Thread-Topic: [PATCH 00/37] MIPS: barriers & atomics cleanups
Thread-Index: AQHVd+PvZwdGu3aHzU2TPg04oPQmjw==
Date:   Mon, 30 Sep 2019 23:08:14 +0000
Message-ID: <20190930230806.2940505-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c5edb22-1b05-4df5-ac13-08d745fb122f
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1709FA5D059A23A9CA2ED63AC1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(26005)(6512007)(5660300002)(71200400001)(71190400001)(1076003)(4326008)(186003)(42882007)(6506007)(256004)(486006)(44832011)(476003)(2616005)(14444005)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WwyME+0ABGiRsfAnjk1Geg3dMcVcG94Fqome3nAM1prOe1ypZ3qk3eedx4hiuf4YqMU8+EAJmTI635HoHDplF1mOcTr0lTUjwuXXCNr+xryoMIgVY2maG0Jv/7p8Fr0sNIgJFGWDp8QHuHd8VmylFRkVuooSp/g7QYXj1Pz74FnlZS8vwURMMJuXdD3Qv2qRA8xjOwdqG9q0NVshdZphWap6/0usG1NoD/XEShB17bHFK0ierR27JIAeCLUOqN14J2TFAeoMIikDSxc+3ePg/4HPwvpPIzGaC3V+i+lH+Mo21WUIkH05Xl5DaH6uHScdx/aDuOoL2tON3p3/iMWh/g3wpJwRT+GjnO+ntxNH89qgEUiX9qfdTcAb2pS8gE4nHsvaOXuaZ+WLAq0pjziZHmVyc3WonLClsOV66p/Ytcw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5edb22-1b05-4df5-ac13-08d745fb122f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:14.2435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0WjEEG/SAAL/6n+aC980ifUuzNwJ6qRuMHtnxu3qyjhsAywbHqLd8T3Yez3CL6pmTD+ZzN8F0XzLK4e2LjC9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
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

Paul Burton (37):
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
  MIPS: bitops: Use generic builtin ffs/fls; drop cpu_has_clo_clz
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

 arch/mips/Makefile                            |   2 +-
 arch/mips/Makefile.postlink                   |  10 +-
 arch/mips/include/asm/atomic.h                | 571 ++++++-----------
 arch/mips/include/asm/barrier.h               | 215 +------
 arch/mips/include/asm/bitops.h                | 593 ++++--------------
 arch/mips/include/asm/cmpxchg.h               |  59 +-
 arch/mips/include/asm/cpu-features.h          |  10 -
 arch/mips/include/asm/futex.h                 |   9 +-
 arch/mips/include/asm/llsc.h                  |  19 +-
 .../asm/mach-malta/cpu-feature-overrides.h    |   2 -
 arch/mips/include/asm/sync.h                  | 207 ++++++
 arch/mips/kernel/genex.S                      |   6 +-
 arch/mips/kernel/pm-cps.c                     |  20 +-
 arch/mips/kernel/syscall.c                    |   3 +-
 arch/mips/lib/bitops.c                        |  57 +-
 arch/mips/loongson64/Platform                 |   2 +-
 arch/mips/tools/.gitignore                    |   1 +
 arch/mips/tools/Makefile                      |   5 +
 arch/mips/tools/loongson3-llsc-check.c        | 307 +++++++++
 19 files changed, 975 insertions(+), 1123 deletions(-)
 create mode 100644 arch/mips/include/asm/sync.h
 create mode 100644 arch/mips/tools/loongson3-llsc-check.c

--=20
2.23.0

