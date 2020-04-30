Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C261BEE90
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 05:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgD3DNj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 23:13:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3345 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726357AbgD3DNj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 23:13:39 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9194AF08CDD32989D52A;
        Thu, 30 Apr 2020 11:13:36 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 30 Apr 2020 11:13:30 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <kvm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] KVM: MIPS/Emulate: Remove unneeded semicolon
Date:   Thu, 30 Apr 2020 11:19:36 +0800
Message-ID: <1588216776-62161-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes coccicheck warnings:

arch/mips/kvm/emulate.c:1793:3-4: Unneeded semicolon
arch/mips/kvm/emulate.c:1968:3-4: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 arch/mips/kvm/emulate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 754094b..5c88bd1 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1790,7 +1790,7 @@ static enum emulation_result kvm_mips_guest_cache_op(int (*fn)(unsigned long),
 			return EMULATE_EXCEPT;
 		default:
 			break;
-		};
+		}
 	}
 }
 
@@ -1965,7 +1965,7 @@ enum emulation_result kvm_mips_emulate_inst(u32 cause, u32 *opc,
 			break;
 		default:
 			goto unknown;
-		};
+		}
 		break;
 unknown:
 #endif
-- 
2.6.2

