Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BC0A5273
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 11:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbfIBJCe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 05:02:34 -0400
Received: from mail-eopbgr820124.outbound.protection.outlook.com ([40.107.82.124]:21097
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730361AbfIBJCe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Sep 2019 05:02:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWO1CUJ6gNOX25Te1l6J7cOLWbpmOnNevqsQzipV5ReW78W07BtSzAsgyRXGlmE1QBj+BPoqUyEtjNpV14tCsZ884uH0kx4iKfKFfONQimC0uHTSz3U0SsW24ZlQdJ4Q0YrNG2Y06nhDOoesazxOaf0E/FnnFsQNSOF31FAiA8iuAFawDLQLRw3M4ulRV2fjaPdoKGl5X1id3JRL1a2AhaD3vyrHXpRscCb6nfpYllHtmB7LwyMnCSXt3aiXRBf7485tHkJpJdm5H1pawyubMS/jjT+21E/LlasMAp7RKwRc5qqgckHnCWKpCELVqOcOYinZNcjqCYtxlh5TmT9o/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMKq6GeMhsk+XahTuFLTss5kI9WDArr01x9BDZbr+To=;
 b=e0Ks8+dfQtSWdQ8IgPXuRcQzvpNRgjQCCwJsmu936vSGwurMHAH03ViHmzRUBFtCLLKEb4sddEiAHIH+fW4hAHsuPtz1syr19SmAQisUydTJmUmKcPWnR7d+RwySbhUKt3PfMI96Cxjy+r2FdOw6SP8FQ2Zw3D/fbFHRB7JU2kxkS67hqnQkNznUpCrxLKkEV5QaJ0vNRoniRnkspOjU3+IUDJA9Xw1zOfzKkPhToXyTRD29UI7NIbgFYk7cFaQ3vM83xUuo9jL0E2X4OchIlweB5P4fh211O5o7ZvWf3gvAQk/oTJI1uA53RxYqLaEiA6Q0KdkvOW04a7qHb0Go/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMKq6GeMhsk+XahTuFLTss5kI9WDArr01x9BDZbr+To=;
 b=f1WiylnWDZarjAL+4c8xJLrGHShdk4TAhTESnfcNJuNdZUbbWzAPbzAhtwdeGPQCCgb82TEfgL6nAEjv6oPW7Oed7I/p3/czlxuaW68xKXdLjleTVyYGZss+z+4+7dVhKTD1ENlq6xUCi4XTM269ih1aMkUnaLDVGev/fWzJyHc=
Received: from DM5PR22MB0860.namprd22.prod.outlook.com (10.171.160.147) by
 DM5PR22MB0169.namprd22.prod.outlook.com (10.168.175.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 2 Sep 2019 09:02:32 +0000
Received: from DM5PR22MB0860.namprd22.prod.outlook.com
 ([fe80::592b:85e8:62b8:dfd9]) by DM5PR22MB0860.namprd22.prod.outlook.com
 ([fe80::592b:85e8:62b8:dfd9%3]) with mapi id 15.20.2220.021; Mon, 2 Sep 2019
 09:02:32 +0000
From:   Gary Fu <qfu@wavecomp.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>, Archer Yan <ayan@wavecomp.com>,
        Gary Fu <qfu@wavecomp.com>
Subject: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Topic: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Index: AQHVYW0nkTjSutOr40CVXBCxMMHvkw==
Date:   Mon, 2 Sep 2019 09:02:32 +0000
Message-ID: <20190902090148.10356-1-qfu@wavecomp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To DM5PR22MB0860.namprd22.prod.outlook.com
 (2603:10b6:3:13b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qfu@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [218.108.86.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 886f02e9-51bc-49ce-eded-08d72f8449ef
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR22MB0169;
x-ms-traffictypediagnostic: DM5PR22MB0169:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR22MB0169F2BB4BE55F073CBBAB11C3BE0@DM5PR22MB0169.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(136003)(366004)(376002)(396003)(346002)(189003)(199004)(99286004)(7736002)(6116002)(2501003)(316002)(186003)(66066001)(66446008)(64756008)(66556008)(66476007)(71190400001)(71200400001)(86362001)(305945005)(486006)(107886003)(6512007)(25786009)(52116002)(478600001)(4326008)(6486002)(6436002)(5640700003)(5660300002)(102836004)(14444005)(26005)(53936002)(6916009)(54906003)(256004)(8936002)(14454004)(50226002)(66946007)(1076003)(476003)(8676002)(81156014)(6506007)(386003)(81166006)(2906002)(2616005)(2351001)(3846002)(36756003);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR22MB0169;H:DM5PR22MB0860.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PEiukPMFI6yFnLI+HsTJenFCSxLO+DQPAtlkWOQ5KQthHcfAzA5YayDZmW5+Ad3F5jGVb7ehwvtvhwLSpH/TSIXdd64KYAMGITAgB+nHu+AVIo2BytCydA0SVYgSJ0ZYwuxd7GSY4jRChbjqCSBr7Ozu1sQOnLOb4pzoaOvM2OnJJpG2/pwwHvu4HecPz0g+/+C6G1SnOhmR1YDt23pAwJzmn4RSzk6ulTfiNCG27JRo7Ly2mIL9JvJi1CgGNwnzx4IbZmUxGaoAficXIapWkAg/R9Iu35+tz6ANbeek9ZQeqL1+NGkpMyB0Sk/BGkp5nrJy5C6x1K70dsmFcaX1CiIwDi4EKiU0hD20m8v+OfihAoagjQ4f/V1IIztVuXXu4M12J8OjV4qZqVKl/oPJSKxa3OgcwEkPKOzNbI+hSU0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886f02e9-51bc-49ce-eded-08d72f8449ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 09:02:32.0333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h2RlrySAuWewPGiLy/w/JMUA3yVXNBCBGGC1gpLSghlNMWEQ0WhVDGYWHztfH4xn2YsMhvCxLYfhwJ4tR1JjAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR22MB0169
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a cond_resched() to give the scheduler a chance to run madvise
task to avoid endless loop here in non-preemptible kernel.

Otherwise, the kvm_mmu_notifier would have no chance to be descreased
to 0 by madvise task -> syscall -> zap_page_range ->
mmu_notifier_invalidate_range_end ->
__mmu_notifier_invalidate_range_end -> invalidate_range_end ->
kvm_mmu_notifier_invalidate_range_end, as the madvise task would be
scheduled when running unmap_single_vma -> unmap_page_range ->
zap_p4d_range -> zap_pud_range -> zap_pmd_range -> cond_resched which
is called before mmu_notifier_invalidate_range_end in zap_page_range.

Signed-off-by: Gary Fu <qfu@wavecomp.com>
---
 arch/mips/kvm/mmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 97e538a8c1be..e52e63d225f4 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -746,6 +746,22 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, un=
signed long gpa,
 		 */
 		spin_unlock(&kvm->mmu_lock);
 		kvm_release_pfn_clean(pfn);
+		/*
+		 * Add a cond_resched() to give the scheduler a chance to run
+		 * madvise task to avoid endless loop here in non-preemptible
+		 * kernel.
+		 * Otherwise, the kvm_mmu_notifier would have no chance to be
+		 * descreased to 0 by madvise task -> syscall -> zap_page_range
+		 * -> mmu_notifier_invalidate_range_end ->
+		 * __mmu_notifier_invalidate_range_end -> invalidate_range_end
+		 * -> kvm_mmu_notifier_invalidate_range_end, as the madvise task
+		 * would be scheduled when running unmap_single_vma ->
+		 * unmap_page_range -> zap_p4d_range -> zap_pud_range ->
+		 * zap_pmd_range -> cond_resched which is called before
+		 * mmu_notifier_invalidate_range_end in zap_page_range.
+		 */
+		if (need_resched())
+			cond_resched();
 		goto retry;
 	}
=20
--=20
2.17.1

