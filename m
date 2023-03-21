Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F116C2F81
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjCUKuG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjCUKtl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:41 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8FA526F
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:24 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id AD3803200C5A;
        Tue, 21 Mar 2023 06:49:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 21 Mar 2023 06:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395763; x=
        1679482163; bh=sdGLXCf+dllwCokIItG43mfL3o8QXJBFWJW2HiOCXzw=; b=4
        BBP4plQCIOzlaAnJgol4wTvMMCJIRtWZAavgXqwbS/I7z5MOGXqq7JiSvsc2K+oG
        TGxKhhqaGwqNa9ecterCc5WvRdhF198XqqVLCDBUH9W7D9W5PJMeHTvCXYhXQVVE
        ybvDltpTVJnx83Kf+bKPH8fzG63KJTUhTc9wIh9FOvwk7HZ2jl96qoRf7itGG0Ar
        Tj7SHAF+bIbORFBmpnjSmWEvxf5GscNCHiDAR8+vR55Sa6dDnK7Tr/r8A3L0T52k
        ljeN3IrDSbRhviygsU4VY0h5uykIpYLtchkC4+TcMdd7c1vm7GEh8Wdzskktbxar
        0AzMrF8CCqk+MUEAp/OqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395763; x=
        1679482163; bh=sdGLXCf+dllwCokIItG43mfL3o8QXJBFWJW2HiOCXzw=; b=D
        /5WXTQERGbvFo+0Q1hodHZWHsb+qniCqqeIHo27SPTc1s5E9FoMeCYzYdNB5ARS1
        wQqfG69gliRbdwVPgpyyvegkfqD621HL0Iy1VrlpQS5TwTwmO3x2BCdhPjEBuxXU
        DNdiI6yizaUC8uA6yl0W1x/TkStZh+ES4GixIK2mI+h6GOsnKxyXCAsmOI/F4lRT
        pYi+JM6cTPdjcz2JU52AwjZWf83OaIVlW3dlpo2zjm8pgq+/T/myzqfnClbhpKdU
        2MzJyvUmrdfMo7eq9NY9ARfCw7SmwnkGlP8XFLrVcxXtitY+t13UdLNagPfeguZa
        IZcgb3vAipmJVaRbvVNtA==
X-ME-Sender: <xms:s4sZZCX4TyP1BIiVQyErCOkDbyESWs5n_z-FzsSmr0KKZqUP6kwEmg>
    <xme:s4sZZOkBEAIR7cmRE68paXs4GmO7t4gEvUbEzNBbzli6BNBDkloUuqtrlHUkWMJ78
    pI0e_-tdIwYCB8EptQ>
X-ME-Received: <xmr:s4sZZGZ-tArfuGtXy1g8ucZUoPwoyVmHh-MsgHVEYNK44u3pCwacIl9627AlacBtPlQSxI5jtXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:s4sZZJXhVPd51hnmfiT9mfIBo_ns8ALEpmdMw8b4JYFmpeoqhNKjsA>
    <xmx:s4sZZMmub_memp0-Xs9GdGrHjXyyh4tdbFnGYGD08jrVIdwQGpzHNw>
    <xmx:s4sZZOedyHv3zct2hF3HkB1RJuA5zzqr76Mx_N1kHVMm7mf-ylAKog>
    <xmx:s4sZZNCAkYFJF4sYqfNEbecS6Oxx0VBoty01UuPuHUt3nygg2EPoNA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:22 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 11/12] MIPS: Add board config for virt board
Date:   Tue, 21 Mar 2023 10:48:51 +0000
Message-Id: <20230321104852.25284-12-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
References: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Aligned with QEMU MIPS virt board.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/generic/board-virt.config | 38 +++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 arch/mips/configs/generic/board-virt.config

diff --git a/arch/mips/configs/generic/board-virt.config b/arch/mips/configs/generic/board-virt.config
new file mode 100644
index 000000000000..5594f9e5c3a8
--- /dev/null
+++ b/arch/mips/configs/generic/board-virt.config
@@ -0,0 +1,38 @@
+CONFIG_COMMON_CLK=y
+
+CONFIG_GOLDFISH=y
+CONFIG_GOLDFISH_PIC=y
+
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_HOST_GENERIC=y
+
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SYSCON_REBOOT_MODE=y
+
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_GOLDFISH=y
+
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+
+CONFIG_MTD=y
+CONFIG_MTD_CFI=y
+
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_XHCI_HCD=y
+
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
-- 
2.37.1 (Apple Git-137.1)

