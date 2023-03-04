Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660756AACEF
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCDWPs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjCDWPs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:48 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C9512F22
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:47 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 8FC845C00A3;
        Sat,  4 Mar 2023 17:15:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 04 Mar 2023 17:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968146; x=
        1678054546; bh=qGsv5yUkSW6MX9yok3pt0irLh7crnCuHDSfbz/DmeoQ=; b=g
        U0KwHeZmGe7DK6vEyBeFOPWbn7u4Ic50UI0Q2imeZoX5hu2gUHPXGt9O30gdedp5
        qt0sxZLUPtIzaoBsu5WIxd9rURxtFTuWigP8o8TwX2l+dDc89GtrELQnWh0RLmEm
        UJ7aDdIAc+hlcNzSlLNyDK+nQXvm+osuA/c5NwGtdraMv6Zkv6zxClICYigJzv7V
        IurApDSzX77g0dH3poCoAi/prTQFpHRWieTfI7zQePoPZuwNMT9CRjcQfHr4PmtC
        YjCerII+DQGZDyaOXb0Rqwqn6/IWhwKtvVhqWe69CuBxHnQM0Q4KWBtyCMl8MMyT
        rfZd7ojNRRaTPqQlJh12g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968146; x=
        1678054546; bh=qGsv5yUkSW6MX9yok3pt0irLh7crnCuHDSfbz/DmeoQ=; b=V
        LT2yJxyB3r+aInf9EZQnsittLTpr+YAQA2MFbh74DDMB5UArmsPov8StH1BMzS6Y
        /UrCqkm4YrEK+j544oWywvc4NivloU82Xfnc7DsTlCa2ZlK+QBfBjk5FWy2/k/4r
        1iRoGtet1igm0wGn76IISwCuf3FRRJJ//CEF15e2UGGgI1AaRQgNKvFBomd4qHiZ
        9FEvOBbbNZ+FHpuOjk14KCYxkw8FOxA7C/kYHUI/RDlDu2D5bicWLCAIKDfLYBpb
        y00UEt60Up2iZgORVG8T+zd6rziafsWQcF0y/11T/pbPSCDjMoMbp74M423AeVUA
        WB8TLZwO7IBi6Dg+NGjPQ==
X-ME-Sender: <xms:EsMDZIge5FYZJ1mYLTA1lRNoWU0k1Pg6QrgFT-yl8lEgBEkRQ5VD_w>
    <xme:EsMDZBBM5U8v7Esm5VK6rEnHHiEXJGW-WnIWVbH8oli-rw5r8ypJSFAbT96W1aFk_
    e8so5lfdmlwelaa1Z0>
X-ME-Received: <xmr:EsMDZAEbGP1MgITOeRgq-Xa1Zd4dP52fO5soPsLlUN51X5MfXgyxhEqB5o__>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:EsMDZJTRVXNS-lrHBiDnJcbSULuFBZ4YhdTG_BsukbC9w7DFYVq6RA>
    <xmx:EsMDZFz4iP7QtWBGoiv1X0zRaFMtwuFEUjMpJEAP2GeG37By_Imp3g>
    <xmx:EsMDZH4DK63jPae5KECx2vuegak-3g_b0QVqXwSBx5F8jcE1r2CpeQ>
    <xmx:EsMDZA81AKjKEd8-KAH_bC2cXoepHsK_brtA_NxqW3eCqgMigX1-zg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:45 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 11/12] MIPS: Add board config for virt board
Date:   Sat,  4 Mar 2023 22:15:23 +0000
Message-Id: <20230304221524.47160-12-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.6
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
2.34.1

