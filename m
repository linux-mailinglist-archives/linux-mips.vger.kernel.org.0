Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E911B8F8B
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 13:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgDZLup (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 07:50:45 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59902 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgDZLup (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 07:50:45 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 0925920CE5;
        Sun, 26 Apr 2020 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587901844; bh=JH5fmaVAU3zVjpRZJe3S98l22Af+YjDXkuSE9/t9KHI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nq2CSnz9kzmXuDisFD3lv+o6xbKbvM5qsWLOTHxUqlSVbcVga3JA5BWa90lENTLX5
         0NNMV0r4glJaZwe6HfhvoJmANWGj7mkMxYd/BVxNTTG5aRqgcJyW5/PnM65YZo8/AD
         girea5tWjHOO8+WrvZN8O6nxPlzubhy/LQy7zFrXBcOx4VBKegCfQnP1yY1U+lVy3d
         tmj4G6COah4gLB21nb0kNUBONrKXn3yJfhsh2vYnnMyikH+jgDHWtvzqqM1XUGkHyh
         BSWrtY0fkbYhtw53WuBPTZg6aynxb833bt+/t+LWWRNMMm8UuwZtk9HVh5lBY4zTO8
         ftWbszQZBm4MQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Kitt <steve@sk2.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        John Garry <john.garry@huawei.com>,
        Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] lib: logic_pio: Introduce MMIO_LOWER_RESERVED
Date:   Sun, 26 Apr 2020 19:47:36 +0800
Message-Id: <20200426114806.1176629-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

That would allow platforms reserve some lower address in PIO MMIO range
to deal with legacy drivers with hardcoded I/O ports that can't be
managed by logic_pio.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 lib/logic_pio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/logic_pio.c b/lib/logic_pio.c
index f511a99bb389..57fff1cb7063 100644
--- a/lib/logic_pio.c
+++ b/lib/logic_pio.c
@@ -20,6 +20,10 @@
 static LIST_HEAD(io_range_list);
 static DEFINE_MUTEX(io_range_mutex);
 
+#ifndef MMIO_LOWER_RESERVED
+#define MMIO_LOWER_RESERVED	0
+#endif
+
 /* Consider a kernel general helper for this */
 #define in_range(b, first, len)        ((b) >= (first) && (b) < (first) + (len))
 
@@ -36,7 +40,7 @@ int logic_pio_register_range(struct logic_pio_hwaddr *new_range)
 	struct logic_pio_hwaddr *range;
 	resource_size_t start;
 	resource_size_t end;
-	resource_size_t mmio_end = 0;
+	resource_size_t mmio_end = MMIO_LOWER_RESERVED;
 	resource_size_t iio_sz = MMIO_UPPER_LIMIT;
 	int ret = 0;
 
-- 
2.26.0.rc2

