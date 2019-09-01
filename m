Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3CA3A4A8A
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbfIAQYY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:24:24 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:60748 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728900AbfIAQYY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:24:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 551483FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:24:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9BpobDNYmO1z for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:24:21 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 9A9753F62D
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:24:21 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:24:21 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 090/120] macro: Extend COUNT_ARGS() from 12 to 32 arguments
Message-ID: <ae3d5b4f1f86fd3d3367398ffd0e8589e0341189.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is useful to define sysfs bit-fields, such as this one in a
forthcoming change:

SYSFS_RW_REG(smode1, smode1,
	SYSFS_DECNUM_FIELD(rc),
	SYSFS_DECNUM_FIELD(lc),
	SYSFS_DECNUM_FIELD(t1248),
	SYSFS_DECNUM_FIELD(slck),
	SYSFS_SYMBOL_FIELD(cmod, vesa, ntsc, pal),
	SYSFS_DECNUM_FIELD(ex),
	SYSFS_DECNUM_FIELD(prst),
	SYSFS_DECNUM_FIELD(sint),
	SYSFS_DECNUM_FIELD(xpck),
	SYSFS_DECNUM_FIELD(pck2),
	SYSFS_DECNUM_FIELD(spml),
	SYSFS_SYMBOL_FIELD(gcont, rgbyc, ycrcb),
	SYSFS_DECNUM_FIELD(phs),
	SYSFS_DECNUM_FIELD(pvs),
	SYSFS_DECNUM_FIELD(pehs),
	SYSFS_DECNUM_FIELD(pevs),
	SYSFS_DECNUM_FIELD(clksel),
	SYSFS_DECNUM_FIELD(nvck),
	SYSFS_DECNUM_FIELD(slck2),
	SYSFS_DECNUM_FIELD(vcksel),
	SYSFS_DECNUM_FIELD(vhp));

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 include/linux/kernel.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 4fa360a13c1e..a9d57f6ed1d3 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -954,9 +954,15 @@ static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 #define swap(a, b) \
 	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
 
-/* This counts to 12. Any more, it will return 13th argument. */
-#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _n, X...) _n
-#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+/* This counts to 32. Any more, it will return the 33rd argument. */
+#define __COUNT_ARGS(							\
+	 _0,  _1,  _2,  _3,  _4,  _5,  _6,  _7,  _8,  _9, _10,		\
+	_11, _12, _13, _14, _15, _16, _17, _18, _19, _20, _21,		\
+	_22, _23, _24, _25, _26, _27, _28, _29, _30, _31, _32, _n, X...) _n
+#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X,				\
+	32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22,			\
+	21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11,			\
+	10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0)
 
 #define __CONCAT(a, b) a ## b
 #define CONCATENATE(a, b) __CONCAT(a, b)
-- 
2.21.0

