Return-Path: <linux-mips+bounces-963-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA783194A
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jan 2024 13:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDE1F1F23937
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jan 2024 12:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9861624218;
	Thu, 18 Jan 2024 12:40:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B992421D
	for <linux-mips@vger.kernel.org>; Thu, 18 Jan 2024 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705581637; cv=none; b=qtt2ikGbWAeHNKPLwTWaPiQpEMuzzORu62PFJJmDNnarZ2ZFlpqRiRQMpdOpQdWRr2v3mWP8gX95l3pHch+Bnr/OTcI3i5A9rNNL+laFPjRGZvM7pJ7rRYFGQtWG+HmUSAWNjFM8EWjVLWCBepmURXCHK6GkXYa8JvXju6DRf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705581637; c=relaxed/simple;
	bh=jQF1Ww9mDtm30PAS7TcOstj+f26QIIg3zHzDxQVsPaE=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam; b=iCdcUDeLZhTCnRSmCeXVVTEuY/QXaI8RAE/Ltk45rzGqADXhEhbDrkpkqw0gZV2AxBoEbKSc/+0DhtzOC/KF2GGmQ3XV3FJPmlB8PpZvNtSNatkqF2w70/uAtcqs5YCcF6qX3d/Mf0wel71Rcb/Ao1FWSLqgVBlGRkjcnGNy5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8DxdfFBHKllb6QBAA--.8210S3;
	Thu, 18 Jan 2024 20:40:33 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxF80nHKll3YgIAA--.1524S4;
	Thu, 18 Jan 2024 20:40:32 +0800 (CST)
From: Huang Pei <huangpei@loongson.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock region
Date: Thu, 18 Jan 2024 20:39:29 +0800
Message-Id: <20240118123929.369939-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240118123929.369939-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240118123929.369939-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxF80nHKll3YgIAA--.1524S4
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFy7Gr45CF48WFyDWF43twc_yoWDWrg_KF
	129wn7ur4fJFsa93y7tryfuF4avay5WayrXF17Jw1Fv34FyF9xGFWUGrs0vF17Wr40krs5
	Z3s8trWay3WIkosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jz2NtUUUUU=

Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()) reveals
that reserved memblock regions have no valid node id set, just set it
right since loongson64 firmware makes it clear in memory layout info.

This work around booting failure on 3A1000+ since commit 61167ad5fecd
("mm: pass nid to reserve_bootmem_region()) under
CONFIG_DEFERRED_STRUCT_PAGE_INIT

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/loongson64/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index f25caa6aa9d3..5bfabc67136a 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -97,6 +97,8 @@ void __init szmem(unsigned int node)
 				(u32)node_id, mem_type, &mem_start, &mem_size);
 			break;
 		}
+		/* set nid for reserved memory */
+		memblock_set_node(0, node_id << 44, &memblock.reserved, node_id);
 	}
 
 	/* Reserve vgabios if it comes from firmware */
-- 
2.30.2


