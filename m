Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056CD6D5C0A
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbjDDJed (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234280AbjDDJe3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:29 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853481FE0
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:28 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id F3EAE5C00C4;
        Tue,  4 Apr 2023 05:34:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 05:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600867; x=
        1680687267; bh=vgOYpjl+y+mJJ4+e5uA4cDGg6lkmAkP+j89TqyNgwUA=; b=x
        rfbtGNHoKGpzaPQP/MQr1KS0UlW5hKskqy6tg1cDt3ON+boANbTk4/zk0ytOwRso
        jsSeWI+MSFPW0PuGYjh12bZu1I74fLgUDEudTlsVzxXsuKrFhG7vDsOww51rUrOT
        K6ko0U9grHOE+nolh7+PngSqCmEecmB3PRTikuWMuOVJxWiNp2oMHfhmVwgegpgV
        QretCDLjxj9GDVPMj9AfIk3FJ75gCacBE2H5jJBCZt+SebgrcdCEg8G/UxP22Eg2
        Bj62FroIgCiXrCotP7b3k3y7aD7zcRNUsWgaHoDR6E9FIKZdV/jy7NBP/CjPw+pg
        Wh2HktcloL8YBTNXkekDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600867; x=
        1680687267; bh=vgOYpjl+y+mJJ4+e5uA4cDGg6lkmAkP+j89TqyNgwUA=; b=R
        mFtAhOmMMqIqthB+7BIGfFtzNMsS2jOqlw5WBVfcG4qIwzKu9aporFrmk+6L1KDC
        PfUC0oePjd8F3CEw2fyXBX0rV14Kw3bM1U/adNfKb7xZPEI1zfONBR6Pb7MmjZDQ
        wl06HyAaZFhb+ujh9AFdhozaiZ/yNwrclVTDDfriJNeDzwu39ZwnnmaZNcSdfPKZ
        JYT1Qw2C1G4525HMRDsMDBb+sOoG73Fdw9dLQTaFBmS/m4+aIAoPWISDBdJb2kSm
        vVZgPzW+jMoj0nMpSExU8H2SqpqFEPt1d3p3GRyAP+tNSwb00DPkPxdTfx7XgcBA
        2KajWhRArb+p/6MHInnkA==
X-ME-Sender: <xms:I-8rZN7JkqH1GeQazO9WaVw4NKgALit140gKmgX8R9KzGMa1DhvdRg>
    <xme:I-8rZK6De5ErqHFdR5gKDuWVQfbdq_uPD7_OPV1-T6Mu6XimgIXLFzFfu_V_x_Ay6
    uReUOApJmxd--TvaAo>
X-ME-Received: <xmr:I-8rZEe9rSmlXu_Al9BjB_-6dlVelcIrhIgVsHf26BEcqg1YevUNOGdAC1My>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:I-8rZGLNXitLYBr2EO27dGbAPQsM41L8xfhQYhKJri8WZ9x56IP6Cg>
    <xmx:I-8rZBJDfzIEsRHoYYt7PEdo6dMgRL8wkyAxNhR8rwKHbHbPsQ1OjQ>
    <xmx:I-8rZPxW8MdzZlcRu4A1dme2zi_4jr6l9Kr8W3-iAP5v_7LrY20kMw>
    <xmx:I-8rZOFZlesx4mtiG0aH2CcEWliQD4pvhewYG9HggxcZl3b7HhoONw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:26 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 12/12] MIPS: generic: Enable all CPUs supported by virt board in Kconfig
Date:   Tue,  4 Apr 2023 10:33:51 +0100
Message-Id: <20230404093351.4233-13-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable extra CPUs that may be supported by virt board, including
R4x00 (R4000 in QEMU), Cavium Octeon (Octeon68XX in QEMU), loongson2e,
loongson2f.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 940ade1c9449..53160d49387c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -155,12 +155,16 @@ config MIPS_GENERIC_KERNEL
 	select PCI_DRIVERS_GENERIC
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
+	select SYS_HAS_CPU_CAVIUM_OCTEON
+	select SYS_HAS_CPU_LOONGSON2E
+	select SYS_HAS_CPU_LOONGSON2F
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_CPU_MIPS32_R6
 	select SYS_HAS_CPU_MIPS64_R1
 	select SYS_HAS_CPU_MIPS64_R2
 	select SYS_HAS_CPU_MIPS64_R6
+	select SYS_HAS_CPU_R4X00
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
-- 
2.39.2 (Apple Git-143)

