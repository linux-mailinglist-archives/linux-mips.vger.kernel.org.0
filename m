Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98623277B7
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 07:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhCAGoa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 01:44:30 -0500
Received: from mail-m121143.qiye.163.com ([115.236.121.143]:60366 "EHLO
        mail-m121143.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbhCAGo2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 01:44:28 -0500
X-Greylist: delayed 560 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Mar 2021 01:44:26 EST
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 54C0E5401F7;
        Mon,  1 Mar 2021 14:34:14 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arch: mips: sibyte: Return -EFAULT if copy_to_user() fails
Date:   Mon,  1 Mar 2021 14:33:56 +0800
Message-Id: <1614580437-19660-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSx9NTkkfTUNNHhlPVkpNSk9OQ0tPTk9OTUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MjI6ORw*Ej8LHxAOFiofOjhP
        T0kKCy9VSlVKTUpPTkNLT05PQk9NVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFKTkhMNwY+
X-HM-Tid: 0a77ec7e9452b038kuuu54c0e5401f7
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The copy_to_user() function returns the number of bytes remaining to be
copied, but we want to return -EFAULT if the copy doesn't complete.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/mips/sibyte/common/sb_tbprof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/sibyte/common/sb_tbprof.c b/arch/mips/sibyte/common/sb_tbprof.c
index f80d7a7..eac125f
--- a/arch/mips/sibyte/common/sb_tbprof.c
+++ b/arch/mips/sibyte/common/sb_tbprof.c
@@ -465,7 +465,7 @@ static ssize_t sbprof_tb_read(struct file *filp, char *buf,
 		if (err) {
 			*offp = cur_off + cur_count - err;
 			mutex_unlock(&sbp.lock);
-			return err;
+			return -EFAULT;
 		}
 		pr_debug(DEVNAME ": read from sample %d, %d bytes\n",
 			 cur_sample, cur_count);
-- 
2.7.4

