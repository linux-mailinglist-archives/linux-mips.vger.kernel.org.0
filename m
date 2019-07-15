Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02FC469E6C
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 23:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732683AbfGOVkn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 17:40:43 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34620 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732540AbfGOVkn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 17:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563226825; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7pXdTM0nJCK/U/d3udYCjSZFiGilJhkAIvapaAu+bs=;
        b=tYArbzcU+BsZbqywzOdgYshQPlxVtkL2u25SFcTo/S5Z/Un0vijf02p1jIKL/kBxXdaNsx
        Nr/lZXl5AsxOAPT3tdPFHuLtxbgDZ2LLXYtn4wCr6/dF7gTO2tX+2fXsc6sYiEsF4ToI79
        0cCS9s1dBiKdlBJv9YrLPLB3xXKkGpk=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/5] MIPS: Undefine PMD_ORDER for 32-bit builds
Date:   Mon, 15 Jul 2019 17:40:03 -0400
Message-Id: <20190715214003.9714-5-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-1-paul@crapouillou.net>
References: <20190715214003.9714-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

During an update long ago to conform to 4-level page code, PMD_ORDER was
changed from 0 to 1, despite the fact that a PMD table is not used at
all in a 32-bit MIPS build. PMD_ORDER does not seem to be used in these
builds. Now, it matches PUD_ORDER, a nonsense #define to give a build
failure with informative error.

The older commit that had redefined PMD_ORDER was
commit c6e8b587718c ("Update MIPS to use the 4-level pagetable code
thereby getting rid of the compacrapability headers.")

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/include/asm/pgtable-32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index b0a78c9b6434..e600570789f4 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -83,7 +83,7 @@ extern int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
 
 #define PGD_ORDER	(__PGD_ORDER >= 0 ? __PGD_ORDER : 0)
 #define PUD_ORDER	aieeee_attempt_to_allocate_pud
-#define PMD_ORDER	1
+#define PMD_ORDER	aieeee_attempt_to_allocate_pmd
 #define PTE_ORDER	0
 
 #define PTRS_PER_PGD	(USER_PTRS_PER_PGD * 2)
-- 
2.21.0.593.g511ec345e18

