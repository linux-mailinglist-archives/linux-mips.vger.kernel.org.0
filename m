Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6824C6D5C09
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbjDDJec (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234272AbjDDJe2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:28 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455BD1FF6
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:27 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B26575C00C3;
        Tue,  4 Apr 2023 05:34:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 05:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600866; x=
        1680687266; bh=Its6W+CbLvBDS+mJAyL3eMDX2XZpg0cn9LT2TPyKllM=; b=0
        GNOlquWwb8cSADnEOTFutJ7+OH5jrLsBhuYcVhBA46l9JJ1SrpEy6lrMfhtDoKeD
        3CDTGRpjAbjNdmEJNLrg/01WWwjk1n/tVfz4AX55NwR3+qlI3J4ZoqUMwNocmDxn
        gsFPewnJYP67CS07CSOoI/+xsWjX/yfFirLdSR6L9W5cVDHZWwB9RLaFD/+WtFVa
        5t9sphQDxo5zAQU+KVkCeLf0deukm1GLZbMHrWbzIPY44vG7M+zYrT/kWN5uAHdi
        aC+xUFKFz+TDzbaxWEW22QtLwb9khjpV4itr+dv4sj1cnYceRwuX9vJa8Uqj03qW
        2hpwdeWYSgoqzAWj9E3wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600866; x=
        1680687266; bh=Its6W+CbLvBDS+mJAyL3eMDX2XZpg0cn9LT2TPyKllM=; b=n
        7OGpCDm9IXzXKlkLx8sH8fRzV7xxNUrvZa6Xnmat49fHCvFIKXPBPoIFakb/2mOL
        Y83q+qgr1ngz/f8PN0PWtEgd6mDiZnTSSs6AKx6FnoJIRX3+VXaO3WPwTq7pOyN3
        3mt1PQO3lZaZC+dJhziVLPVXhicS0ZTXlfNiOaS0Xf4YzsdMNzofpu1OHAv9m263
        0G4nqWahucogs1j2Jm99h4EM4efLUOBkkGuo81pCWfs9asRiQbUSYKFbodM3UjH6
        DCgd3jA6sNvqBo6m6Ccg8c/M8R7jwZJGsVlExNF9NI6lsMGu78+TAASeX+rRD/bh
        fPTlJ+RQDvRqc2qFGISXQ==
X-ME-Sender: <xms:Iu8rZMzo06uw4pHDyFf3RKl_FfUl4wgcONzbJ_7V7rSU41QjMwOf7Q>
    <xme:Iu8rZASDZ1inc0OZT6UHD7wvwpcFjd2WLu2N3GV49B9b4K1WzGgySB9vLNz8aIcwO
    TZ7GdavT9qXXPa8-cE>
X-ME-Received: <xmr:Iu8rZOW42NoK1AiGiDz5fsKHrFelG62ZEOs_EY6MimsAdnbVm-BJaiTOLbnT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Iu8rZKjjYzL11A5EJhife1BQcWThb4SF_I0NenxKrJdS2gfvKrslLg>
    <xmx:Iu8rZOCiNP6q2hwMNJWp0C0_1lxAx6GJ3VmXc3bsiwMSKoGlcukSJw>
    <xmx:Iu8rZLI1JW53ZjtzI71ETHu8J_XZarN2OuUX7HvvZO3IKFYYJhOsuw>
    <xmx:Iu8rZB_jz1twGYlCzRLV_lVvOqeK7AC9pleI7yS1a9WkJiXkYRZOUQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:25 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 11/12] MIPS: Add board config for virt board
Date:   Tue,  4 Apr 2023 10:33:50 +0100
Message-Id: <20230404093351.4233-12-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
        UPPERCASE_50_75 autolearn=unavailable autolearn_force=no version=3.4.6
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
2.39.2 (Apple Git-143)

