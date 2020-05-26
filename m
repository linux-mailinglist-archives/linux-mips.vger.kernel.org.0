Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000321BE04C
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 16:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgD2OKV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 10:10:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:36840 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726691AbgD2OKV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 10:10:21 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4038964235C1C3E36776;
        Wed, 29 Apr 2020 22:10:18 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 22:10:09 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tsbogend@alpha.franken.de>, <pbonzini@redhat.com>,
        <sean.j.christopherson@intel.com>, <linux-mips@vger.kernel.org>,
        <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] KVM: MIPS: use true,false for bool variable
Date:   Wed, 29 Apr 2020 22:09:35 +0800
Message-ID: <20200429140935.7993-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following coccicheck warning:

arch/mips/kvm/mips.c:82:1-28: WARNING: Assignment of 0/1 to bool
variable
arch/mips/kvm/mips.c:88:1-28: WARNING: Assignment of 0/1 to bool
variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/mips/kvm/mips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 9f50ceef9978..44eb36b1dbd8 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -79,13 +79,13 @@ bool kvm_trace_guest_mode_change;
 
 int kvm_guest_mode_change_trace_reg(void)
 {
-	kvm_trace_guest_mode_change = 1;
+	kvm_trace_guest_mode_change = true;
 	return 0;
 }
 
 void kvm_guest_mode_change_trace_unreg(void)
 {
-	kvm_trace_guest_mode_change = 0;
+	kvm_trace_guest_mode_change = false;
 }
 
 /*
-- 
2.21.1

