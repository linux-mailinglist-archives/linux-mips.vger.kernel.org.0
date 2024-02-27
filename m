Return-Path: <linux-mips+bounces-1783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE40869455
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 14:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89981B26AD8
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287061419A0;
	Tue, 27 Feb 2024 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aXmoo5Il"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3813B2B9;
	Tue, 27 Feb 2024 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041549; cv=none; b=oCB3yjGoOwiCPbQIV8IQOqWaDjLGHVh6x21ocTMKBRoa0Ft0DfqGE8xnZcKv0qhxSr1gMT3PpaDeEdJAT/h5lPLdj3Dexz6hqSfIEwhCddPyo6rBrScOCUosDlz063/iltQR8znL6xfVR1sttU18EAELsTfNawjX+XuZ6iLJGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041549; c=relaxed/simple;
	bh=zgwKldCsW+3XSE2NZ+EPIrDZOQakt6qTyS8tEcDq6oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ignin5+qj3//1sJV97sg3w7LHt9Z7xZrvln+IYIUHFFYScZp9zurQDFU/Z1K9sZO6PQXuquaLPdC9bIFBtgjKpc50LdB5yqryKZiQ/ykZzPFVUf2vUY7jbx+gtFmWAeBRl7EE/LhappUrC8vbiXc81nSk4amUl8tu+nrvAwJk7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aXmoo5Il; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A69C433F1;
	Tue, 27 Feb 2024 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709041548;
	bh=zgwKldCsW+3XSE2NZ+EPIrDZOQakt6qTyS8tEcDq6oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aXmoo5IllGqhjr8sA3DUMukIHsvnp8HBHFnMsITlGYSy+xBrayiNxJchLeUhh84tU
	 WklvVXEYL2WCq4/ZwtjCQbeWkRy6lDjCZZSOuEyjngz9sQqIBqwq8I0/UbkNqWWL6E
	 D845N9sDQF7InHUdV5FK3hnwpjPTUngqwz2gcWyM=
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
Subject: [PATCH 4.19 43/52] scsi: jazz_esp: Only build if SCSI core is builtin
Date: Tue, 27 Feb 2024 14:26:30 +0100
Message-ID: <20240227131549.944152047@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131548.514622258@linuxfoundation.org>
References: <20240227131548.514622258@linuxfoundation.org>
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

4.19-stable review patch.  If anyone has any objections, please let me know.

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
index 6047f0284f73a..5c3635378c321 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -1252,7 +1252,7 @@ source "drivers/scsi/arm/Kconfig"
 
 config JAZZ_ESP
 	bool "MIPS JAZZ FAS216 SCSI support"
-	depends on MACH_JAZZ && SCSI
+	depends on MACH_JAZZ && SCSI=y
 	select SCSI_SPI_ATTRS
 	help
 	  This is the driver for the onboard SCSI host adapter of MIPS Magnum
-- 
2.43.0




