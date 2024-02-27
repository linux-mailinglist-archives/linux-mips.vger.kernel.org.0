Return-Path: <linux-mips+bounces-1787-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4138694F2
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 14:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1702028DD83
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 13:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EED13DBAA;
	Tue, 27 Feb 2024 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jWOPYpMl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0498113DB92;
	Tue, 27 Feb 2024 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709042257; cv=none; b=Gad/70w6nX5uHxE3LE5z3/zRfaVvEk+zNZM4OKsDH00MT+8cQrpSGEdmw8vXSOeT2anPmd+BzMgGeMzg2iu4GMgWp7u2m/yOdPbL5VsZ7qSv5rnLFeWtfH8UEDt/TRdvSNsKRsEqY9cO3nAz5uCHwGxnRca54UhTHxGkyGv90og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709042257; c=relaxed/simple;
	bh=aQ/u2/3H2Uc5up69ifREAXUw9VOLfj4pTBmx70CtcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZbeVCyPHQu3PVxnO7MisuDQlTnbRkBCNMwAJ+eE5wYfntc4l3U3ROHAgYTJ0w4QWNjnf2I51kbwoebw3G6UJgp8LnUXU4M+ukgd4zyVnc8Pa4bzdrirKbQT3l9IXDHS1XbvD5PSYWAJ6V3Z8EHDhg7DGa669HzM6gduQL+lBx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jWOPYpMl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B654C433F1;
	Tue, 27 Feb 2024 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709042256;
	bh=aQ/u2/3H2Uc5up69ifREAXUw9VOLfj4pTBmx70CtcxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jWOPYpMltvmDQsQ6KFhp8JDN7xnZr9nG8y5SZHVBes7lScxokHWEhH4RbvB9KGOle
	 O9MtT+1pNHNBnV1mQdjGNC6eMTTn1iK9nxaZOcQyUL6HzbC9yXmfKxAxfii6yhDIt1
	 JMIYDyEV2tqxnspdqVmmEP0NRw40JjCThommyVXs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 233/299] scsi: jazz_esp: Only build if SCSI core is builtin
Date: Tue, 27 Feb 2024 14:25:44 +0100
Message-ID: <20240227131633.242826884@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131625.847743063@linuxfoundation.org>
References: <20240227131625.847743063@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 9ddf190a7df77b77817f955fdb9c2ae9d1c9c9a3 ]

JAZZ_ESP is a bool kconfig symbol that selects SCSI_SPI_ATTRS.  When
CONFIG_SCSI=m, this results in SCSI_SPI_ATTRS=m while JAZZ_ESP=y, which
causes many undefined symbol linker errors.

Fix this by only offering to build this driver when CONFIG_SCSI=y.

[mkp: JAZZ_ESP is unique in that it does not support being compiled as a
module unlike the remaining SPI SCSI HBA drivers]

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20240214055953.9612-1-rdunlap@infradead.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: James E.J. Bottomley <jejb@linux.ibm.com>
Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402112222.Gl0udKyU-lkp@intel.com/
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index 695a57d894cdd..23bce8995a557 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -1285,7 +1285,7 @@ source "drivers/scsi/arm/Kconfig"
 
 config JAZZ_ESP
 	bool "MIPS JAZZ FAS216 SCSI support"
-	depends on MACH_JAZZ && SCSI
+	depends on MACH_JAZZ && SCSI=y
 	select SCSI_SPI_ATTRS
 	help
 	  This is the driver for the onboard SCSI host adapter of MIPS Magnum
-- 
2.43.0




