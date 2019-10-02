Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389D8C913F
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 20:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfJBS7y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 14:59:54 -0400
Received: from mail-eopbgr740130.outbound.protection.outlook.com ([40.107.74.130]:45120
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726076AbfJBS7y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 14:59:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoYzY8ZsCYDq3hSeXwX5jctZFIJF6VpJh6RPaFiLTlfyFS56nnFVzsZev6YpbRouh5q3jhqeY/uEZKZR2H0F7Jg/VImBwrpiZ6uPasGrHqIxw3dUaNB6l3LOvf1WzBnlxgCThXH/tUAQr4T6HgwytSUbiyaeJCH1+GVjbpqK8LFBGQxOWHaE+lXT2Sx8kY76DyOWfpiXy+snOD56XJHaxDo2S67yXXPtcHvVVVAFVKzvfgAfQIGKuVvyIV+84wZsnRfdJydCLOuixnPvKlb0NCbd6iiQDIT+ewb34l2R+XX+FzY0woloEPtS+Zw3mkesm+SFCaO2Q6V+x/J1L0iqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzVmkEvxHr0rs8x8KV36xjRS9tZPokDctFhP3RpxeDg=;
 b=ZLBGPMSHjjhDUGyTrcR1DYSazveOs7xc6AQ4/F+6J+odjKOfJhDSPzGl7P9a2CN2JU8MPRQ+POpWxIHvkBXpjmezgSXYqsXLWAWX2b5DL23YLWSQQ4fNcI8hpXHEjmXOBcoT41wJ8EiRr+F4A286YGgH74/xRA8LLXeY0gDopUJ7b9U2vDP5HgmPQHo0CGwiAKzcB6cNZq774zmWxdGobrubOeIDd8gk+x+ixYEmhJ4Rfxs5VRNI0VaVj5gRh5s1QJdfmt4EU40RVx+BGL7GSbrgjEDBtnnPsNTGnS9bTzlCAATSaLIuLhyGYJ669ZpmdVLDHTTKs2D5csKcSEbbXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzVmkEvxHr0rs8x8KV36xjRS9tZPokDctFhP3RpxeDg=;
 b=bY/21nXa8kTx0nwKjK9Recoq1rMvTNeuBl6kOApyUdEJ3Nkoo3QErcRdf4lFPspoLMRQ0AUMgdo0QfCKw5wSx0T3hiJfgibU49i9MivqzKOoeOcsAThs18fw5MF1B4dieT6Hj69uyYhQgb5qPrBQ5zFeYFkcDtWj8fn8+W2CLHA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1520.namprd22.prod.outlook.com (10.174.170.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:59:50 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 18:59:50 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Christian Brauner <christian@brauner.io>
Subject: [PATCH] MIPS: Wire up clone3 syscall
Thread-Topic: [PATCH] MIPS: Wire up clone3 syscall
Thread-Index: AQHVeVOQR1sGlenHSE+Gka15+Z4wng==
Date:   Wed, 2 Oct 2019 18:59:49 +0000
Message-ID: <20191002185942.295960-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77c54cdc-82ac-43fd-0f15-08d7476ab364
x-ms-traffictypediagnostic: MWHPR2201MB1520:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB15207C92B3BE252786147EC2C19C0@MWHPR2201MB1520.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(39840400004)(136003)(376002)(396003)(189003)(199004)(50226002)(42882007)(2351001)(102836004)(52116002)(2616005)(5660300002)(71200400001)(476003)(966005)(6916009)(478600001)(66476007)(66446008)(386003)(64756008)(66556008)(6506007)(2501003)(66946007)(26005)(256004)(186003)(66066001)(6306002)(6512007)(8676002)(1076003)(316002)(54906003)(25786009)(99286004)(6486002)(36756003)(14454004)(44832011)(4326008)(486006)(3846002)(6116002)(8936002)(305945005)(5640700003)(81166006)(6436002)(81156014)(7736002)(2906002)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1520;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YA5OdKW0naKG5cCrrdWjEAPwUrnL69V6f7w3zuTlH+Uj2s/fm8VaaTAPo6U6B8dta51q677SqI6g82ip2fdd9xGH1ccJKF9OylbO/dMGbMj6lXuKweiP1Agj4pMpdsp6SnGv7qwmTlTuRPys4jCgk3KLx4Hm5BKK9bKbxhYRHhGMnKOVG6bWEQv0h1zuya3dNibLPPGWuGjdsKB3G0DJ2Uuh0QUf2vQ+zamfZ5oYjNPPRbbmhtnoxYopq8m8sh3wI8iyUvDwYMpxiccARqtmp/XrQ02MhG/HS4tRIqDjSz74cjOYzrs+5fpI0VeL3381KikMPtY2rYJCB5JsOt8op0dTOFI+N2t1+jqK17HR0rhJZVMeEfs6GYy2RosPRoIvMAAmkxg1oRy8QKOsTEkb+tnTKVF074W4KW1jI+cFgSUXoOoCGBTJ8kP8gPxYhgaFcTMI9yq9dz936sbZLpMW+w==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c54cdc-82ac-43fd-0f15-08d7476ab364
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 18:59:49.9378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3H7P/TA0558iqpz/s/KfdBnjSOfFtGCV2W46xpKeSWYXMOT3IHsy7WrEt6BavHUu0mCSY2O2V2MIOzVWjDr3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1520
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Wire up the new clone3 syscall for MIPS, using save_static_function() to
generate a wrapper that saves registers $s0-$s7 prior to invoking the
generic sys_clone3 function just like we do for plain old clone.

Tested atop 64r6el_defconfig using o32, n32 & n64 builds of the simple
test program from:

  https://lore.kernel.org/lkml/20190716130631.tohj4ub54md25dys@brauner.io/

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Christian Brauner <christian@brauner.io>
---

 arch/mips/include/asm/unistd.h            | 1 +
 arch/mips/kernel/syscall.c                | 1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl | 2 +-
 arch/mips/kernel/syscalls/syscall_n64.tbl | 2 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl | 2 +-
 5 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/unistd.h b/arch/mips/include/asm/unistd.=
h
index 071053ece677..5d70babfc9ee 100644
--- a/arch/mips/include/asm/unistd.h
+++ b/arch/mips/include/asm/unistd.h
@@ -52,6 +52,7 @@
 # endif
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_SYS_CLONE3
=20
 /* whitelists for checksyscalls */
 #define __IGNORE_fadvise64_64
diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index b0e25e913bdb..3f16f3823031 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -80,6 +80,7 @@ SYSCALL_DEFINE6(mips_mmap2, unsigned long, addr, unsigned=
 long, len,
=20
 save_static_function(sys_fork);
 save_static_function(sys_clone);
+save_static_function(sys_clone3);
=20
 SYSCALL_DEFINE1(set_thread_area, unsigned long, addr)
 {
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/s=
yscalls/syscall_n32.tbl
index c9c879ec9b6d..e7c5ab38e403 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -373,4 +373,4 @@
 432	n32	fsmount				sys_fsmount
 433	n32	fspick				sys_fspick
 434	n32	pidfd_open			sys_pidfd_open
-# 435 reserved for clone3
+435	n32	clone3				__sys_clone3
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/s=
yscalls/syscall_n64.tbl
index bbce9159caa1..13cd66581f3b 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -349,4 +349,4 @@
 432	n64	fsmount				sys_fsmount
 433	n64	fspick				sys_fspick
 434	n64	pidfd_open			sys_pidfd_open
-# 435 reserved for clone3
+435	n64	clone3				__sys_clone3
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/s=
yscalls/syscall_o32.tbl
index 9653591428ec..353539ea4140 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -422,4 +422,4 @@
 432	o32	fsmount				sys_fsmount
 433	o32	fspick				sys_fspick
 434	o32	pidfd_open			sys_pidfd_open
-# 435 reserved for clone3
+435	o32	clone3				__sys_clone3
--=20
2.23.0

