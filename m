Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7307AA4512
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 17:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbfHaPks (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 11:40:48 -0400
Received: from mail-eopbgr690114.outbound.protection.outlook.com ([40.107.69.114]:40430
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728144AbfHaPkr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 31 Aug 2019 11:40:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENWrZyWqLjyTFx560EyVnvrf+S5gcScynbGvvRN4DnFn4l2hq78qAUD3QlsmjTaWwU8cQ3Zi/0sVv+eGg0FBCJgt+w5ccg6aOnKcWB1qZuFvOQcO12hWS8exyNzREgQPs8fFdMuKWPWBDf6Nf24GirRIvxxNbOBsisvs7zpECscazaJTYyifkca+x7XxNtkcoJlsusa3uzfZqTZukldlXMvH6MmPpaB9GNNlaC3wVC+xOBE5+sVr9Rl+/iLYMCT27+4x26th4zE+QRZB+sHSlLr0RNIIjYaNmweeaWwq3iKfjuOuos8d1ROASJWMcUKNFzCNfE2o2M5PTc38Q/0Aug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWxH7sV+nqfODSr01mzYvoLUY9srP4Y6QkkU0W0rnNQ=;
 b=b/POH+ThNzj8VwWrsYzGWkhhECYXqZ6nfuNLeM49tAhnR1gz+7WHet0T1kU5lgEzIhqAXTvq7w0lTbOfzqg3ZgD5s7wclRAJI7ao7z4smuZktcHqZ1wweptKqKQiLvCAtOu8cOK7b78JoER9V+GVxakVOycAKqkQAysKNHZu21XRODHcQLyeKG0Y3f69WUDs4YMxA4TqqnRVUfPtLgyxRNcBphVtvv4PKb6NfCZnDs4D4znlu0x9oraSE1AGBeouWOC1Obmx7yDsdC+CUfpBU3PJOeHEOWOSu6Z1OuHHzcrdhN8k6ikxmdKGsaYVV8jeWFTtKYp7Skgwcff+BFhwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWxH7sV+nqfODSr01mzYvoLUY9srP4Y6QkkU0W0rnNQ=;
 b=BYdqtc5v/zQoceUo11JKF8oI71fJFCoAHmXmo4eduHXtyBcQNWkx4Pb4mXozW7Fl+mtRLmDKGmOQe2WEFXJ+9MkG5ZzylDVdhcltT2y0h0lXH3LPOsQT+sy66QG3HFzOG9JCBTZyJZ5gZdnh4pCRLGSWM6sCayheJkKWUTgbc/E=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1311.namprd22.prod.outlook.com (10.172.62.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Sat, 31 Aug 2019 15:40:45 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.013; Sat, 31 Aug
 2019 15:40:45 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 2/3] MIPS: tlbex: Simplify r3k check
Thread-Topic: [PATCH 2/3] MIPS: tlbex: Simplify r3k check
Thread-Index: AQHVYBJz+BF9BLVuWEWYafyHryDNqw==
Date:   Sat, 31 Aug 2019 15:40:44 +0000
Message-ID: <20190831154027.6943-2-paul.burton@mips.com>
References: <20190831154027.6943-1-paul.burton@mips.com>
In-Reply-To: <20190831154027.6943-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0161.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::29) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.1
x-originating-ip: [78.144.179.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47ab72a2-61c1-47fd-9550-08d72e299651
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1311;
x-ms-traffictypediagnostic: MWHPR2201MB1311:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB13111A8B1CB0C5FA50AEEE68C1BC0@MWHPR2201MB1311.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(376002)(136003)(366004)(346002)(199004)(189003)(2501003)(14454004)(386003)(102836004)(42882007)(6506007)(186003)(52116002)(476003)(2616005)(486006)(44832011)(26005)(11346002)(446003)(76176011)(2351001)(6916009)(1076003)(478600001)(14444005)(5660300002)(71190400001)(66446008)(64756008)(66556008)(71200400001)(66476007)(2906002)(107886003)(66946007)(8936002)(81156014)(6116002)(66066001)(5640700003)(8676002)(6486002)(50226002)(316002)(6512007)(256004)(6436002)(53936002)(99286004)(25786009)(305945005)(36756003)(7736002)(4326008)(81166006)(3846002)(42413003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1311;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mmcho0xPzZGd1qXWdn6DJrwWOznCEqulFzo9cAq3xUirj7aM8XbO0PiVxtLcIC75llh5t34xZNRzEta8ZcHiCojO6Zh2o83NxyVcIKR4AIKHQgcWW5K2DMF11qe864X1KrgI11aZWsFsgcRF9r7HPkgn3x5T/5gOM32cDFXft7HyDxQdOQrmjrz+dxEqzDipF4RxuEHjsovqwE+hwIhpPQwy+w2w8aLLJbSGDz4gg/mXoNz8gQ+eG1rkFa1Hs2kmARRC82KRattCv7zJrL8x5DoNHSvg13EVgjsPD9EJQo8VRBZ5NIdjHzb6bTZCvqlPEymDVMVZQpePeUvXU+0jKfKkHwTYv4HPIjvVPiEF5RQP3gk31AZ8dGToOI0A/kq2ycYuornNBl07abb2gvZWp87WdZJAk5umE9bIW3dc6+U=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ab72a2-61c1-47fd-9550-08d72e299651
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 15:40:44.9039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ERDEtui8uu8EmEENuhJON7lm0076XcPgcvX23HvNzp7fYSJcQq2SE6WBPYbjsANPz/D2yWVNqTH5zGNEwV6HbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1311
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We already know whether a CPU has r3k style exceptions, including TLB
exceptions, by checking cpu_has_3kex. Remove the list of CPU types in
build_tlb_refill_handler() & check cpu_has_3kex instead.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/mm/tlbex.c | 52 +++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 071d48593464..6e3ca9cc5249 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -2607,14 +2607,7 @@ void build_tlb_refill_handler(void)
 	check_for_high_segbits =3D current_cpu_data.vmbits > (PGDIR_SHIFT + PGD_O=
RDER + PAGE_SHIFT - 3);
 #endif
=20
-	switch (current_cpu_type()) {
-	case CPU_R2000:
-	case CPU_R3000:
-	case CPU_R3000A:
-	case CPU_R3081E:
-	case CPU_TX3912:
-	case CPU_TX3922:
-	case CPU_TX3927:
+	if (cpu_has_3kex) {
 #ifndef CONFIG_MIPS_PGD_C0_CONTEXT
 		if (cpu_has_local_ebase)
 			build_r3000_tlb_refill_handler();
@@ -2631,30 +2624,29 @@ void build_tlb_refill_handler(void)
 #else
 		panic("No R3000 TLB refill handler");
 #endif
-		break;
+		return;
+	}
=20
-	default:
-		if (cpu_has_ldpte)
-			setup_pw();
+	if (cpu_has_ldpte)
+		setup_pw();
=20
-		if (!run_once) {
-			scratch_reg =3D allocate_kscratch();
-			build_setup_pgd();
-			build_r4000_tlb_load_handler();
-			build_r4000_tlb_store_handler();
-			build_r4000_tlb_modify_handler();
-			if (cpu_has_ldpte)
-				build_loongson3_tlb_refill_handler();
-			else if (!cpu_has_local_ebase)
-				build_r4000_tlb_refill_handler();
-			flush_tlb_handlers();
-			run_once++;
-		}
-		if (cpu_has_local_ebase)
+	if (!run_once) {
+		scratch_reg =3D allocate_kscratch();
+		build_setup_pgd();
+		build_r4000_tlb_load_handler();
+		build_r4000_tlb_store_handler();
+		build_r4000_tlb_modify_handler();
+		if (cpu_has_ldpte)
+			build_loongson3_tlb_refill_handler();
+		else if (!cpu_has_local_ebase)
 			build_r4000_tlb_refill_handler();
-		if (cpu_has_xpa)
-			config_xpa_params();
-		if (cpu_has_htw)
-			config_htw_params();
+		flush_tlb_handlers();
+		run_once++;
 	}
+	if (cpu_has_local_ebase)
+		build_r4000_tlb_refill_handler();
+	if (cpu_has_xpa)
+		config_xpa_params();
+	if (cpu_has_htw)
+		config_htw_params();
 }
--=20
2.22.1

