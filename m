Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE2723F6D3
	for <lists+linux-mips@lfdr.de>; Sat,  8 Aug 2020 09:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgHHHZS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Aug 2020 03:25:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50506 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgHHHZS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 8 Aug 2020 03:25:18 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmMVPUy5fb_4FAA--.2028S2;
        Sat, 08 Aug 2020 15:25:05 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix writecombine issue for Loongson64
Date:   Sat,  8 Aug 2020 15:25:02 +0800
Message-Id: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxmMVPUy5fb_4FAA--.2028S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyDGrW8Ww4UZFWrWF1kGrg_yoW5Zry7pF
        4SkwnxG393tr1DtFW7GF18WF98Ca1kuay8Cr15Gw17u3y3ZFW8Wr9xJr4fJrWUXrW7t3yU
        tr1kCr4qvFyYv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
        x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
        v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
        67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
        IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
        xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUqEoXUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson processors have a writecombine issue that maybe failed to
write back framebuffer used with ATI Radeon or AMD GPU at times,
after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
mapping for MIPS"), there exists some errors such as blurred screen
and lockup, and so on.

Remove the flag TTM_PL_FLAG_WC of VRAM to fix writecombine issue for
Loongson64 to work well with ATI Radeon or AMD GPU, and it has no any
influence on the other platforms.

[   60.958721] radeon 0000:03:00.0: ring 0 stalled for more than 10079msec
[   60.965315] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000112 last fence id 0x000000000000011d on ring 0)
[   60.976525] radeon 0000:03:00.0: ring 3 stalled for more than 10086msec
[   60.983156] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000374 last fence id 0x00000000000003a8 on ring 3)

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  7 +++++--
 drivers/gpu/drm/radeon/radeon_object.c     | 20 ++++++++++++++------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 5ac7b55..9f785f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -136,8 +136,11 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 
 		places[c].fpfn = 0;
 		places[c].lpfn = 0;
-		places[c].flags = TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED |
-			TTM_PL_FLAG_VRAM;
+		if (IS_ENABLED(CONFIG_MACH_LOONGSON64))
+			places[c].flags = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;
+		else
+			places[c].flags = TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED |
+					  TTM_PL_FLAG_VRAM;
 
 		if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
 			places[c].lpfn = visible_pfn;
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index f3dee01..c6cede6 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -112,15 +112,23 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 		    rbo->rdev->mc.visible_vram_size < rbo->rdev->mc.real_vram_size) {
 			rbo->placements[c].fpfn =
 				rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
-			rbo->placements[c++].flags = TTM_PL_FLAG_WC |
-						     TTM_PL_FLAG_UNCACHED |
-						     TTM_PL_FLAG_VRAM;
+			if (IS_ENABLED(CONFIG_MACH_LOONGSON64))
+				rbo->placements[c++].flags = TTM_PL_FLAG_UNCACHED |
+							     TTM_PL_FLAG_VRAM;
+			else
+				rbo->placements[c++].flags = TTM_PL_FLAG_WC |
+							     TTM_PL_FLAG_UNCACHED |
+							     TTM_PL_FLAG_VRAM;
 		}
 
 		rbo->placements[c].fpfn = 0;
-		rbo->placements[c++].flags = TTM_PL_FLAG_WC |
-					     TTM_PL_FLAG_UNCACHED |
-					     TTM_PL_FLAG_VRAM;
+		if (IS_ENABLED(CONFIG_MACH_LOONGSON64))
+			rbo->placements[c++].flags = TTM_PL_FLAG_UNCACHED |
+						     TTM_PL_FLAG_VRAM;
+		else
+			rbo->placements[c++].flags = TTM_PL_FLAG_WC |
+						     TTM_PL_FLAG_UNCACHED |
+						     TTM_PL_FLAG_VRAM;
 	}
 
 	if (domain & RADEON_GEM_DOMAIN_GTT) {
-- 
2.1.0

