Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 364B110D2BC
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfK2IxL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:53:11 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25894 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfK2IxL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 03:53:11 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575017542; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=KBMROfByYRekKn9mQBqxvWB0j2G6dico4/BeBPn3MQ6lHJTCoigh4v8CEyfyEQ9NoH44hf6z1vNZ/c7X+3K6LoXS0iSn8cInEr9qMuiH1fxbvyOW05+oZjk5KZ8iPcEJXPd6oUvAEaDBIB/7rGmGzcm04dwXukbPEti+L60DDpQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575017542; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=2jw2edLK6aL3mkL6+0431XgLWupYHzieHeZv4eaRA0M=; 
        b=MZxMyXPsjaGyMtxpkeOfqxK5zJoRUYQoGA6f9Ar0jZkMbWrR5m2bKdZ1HDPlC0cShSM2jW9WkH1HxtyDs3tBB03hUhd/jF9GSmKo2RfLqcrujYBWs85DRE7HLz6Q1vaZoqKmFumSI+Elge+PP83+AhKAp4Qc9R87sPHnM116tuE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=i6lWgobW2Ya6wgEznpq/D8wxhMnmJxSDFPD5vKujxQGvkaAVTWzBZBF+DwMJJv90BD+qVUs8eEpT
    bDlYqoSJ388ACFVkT7t9YTZ5hUTTKqewfC/ssnsE1FIReEqwL4DJ  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575017542;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=2jw2edLK6aL3mkL6+0431XgLWupYHzieHeZv4eaRA0M=;
        b=XjWv1YltmRmvRvwptYqe8LhCLvw5xvIF8RAnbXT9Etqvx6QU89UlJAHbf995ziI4
        noNSxPbIJ2mkTKhFxX4n+sp0Z0Yt6J/qlhZPBKBKOFfovJvFwxHmSoPTd5/lUkP8zSr
        HpIaekEuDBrw5sQJKGqCbAeiL4Qoi/R6R9cLn0H8=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.146.46 [139.207.146.46]) by mx.zohomail.com
        with SMTPS id 1575017541659799.7629197379202; Fri, 29 Nov 2019 00:52:21 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v6 06/12] MIPS: CU1000: Update defconfig for pdma controller.
Date:   Fri, 29 Nov 2019 16:48:47 +0800
Message-Id: <1575017333-29020-7-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
References: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Selected pdma controller support by default.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v4:
    New patch.
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.

 arch/mips/configs/cu1000-neo_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 4fafe92..6ac51ec 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -61,6 +61,8 @@ CONFIG_GPIO_SYSFS=y
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_DMADEVICES=y
+CONFIG_DMA_JZ4780=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_NVMEM=y
 CONFIG_NVMEM_SYSFS=y
-- 
2.7.4


