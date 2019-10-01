Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E088C4341
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbfJAVxO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:14 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:55809
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728024AbfJAVxO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/J5dX0pL1h6O+/f8ezZ3Q/fU1kxUB27gFKwawMBDFNqdv36p3YTKrvhWmIUqpfjGuOBZm7yvuEk0UpYqgryBQN4+MST5gC0BFNO8xs7LKJMuEE0rWciyiJZ6LOjTGv0vE1v+mqfy9gW2JShnk5FcrG8+Xqm9ID83ZFD9RwWZla59qmNUfnoqG0i+dMsXxqNZGRXKkxxoITYLUYX0JVyPBt3hjye086eZGA3nl28I6vrmIZ36SHFyM9hkxOOPaOGoMCZ1Hy1MXqry6UQP50nJaZN8+LVOiUT0aWIzISTGb8TmL8zNjPibM+WYhNOEY977BjFAh2AWcgCqq6LwSG14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e7ebd9MXfR2Sz/oJu/bw9Jr1OuQWNHWSBxeBRXCAmQ=;
 b=hHkTgWt1531+EMJG9ZUR6vleT2eiQSu+7lQaGIvhCkrTzAgTEaprrWsl7Oks8usfvh9Gz7ovNOAf0QVILNK7Fe6tA/9EgSXmBRP6JkAMsPpmOb2WlLBCJA0ZOsyJ6Qte5EQF0IXKQuBGCH03e9dJwjCGlGk4FyNurz/tKH3FVOjuEJm+2J2GBZo7XsKE1TAfG/s567V7myDHmLi8tonCowCQ0xI46IA5IcNvsD9y2FaenrPVZHZK0FeMjSpmLrhFqK2phTbUbX+HliEcVTYeErbgLReS5nHas5GWgYjiGV9Tp/JuIRbwBUp0HJs95t1BkwQ4ULVjnT32vfrSkY5wcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e7ebd9MXfR2Sz/oJu/bw9Jr1OuQWNHWSBxeBRXCAmQ=;
 b=Kns37M1vHgMAMNZyM7lO8Ht4P6yrEHqHKvW8my7u0g41liiE0A3sTeaPfgA3vqutsa/QiW/+l5K9WLcP5yMXnoCLTn2Hru4DdV+eT3KQUqVUqZoT9oAtkp8M9yTA98RAQqMR4//dHZzKlwbcfZ4jKA71K+ePUxY8+OEy1b91RRw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:11 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 06/36] MIPS: barrier: Remove fast_mb() Octeon #ifdef'ery
Thread-Topic: [PATCH v2 06/36] MIPS: barrier: Remove fast_mb() Octeon
 #ifdef'ery
Thread-Index: AQHVeKKecuBJXFEExEuaIM5meiefFQ==
Date:   Tue, 1 Oct 2019 21:53:11 +0000
Message-ID: <20191001215249.4157062-7-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 941c3f8c-3e9f-42f8-2bbc-08d746b9c07c
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439B6DA752211E2B29E3EEDC19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(4744005)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QqBWANbODkvJAoLJDkCtW5LaFywMrHLyYCi1au3LJSFtk7BizZfSDuEgPfv0kbM9AcLi6sfkFkx45KGeD9QByONoXEygbHc8NnMSsBFrQsETbqLo4AZPAjAlWS9t8e9ZLx1eUTyH7lzaMNII+9rAPIvifSeexR7KzIywfYrL/CJ2UKKVgj79RU2+AiuVkX29QPIaUxxDaIeVMAxa8+UkJr1sVTxp5wcgD/KyqyEK2IQLf3W7ASfmDmKHgbepGqvh6+Kv3jKRYCN4CbjSBg1mdzQxtoO6bpcDicXvhfkFVJUvKEGr+y32uVXjvjWyeR23YEWOTsaBGATlk47YKGMUoDQpuXXAz5/HzSdC0Q8qCl0hquiNTO6kHIP73nQp0cuMwkhwGa+P37s2szD0++RQ0BPLwtYt7Hjjl7vVMcMX7YU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941c3f8c-3e9f-42f8-2bbc-08d746b9c07c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:11.1000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLH36cKMPrbCp5wABLkP9iAnOAxVbw14cwrc6DQV1/7T5CXrFC7zEKqdQAo4u4Y574hc2NKJi9IKva4bhiZiDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The definition of fast_mb() is the same in both the Octeon & non-Octeon
cases, so remove the duplication & define it only once.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

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

