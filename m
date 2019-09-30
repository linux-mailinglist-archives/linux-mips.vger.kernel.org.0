Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6E7C2A47
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732253AbfI3XIV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:21 -0400
Received: from mail-eopbgr710105.outbound.protection.outlook.com ([40.107.71.105]:33459
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726425AbfI3XIU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU+jX0xITwclfsoMHiSvMaB4mrMvMm/PTdHgUSv5DtWt9oUdfU2PXR13dIViv2yHL+QUivpiPNyR9FoVimif8qiuU7MC/7ETAiTJaIdpkEAQtEZbKTR9PSq5qRZ0ng+bqo1SPHv8+M3CfSkbzvikzS1r34ro+LwoL5FzfsCDvIW3Wc7CmeUTZFFuwgoHEFuSVqGIJfbxvPrmnBCIFfBaqVsdsP166lESC6i5lOxbs1rzk28sET9ZaruYuI470xjqIw8LTCvxjefwzvCFUeXQzuxzoS/Hyy6G8V8RXum2zvmvENTXfNrYUAjYOrFgdK/r3SO19mLLn4HRvXNPzGP3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H7VFEgK5L2CSygsMdg95Dj2PplW8Nur2FDPObYfrHo=;
 b=eDhcJrRKx9xzXFeV/IBz6bBr4bm2T4twPrJYqzGGzq+RORq+/HENeNUqZnGLkW/l1k9OO/nBPHoEDsBOt3qr9o2ntuZWlpvOX13Vm8WQmVBloc7vG/Wb10+YqkYUKiEHw+WpfCU5qedApw1ZSSksLL7ctE9GJ04t0tfyFRkBph6HeyWYVLL7CODiPk3CMiE3Ag+ex8RU20yDainSyFr+TSTW8MWuCWO+DETiksWInvCQzvZERPDCxCG3J7sNjhWu+d8i5gYK6GL1SMmqP+9Mo/phfbI7uF0+n1bkxjAzLeX3TNOZD8ICQiPzxBdOPAlkrLFng2esZCgPacWA+1VuVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H7VFEgK5L2CSygsMdg95Dj2PplW8Nur2FDPObYfrHo=;
 b=R16BjZmwbgMC/Uh/F3bU+4gHn5PI/OutYC3fd0XTKn9Y3yT+k25ObE4vKqDxlpRzS9iHCafCCB1ju8uX4N3ADsWU2nAniCXWSzOqR5XW2RTD95lAfrTfw6BXot6rbegw/vxWJCACT7YFI2+b06vCIXau8VB5DKjHqEx2bFsgntg=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:18 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:18 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 04/37] MIPS: barrier: Clean up rmb() & wmb() definitions
Thread-Topic: [PATCH 04/37] MIPS: barrier: Clean up rmb() & wmb() definitions
Thread-Index: AQHVd+Py/lmEsltRXUiYsxgmO+g4aA==
Date:   Mon, 30 Sep 2019 23:08:17 +0000
Message-ID: <20190930230806.2940505-5-paul.burton@mips.com>
References: <20190930230806.2940505-1-paul.burton@mips.com>
In-Reply-To: <20190930230806.2940505-1-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 9d223693-1744-4959-7ac6-08d745fb1469
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB17094BE68382F1440E3C4544C1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(76176011)(26005)(6512007)(5660300002)(71200400001)(71190400001)(1076003)(4326008)(186003)(42882007)(6506007)(11346002)(256004)(486006)(44832011)(476003)(2616005)(446003)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0OFVz7zG0ZIRqUHdOzZwnGQEMtoyStNLf670w+gigN3lDWs4zFQcrX0mLaRogtqFxfmQzsvzs8wEpe6ZSMSoq+Gyd8pVoYXLGFemvgyp51Bw3bWQLtWu5mJWvCqhHi+Iyi7W4p3qagDb7f1PHCeiJGOw/CcS7CTzUjgp514EjwMaw7xJL022wL0YxZGwLol64BIz21QnPsfI7fglFePUOIbloBUzjMXHc3NeSW4/y/pOJk/owpSGZoM0UoH6lOXzGf51EQMfKITrLl1o3JhKr4v23Jq2JTTw38eJIC7Vu48WsTc1phyDh7DbXwRjg93Ewg2UEVIuZ5Je3BFWwfxdWH2FYF0GUv2r68h9aGqbaEYWG85Hu/hH6BM0ceKOsmfK9bsm6oi1mDP3zjQBN5khcgTBFWu/KzaZ0F3uKwcaX8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d223693-1744-4959-7ac6-08d745fb1469
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:17.9208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUKSsOeWCvoxqwzKRucMT9uDJa7i+ytFB/mglfqLyqdNQfi9z1uuLJbv2GZjW56RNNfLdwVkjexFb4ShMM+9Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Simplify our definitions of rmb() & wmb() using the new __SYNC()
infrastructure.

The fast_rmb() & fast_wmb() macros are removed, since they only provided
a level of indirection that made the code less readable & weren't
directly used anywhere in the kernel tree.

The Octeon #ifdef'ery is removed, since the "syncw" instruction
previously used is merely an alias for "sync 4" which __SYNC() will emit
for the wmb sync type when the kernel is configured for an Octeon CPU.
Similarly __SYNC() will emit nothing for the rmb sync type in Octeon
configurations.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/barrier.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 5ad39bfd3b6d..f36cab87cfde 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -26,6 +26,18 @@
 #define __sync()	do { } while(0)
 #endif
=20
+static inline void rmb(void)
+{
+	asm volatile(__SYNC(rmb, always) ::: "memory");
+}
+#define rmb rmb
+
+static inline void wmb(void)
+{
+	asm volatile(__SYNC(wmb, always) ::: "memory");
+}
+#define wmb wmb
+
 #define __fast_iob()				\
 	__asm__ __volatile__(			\
 		".set	push\n\t"		\
@@ -37,16 +49,9 @@
 		: "m" (*(int *)CKSEG1)		\
 		: "memory")
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
-# define OCTEON_SYNCW_STR	".set push\n.set arch=3Docteon\nsyncw\nsyncw\n.s=
et pop\n"
-# define __syncw()	__asm__ __volatile__(OCTEON_SYNCW_STR : : : "memory")
-
-# define fast_wmb()	__syncw()
-# define fast_rmb()	barrier()
 # define fast_mb()	__sync()
 # define fast_iob()	do { } while (0)
 #else /* ! CONFIG_CPU_CAVIUM_OCTEON */
-# define fast_wmb()	__sync()
-# define fast_rmb()	__sync()
 # define fast_mb()	__sync()
 # ifdef CONFIG_SGI_IP28
 #  define fast_iob()				\
@@ -83,19 +88,14 @@
=20
 #endif /* !CONFIG_CPU_HAS_WB */
=20
-#define wmb()		fast_wmb()
-#define rmb()		fast_rmb()
-
 #if defined(CONFIG_WEAK_ORDERING)
 # ifdef CONFIG_CPU_CAVIUM_OCTEON
 #  define __smp_mb()	__sync()
-#  define __smp_rmb()	barrier()
-#  define __smp_wmb()	__syncw()
 # else
 #  define __smp_mb()	__asm__ __volatile__("sync" : : :"memory")
-#  define __smp_rmb()	__asm__ __volatile__("sync" : : :"memory")
-#  define __smp_wmb()	__asm__ __volatile__("sync" : : :"memory")
 # endif
+# define __smp_rmb()	rmb()
+# define __smp_wmb()	wmb()
 #else
 #define __smp_mb()	barrier()
 #define __smp_rmb()	barrier()
--=20
2.23.0

