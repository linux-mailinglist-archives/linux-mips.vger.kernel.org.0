Return-Path: <linux-mips+bounces-1794-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E086980B
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 15:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 557CFB2D7FF
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 14:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4956F145341;
	Tue, 27 Feb 2024 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PMANkhtQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0CF145339;
	Tue, 27 Feb 2024 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709043887; cv=none; b=SHIpZszL2tifcZIY+4mz/rtU0N3d5U2yx3rbSUr35xvSeiMDKfaNyy3Ufz/ymX/D3ATIn5bWtlB9BzVdRrHnGMLUWEZJL7+02gI6HKlgLl/HkFdqydGZNLLR6XRa7x6w7ZZwNSv7MOK2n+GDfbjU3oBWpDFwvDEK2rVjDOenDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709043887; c=relaxed/simple;
	bh=DCqJMQ7xrttugh9SJCioyCWUWhkVuGpEROc6wsdqI0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+dlZWf6aEBVqlR5M+eujuTRt13WzxCa8EyFlWtfdlmiakGb9MUNjIvyVU+p7QN1aAOqfgziBY6wyQikxL3B/onRkCWiwZxvviN3s4QZX0+TDktpHvx8DMWc3UIFxxVoM1iOmfiM3LID1qhX/KDBNVWkY+bP445Yt3g3UTayAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PMANkhtQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E87CC43399;
	Tue, 27 Feb 2024 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709043887;
	bh=DCqJMQ7xrttugh9SJCioyCWUWhkVuGpEROc6wsdqI0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PMANkhtQZPsPe3GnC0Ie1FufglSA7nqGp6bUdhO9ftS9DhDZax5PRqWdiJF7QxLJU
	 p4Qc1ERR2R5+LWYubEPCdS+JCIz0A++f6V8PERnoNlFHZk2Cn3mBXKI86hKWuVD0oI
	 bL3RDopB98dwRhMxHc2DtE8I8Hfrk1e5lGy85xb4=
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
Subject: [PATCH 5.4 69/84] scsi: jazz_esp: Only build if SCSI core is builtin
Date: Tue, 27 Feb 2024 14:27:36 +0100
Message-ID: <20240227131555.116557092@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131552.864701583@linuxfoundation.org>
References: <20240227131552.864701583@linuxfoundation.org>
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

5.4-stable review patch.  If anyone has any objections, please let me know.

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
index 51bbc858a944c..cab6e67ea606b 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -1286,7 +1286,7 @@ source "drivers/scsi/arm/Kconfig"
 
 config JAZZ_ESP
 	bool "MIPS JAZZ FAS216 SCSI support"
-	depends on MACH_JAZZ && SCSI
+	depends on MACH_JAZZ && SCSI=y
 	select SCSI_SPI_ATTRS
 	help
 	  This is the driver for the onboard SCSI host adapter of MIPS Magnum
-- 
2.43.0




