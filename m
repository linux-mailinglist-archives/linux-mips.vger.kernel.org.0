Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 347B4C2A6A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732390AbfI3XIW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:22 -0400
Received: from mail-eopbgr710105.outbound.protection.outlook.com ([40.107.71.105]:33459
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732301AbfI3XIW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9yoKIqH+QohUvMOgVTcmIogDgYZMeArd7GUChxv2d8xbqZJZLzfaa3KCxkJruDcD+1Yg9rmCWo+lgA+A2SpuIFgwOt+oi4JzxWCnUpve8fTkTZlKsMENTZgo7zo7mRGkv/2NI5eOp/NBiIXifsi9tg4VCdXrnJimM/HbjFS82QBLFni7j8BMCwRwEFi4InWIH/cFF2DQImOIjO/cXBiPMtegLA9okaxmMSJ/b7YCvd4qvsPA/RfXS0/y83t8Z3ca5Y1+wmLWyF9slP5gwNi9IWpo5ae5DewEywY3g8j19lli7JmxrlJFL9W+qdZaDHD3mGxwF+KGgnViEaRj/qRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrqnYEjdQEijKACbW1P8uI4u8aL+ZvFCd0DStIFNSws=;
 b=BU7VyWy3VglB+R5znueEOt9WWQkUUOS+DdSAjdI0SFb7vK4lt9XR4e+imf0fimwxvFv1wbWq7v4QD23GgcK6WeRzx8abWhLZVP9wf/q6p+YUv03+1Zl4hncWDwHVEp3MYO1vEhxTgYMAChPvm6vcI4odPavgAsokvL54YUOceuJornYdNKe0vy0iGB9eiRauz1VezuhpaLSjfNAs0JOZ9KsfnPd98WarVxe3bFW0GKDjqDBfuKFs2c7dUj0FlKGbK5qEyyuwej9tUg/vAAeRGCU2G25XC51clrReiG/ccY5lAams6SzK9y9ihlI/uhIyc3C2oiSiUfYeGh1HcfONnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrqnYEjdQEijKACbW1P8uI4u8aL+ZvFCd0DStIFNSws=;
 b=OX1gPlU+VoPFTSPITy0s1PSctNddHJ19pAGYnMsgGrmWa/Ab3QcXgruOW/40plFOMM7H9MYAYLE2EMQRxC7DqHBeuVkQTfD6dhF0t2U4YFO90JhaRxkq5NdKINhSmvD/nRbBeUNzeo+zWapPit51WoAdT91ZKKnxMG7L6I6Jly4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:20 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:20 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 06/37] MIPS: barrier: Remove fast_mb() Octeon #ifdef'ery
Thread-Topic: [PATCH 06/37] MIPS: barrier: Remove fast_mb() Octeon #ifdef'ery
Thread-Index: AQHVd+PzeVq9kAt290WIqEOScOBiuA==
Date:   Mon, 30 Sep 2019 23:08:19 +0000
Message-ID: <20190930230806.2940505-7-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 462dc3b8-25f4-48af-bdd4-08d745fb1577
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1709B6DE1A5B9C3C05A8E77AC1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(76176011)(26005)(6512007)(5660300002)(71200400001)(71190400001)(4744005)(1076003)(4326008)(186003)(42882007)(6506007)(11346002)(256004)(486006)(44832011)(476003)(2616005)(446003)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TSeAAwVMTDamfjnekE9MTVrove26oLUakIo5xAuoKaBWInpICqpP3a8Ys+9f9glKYQiYWEd/7du97Rof814MR1Z/VFh6gpD2VTRqp8rFQOmB/CmV3vQt2CeQp+qWw9PRLFpggsMIuf3Uyx9bncynMCjSwGPrUPIpliEPXMc5YrluY4RkDeSnfkC1KNbbwxmvdl1CIPshtTirZxQJBIB1DFvJgvDAF/TCZAaE3L5GNWhysLMQN+EpQJU3BcOKw1EEfVvxVfeAn7tQssK3jUJFpxzvACLmloMGSRtBAqB7j9MxtONiwzsxjEZ25uJpHwWTrUO36/pQnBhVBGcnFTA3IR173g2YM0Igl4o0Rh+Tv8eNlWAbTKeM17DFZcUiHGoWrw0Se2sghaZfARZkAA2RVzNrWRF4sP2i2VEmdlUfZuQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462dc3b8-25f4-48af-bdd4-08d745fb1577
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:19.7620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PV6JSwNSgI4qL2LsuPVaFLYMKTCXuK40B6WD3joP1tW5s3Fj06rvk95ZjrXOz5K1e+FOYeEbl6nB96+dobpCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The definition of fast_mb() is the same in both the Octeon & non-Octeon
cases, so remove the duplication & define it only once.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/barrier.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 8a5abc1c85a6..657ec01120a4 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -38,6 +38,8 @@ static inline void wmb(void)
 }
 #define wmb wmb
=20
+#define fast_mb()	__sync()
+
 #define __fast_iob()				\
 	__asm__ __volatile__(			\
 		".set	push\n\t"		\
@@ -49,10 +51,8 @@ static inline void wmb(void)
 		: "m" (*(int *)CKSEG1)		\
 		: "memory")
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
-# define fast_mb()	__sync()
 # define fast_iob()	do { } while (0)
 #else /* ! CONFIG_CPU_CAVIUM_OCTEON */
-# define fast_mb()	__sync()
 # ifdef CONFIG_SGI_IP28
 #  define fast_iob()				\
 	__asm__ __volatile__(			\
--=20
2.23.0

