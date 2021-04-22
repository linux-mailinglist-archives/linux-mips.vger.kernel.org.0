Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDE836881A
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 22:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236851AbhDVUgp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 16:36:45 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:39526 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239274AbhDVUgo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 16:36:44 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 9004A92009D; Thu, 22 Apr 2021 22:36:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 8CA1292009B;
        Thu, 22 Apr 2021 22:36:08 +0200 (CEST)
Date:   Thu, 22 Apr 2021 22:36:08 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] lib/math/test_div64: Correct the spelling of
 "dividend"
In-Reply-To: <alpine.DEB.2.21.2104222124010.44318@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2104222157180.44318@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2104222124010.44318@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The word is spelt with a final "d" of course.  What a massive messup!

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 lib/math/test_div64.c |   38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

linux-div64-test-dividend.diff
Index: linux-3maxp-div64/lib/math/test_div64.c
===================================================================
--- linux-3maxp-div64.orig/lib/math/test_div64.c
+++ linux-3maxp-div64/lib/math/test_div64.c
@@ -16,7 +16,7 @@
 
 #define TEST_DIV64_N_ITER 1024
 
-static const u64 test_div64_dividents[] = {
+static const u64 test_div64_dividends[] = {
 	0x00000000ab275080,
 	0x0000000fe73c1959,
 	0x000000e54c0a74b1,
@@ -27,7 +27,7 @@ static const u64 test_div64_dividents[]
 	0x0842f488162e2284,
 	0xf66745411d8ab063,
 };
-#define SIZE_DIV64_DIVIDENTS ARRAY_SIZE(test_div64_dividents)
+#define SIZE_DIV64_DIVIDENDS ARRAY_SIZE(test_div64_dividends)
 
 #define TEST_DIV64_DIVISOR_0 0x00000009
 #define TEST_DIV64_DIVISOR_1 0x0000007c
@@ -55,7 +55,7 @@ static const u32 test_div64_divisors[] =
 static const struct {
 	u64 quotient;
 	u32 remainder;
-} test_div64_results[SIZE_DIV64_DIVISORS][SIZE_DIV64_DIVIDENTS] = {
+} test_div64_results[SIZE_DIV64_DIVISORS][SIZE_DIV64_DIVIDENDS] = {
 	{
 		{ 0x0000000013045e47, 0x00000001 },
 		{ 0x000000000161596c, 0x00000030 },
@@ -160,16 +160,16 @@ static inline bool test_div64_verify(u64
  * to do constant propagation, and `do_div' may take a different path for
  * constants, so we do want to verify that as well.
  */
-#define test_div64_one(divident, divisor, i, j) ({			\
+#define test_div64_one(dividend, divisor, i, j) ({			\
 	bool result = true;						\
 	u64 quotient;							\
 	u32 remainder;							\
 									\
-	quotient = divident;						\
+	quotient = dividend;						\
 	remainder = do_div(quotient, divisor);				\
 	if (!test_div64_verify(quotient, remainder, i, j)) {		\
 		pr_err("ERROR: %016llx / %08x => %016llx,%08x\n",	\
-		       divident, divisor, quotient, remainder);		\
+		       dividend, divisor, quotient, remainder);		\
 		pr_err("ERROR: expected value              => %016llx,%08x\n",\
 		       test_div64_results[i][j].quotient,		\
 		       test_div64_results[i][j].remainder);		\
@@ -185,31 +185,31 @@ static inline bool test_div64_verify(u64
  */
 static bool __init test_div64(void)
 {
-	u64 divident;
+	u64 dividend;
 	int i, j;
 
-	for (i = 0; i < SIZE_DIV64_DIVIDENTS; i++) {
-		divident = test_div64_dividents[i];
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_0, i, 0))
+	for (i = 0; i < SIZE_DIV64_DIVIDENDS; i++) {
+		dividend = test_div64_dividends[i];
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_0, i, 0))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_1, i, 1))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_1, i, 1))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_2, i, 2))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_2, i, 2))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_3, i, 3))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_3, i, 3))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_4, i, 4))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_4, i, 4))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_5, i, 5))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_5, i, 5))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_6, i, 6))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_6, i, 6))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_7, i, 7))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_7, i, 7))
 			return false;
-		if (!test_div64_one(divident, TEST_DIV64_DIVISOR_8, i, 8))
+		if (!test_div64_one(dividend, TEST_DIV64_DIVISOR_8, i, 8))
 			return false;
 		for (j = 0; j < SIZE_DIV64_DIVISORS; j++) {
-			if (!test_div64_one(divident, test_div64_divisors[j],
+			if (!test_div64_one(dividend, test_div64_divisors[j],
 					    i, j))
 				return false;
 		}
