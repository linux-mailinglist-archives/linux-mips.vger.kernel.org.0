Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008D83B6705
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 18:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhF1Qy0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 12:54:26 -0400
Received: from [115.28.160.31] ([115.28.160.31]:51244 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S231918AbhF1QyZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 12:54:25 -0400
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Jun 2021 12:54:25 EDT
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 933906010F;
        Tue, 29 Jun 2021 00:46:22 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1624898782; bh=DRjzne0ItLzPQT3F0soM35/vWix/rlub43mj4Mg5ZO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wD2YDXSu0vMOwaZhE7EeYU6XBd/MouY0izvng/ribHsz72UPJMwv0kRSf3PfsGWIf
         +8ow85c7V1hTqmMYdw6mQxfCy+nJWQmPs2tqs9k9rhiqBF/KFw/pJ+d3/sadT8eKw6
         2fLZUXGfObi/u8tmdtnk8Er7w95VACoMdoYdjwcI=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Subject: [PATCH v4 4/6] MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
Date:   Tue, 29 Jun 2021 00:45:50 +0800
Message-Id: <20210628164552.1006079-5-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210628164552.1006079-1-git@xen0n.name>
References: <20210628164552.1006079-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is now supported, enable for Loongson-3 systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index f02101ff04b3..fccb6906d4b4 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -320,6 +320,7 @@ CONFIG_USB_SERIAL_OPTION=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
 CONFIG_RTC_DRV_GOLDFISH=y
+CONFIG_RTC_DRV_LS2X=y
 CONFIG_DMADEVICES=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=m
-- 
2.30.1

