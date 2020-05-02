Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BA71C229C
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 05:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgEBDzg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 23:55:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38836 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726307AbgEBDzg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 May 2020 23:55:36 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL2gW76xepTMvAA--.8S2;
        Sat, 02 May 2020 11:55:02 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] MIPS: tools: Show result for loongson3-llsc-check
Date:   Sat,  2 May 2020 11:55:01 +0800
Message-Id: <1588391701-5588-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxL2gW76xepTMvAA--.8S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZryxKw4kAw17Kw48Xr43ZFb_yoWkArc_Ja
        s2g348GryrXrW2k3ykury8XFZ7WFyxZ3W7ua17Zr17W3WYyF13XFW0yrZ8KF17Aw1jyF4f
        AF48ur1xAr4I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
        Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
        1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0UDGUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It is better to show the result before loongson3-llsc-check exit,
otherwise we can see nothing if the return status is EXIT_SUCCESS,
it seems confusing.

E.g. without this patch:

[loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
[loongson@localhost tools]$

With this patch:

[loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
loongson3-llsc-check returns success
[loongson@localhost tools]$

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2:
  - move "returns" after "loongson3-llsc-check" suggested by Sergei

 arch/mips/tools/loongson3-llsc-check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/tools/loongson3-llsc-check.c b/arch/mips/tools/loongson3-llsc-check.c
index 0ebddd0..bdbc7b4 100644
--- a/arch/mips/tools/loongson3-llsc-check.c
+++ b/arch/mips/tools/loongson3-llsc-check.c
@@ -303,5 +303,7 @@ int main(int argc, char *argv[])
 out_close:
 	close(vmlinux_fd);
 out_ret:
+	fprintf(stdout, "loongson3-llsc-check returns %s\n",
+		status ? "failure" : "success");
 	return status;
 }
-- 
2.1.0

