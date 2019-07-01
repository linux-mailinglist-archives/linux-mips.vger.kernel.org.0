Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B0B5BF9D
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 17:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbfGAPTA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 11:19:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59166 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbfGAPS7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jul 2019 11:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3Ba+Jb98yVS5mZ3n94oGXQBYD6fv7eSFwFd2YiewCW0=; b=B8zOfMOLAu59NaUvSy8QYch5Jh
        NskcwR4SmdPEjEvWY+1ydPBApZywsDWMb5u4PEb5VzW92AySwlrysI5iqPnkp3omLj25ThQsOC8OQ
        VhpVvsHnGevdZJh5uci2lEnl3+OnEZs+hB8YdhBvjqdmhe8uaZ3GTURjRS9se6y1zC6uTlifH6Duz
        jQGnrj1ElyoefePcSMTTs0ZEzU/YG5oQFbDmjs4gOMgXnfoIaInv2X4QwXyvuepYtI15agNcO8hpv
        vQQCvAGi87ceTgfl8rtDBr32iVm1vSdz7dsEndDPWwZ3k9U1ghjO+iHrZ4ion4SiXsUNgC4FwnmyB
        jV4wmmCw==;
Received: from [38.98.37.141] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hhy4q-0003zx-QI; Mon, 01 Jul 2019 15:18:46 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: don't select ARCH_HAS_PTE_SPECIAL
Date:   Mon,  1 Jul 2019 17:18:18 +0200
Message-Id: <20190701151818.32227-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701151818.32227-1-hch@lst.de>
References: <20190701151818.32227-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS doesn't really have a proper pte_special implementation, just
stubs.  It turns out they were not enough to make get_user_pages_fast
work, so drop the select.  This means get_user_pages_fast won't
actually use the fast path for non-hugepage mappings, so someone who
actually knows about mips page table management should look into
adding real pte_special support.

Fixes: eb9488e58bbc ("MIPS: use the generic get_user_pages_fast code")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b1e42f0e4ed0..7957d3457156 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -6,7 +6,6 @@ config MIPS
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
 	select ARCH_CLOCKSOURCE_DATA
 	select ARCH_HAS_ELF_RANDOMIZE
-	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_SUPPORTS_UPROBES
-- 
2.20.1

