Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 680ED6DBF82
	for <lists+linux-mips@lfdr.de>; Sun,  9 Apr 2023 12:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjDIKn2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Apr 2023 06:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjDIKn1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Apr 2023 06:43:27 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10404681
        for <linux-mips@vger.kernel.org>; Sun,  9 Apr 2023 03:43:26 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 00EF032002E2;
        Sun,  9 Apr 2023 06:43:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 09 Apr 2023 06:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1681037005; x=
        1681123405; bh=V7r1LKhTijisrmsj/fVHeC7m0VCsTE7Lg6Deu9KVD90=; b=g
        VZh9uUAp+zuqhI6mbP//sMfL4fCxRih9RkdHoLKesYwNhJDd0dodbP/a8mu0975R
        DsN6LOuSRYPklQ8SUlxNgNvD9sOSY1sll1zVz/zlIpLtKXW8pGoZmE9y/XKiD8sk
        Bzn48kJYoSzw/OsTwlct9sQyxWZYN2rYdDcgYMBVD9aBBDdi6+zHZ+g0npd1zm0b
        KE2WkWMrojD1GLJPYas6EWnctPZEz20ZBxrWtZVDOp522B//hpZhOwg3NjX1nsOe
        3J3Q8etIV8oME+D9sz4c2ru6hE1jZzrMZ0jQBmiybBWTWBXlWUMJM6T5HuFfXQqZ
        999Trn3j/ShxWasbrVaOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1681037005; x=
        1681123405; bh=V7r1LKhTijisrmsj/fVHeC7m0VCsTE7Lg6Deu9KVD90=; b=p
        rWwuNXdj+f6x22OgbEPl76OB2nvDcINEi/hSEutHilLOBz5Gw1jiwwXD1b0SSABU
        1pnlqZ4xIkQPUBHtkObv8bwt8GMSKGeYfYp+4VPozGq9evVpRtKNSHoX/W6D/JGk
        9oEOGP4pvuAVBGG6WMFefSJkQML798NH39uamK99dbYULc9PKsruXFSS7FezRc5D
        i+6bIVYR9tF5N7xU0AOOqNcPEfAp/WXy1Upy46iP30TjU9mWG6JQrDxDFy/siJA4
        MyjL5VPPFH1QGUqeC5+J1FoaNSe1cS0J9azsFShxB/eZ+evecfIxnveXTEJUg9bh
        WmXTPKv8VctNydqeWBsuw==
X-ME-Sender: <xms:zZYyZG-1uXv2_9Xppbwi86yEWEAvvJOi6Q7YEs4GXok_ss1Wpi0NtA>
    <xme:zZYyZGsWXlOfl4GioHKIkcp2Sk9BV6hbAFm9uz3MsVPXIN2il2_ldMQq4vj-OT1U8
    SFd3yJGva21aG-4yq8>
X-ME-Received: <xmr:zZYyZMAFOHNIKciZk9EO5RPRI1Ew9nP2A9h7p2rg2UZZkA19HLlt56vtyzb3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:zZYyZOde6HWrNEUHpzMTQpURwRGqKU7MXlzxlr2mWELt5CQkuhJJfw>
    <xmx:zZYyZLO2awRh2fIFJskmnyz8UxmMPT1D23uGYp9Tl4FcsozHal0s5w>
    <xmx:zZYyZIk47M9n0h_9zNK1abd1Hk4IukRh8m0BjTm_hmF6n3jYvKf8ow>
    <xmx:zZYyZAqJZ6ydhDaW1NvGgB9ElZ0X18eUuQuVA4nq0mYYvNP1QvG37w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 06:43:24 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/8] MIPS: loongson2ef: Add missing break in cs5536_isa
Date:   Sun,  9 Apr 2023 11:43:04 +0100
Message-Id: <20230409104309.13887-4-jiaxun.yang@flygoat.com>
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

Fixes build error:

arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:217:2: error:
unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
        default:
        ^
arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:217:2:
note: insert 'break;' to avoid fall-through
        default:
        ^
        break;

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson2ef/common/cs5536/cs5536_isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
index 5ad38f86ee62..d60dd9992377 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
@@ -213,7 +213,7 @@ void pci_isa_write_reg(int reg, u32 value)
 			lo |= 0x00000063;
 			_wrmsr(SB_MSR_REG(SB_ERROR), hi, lo);
 		}
-
+		break;
 	default:
 		/* ALL OTHER PCI CONFIG SPACE HEADER IS NOT IMPLEMENTED. */
 		break;
-- 
2.39.2 (Apple Git-143)

