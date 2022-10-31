Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9D9613BE3
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 18:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiJaRIH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 13:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiJaRIG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 13:08:06 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A758B12AF0;
        Mon, 31 Oct 2022 10:08:04 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D4D2C5C0144;
        Mon, 31 Oct 2022 13:08:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 31 Oct 2022 13:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
         h=cc:cc:content-transfer-encoding:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1667236083; x=1667322483; bh=u7ZODrZkrV
        MqIY9SoliSOosx1CU77J/WsQSAht9zSd0=; b=HmTLeNHXy8Li1CVL6im4aiytTd
        dRyQyL70nBSX2mh/YvUbSKuuqjmeh+OeyigdzKsqhU4FMoHPkPf933EnS3KFRX5N
        U1JAf5635AxY+iYzKZ2znSx18IGRx93PmvAl/bBCWHcnep/6rj+7uT99Pdd0WuxL
        4RnMOYfiAl6GRRRChVqv6hnx/LCbx6FJ+QkSnRyjZROmFOM0crzBT38HIKWXbnQW
        DV+IxhIKAcVYvpxQLCwfUSyt/oX1IaEpX4ajx6Lb350MSbki7MMNnOnKqUvfb3gU
        NTuXb8kQY8DLTTQOnyGj06EsQ6OpTCiBocCvYIzZAMHyLduYwaKqe2Hau3hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1667236083; x=1667322483; bh=u7ZODrZkrVMqIY9SoliSOosx1CU77J/WsQS
        Aht9zSd0=; b=DU4eIHdR9xpBvrxxrdWYHwrTh/sqPHbODxYuwOdwI9DjCEFPa0s
        budxrUL5OWQb5Wnt5XauIRTqrLVAbxDIGPB/4WiwJ6cy+Px8yFPuq+F4OYp5zaFk
        neKUCfx0jg7cVfK1865UV+gAyY+aD9mJfE7NqIVD7crEfNfTLufN00oQ85qjp66J
        EjTSmt7NkxOBM/Y2dCPtnTWXAibP972OA47D6JhXANa9/8ROYLnc8WpJifwns1fV
        3zqtm9PmpIfGnSSAPcy6+/dyPJf25WSSPtcEC9mj03pOJpFl/lq4gKxKc14ouDjd
        e0k3LZ2sBMv2DlQck3UZzv5qWDYPlVmNxLg==
X-ME-Sender: <xms:8wBgY_j0aXRx4a2C3k83vWNq9V1ca6Eykr22Drur48A10EgttWAjdg>
    <xme:8wBgY8A5yu9GadmX0pt3xPjNemFN2SEe6z1c2gmdzmC2cHpvsf1lWsQFYJBGVeynm
    QwM-EvWgMIoAMVDGg>
X-ME-Received: <xmr:8wBgY_FuXX18v4EXqER3xE7qVmFA05yoBQeajy6Y75xxYunTN_11_dHasbqKQR0Q89v_d7sNf0_UPgKccyJjoib5d36brvEnJlReA4oS8kerG6Lh9Bc34d6EblJyJPbi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhohhhnucfvhhhomhhsohhnuceoghhithesjhhohhhnthhhohhm
    shhonhdrfhgrshhtmhgrihhlrdgtohhmrdgruheqnecuggftrfgrthhtvghrnhepfedvke
    evgefgkeeghedvleetieffhefgiefhlefgvdekfedvteekueeuveelheevnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhmrghilhdr
    tghomhdrrghu
X-ME-Proxy: <xmx:8wBgY8QuhNsAjW-JgU618HOvZf_V5xMQWleaKYIDVlbXmVH_S1ym2g>
    <xmx:8wBgY8zFP4p6ExVlranWm8Ou7TJD9JmPYIuEiw2iUjU57jLCNu0eXw>
    <xmx:8wBgYy4c0-l_viYMCot2o3c2gAjpH0jEPD3y1qLqkay_jGfm8fzRTw>
    <xmx:8wBgY2t7wL0jbFd_E6LC4Uq6ixWJedF9AGMiU8HbNlepSQ05iTqXyA>
Feedback-ID: ic081425d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 13:08:00 -0400 (EDT)
From:   John Thomson <git@johnthomson.fastmail.com.au>
To:     tsbogend@alpha.franken.de, keescook@chromium.org
Cc:     linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org,
        John Thomson <git@johnthomson.fastmail.com.au>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] mips: boot/compressed: use __NO_FORTIFY
Date:   Tue,  1 Nov 2022 03:07:49 +1000
Message-Id: <20221031170749.2159430-1-git@johnthomson.fastmail.com.au>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
---
v2:
fix subject typo: FORITFY->FORTIFY
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

