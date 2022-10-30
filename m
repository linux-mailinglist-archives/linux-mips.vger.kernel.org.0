Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6CF0612C4E
	for <lists+linux-mips@lfdr.de>; Sun, 30 Oct 2022 19:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiJ3ShI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Oct 2022 14:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiJ3ShH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Oct 2022 14:37:07 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447177662;
        Sun, 30 Oct 2022 11:37:05 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id DA7DF5C0098;
        Sun, 30 Oct 2022 14:37:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 30 Oct 2022 14:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
         h=cc:cc:content-transfer-encoding:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1667155022; x=1667241422; bh=8PcKdqsexw
        gr7i+zRhie4DX39kN0m6JW6gwmYGL3cxI=; b=RwmNTL9XOHBRtRYrIU9HgM8/ZU
        V8HEmhbKBIqJKiHZl7UBde10qoOS63iWEzb57AMH3W2sJwmPZAm5S20gUqC77APw
        UOpYqvoo1y14bGKcICBbIUQ+3aZnaTGIvDcU0l6KwX/GaJNlRZWftcFL/WPX/hov
        df9HAGFTmpyif3BuwwLPA2/iGxKrEZMEgnEcOpIubfYqQO5gNAZu8cjS1n+B6jzZ
        uxPenYjWLnTOXSQvpE1g7ZKJbT7HCP/ZBfbjS9nfUpxVicwbN+8TXEEle1uBwgUz
        EwJId3OM5n23mG+1f22eQ8RjqhQjTsXxQKq5aRCCeUIpeWx6jMk6whgs3IQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1667155022; x=1667241422; bh=8PcKdqsexwgr7i+zRhie4DX39kN0m6JW6gw
        mYGL3cxI=; b=hwgW0G81MqwrMQLFFDxMlM1stpONy4970bScLjFWhWkjOVzR0nK
        cp7gsgFTIbeiaSEZHv48du/yEc4omW3LDBOUOICj+orNBeZlSq71CoJN/dvg9ca4
        ACo8r5lRIJ3yBbY7WLjT1dKZCmXEvZMwQQXfRc3X+19qT+wjc5nXA5aCv66qLXMB
        AZ1R7BbFIxiMVvAsQc4BRjHYs/UceKOQ2FnHLaNwH1AatMb3oDjvWS0fHaqFw71s
        bka3tWqKX0Hjm2UQPiRrK0osxhts8neE7Oju0/eZMoaTMH1XebkjKfnGJbkhBJEp
        LQDmLdFTqS9q2m3Poa47QEybfzF8C6eCd5A==
X-ME-Sender: <xms:TsReY7pEXOdlcLDFmk9BZhbphg9cfXMuWSSW3bA5QBrab3YcHBWdPA>
    <xme:TsReY1p7dlfGPovJvxMiJMvOA7Y6qyHBPU1SXJ09cWp8KE91-fsiv2AOa3dhR6YUg
    VSaxz_P8U_buoHrsw>
X-ME-Received: <xmr:TsReY4O5nWpRogJj_zqQbqanuz1K0Yu8sFT11CQCGzdNJb-WsRUOIaW-4hUxZWd1ew06u6wQGjcWVd19iws-PqhAVv9q0WI1Q2V5q7DwnE1pLQJbHfRELiFMvHtyacdD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedruddtgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflohhhnhcuvfhhohhmshhonhcuoehgihhtsehjohhhnhhthhho
    mhhsohhnrdhfrghsthhmrghilhdrtghomhdrrghuqeenucggtffrrghtthgvrhhnpeefvd
    ekveeggfekgeehvdelteeiffehgfeihfelgfdvkeefvdetkeeuueevleehveenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepghhithesjhhohhhnthhhohhmshhonhdrfhgrshhtmhgrihhl
    rdgtohhmrdgruh
X-ME-Proxy: <xmx:TsReY-4ae_2DjrzRz41-KjzRN_xvqJOEGzcw_JEeBJ4z_KFmGnOLWA>
    <xmx:TsReY64PSPscKVj-joJDjXSdvMWV4iI4Y-aa2g89TLG0qPmEF3bJRg>
    <xmx:TsReY2idE5W7vuh5FQjxEpjlZtVIzlBQKpOVgyLA_XWHDLkI2TZ_Ww>
    <xmx:TsReY11hlaNGfHdJAuiY4QLBI7QehEt79a3QbhkEdiv_BDF4suphhw>
Feedback-ID: ic081425d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Oct 2022 14:37:00 -0400 (EDT)
From:   John Thomson <git@johnthomson.fastmail.com.au>
To:     tsbogend@alpha.franken.de, keescook@chromium.org
Cc:     linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org,
        John Thomson <git@johnthomson.fastmail.com.au>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] mips: boot/compressed: use __NO_FORITFY
Date:   Mon, 31 Oct 2022 04:36:47 +1000
Message-Id: <20221030183647.3371915-1-git@johnthomson.fastmail.com.au>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the mips CONFIG_SYS_SUPPORTS_ZBOOT kernel, fix the compile error
when using CONFIG_FORTIFY_SOURCE=y

LD      vmlinuz
mipsel-openwrt-linux-musl-ld: arch/mips/boot/compressed/decompress.o: in
function `decompress_kernel':
./include/linux/decompress/mm.h:(.text.decompress_kernel+0x177c):
undefined reference to `warn_slowpath_fmt'

kernel test robot helped identify this as related to fortify. The error
appeared with commit 54d9469bc515 ("fortify: Add run-time WARN for
cross-field memcpy()")
Link: https://lore.kernel.org/r/202209161144.x9xSqNQZ-lkp@intel.com/

Resolve this in the same style as commit cfecea6ead5f ("lib/string:
Move helper functions out of string.c")

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 54d9469bc515 ("fortify: Add run-time WARN for cross-field memcpy()")
Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
---
not sure about the fixes tag:
compile error only occurs due to the fortify commit, but it looks like
this change could have been part of the other commit identified in the
message: lib/string move helper functions?
---
 arch/mips/boot/compressed/decompress.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index 5b38a802e101..c5dd415254d3 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -9,6 +9,7 @@
 
 #define DISABLE_BRANCH_PROFILING
 
+#define __NO_FORTIFY
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
-- 
2.37.2

