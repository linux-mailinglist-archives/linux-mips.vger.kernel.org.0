Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07727306A8
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jun 2023 20:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235429AbjFNSEq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jun 2023 14:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbjFNSEo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jun 2023 14:04:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A182125;
        Wed, 14 Jun 2023 11:04:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 096FF64402;
        Wed, 14 Jun 2023 18:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF2FC433AB;
        Wed, 14 Jun 2023 18:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686765881;
        bh=SsMrL8wc7CcvmkEovviFBB5N7SShCz7j/dN3zOyZUGE=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=i0JEdFswdWdX5pFkVPJo1Dtb6LQWkcpgIMBhxe81rtgjJVzzjds8cQ1XCJ4ZNJACL
         G9nl2s+ujFi+Ge4oH0815eKkd4mI+sBMqdtappRVcrd7U9X0ihJiGspVKVgAxQD3Fx
         rYfsU4oJQdvxa6E6YPN2W79cN+B7Ulo1Jq8PgkrFPN8r/A+UE8BRUmwtkxPKuhbln8
         kB355YUXjswk5Qdq2+onfNUqWTLiNqKFiDgUWS5kh31c6RzighoSnzNbhpq0Mhf7lX
         d8NQrQMJc+cs46zJYTWoFvbXsne2jaWbV20Vtfz6/75DbIVrvyXgAjweDjjEGGAjhx
         vK6R+NPEVwQMA==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 14 Jun 2023 11:04:36 -0700
Subject: [PATCH 6.1 2/4] MIPS: Move '-Wa,-msoft-float' check from as-option
 to cc-option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-6-1-asssembler-target-llvm-17-v1-2-75605d553401@kernel.org>
References: <20230612-6-1-asssembler-target-llvm-17-v1-0-75605d553401@kernel.org>
In-Reply-To: <20230612-6-1-asssembler-target-llvm-17-v1-0-75605d553401@kernel.org>
To:     gregkh@linuxfoundation.org, sashal@kernel.org,
        ndesaulniers@google.com
Cc:     naresh.kamboju@linaro.org, stable@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689; i=nathan@kernel.org;
 h=from:subject:message-id; bh=SsMrL8wc7CcvmkEovviFBB5N7SShCz7j/dN3zOyZUGE=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCldjGZcTQHapxZYPJ/k8rDda8Heyuxj969ceJL0la9ox
 6H/l34c6ChlYRDjYJAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATUddi+Kd28kXCJFExL+v3
 8hVL+DUMDi/MCFnCtldbcf+lCNd3SUsYGY5azdzwTPqYOD+rRWPRwUWPDv0OtXcKj7buup/BmOn
 /lBcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch is for linux-6.1.y and earlier, it has no direct mainline
equivalent.

In order to backport commit d5c8d6e0fa61 ("kbuild: Update assembler
calls to use proper flags and language target") to resolve a separate
issue regarding PowerPC, the problem noticed and fixed by
commit 80a20d2f8288 ("MIPS: Always use -Wa,-msoft-float and eliminate
GAS_HAS_SET_HARDFLOAT") needs to be addressed. Unfortunately, 6.1 and
earlier do not contain commit e4412739472b ("Documentation: raise
minimum supported version of binutils to 2.25"), so it cannot be assumed
that all supported versions of GNU as have support for -msoft-float.

In order to switch from KBUILD_CFLAGS to KBUILD_AFLAGS in as-option
without consequence, move the '-Wa,-msoft-float' check to cc-option,
including '$(cflags-y)' directly to avoid the issue mentioned in
commit 80a20d2f8288 ("MIPS: Always use -Wa,-msoft-float and eliminate
GAS_HAS_SET_HARDFLOAT").

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index b296e33f8e33..de8d508f27af 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -109,7 +109,7 @@ endif
 # (specifically newer than 2.24.51.20140728) we then also need to explicitly
 # set ".set hardfloat" in all files which manipulate floating point registers.
 #
-ifneq ($(call as-option,-Wa$(comma)-msoft-float,),)
+ifneq ($(call cc-option,$(cflags-y) -Wa$(comma)-msoft-float,),)
 	cflags-y		+= -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float
 endif
 

-- 
2.41.0

