Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDCE1C2A7B
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732752AbfI3XJS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:18 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:60959
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732748AbfI3XJS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7/vdmGj1qntGxcDP1emfRp3FS5N3s9C0lThKFF7Hjo1DPrWUnFgxVG1wPMj4D/hmJozm1mrOZTnuF0/sux8vc7Uz5o5pA/BqHTwIHcF2PP8XKqxQKsnp3VUC1qWIo/BmNBSkXZRvKLiuCjCshm4Q+He69uCp5wgIUM+fsIKk7p1Gsry4UWotyeFS5Wj9YY2kQZf5pE/u15SY5LEfgMnAtKWtsBIpgAeQH7YhmP9JMwTmzejEzmM3OaFQt+bR2f9YBASea8pmoOzVITCXwhrsN3ExKjNkmiaz87JemCwaVWEgEODEK6HD4gZnB9xiHO2EJ1Dv3FWnojdK5ipGuN3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU4Uc0mo+O5PVjJGC0ciFRRf3CAmp/HGzg922sq6WDI=;
 b=RB5i4/PIJbT1715HZFZbBPWp+I3ZlH8kORgTbZMrniPsYyuZdISMJt+4pVjNx358eX8FXma8MfGcSHz+IIQC5kJ5SCd50/g2k0AUdRbBD/vQv1x6eKnmSFIsk+eJtOHpyzrjuXNhxEAJeMGPnuig7M0eSWx+ZsagFzxx/L+4Kbk35JITslmMn0428Zuqdebr1NDyPorPP9HB4ml66u7u+nV91ze3EjRg9X4ahpx/kZtg26YfdYTv+1SDe/5FZTSIPvdycYolduiGhpKMOrBJjlNQv/PFpCWqU2Mk1JdomKBQgmeUCbeGiANM3VvYa8ufPLeNg6ZDRZQ+dUGQodi5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU4Uc0mo+O5PVjJGC0ciFRRf3CAmp/HGzg922sq6WDI=;
 b=Am5jpH+hYsRd+avJVN27mMhwMSXoOX76p7kS+McjWSVFsEyceHZ26oLczG5FnxKKzbutqUIa//ko1ESpzqTMCaAeTjsgHC6/Rk/QMhQVWsU9jA0tAe1CMqv5CX+TqQtrMQBZ+8lphZCVuQ3udB6TP+8jxUd+O6QiZu+i6IvzJhc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:09:10 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:09:10 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 30/37] MIPS: cmpxchg: Omit redundant barriers for Loongson3
Thread-Topic: [PATCH 30/37] MIPS: cmpxchg: Omit redundant barriers for
 Loongson3
Thread-Index: AQHVd+P/34JQxmanBEabiwRK/UX20A==
Date:   Mon, 30 Sep 2019 23:08:40 +0000
Message-ID: <20190930230806.2940505-31-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: be9a93b3-c89e-4236-71cc-08d745fb21b6
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022A7959AA2D5CF0535E61BC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(186003)(478600001)(2501003)(6436002)(50226002)(6666004)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002)(133343001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tm543mOujwZOy5RZLSJZ7ZVFt8AL/BITyg43+5TszTsUWL76vCZepL4tuwuoAKo71DX+wEX3OVVpasPB1PLObioqd5TL9srlbi+ux6NuyviGjsPUoWe3IGYMIJ77Ecs7W2FoFB/3KvC7V509AIOZTeVuIORpW38lrq8bSpXclIOu17KpczWWHGrwXruvJBgmqpyxe1cHzYDoQ7ZaMaAox/hBlGjtyIa9qX8hpnZl7nZ8DKR5e1FkhgAF/+EcaNgxwNgS1fkHTMryU7sQbah6+QArp8CBRStfiEwLN74pkkqUH1tfYl5GZVQGcONoru+lzajRRTVdbNYeXX+Q/uuFTn326D6y35Otdsi9ujviV6LNHLTa8RYXsQs7ZnPYIxuKCfuNVG1y0SGuwn9YDdKp/jYpI1ugk6w6PZCqUOFmdMk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9a93b3-c89e-4236-71cc-08d745fb21b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:40.2916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dInZDDzcOQB6jQRqIfF0QtO2RIHfa98dzJwJsDKRTx6+hyHodX+04+uZlTzM2F5s9fg9DoMMqlQ0igGGFaFKQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building a kernel configured to support Loongson3 LL/SC workarounds
(ie. CONFIG_CPU_LOONGSON3_WORKAROUNDS=3Dy) the inline assembly in
__xchg_asm() & __cmpxchg_asm() already emits completion barriers, and as
such we don't need to emit extra barriers from the xchg() or cmpxchg()
macros. Add compile-time constant checks causing us to omit the
redundant memory barriers.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxch=
g.h
index fc121d20a980..820df68e32e1 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -94,7 +94,13 @@ static inline unsigned long __xchg(volatile void *ptr, u=
nsigned long x,
 ({									\
 	__typeof__(*(ptr)) __res;					\
 									\
-	smp_mb__before_llsc();						\
+	/*								\
+	 * In the Loongson3 workaround case __xchg_asm() already	\
+	 * contains a completion barrier prior to the LL, so we don't	\
+	 * need to emit an extra one here.				\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_mb__before_llsc();					\
 									\
 	__res =3D (__typeof__(*(ptr)))					\
 		__xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
@@ -179,9 +185,23 @@ static inline unsigned long __cmpxchg(volatile void *p=
tr, unsigned long old,
 ({									\
 	__typeof__(*(ptr)) __res;					\
 									\
-	smp_mb__before_llsc();						\
+	/*								\
+	 * In the Loongson3 workaround case __cmpxchg_asm() already	\
+	 * contains a completion barrier prior to the LL, so we don't	\
+	 * need to emit an extra one here.				\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_mb__before_llsc();					\
+									\
 	__res =3D cmpxchg_local((ptr), (old), (new));			\
-	smp_llsc_mb();							\
+									\
+	/*								\
+	 * In the Loongson3 workaround case __cmpxchg_asm() already	\
+	 * contains a completion barrier after the SC, so we don't	\
+	 * need to emit an extra one here.				\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_llsc_mb();						\
 									\
 	__res;								\
 })
--=20
2.23.0

