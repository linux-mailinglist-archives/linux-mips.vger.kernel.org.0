Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CD473540D
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 12:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjFSKvV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 06:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjFSKu6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 06:50:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4385EE7E;
        Mon, 19 Jun 2023 03:50:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C857F60B36;
        Mon, 19 Jun 2023 10:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1376C433C0;
        Mon, 19 Jun 2023 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687171828;
        bh=45uaUSTkyP7xeUbPTYQlXjbpq3+n6A/7C3jE7hnF+E0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dtrAFe7bqU0EkkP5ARBzdYpD1uIVJqCh41j5H1yFkbg13MBJssl5PCSGovDhhW7wL
         Wv0vcRvAbiEAg7HjyzI1ruLgmcn7HoxqNSX43Dm5RW5xQvlaFb9WERN48cplMBEuri
         K6mOA94gRiCI2SOsTn8IU7p8Qb72W3Pu3jE8b6is=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
Subject: [PATCH 6.1 164/166] MIPS: Move -Wa,-msoft-float check from as-option to cc-option
Date:   Mon, 19 Jun 2023 12:30:41 +0200
Message-ID: <20230619102202.626605616@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619102154.568541872@linuxfoundation.org>
References: <20230619102154.568541872@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Nathan Chancellor <nathan@kernel.org>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Cc: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 


