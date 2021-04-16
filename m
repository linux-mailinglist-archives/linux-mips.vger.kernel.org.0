Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C208B361893
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 06:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238434AbhDPEKJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 00:10:09 -0400
Received: from alln-iport-8.cisco.com ([173.37.142.95]:10165 "EHLO
        alln-iport-8.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237979AbhDPEKF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Apr 2021 00:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1801; q=dns/txt; s=iport;
  t=1618546181; x=1619755781;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SQ58imMeiHXePvYFGI+pFKOj7B4LzLzc7QXDrbdED60=;
  b=UdmIFeK0YNQ7MRjgW1e6+9OMygECDstf/do3e2U2UdSFbqKFB9TAclNw
   7SacQtTh8Junbn5VedoAVAPd+GA+uXaWof1btGzUc1HcD5WUmGbJtMts2
   8KgsYolgWbq24u3uLdTQtZMZAI934TpPv6oyHE49vX09wuJ8XoElzHeW5
   U=;
X-IPAS-Result: =?us-ascii?q?A0AIAACODHlgmIsNJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF+BgEBAQsBAYN2ATkxjGekPIF8CwEBAQ80BAEBgVuCdQKBcwIlNAkOA?=
 =?us-ascii?q?gMBAQEDAgMBAQEBAQUBAQECAQYEFAEBAQEBAQEBaIVdQxYBhWsGMgFGEFFXB?=
 =?us-ascii?q?gESgnGDCKwGgiuBAYg2gUQUgSUBiGt0g3UnHIFJQoN/dIo5BIJGAYEOAZ9Mg?=
 =?us-ascii?q?X+cLYMWgSabUQ8jg06hLpUYghKhUIFUOIFbMxoIGxWDJFAZDo44jXQBWyEDL?=
 =?us-ascii?q?zgCBgoBAQMJiU6DQAEB?=
IronPort-HdrOrdr: A9a23:xoYOGKEi9RQH0BH6pLqFtZHXdLJzesId70hD6mlaQ3VuHvCwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkO0sFJqrQQWOggWVBa5464+K+VfdMg34stVQzK
 JxN5V5YeeAbmRSqebfzE2GH807wN+BmZrY4Nv263t2VwllZ+VB4m5CazqzKUF9SAlYCZdRLv
 P1jfZvnDaudW8aac62HBA+Lor+jufWn5HrawNuPXEawTSJ5AnE1JfKVzCFwxFbaD9U2LEk62
 SAqRDh/76uqevT8G6660bjq7BfmN7s0bJ4ZPCku4wyNijmjBquacBHXbCP1QpF2d2H2RINjM
 TGpQsmMoBIz07pOkuxoRfrxmDboVAT10M=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,226,1613433600"; 
   d="scan'208";a="695927056"
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 16 Apr 2021 04:09:32 +0000
Received: from zorba.cisco.com ([10.24.7.67])
        by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id 13G49OHi016753;
        Fri, 16 Apr 2021 04:09:30 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     xe-linux-external@cisco.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] scripts: insert-sys-cert: change name to insert-symbol
Date:   Thu, 15 Apr 2021 21:09:14 -0700
Message-Id: <20210416040924.2882771-4-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416040924.2882771-1-danielwa@cisco.com>
References: <20210416040924.2882771-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.67, [10.24.7.67]
X-Outbound-Node: alln-core-6.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since the tool is used to update the command line and/or
to update the certificates, I think it makes sense to
changes the name of this tool.

Update the name of the tool to better reflect it's new use.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 scripts/Makefile                               | 2 +-
 scripts/{insert-sys-cert.c => insert-symbol.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename scripts/{insert-sys-cert.c => insert-symbol.c} (99%)

diff --git a/scripts/Makefile b/scripts/Makefile
index c36106bce80e..ed6b9f8f91fa 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -13,7 +13,7 @@ hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
-hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
+hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-symbol
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
diff --git a/scripts/insert-sys-cert.c b/scripts/insert-symbol.c
similarity index 99%
rename from scripts/insert-sys-cert.c
rename to scripts/insert-symbol.c
index 77d3306cfbfb..6866e3a84974 100644
--- a/scripts/insert-sys-cert.c
+++ b/scripts/insert-symbol.c
@@ -7,7 +7,7 @@
  * This software may be used and distributed according to the terms
  * of the GNU General Public License, incorporated herein by reference.
  *
- * Usage: insert-sys-cert [-s <System.map> -b <vmlinux> -c <certfile>
+ * Usage: insert-symbol [-s <System.map> -b <vmlinux> -c <certfile>
  */
 
 #define _GNU_SOURCE
-- 
2.25.1

