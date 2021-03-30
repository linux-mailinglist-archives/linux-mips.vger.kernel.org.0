Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD96834F047
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhC3R5d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:57:33 -0400
Received: from rcdn-iport-7.cisco.com ([173.37.86.78]:53935 "EHLO
        rcdn-iport-7.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbhC3R5M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1834; q=dns/txt; s=iport;
  t=1617127032; x=1618336632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+iehyumbVkfLozRt/wihMfSdEK+81ZluPnT+4IxME2U=;
  b=GfZIQwzPQTOK7JIrrYeK2vmWrNaGmJSPMuezxyRH/cQlNQy4pSK1n6Zl
   UBa/putiqTdY+kthlR/2d1KEa9Q2v1Q2Pl3ZeoLClj4cEflZuq2FYMjOa
   dt3eyBCKLfwWbwZZBNWjaaSKOQpfdg1e9F4ApsbU03b7QRAxZ3w1DBmpi
   c=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AprIAGKp9/k4nNGkSrZAhj+AaV5t2L9V00z?=
 =?us-ascii?q?AX/kB9WHVpW+aT/vrDoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SOD?=
 =?us-ascii?q?XOlWO0IOhZg7fK7CbnH0TFnNJ19aAlSKRmDc21MF4St7eY3CCdM/INhOaK67?=
 =?us-ascii?q?qpg+C29QYJcShPZ7t75wl0TiaXe3cWeCB8CZA0FIWR66N8zlLKRV0tYsu2HX?=
 =?us-ascii?q?UDVeTYzue79q7OWwIMBBIs9WC14g+A1biSKXWl9yZbey9Tx/MY/XLdlQvi6u?=
 =?us-ascii?q?GYr+ij0RPHzQbonvNrseqk7tNCAcCW4/J0FhzcziC1eY9mR7qO+Bcyre3H0i?=
 =?us-ascii?q?dSrPD85zE9Is9093TdOluQnCKo8Qzh3DEygkWSr2OlvQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ANAAAXZmNg/5ldJa1aGwEBAQEBAQE?=
 =?us-ascii?q?BBQEBARIBAQEDAwEBAYF8BgEBAQsBgiqBTAE5MYxlpBKBfAsBAQEPNAQBAYR?=
 =?us-ascii?q?QAoF6AiU0CQ4CAwEBDAEBBQEBAQIBBgRxhW6GRQYyAUYQUVcGARKFeKs0gim?=
 =?us-ascii?q?JC4FEFIElAYhjdINyJhyBSUKBRYMnijYEgkeBDoJxApB4jT6cIoMRgSObRSK?=
 =?us-ascii?q?kUi2UWp4tX4QogVQ6gVkzGggbFYMkUBkNjisWjWoBWyEDLzgCBgoBAQMJiR8?=
 =?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; 
   d="scan'208";a="865117068"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Mar 2021 17:57:11 +0000
Received: from zorba.cisco.com ([10.24.8.123])
        by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CG024502;
        Tue, 30 Mar 2021 17:57:09 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] powerpc: convert strcpy to strlcpy in prom_init
Date:   Tue, 30 Mar 2021 10:56:58 -0700
Message-Id: <0c80a08ad4cf788c75043c1615c05bad893f4fde.1617126961.git.danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-2.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There's only two users of strcpy and one is the command
line handling. The generic command line handling uses strlcpy
and it makes sense to convert this one other user to strlcpy to
keep prom_init size consistent.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/powerpc/kernel/prom_init.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index ccf77b985c8f..2c2f33155317 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -242,15 +242,6 @@ static int __init prom_strcmp(const char *cs, const char *ct)
 	return 0;
 }
 
-static char __init *prom_strcpy(char *dest, const char *src)
-{
-	char *tmp = dest;
-
-	while ((*dest++ = *src++) != '\0')
-		/* nothing */;
-	return tmp;
-}
-
 static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
 {
 	unsigned char c1, c2;
@@ -276,6 +267,20 @@ static size_t __init prom_strlen(const char *s)
 	return sc - s;
 }
 
+static size_t __init prom_strlcpy(char *dest, const char *src, size_t size)
+{
+	size_t ret = prom_strlen(src);
+
+	if (size) {
+		size_t len = (ret >= size) ? size - 1 : ret;
+
+		memcpy(dest, src, len);
+		dest[len] = '\0';
+	}
+	return ret;
+}
+
+
 static int __init prom_memcmp(const void *cs, const void *ct, size_t count)
 {
 	const unsigned char *su1, *su2;
@@ -2702,7 +2707,7 @@ static void __init flatten_device_tree(void)
 
 	/* Add "phandle" in there, we'll need it */
 	namep = make_room(&mem_start, &mem_end, 16, 1);
-	prom_strcpy(namep, "phandle");
+	prom_strlcpy(namep, "phandle", 8);
 	mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
 
 	/* Build string array */
-- 
2.25.1

