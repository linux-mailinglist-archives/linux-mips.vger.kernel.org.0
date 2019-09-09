Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13B2AD207
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2019 04:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733155AbfIICt0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Sep 2019 22:49:26 -0400
Received: from mail-eopbgr750124.outbound.protection.outlook.com ([40.107.75.124]:8679
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733062AbfIICt0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Sep 2019 22:49:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jgj32YJtpsCfnm4W2GFbPIsT1qN4UK00Cn3D4Y+orAhm4OwjfcXI3VFsPhBqfgIeNX0/ifCt7V1/XHuyp+mwfndZGmoL1+8BXCXvR0MpX9DM6o2rq3zm0YomIWYzwCJCEwGVhhxUSak3/vre6X/OneEOzwAzT4CWPh1OyA5FWfDWO+I/oqm+ROlAQNA7ccDjCAT/UUT806J43zbIcAmLlgxQobXv6scolPKptrJYzkKzio8O8O+8WJKYXVQ2PBR7H4LLjC/3JrfUFqdP6AgHnabELHKokyPwoyUqxjIxD0sOZ+ULb0pkqt+DDhPgP6Or8U2hvCDDgjOO01M24Dvrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g46fOMqOdfH+8DR56s96c8+WqNlUAOY+CoMyKjXI2UU=;
 b=bCbsTQ2qEWbHKciQRwIAnBQ8aA5yJbMhir3s9850VqtKCyQcXMpSwguMhzrv84yhtfDAy9ntdhmmiRTUhaOWe9HnaGXW8Zx89NOe9XCC1M7Bqtf2K3uvk0hdJdcnTUAMeDBRSxzSDrcfqUcGAdZcSjVHwkaapv4+esBfDallv9SdpKw485/BCAL1kk9rDWA/x3Huq0AjjFzd+TapitywsXITxO83jAy0teSWfCogx+QztW+SQWci/C0qr01LA7nfHrDk4TR5TTHypqO9vOvlQvDE3nhlWm98gh++CnibDezuGjVmf7/LNo9OoaSQEItuxd2WHaJkz7h1nNQB4p1n1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g46fOMqOdfH+8DR56s96c8+WqNlUAOY+CoMyKjXI2UU=;
 b=Rv+VgLCf7yMnNovClOfXe2k3hpJFXQki/H4FBi6sWFRFlfsgny7ZiCWZT3gPwjv/efs1VKeNZaFEdcUjsl8T+b/L4dlF6GzYYzhm0wYXo78z1Y66RmFExNGh8BnY+2MVQJiTlJ63JHRAoRYG0VH/z4HaYmnYtsY7NKgVJecIafU=
Received: from DM5PR22MB0860.namprd22.prod.outlook.com (10.171.160.147) by
 DM5PR22MB0412.namprd22.prod.outlook.com (10.173.171.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 02:49:20 +0000
Received: from DM5PR22MB0860.namprd22.prod.outlook.com
 ([fe80::592b:85e8:62b8:dfd9]) by DM5PR22MB0860.namprd22.prod.outlook.com
 ([fe80::592b:85e8:62b8:dfd9%3]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 02:49:20 +0000
From:   Gary Fu <qfu@wavecomp.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        Archer Yan <ayan@wavecomp.com>, Gary Fu <qfu@wavecomp.com>
Subject: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Topic: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Index: AQHVZrktJiYQlXJorEWsFSqM1ehwjw==
Date:   Mon, 9 Sep 2019 02:49:19 +0000
Message-ID: <20190909024838.2757-1-qfu@wavecomp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::25) To DM5PR22MB0860.namprd22.prod.outlook.com
 (2603:10b6:3:13b::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qfu@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [218.108.86.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8ce6cb3-2c21-4a3a-a6fc-08d734d04ff8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR22MB0412;
x-ms-traffictypediagnostic: DM5PR22MB0412:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR22MB0412A2FE41E56E731EE39BE2C3B70@DM5PR22MB0412.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(396003)(136003)(39840400004)(376002)(189003)(199004)(64756008)(8676002)(2501003)(71190400001)(36756003)(66476007)(2616005)(99286004)(52116002)(5660300002)(53936002)(26005)(6436002)(478600001)(54906003)(2906002)(6916009)(1076003)(5640700003)(102836004)(2351001)(486006)(86362001)(476003)(6486002)(386003)(14454004)(6512007)(316002)(6506007)(186003)(50226002)(66946007)(66556008)(66446008)(256004)(71200400001)(3846002)(7736002)(6116002)(107886003)(81166006)(81156014)(4326008)(305945005)(25786009)(66066001)(14444005)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR22MB0412;H:DM5PR22MB0860.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NwvnsgJynVYTEUpG389eznGwd8oMjqOC3faWg2mUn2SaXUE08MWbxNe+E8ccSSbIpRaf/5WIBD9aXQ7eDv9J0MTrpRGfNtQjMa8InS209UQTAbzP82rDqFKDU7AvOsIYoPva9azXclNOHSPbthDSyjE+EmUF0nJh/SkE+cjlj1CCWE04w1vQkmqdUzkws9gfxV+mH1hEMk6blj8aU/eeuAFi7qXl3Eov1rJpyn9g+T1tECPkR7b7SrfG5kHx6ctT+8+oXm1u954ndCrJUxyTtQP2l4gwNuBtcWXOYAQf2lLHJRwylvWkjk1tKexRM/iW6SewRxRd2dveDhAhdFlQN9Spak8mCwWrW+yvm3KPj/wDEnknPTe5wjjxmh6h9vYBRxItiqG0Dxtucj5/gVVU09qBJ6HHT9yOAIFs7XvL8rg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ce6cb3-2c21-4a3a-a6fc-08d734d04ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 02:49:19.9660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUKeNwz88JcVPtxaPXFZTL4NcgGxrUTj/sp7zuRR/ZHsIdUOrdp3jPgGNKzAns7r0f5AzW8ehl7GDyiK/SEZUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR22MB0412
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a cond_resched() to give the scheduler a chance to run madvise
task to avoid endless loop here in non-preemptible kernel.

Otherwise, the kvm_mmu_notifier would have no chance to be decreased
to 0 by madvise task -> syscall -> zap_page_range ->
mmu_notifier_invalidate_range_end ->
__mmu_notifier_invalidate_range_end -> invalidate_range_end ->
kvm_mmu_notifier_invalidate_range_end, as the madvise task would be
scheduled when running unmap_single_vma -> unmap_page_range ->
zap_p4d_range -> zap_pud_range -> zap_pmd_range -> cond_resched which
is called before mmu_notifier_invalidate_range_end in zap_page_range.

When handling GPA faults by creating a new GPA mapping in
kvm_mips_map_page, it will be retrying to get available page. In the
low memory case, it is waiting for the memory resources freed by
madvise syscall with MADV_DONTNEED (QEMU application -> madvise with
MADV_DONTNEED -> syscall -> madvise_vma -> madvise_dontneed_free ->
madvise_dontneed_single_vma -> zap_page_range). In zap_page_range,
after the TLB of given address range is cleared by unmap_single_vma,
it will call __mmu_notifier_invalidate_range_end which finally calls
kvm_mmu_notifier_invalidate_range_end to decrease mmu_notifier_count
to 0. The retrying loop in kvm_mips_map_page checks the
mmu_notifier_count and if the value is 0 which indicates that some
new page is available for mapping, it will jump out the retrying loop
and set up PTE for a new GPA mapping.
During the TLB clearing (in unmap_single_vma in madvise syscall)
mentioned above, it will call cond_resched() per PMD for avoiding
occupying CPU for a long time (in case of huge page range zapping).
When this happens in the non-preemptible kernel, the retrying loop in
kvm_mips_map_page will be running endlessly as there is no chance to
reschedule back to madvise syscall to run
__mmu_notifier_invalidate_range_end to decrease mmu_notifier_count so
that the value of mmu_notifier_count is always 1.
Adding a scheduling point before every retry in kvm_mips_map_page will
give the madvise syscall (invoked by QEMU) a chance to be re-scheduled
back to zap pages in the given range and clear mmu_notifier_count
value to let kvm_mips_map_page task jump out the loop.

Signed-off-by: Gary Fu <qfu@wavecomp.com>
---
 arch/mips/kvm/mmu.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 97e538a8c1be..26bac7e1ea85 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -746,6 +746,54 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, un=
signed long gpa,
 		 */
 		spin_unlock(&kvm->mmu_lock);
 		kvm_release_pfn_clean(pfn);
+		/*
+		 * Add a cond_resched() to give the scheduler a chance to run
+		 * madvise task to avoid endless loop here in non-preemptible
+		 * kernel.
+		 * Otherwise, the kvm_mmu_notifier would have no chance to be
+		 * decreased to 0 by madvise task -> syscall -> zap_page_range
+		 * -> mmu_notifier_invalidate_range_end ->
+		 * __mmu_notifier_invalidate_range_end -> invalidate_range_end
+		 * -> kvm_mmu_notifier_invalidate_range_end, as the madvise task
+		 * would be scheduled when running unmap_single_vma ->
+		 * unmap_page_range -> zap_p4d_range -> zap_pud_range ->
+		 * zap_pmd_range -> cond_resched which is called before
+		 * mmu_notifier_invalidate_range_end in zap_page_range.
+		 *
+		 * When handling GPA faults by creating a new GPA mapping in
+		 * kvm_mips_map_page, it will be retrying to get available
+		 * pages.
+		 * In the low memory case, it is waiting for the memory
+		 * resources freed by madvise syscall with MADV_DONTNEED (QEMU
+		 * application -> madvise with MADV_DONTNEED -> syscall ->
+		 * madvise_vma -> madvise_dontneed_free ->
+		 * madvise_dontneed_single_vma -> zap_page_range). In
+		 * zap_page_range, after the TLB of given address range is
+		 * cleared by unmap_single_vma, it will call
+		 *  __mmu_notifier_invalidate_range_end which finally calls
+		 * kvm_mmu_notifier_invalidate_range_end to decrease
+		 * mmu_notifier_count to 0. The retrying loop in
+		 * kvm_mips_map_page checks the mmu_notifier_count and if the
+		 * value is 0 which indicates that some new page is available
+		 * for mapping, it will jump out the retrying loop and set up
+		 * PTE for a new GPA mapping.
+		 * During the TLB clearing (in unmap_single_vma in madvise
+		 * syscall) mentioned above, it will call cond_resched() per
+		 * PMD for avoiding occupying CPU for a long time (in case of
+		 * huge page range zapping). When this happens in the
+		 * non-preemptible kernel, the retrying loop in
+		 * kvm_mips_map_page will be running endlessly as there is no
+		 * chance to reschedule back to madvise syscall to run
+		 * __mmu_notifier_invalidate_range_end to decrease
+		 * mmu_notifier_count so that the value of mmu_notifier_count
+		 * is always 1.
+		 * Adding a scheduling point before every retry in
+		 * kvm_mips_map_page will give the madvise syscall (invoked by
+		 * QEMU) a chance to be re-scheduled back to zap pages in the
+		 * given range and clear mmu_notifier_count value to let
+		 * kvm_mips_map_page task jump out the loop.
+		 */
+		cond_resched();
 		goto retry;
 	}
=20
--=20
2.17.1

