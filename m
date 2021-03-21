Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938C734346A
	for <lists+linux-mips@lfdr.de>; Sun, 21 Mar 2021 20:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhCUT4O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Mar 2021 15:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhCUTzn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Mar 2021 15:55:43 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 927ADC061574;
        Sun, 21 Mar 2021 12:55:42 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id E508892009E; Sun, 21 Mar 2021 20:55:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id DED2692009B;
        Sun, 21 Mar 2021 20:55:41 +0100 (CET)
Date:   Sun, 21 Mar 2021 20:55:41 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/2] MIPS: SiByte: Regenerate stale SWARM defconfig
In-Reply-To: <alpine.DEB.2.21.2103212028360.21463@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2103212040340.21463@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2103212028360.21463@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Options have been removed and reordered since the last update, so 
regenerate the template so as not to interfere with actual changes.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/configs/sb1250_swarm_defconfig |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

linux-swarm-defconfig-regen.diff
Index: linux-swarm-defconfig/arch/mips/configs/sb1250_swarm_defconfig
===================================================================
--- linux-swarm-defconfig.orig/arch/mips/configs/sb1250_swarm_defconfig
+++ linux-swarm-defconfig/arch/mips/configs/sb1250_swarm_defconfig
@@ -17,7 +17,6 @@ CONFIG_64BIT=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_HZ_1000=y
-CONFIG_PCI=y
 CONFIG_MIPS32_O32=y
 CONFIG_PM=y
 CONFIG_MODULES=y
@@ -34,15 +33,13 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-CONFIG_INET_XFRM_MODE_TRANSPORT=m
-CONFIG_INET_XFRM_MODE_TUNNEL=m
-CONFIG_INET_XFRM_MODE_BEET=m
 CONFIG_TCP_MD5SIG=y
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_RFKILL=m
+CONFIG_PCI=y
 CONFIG_FW_LOADER=m
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_RAM=y
@@ -88,18 +85,14 @@ CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
 CONFIG_CRYPTO_FCRYPT=m
-CONFIG_CRYPTO_KHAZAD=m
 CONFIG_CRYPTO_SALSA20=m
-CONFIG_CRYPTO_SEED=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_CRYPTO_LZO=m
