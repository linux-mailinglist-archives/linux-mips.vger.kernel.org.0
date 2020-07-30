Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C8A23293A
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 02:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgG3A4t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 20:56:49 -0400
Received: from relay4.mymailcheap.com ([137.74.80.156]:37845 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgG3A4p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 20:56:45 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 0D8623F1D0;
        Thu, 30 Jul 2020 02:56:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id CFB272A90C;
        Thu, 30 Jul 2020 02:56:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596070602;
        bh=jt6CXPuxRRHbhS3TXLRcgmZiibXtcKZSRTlrq/14zrI=;
        h=From:To:Cc:Subject:Date:From;
        b=XuFHDQuc7IOKosfSbNDfcFpAYVGDt6SZ7AXF4ZehRR2PdlXArIB4tURpRgFSoRRpZ
         G/H//0mBDXsaDzn7lSIp/4CwkaeN+PKgms6wHoLRSdo1TVtZoE251STz9NULqwMMyh
         JV0YpW+ueIAHLbb92P28c/RepKGIMG8jDUrw26HQ=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ip1L72fUqe0v; Thu, 30 Jul 2020 02:56:40 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 30 Jul 2020 02:56:40 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 3948840143;
        Thu, 30 Jul 2020 00:56:39 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="WG0PFiVD";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [123.157.159.172])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id C3B0F40143;
        Thu, 30 Jul 2020 00:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596070592;
        bh=jt6CXPuxRRHbhS3TXLRcgmZiibXtcKZSRTlrq/14zrI=;
        h=From:To:Cc:Subject:Date:From;
        b=WG0PFiVDsOWJMFzQBYlGYI2nKEUfBmaOnG2heQdBJtbF9nxGw2RPx2DBGSFcXvexd
         +kEJtszEREXGdPLzif45B5dePQIGSGGcJcQkVZx9oqzuqvvvJxmsWXFKXgAGsCEe7k
         0f4oVDQfxU5otEOe6w1ZIygtPPmwaotsAJPTvT4Q=
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     robh@kernel.org, linux-kernel@vger.kernel.org,
        tsbogend@alpha.franken.de, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] of_address: Guard of_bus_pci_get_flags with CONFIG_PCI
Date:   Thu, 30 Jul 2020 08:56:14 +0800
Message-Id: <20200730005614.32302-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3948840143
X-Spamd-Result: default: False [4.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[123.157.159.172:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[6];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         MID_CONTAINS_FROM(1.00)[];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After 2f96593ecc37 ("of_address: Add bus type match for pci ranges parser"),
the last user of of_bus_pci_get_flags when CONFIG_PCI is disabled had gone.

This caused unused function warning when compiling without CONFIG_PCI.
Fix by guarding it with CONFIG_PCI.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 2f96593ecc37 ("of_address: Add bus type match for pci ranges parser")
---
 drivers/of/address.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 813936d419ad..157dc7e06077 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -101,6 +101,7 @@ static unsigned int of_bus_default_get_flags(const __be32 *addr)
 	return IORESOURCE_MEM;
 }
 
+#ifdef CONFIG_PCI
 static unsigned int of_bus_pci_get_flags(const __be32 *addr)
 {
 	unsigned int flags = 0;
@@ -123,7 +124,6 @@ static unsigned int of_bus_pci_get_flags(const __be32 *addr)
 	return flags;
 }
 
-#ifdef CONFIG_PCI
 /*
  * PCI bus specific translator
  */
-- 
2.27.0
