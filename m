Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B6E73A574
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jun 2023 17:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjFVP4s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jun 2023 11:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjFVP4p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Jun 2023 11:56:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EAA2125;
        Thu, 22 Jun 2023 08:56:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB17C6189D;
        Thu, 22 Jun 2023 15:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E905C433C0;
        Thu, 22 Jun 2023 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687449397;
        bh=KuNfl/le8W+tk5pj4CEfMdhcf3haC1/lnKFZoEA+xQ8=;
        h=From:Date:Subject:To:Cc:From;
        b=DkEDIT4UBYHIa99zqkTxpmTrj4B/F3AK2eaeyiXA4pIt+ZstWnbGy1jV9/rFeJ3Sm
         OX0+mkZeAyml/vm0tc2UUgIqKzrc7UL9QohZBE/H8xjEZUj0pyCWOoMda1PLv2EhNe
         qGohq7oWexD1eoMC04cR0aKmyUWxc1LEip0FIAJRNvEzff3cDZRw1L+/+aDpyqbjnp
         11HDjYwel8qzRaKAqb8mkaouY1PTLcJiobdnhQSwVRzU9FJNrU/7UQJDLuMnZ0SpUD
         jBFiids4vJJx/WVOFVn9dA9rZQby1ODx+Q2ui3Rzwi8N6EYvaBOyZbG7LXseb9dEOA
         M9Rn/oS54iUMA==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Thu, 22 Jun 2023 15:56:19 +0000
Subject: [PATCH] clk: ralink: mtmips: Fix uninitialized use of ret in
 mtmips_register_{fixed,factor}_clocks()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
X-B4-Tracking: v=1; b=H4sIACJvlGQC/x2NSw6CQBAFr0J6bSfziWi8CnEBTKsvYENm+AXC3
 Z24rFpUHZQkQhI9ioOiLEgYNIO9FNR+an0LI2QmZ5w3pXP8xZg41j2047bveJ0VignZ7BLYXk0
 TjPelvd8oR8YoL2z/QfU8zx8nr3sycAAAAA==
To:     tsbogend@alpha.franken.de
Cc:     sergio.paracuellos@gmail.com, sboyd@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, trix@redhat.com,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        patches@lists.linux.dev, llvm@lists.linux.dev
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238; i=nathan@kernel.org;
 h=from:subject:message-id; bh=KuNfl/le8W+tk5pj4CEfMdhcf3haC1/lnKFZoEA+xQ8=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDClT8k3W7xfiYss4OC/2w2LP13xJWld9nMv+hl7qa1gwd
 d7iC+e7OkpZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEDP0YGeb++aLxN1z75LLv
 u16dZ5P6HXd5qv7OL96FZvv7yh/Oc33M8D/l6z7ZfA6D07JSd048mv3/kHNG2qkad4P3U//pmys
 vVeADAA==
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

Clang warns:

  drivers/clk/ralink/clk-mtmips.c:309:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    309 |         return ret;
        |                ^~~
  drivers/clk/ralink/clk-mtmips.c:285:9: note: initialize the variable 'ret' to silence this warning
    285 |         int ret, i;
        |                ^
        |                 = 0
  drivers/clk/ralink/clk-mtmips.c:359:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    359 |         return ret;
        |                ^~~
  drivers/clk/ralink/clk-mtmips.c:335:9: note: initialize the variable 'ret' to silence this warning
    335 |         int ret, i;
        |                ^
        |                 = 0
  2 errors generated.

Set ret to the return value of clk_hw_register_fixed_rate() using the
PTR_ERR() macro, which ensures ret is not used uninitialized, clearing
up the warning.

Fixes: 6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")
Closes: https://github.com/ClangBuiltLinux/linux/issues/1879
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/clk/ralink/clk-mtmips.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ralink/clk-mtmips.c b/drivers/clk/ralink/clk-mtmips.c
index 9322c6210a33..1e7991439527 100644
--- a/drivers/clk/ralink/clk-mtmips.c
+++ b/drivers/clk/ralink/clk-mtmips.c
@@ -292,6 +292,7 @@ static int mtmips_register_fixed_clocks(struct clk_hw_onecell_data *clk_data,
 						      sclk->parent, 0,
 						      sclk->rate);
 		if (IS_ERR(sclk->hw)) {
+			ret = PTR_ERR(sclk->hw);
 			pr_err("Couldn't register fixed clock %d\n", idx);
 			goto err_clk_unreg;
 		}
@@ -342,6 +343,7 @@ static int mtmips_register_factor_clocks(struct clk_hw_onecell_data *clk_data,
 						  sclk->parent, sclk->flags,
 						  sclk->mult, sclk->div);
 		if (IS_ERR(sclk->hw)) {
+			ret = PTR_ERR(sclk->hw);
 			pr_err("Couldn't register factor clock %d\n", idx);
 			goto err_clk_unreg;
 		}

---
base-commit: fd99ac5055d4705e91c73d1adba18bc71c8511a8
change-id: 20230622-mips-ralink-clk-wuninitialized-150bd0336187

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

