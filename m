Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3543A6DBF84
	for <lists+linux-mips@lfdr.de>; Sun,  9 Apr 2023 12:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjDIKnd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Apr 2023 06:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDIKnc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Apr 2023 06:43:32 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2C746BF
        for <linux-mips@vger.kernel.org>; Sun,  9 Apr 2023 03:43:31 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id AF47732004ED;
        Sun,  9 Apr 2023 06:43:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 09 Apr 2023 06:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1681037010; x=
        1681123410; bh=GICeuC5Na6dEOkT9RFxmFTSwUiB6wXXr5dWatVKt1SI=; b=h
        br0bEp5gHuzlgLbCg4djDpSISTNjkyhcxX2+dZ2xm34muiZdLJEz7RrIf4Yz/t+1
        yWtXWTx6ilIf4sOsXKIVzzjxB4Gk5A6KNbxv22WAj1tKRKYsocvnYLTVyP+BPccd
        RnXy3kbk7Zb/YErIikN8asz6auUOwuH2aJdShelMPk8sOaDu3rnYorp/XFtLn7HM
        j2+LiJFYTOuxrNk5gVRFKXhYOQktnkj6nU2EsdaIqKSoxo/NjTFpzy2t5IjS04rf
        gF6tNI/GfNFQxVgUIaxl62PZQaB9o/o9PP6/rR0GBXqiLuwjdG7xgvm3kx2aNtb1
        vAsDp9Ph7wohMAe354gVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1681037010; x=
        1681123410; bh=GICeuC5Na6dEOkT9RFxmFTSwUiB6wXXr5dWatVKt1SI=; b=m
        5wA77IC1LBNrO3z3FmlKzyw1EkseskgKySrLlYrlE326Q7eoZq/4buVPyMx4RSG/
        1R7lMMohuR7m4kUtJwuU1UxR2+D9ksiXqhoKqR6VzRmJ3eE4I36Aparbl/LbaQSW
        JS8Mhh+G1LoS713TG/1sOKUbR0afcPi/d5xffZxPADgEHW/7YkbLxVbDQzVpAZhJ
        CGveBOhASSmJpUTBRV9I3FjULk5pNWsbgoPZeG/COB2Zc/2jpjanIFbnMj0EqzpD
        zagRwZGMOVkLCAt3PD2L1JrgN4tcRABeYpr893auYAwK8hsgRUx9oehblqGtVNRe
        H2FZ84YEzMnamhuzVooZQ==
X-ME-Sender: <xms:0pYyZK_XZXsKsOzNTb6j-tSqJ6rq-PFrjwZQqX-QQ-reBdmbtSTw5Q>
    <xme:0pYyZKsrbumuSxruNgnlXgAO-sm0LXMtvRl7tcc_Z073uCO1YdK7izCQfKHoFc8EY
    vx0Onw0j7VOs5GjQuk>
X-ME-Received: <xmr:0pYyZACSKOL-LR7m-BytYLWk0X_R95j33D9ZWvH1ZlmVBB9S_LsZlTyywpyu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:0pYyZCeWVZvayWvdxdm_JTS4_1J7LqpGtot1HMSp5c_ovuy_qvYWxA>
    <xmx:0pYyZPO8j4LMpNFPflXdRqQ3v23iofzcRI5MgaPbgW-dh3YglXn2Lw>
    <xmx:0pYyZMlh4CW3i44wyxHHGV9poTzAfij6ZtST0Be8WyWNDZQv5J4q6g>
    <xmx:0pYyZEphZgigudbrnhebDIY58dVGyQX-1agqwIgPKsUKGWt_-VtwFQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 06:43:29 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/8] MIPS: mipsregs: Parse fp and sp register by name in parse_r
Date:   Sun,  9 Apr 2023 11:43:06 +0100
Message-Id: <20230409104309.13887-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

parse_r helper is used to parse register number from oprand,
it only handles oprand which use number to refer register before.

However compiler may use $gp and $sp to reference register 29 and
30. Handle this situation by adding relevant match name.

Fixes compilation error:
{standard input}: Assembler messages:
{standard input}:1937: Error: Unable to parse register name $fp

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mipsregs.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 9d928b952abf..7d2c1c90fa10 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1277,11 +1277,13 @@ static inline int mm_insn_16bit(u16 insn)
  */
 
 /* Match an individual register number and assign to \var */
-#define _IFC_REG(n)				\
-	".ifc	\\r, $" #n "\n\t"		\
+#define _IFC_REG_NAME(name, n)			\
+	".ifc	\\r, $" #name "\n\t"		\
 	"\\var	= " #n "\n\t"			\
 	".endif\n\t"
 
+#define _IFC_REG(n)	_IFC_REG_NAME(n, n)
+
 #define _ASM_SET_PARSE_R						\
 	".macro	parse_r var r\n\t"					\
 	"\\var	= -1\n\t"						\
@@ -1293,6 +1295,7 @@ static inline int mm_insn_16bit(u16 insn)
 	_IFC_REG(20) _IFC_REG(21) _IFC_REG(22) _IFC_REG(23)		\
 	_IFC_REG(24) _IFC_REG(25) _IFC_REG(26) _IFC_REG(27)		\
 	_IFC_REG(28) _IFC_REG(29) _IFC_REG(30) _IFC_REG(31)		\
+	_IFC_REG_NAME(sp, 29) _IFC_REG_NAME(fp, 30)			\
 	".iflt	\\var\n\t"						\
 	".error	\"Unable to parse register name \\r\"\n\t"		\
 	".endif\n\t"							\
-- 
2.39.2 (Apple Git-143)

