Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889B7D100D
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 15:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731178AbfJIN1r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 09:27:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:47498 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731430AbfJIN1b (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 09:27:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 801F2B17E;
        Wed,  9 Oct 2019 13:27:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] MIPS: SGI-IP22: set PHYS_OFFSET to memory start
Date:   Wed,  9 Oct 2019 15:27:16 +0200
Message-Id: <20191009132718.25346-6-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191009132718.25346-1-tbogendoerfer@suse.de>
References: <20191009132718.25346-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

IP22 started at physical 0x08000000. To avoid wasting memory for
page structs set PHYS_OFFSET.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/mach-ip22/spaces.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip22/spaces.h b/arch/mips/include/asm/mach-ip22/spaces.h
index 7f9fa6f66059..78d0335f5f2e 100644
--- a/arch/mips/include/asm/mach-ip22/spaces.h
+++ b/arch/mips/include/asm/mach-ip22/spaces.h
@@ -10,11 +10,10 @@
 #ifndef _ASM_MACH_IP22_SPACES_H
 #define _ASM_MACH_IP22_SPACES_H
 
+#define PHYS_OFFSET     _AC(0x08000000, UL)
 
 #ifdef CONFIG_64BIT
 
-#define PAGE_OFFSET		0xffffffff80000000UL
-
 #define CAC_BASE		0xffffffff80000000
 #define IO_BASE			0xffffffffa0000000
 #define UNCAC_BASE		0xffffffffa0000000
-- 
2.16.4

