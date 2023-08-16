Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA5377ECAE
	for <lists+linux-mips@lfdr.de>; Thu, 17 Aug 2023 00:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238072AbjHPWAB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Aug 2023 18:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346777AbjHPV7n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Aug 2023 17:59:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F203F2705
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 14:59:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8EEA566F89
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 21:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECC7C433C7;
        Wed, 16 Aug 2023 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692223178;
        bh=WQtNlgXm2PuVstLEtNrQIOOIlP1ZsoVmWkdg3rxZlIQ=;
        h=From:Date:Subject:To:Cc:From;
        b=CCjnYRF/fb1pyfKy2oSIkvQXB0acRzVmUmejgrEW7kLqvzL3ZRAB4+RCfzUkcNJHc
         Kr6TinPg9An70XsqWK8FTy5n46ieIM1G73MzWKdTVjy/oKiXBhU6OlSB8EU64I/VeI
         NMqqWorMO8mp0shi6f9Eu6T+WSomw72C78tv0oE4+wZnYa2kQ0hfU0r6tf587aFP7f
         0Qf8wfRszkldRTbUbOTBzwiC/ootwA6V8FQ6h1Jx5vNheCNBn8161qeDvPhQJP6F39
         aIuFDJAqBzaVacGJnirrdDncVbykfuBmqAJAMGG1iHDWzckjNXUoeWLEU43SkmzyrR
         nVOnv0CAK0gTg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 16 Aug 2023 14:59:23 -0700
Subject: [PATCH] MIPS: VDSO: Conditionally export __vdso_gettimeofday()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230816-mips-vdso-cond-export-__vdso_gettimeofday-v1-1-fe725254c782@kernel.org>
X-B4-Tracking: v=1; b=H4sIALpG3WQC/x2Nyw6DIBAAf8XsuZsANvbxK01DkF3tHgQCxNgY/
 13a48xhZofCWbjAs9sh8ypFYmigLx34jwszo1BjMMr06q4HXCQVXKlE9DEQ8pZirmjtT9mZa5W
 F40Tui71y48P4mx7oCq2XMk+y/V+v93Gc/OPaHnsAAAA=
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271; i=nathan@kernel.org;
 h=from:subject:message-id; bh=WQtNlgXm2PuVstLEtNrQIOOIlP1ZsoVmWkdg3rxZlIQ=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCl33U7WMasszIn02cbbu2X5a+4mF3dOdkOF5L4m4ZPVw
 aEMwdodpSwMYhwMsmKKLNWPVY8bGs45y3jj1CSYOaxMIEMYuDgFYCKvkxgZNky/vZ7t9C3X5wpa
 6os3VK8X3nIhoND+tV5b7+Fp569PmsjwT01Od5vr711T49VuNy7/v1cgR54r28Bj6czuVcsWnPi
 exgkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ld.lld 16.0.0 and newer defaults to '--no-undefined-version', which
causes the following error when CONFIG_MIPS_CLOCK_VSYSCALL is not set:

  ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_gettimeofday' failed: symbol not defined

Only export __vdso_gettimeofday() when it will be present in the final
object file, which clears up the error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308170532.zxFFv25c-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/mips/vdso/vdso.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index d90b65724d78..836465e3bcb8 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -94,7 +94,9 @@ VERSION
 #ifndef CONFIG_MIPS_DISABLE_VDSO
 	global:
 		__vdso_clock_gettime;
+#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
 		__vdso_gettimeofday;
+#endif
 		__vdso_clock_getres;
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 		__vdso_clock_gettime64;

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230816-mips-vdso-cond-export-__vdso_gettimeofday-30ab92c716d4

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

