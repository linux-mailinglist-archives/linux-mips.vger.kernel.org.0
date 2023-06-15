Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1923B731DAD
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jun 2023 18:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjFOQVn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jun 2023 12:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbjFOQV3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jun 2023 12:21:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC6D184
        for <linux-mips@vger.kernel.org>; Thu, 15 Jun 2023 09:21:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 71FC360C28
        for <linux-mips@vger.kernel.org>; Thu, 15 Jun 2023 16:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6707CC433C8;
        Thu, 15 Jun 2023 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686846087;
        bh=CMQKT8ObhlIs/9yTVJn9B5e8S9RnKJusjioFlwPJBJs=;
        h=From:Date:Subject:To:Cc:From;
        b=NsWAOQYgx7xp4t/t+WJ8we297HK1TaOr7G80WxyPwR6940xy4KQYIy0A4TRHVuemN
         P87mvubInkuwvv0q0a+Jd/NEIFFRHid+7puFtdNnpp+fuEwuIlVCFhvUAuk60NNPcD
         KiizxEq5TtOdV5O7h9kU3eEKTh7lEQe1BOOSr5nY2R1Rp4MuI5AqW7/LgLbfo9b7EO
         ktZNKIR19X4F2JaPfmYZ/yWDgjX+Wt/UMRgcH7V+4k33qhsXa8Wr0XbGJ+Jd5lS4zi
         azNrpEuZdpeJfGv1shMUzOWqmb4Mc2UkDXPSBVp4PXF4/MhH9xOXEF2zE7U1lfRRJG
         OnoYlNgPTSFIQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Thu, 15 Jun 2023 09:21:18 -0700
Subject: [PATCH] MIPS: Mark core_vpe_count() as __init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230615-mips-mark-core_vpe_count-as-init-v1-1-99c124367ea8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH06i2QC/x2NWwqDMBAAryL57kJUGqFXKUXWZFuXkge7qRTEu
 zf2cxiY2Y2SMKm5dbsR2lg5pwb9pTN+xfQi4NDYDHYYreuvELkoRJQ3+Cw0b4Vmnz+pAipw4gr
 O2uCnkUY3BdMyCyrBIpj8eoYiaiU5RRF68vf/vj+O4weQxqugiwAAAA==
To:     tsbogend@alpha.franken.de
Cc:     ndesaulniers@google.com, trix@redhat.com, jiaxun.yang@flygoat.com,
        linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=nathan@kernel.org;
 h=from:subject:message-id; bh=CMQKT8ObhlIs/9yTVJn9B5e8S9RnKJusjioFlwPJBJs=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCndVu3p3FVHExyuKgR0pDQdf2WQmXMxYpPz5bz1kWZnu
 rZ6xup3lLIwiHEwyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIkUeDAynJHT3eesr5Ao/zTw
 urBy3/993bI7pLeyTWPX2LXv5JsEXob/sXmP9uZfNP21M9vv/ukUE+YitocdfpPWy67h+VH1PkS
 JEwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 96cb8ae28c65 ("MIPS: Rework smt cmdline parameters"),
modpost complains when building with clang:

  WARNING: modpost: vmlinux.o: section mismatch in reference: core_vpe_count (section: .text) -> smp_max_threads (section: .init.data)

This warning occurs when core_vpe_count() is not inlined, as it appears
that a non-init function is referring to an init symbol. However, this
is not a problem in practice because core_vpe_count() is only called
from __init functions, cps_smp_setup() and cps_prepare_cpus().

Resolve the warning by marking core_vpe_count() as __init, as it is only
called in an init context so it can refer to init functions and symbols
and have its memory freed on boot.

Fixes: 96cb8ae28c65 ("MIPS: Rework smt cmdline parameters")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/mips/kernel/smp-cps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index bea6a13ea464..92575222713b 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -29,7 +29,7 @@ static DECLARE_BITMAP(core_power, NR_CPUS);
 
 struct core_boot_config *mips_cps_core_bootcfg;
 
-static unsigned core_vpe_count(unsigned int cluster, unsigned core)
+static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
 {
 	return min(smp_max_threads, mips_cps_numvps(cluster, core));
 }

---
base-commit: 5cad8323040bb8d47e130c10ea4dcb7175c7602a
change-id: 20230615-mips-mark-core_vpe_count-as-init-600dc73e367d

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

