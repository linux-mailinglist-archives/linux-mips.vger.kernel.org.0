Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B142358F6E
	for <lists+linux-mips@lfdr.de>; Thu,  8 Apr 2021 23:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhDHVtB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Apr 2021 17:49:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:43580 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDHVtB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Apr 2021 17:49:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8A0FAAF2C;
        Thu,  8 Apr 2021 21:48:48 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
Subject: [PATCH] MIPS: octeon: Add __raw_copy_[from|to|in]_user symbols
Date:   Thu,  8 Apr 2021 23:48:46 +0200
Message-Id: <20210408214846.50758-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Cavium Octeon has it's own memcpy implementation and also need the change
done in commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs").

Fixes: 04324f44cb69 ("MIPS: Remove get_fs/set_fs")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/cavium-octeon/octeon-memcpy.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-memcpy.S b/arch/mips/cavium-octeon/octeon-memcpy.S
index 0a7c9834b81c..600d018cf354 100644
--- a/arch/mips/cavium-octeon/octeon-memcpy.S
+++ b/arch/mips/cavium-octeon/octeon-memcpy.S
@@ -150,8 +150,12 @@ LEAF(memcpy)					/* a0=dst a1=src a2=len */
 EXPORT_SYMBOL(memcpy)
 	move	v0, dst				/* return value */
 __memcpy:
-FEXPORT(__copy_user)
-EXPORT_SYMBOL(__copy_user)
+FEXPORT(__raw_copy_from_user)
+EXPORT_SYMBOL(__raw_copy_from_user)
+FEXPORT(__raw_copy_to_user)
+EXPORT_SYMBOL(__raw_copy_to_user)
+FEXPORT(__raw_copy_in_user)
+EXPORT_SYMBOL(__raw_copy_in_user)
 	/*
 	 * Note: dst & src may be unaligned, len may be 0
 	 * Temps
-- 
2.29.2

