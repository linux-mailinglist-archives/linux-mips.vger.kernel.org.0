Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03BF0C4321
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbfJAVyV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:21 -0400
Received: from mail-eopbgr750115.outbound.protection.outlook.com ([40.107.75.115]:30851
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728374AbfJAVyU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzh4IqhE1htTmSF4CB79RsewnHCreBEpX9YOTQ2U4Jllt5COHLN3d/UMS5e20JmjaOD8lrXK4xReXh2UCE70hmwYELc8vk37LiHThWuvHJ3PFX91DDxtmb+tRvRsu52u8FNWjrsKdjXHVbxVL9yr9FIplj/av2aLWYqbyMgRLXK4si5xbqbj7c+/+7FbvmKStysZzh7+JJ24Crl/bKjyC2M09Iu48F/uYD0U6SLVrHJyLcNRLs0XGZ9O8NB03qzTzdZDl5dze3tyzhCytH/fcWRYzlWfRCzQ+abJh4+6vYBI92QZXzBGxoNRuNi4l3AdrQP5GQn/pFpjnsrwmWwyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh5vG+SPU2Hm/waIrlSJpgSDR+tZl3iQ1MmEoawt9qU=;
 b=MXndv7POotaxw2ddgacQa8H8euLldL6urNTd8yZWL9LFdCV3e296xgCUsWf/XMTBc2qlfR+Rqy2OP22OWmulzCc0BGacHjosbETlXDAT/OihYUm+piQSH8AVsXs0HjwsXq93u8EV+SnbVLwUpF/HvYd+xAu2JwMexvVOi87I4v2LhOqXRTyU38J/lFt0ZHvSwapQEX0KAuG0IPSFjQU77mbR3ztWbKR8byLC17N7bJK6v6SDGZjXkcJ2H2HKrJkI27zLbQ4Ci1Qt69zv1qKE6KGFsrJavM1Kk20tH+HpVyJpZnIF9PVkub1qlTo98ao2kc6QWiGqkTH11csBgn/IKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh5vG+SPU2Hm/waIrlSJpgSDR+tZl3iQ1MmEoawt9qU=;
 b=EQa5TUCAuabV+Utiqb4z5qqTeAzyW2YyUuxOVHqqwy8HFwi9qaWwWj7adN9nOW+1NgMzOMfS8KaMga5z+s3olIc+Ynk1f9Ekgqje+lT7ygwGCWqdv3uDAaUSupuoSeIyZO1B0+J/n5pHxo1AEoSDh0QaS1MKtsfHwzLOm72buXE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:54:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:54:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 33/36] MIPS: barrier: Make __smp_mb__before_atomic() a
 no-op for Loongson3
Thread-Topic: [PATCH v2 33/36] MIPS: barrier: Make __smp_mb__before_atomic() a
 no-op for Loongson3
Thread-Index: AQHVeKKwhbfdOsKkPE+4wKLTFI1E5g==
Date:   Tue, 1 Oct 2019 21:53:41 +0000
Message-ID: <20191001215249.4157062-34-paul.burton@mips.com>
References: <20191001215249.4157062-1-paul.burton@mips.com>
In-Reply-To: <20191001215249.4157062-1-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: b18c0c9a-9b53-47a5-e6d1-08d746b9d2b6
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB158182ED9D8D68C75A694988C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(14444005)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(6666004)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001)(101420200001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4gXRBRX+x+cUbJzD8n8EFzKlQjJ4NYJhGim73DkwiYanwP2H+EV1HSEIifteVV5AN6RMWlDuu6Q6QGK69HJ/m/9mKMEV+VWP3Wxjo9lbp5nijbcX8QJOqzjPO9iVINeOFd8aBmvE/CY4rYCKgLLXVY5OKVBf64kpGZCLHy7c2fGyF17W+sCM/39iSLJu48f5n9lM9Ua1F9LzCSNqALDLt1/C8KqId3r1ZRG7hYB3biKAwb+sWoVaMos6mgVUy2BgIt9/c6Rm8/O5qnCWygT8WKULatSRUbZ5f59D9aaEsmtqMqqN5bGpsscI+n7wGl6acF80BTIRAKueDQ2lB0OnAH7yU+WAU5Ab/vWGVGVVRASfG+r5HmQ3/cWtxCFV2WdIwC373NMjKdf+WhXIB9ocz3hJ1CdDWUIt/FQYaHH8bDg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18c0c9a-9b53-47a5-e6d1-08d746b9d2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:41.6609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wut9jReBp+CsVA459Y1Wnpf5Ka+nTOxJUOxZWf5xbs8n+NtOaRbszJEuoiZeI5v4pRmOkaQ7FfrYgyZK46qKLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson3 systems with CONFIG_CPU_LOONGSON3_WORKAROUNDS enabled already
emit a full completion barrier as part of the inline assembly containing
LL/SC loops for atomic operations. As such the barrier emitted by
__smp_mb__before_atomic() is redundant, and we can remove it.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/barrier.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 6d92d5ccdafa..49ff172a72b9 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -119,7 +119,17 @@ static inline void wmb(void)
 #define nudge_writes() mb()
 #endif
=20
-#define __smp_mb__before_atomic()	__smp_mb__before_llsc()
+/*
+ * In the Loongson3 LL/SC workaround case, all of our LL/SC loops already =
have
+ * a completion barrier immediately preceding the LL instruction. Therefor=
e we
+ * can skip emitting a barrier from __smp_mb__before_atomic().
+ */
+#ifdef CONFIG_CPU_LOONGSON3_WORKAROUNDS
+# define __smp_mb__before_atomic()
+#else
+# define __smp_mb__before_atomic()	__smp_mb__before_llsc()
+#endif
+
 #define __smp_mb__after_atomic()	smp_llsc_mb()
=20
 static inline void sync_ginv(void)
--=20
2.23.0

