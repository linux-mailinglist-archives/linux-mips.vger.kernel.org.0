Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8701B1E20BC
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 13:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388748AbgEZLO6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 07:14:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54090 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388712AbgEZLO6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 07:14:58 -0400
Received: from localhost.localdomain (unknown [124.64.16.78])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxNuof+sxeFkI5AA--.96S2;
        Tue, 26 May 2020 19:14:44 +0800 (CST)
From:   Lichao Liu <liulichao@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Lichao Liu <liulichao@loongson.cn>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache consistency
Date:   Tue, 26 May 2020 19:14:38 +0800
Message-Id: <20200526111438.3788-1-liulichao@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9AxNuof+sxeFkI5AA--.96S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1DXw4xCr48Xr47ury5CFg_yoWxArXEkr
        srK3yfWrs5uFWUZFykArs5GFyDXFWDu347AFnrKF1YkF98Za1rGay7tFZ7Jr1UuFs09FWf
        tasxZrW8Cas2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8KwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDcTQUUUUU=
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPU_LOONGSON2EF need software to maintain cache consistency,
so modify the 'cpu_needs_post_dma_flush' function to return true
when the cpu type is CPU_LOONGSON2EF.
---
 arch/mips/mm/dma-noncoherent.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index fcea92d95d86..563c2c0d0c81 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -33,6 +33,7 @@ static inline bool cpu_needs_post_dma_flush(void)
 	case CPU_R10000:
 	case CPU_R12000:
 	case CPU_BMIPS5000:
+	case CPU_LOONGSON2EF:
 		return true;
 	default:
 		/*
-- 
2.17.1

