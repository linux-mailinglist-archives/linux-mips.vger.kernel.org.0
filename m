Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618691BB6B4
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 08:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgD1Gdk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 02:33:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50938 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726591AbgD1Gdi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 02:33:38 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B2A8A569E5E26E311EAB;
        Tue, 28 Apr 2020 14:33:36 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 14:33:28 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <rric@kernel.org>, <tsbogend@alpha.franken.de>,
        <oprofile-list@lists.sf.net>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] MIPS: oprofile: remove unneeded semicolon in common.c
Date:   Tue, 28 Apr 2020 14:32:54 +0800
Message-ID: <20200428063254.33337-1-yanaijie@huawei.com>
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

arch/mips/oprofile/common.c:113:2-3: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/mips/oprofile/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/oprofile/common.c b/arch/mips/oprofile/common.c
index 03db268cba5c..d3996c4c6440 100644
--- a/arch/mips/oprofile/common.c
+++ b/arch/mips/oprofile/common.c
@@ -110,7 +110,7 @@ int __init oprofile_arch_init(struct oprofile_operations *ops)
 	case CPU_LOONGSON64:
 		lmodel = &op_model_loongson3_ops;
 		break;
-	};
+	}
 
 	/*
 	 * Always set the backtrace. This allows unsupported CPU types to still
-- 
2.21.1

