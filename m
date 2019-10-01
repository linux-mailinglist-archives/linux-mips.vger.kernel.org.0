Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D86BCC433C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbfJAVx1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:27 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728102AbfJAVx0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUJkZ/EBDxdUUsVK9IpdyNyDL10bAWh4gtOsgW5GHPybiBlpvmKoEXJrL1i1FWdVHB0bELNWx0n6qCQt4GKGn2zitPdhK+oqsmurgZc2YDH4DeosqFC7KXO36dFQPeqlyRuTVD9uBTKZl4WO5zACbydyXdaPvURaqF7jlcbNcCwFv0a8DukT9yQP0/nbzELBgp8S0YsB22IudnnGPr7Dp2KsBuMYaAnriyYIwsKNQA0o7GFjnrfe0/Zbw+I/0kZ9UyKDYYLlXUGgb8OEtagZrsn5i8m5u7f4MzJRroavun7mris/p6pKojEACL3w2MtJyiGkZz15eURCzXBqfeeiJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49Jd5Z3FfPcepodFqHQoJO3RNX9e6jeeL5/ciXdkBxQ=;
 b=WsouRD4w/d4uhMq/Vz9E8SstA2rTGCuY4Lh8tJsemB6ALXESFjnKQ2fkERQJey8BCFipkxYeHGX8GvXtYL/2ppDeWl6iFDAUPiYpMBhzL9L0J2j/nbXkRuKBJscqL9Sc97zrSM1JQMluRqLCAuDZ0lNXYnwh55st/xAMnScjLqNiG/MIsPihDwN96SG1O0qwT+TDSK26QXi3wMNn1PnM+SErGkysk/d8+CF2hSZrzxPDO68pwJFrlhNHm4P+SH0rwmjEB9AU0ybFUf8bhzgwWl7V1U3kuE+KdFe1MxKxijQuRYP5AqrZPWOXMCO3GEilN6sGehb/L2CCiiiGXXn9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49Jd5Z3FfPcepodFqHQoJO3RNX9e6jeeL5/ciXdkBxQ=;
 b=nIft/n9i3XyezoKBDZMOfKqc8/S5OgVdkgdcWTmc1tjeEo5CgJ/9Jb6nSRADWOJr2jUEWMTeUiYdxHN5pZxGQ7ZrVeSSTjaMPMywFL38WB8MLYILIOKnvRN9K9rw9PDbpu4C88lH6ChMVQcwRWuJKvVXDe8NtG2nw8XwYLb1Vyw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:22 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:22 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 13/36] MIPS: atomic: Use _atomic barriers in
 atomic_sub_if_positive()
Thread-Topic: [PATCH v2 13/36] MIPS: atomic: Use _atomic barriers in
 atomic_sub_if_positive()
Thread-Index: AQHVeKKkiaHoVT4NRUe9RobCldAC8Q==
Date:   Tue, 1 Oct 2019 21:53:21 +0000
Message-ID: <20191001215249.4157062-14-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: a263dcc0-275a-4389-b765-08d746b9c6e5
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14395FF43659935614EE4774C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(4744005)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gB4PwjDE8ulZ/lAKowSsbNbas0JCeNDe6aNOs4Wqyag23x/uK4zp04AceK51GQJ7qx9WcTVJw7IYfCioc9U3Qf8FUDwijMZN0U1S58zZU5+ejE7oWRfh2KCO1uLA9k56qt0VGaUv7pPCth0ChW2HwQ5a/QvoHUCdrvnqgawLqyb0vnmIwWDRB6FHHx3iEakpApexFr6EADQw4vqTX/PbtwF60M3oHf1n493mD0udZbHNcEJ7ZUfVWz3av0OUFwLuKgC03Hcod7tn7wSFXjFgLUncpzat3WPZwnghOT/HoBy2fYJh/7cBxSGz3VqgToLGr054MhhFaFhTLvvCRq6D623zeVHQfKszBb1By3sbqrAdx7CpbeGnzU/2409QgL+qi9iZJo5lGesLhLi72h0RrSMHg/ZYeAYhnARN75wmAgA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a263dcc0-275a-4389-b765-08d746b9c6e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:21.9650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3d1GWdc5N58ymI22MT29lTxfJtcd8+iMeDKZ7y9PEeb9RbzFusvnaBUoKczrkncKlMNIPvF0CXWv/VMsBYnO1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use smp_mb__before_atomic() & smp_mb__after_atomic() in
atomic_sub_if_positive() rather than the equivalent
smp_mb__before_llsc() & smp_llsc_mb(). The former are more standard &
this preps us for avoiding redundant duplicate barriers on Loongson3 in
a later patch.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/atomic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.=
h
index 841ff274ada6..24443ef29337 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -196,7 +196,7 @@ static __inline__ int atomic_sub_if_positive(int i, ato=
mic_t * v)
 {
 	int result;
=20
-	smp_mb__before_llsc();
+	smp_mb__before_atomic();
=20
 	if (kernel_uses_llsc) {
 		int temp;
@@ -237,7 +237,7 @@ static __inline__ int atomic_sub_if_positive(int i, ato=
mic_t * v)
 	 * another barrier here.
 	 */
 	if (!__SYNC_loongson3_war)
-		smp_llsc_mb();
+		smp_mb__after_atomic();
=20
 	return result;
 }
--=20
2.23.0

