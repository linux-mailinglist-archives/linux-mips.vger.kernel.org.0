Return-Path: <linux-mips+bounces-3165-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB08BFCDE
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 14:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 919802824EB
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 12:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435CA8289A;
	Wed,  8 May 2024 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGTF0dc/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F402BB03;
	Wed,  8 May 2024 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715170037; cv=none; b=gF+daDyGYnYQDGSDY8XWspLTk6Xtaw8rp14K9ENX3dbU+xr4ziPRq5+rvG9WhWpspPi18m8UixnzuzbYR/5t+ceuk9Sh1s2K4/tmmMCj/DbVFNoOQxote/4BoSKO4MekQPpsMIE+8WpQrJ2dEZyNEr4dZQ1vF7XOxmbRW8r4h2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715170037; c=relaxed/simple;
	bh=oLumnwDbwwH/DgYQvtUxMCqelOVEGJ6zPxZzNljEza4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=po0zlRYwzerarzzoh0eNzR7LYoKdkoexUnxpfeag2ejQExWpC6Bw+S47pesjWCiDYMhr+34zmMXdvCkOrlu8R9NvhjSQLtewQz+u3AM97fKJEZjdxXQe6BE6lDt1K6FJOzObuW3d+WotaMfS3GqXUU9nV5qiLBZV50lq4XsLsTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGTF0dc/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715170036; x=1746706036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oLumnwDbwwH/DgYQvtUxMCqelOVEGJ6zPxZzNljEza4=;
  b=IGTF0dc/lwALvvkLkUQSmIPzReT77Prz3fqUMAa5r/l0LTgpxzeJtCiL
   eFnZovcY85gkBfAmp3gv/0uRD446bXMjBCgLYL2UWLlkeBNfisOxUZ2Ri
   Zu7TliaB3Hf1B2En2gOlo3df6xW8Py3ZLaCHBqItwRyVLxD4H4Lke7/1v
   wSXi13eIuGrsffwbanpQutKx5MxBDdM0HSdBHRWgjEy/tD/HexfdQIhmo
   GeSYLKoQjv/55YRbwLeq6Egvv1ZW+AzzLOxdm5eKcl/QLmLbpsMAqqwAe
   zzarX5o5uxSMbkFd7EKzl28gnLNAg+Fk4sd0yUkLx5hLfCXmCGia2CX/J
   A==;
X-CSE-ConnectionGUID: PkxSGgDAQ9COPgekeQOkmA==
X-CSE-MsgGUID: Ted4Fyc5QFWMPwdnTDElGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33530982"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33530982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 05:07:13 -0700
X-CSE-ConnectionGUID: Z5OOjc3ySoCSsHlBtrQ5pw==
X-CSE-MsgGUID: PXHDStR+RCaH82laAJE0gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33702558"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.80])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 05:07:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Florian Fainelli <florian.fainelli@telecomint.eu>,
	Ralf Baechle <ralf@linux-mips.org>,
	Phil Sutter <n0-1@freewrt.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/1] MIPS: Routerboard 532: Fix vendor retry check code
Date: Wed,  8 May 2024 15:07:00 +0300
Message-Id: <20240508120700.51374-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

read_config_dword() contains strange condition checking ret for a
number of values. The ret variable, however, is always zero because
config_access() never returns anything else. Thus, the retry is always
taken until number of tries is exceeded.

The code looks like it wants to check *val instead of ret to see if the
read gave an error response.

Fixes: 73b4390fb234 ("[MIPS] Routerboard 532: Support for base system")
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
--

IMPORTANT NOTE TO MAINTAINER:

This change has potential of breaking something and I don't have HW to
test this with. I only came across it while going through all PCIBIOS_*
call chains. Clearly the current code non-sensical so something is not
right but whether this is the right way to solve the problem, I'm not
entirely sure because it will make small change into the behavior.
---
 arch/mips/pci/ops-rc32434.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/pci/ops-rc32434.c b/arch/mips/pci/ops-rc32434.c
index 874ed6df9768..34b9323bdabb 100644
--- a/arch/mips/pci/ops-rc32434.c
+++ b/arch/mips/pci/ops-rc32434.c
@@ -112,8 +112,8 @@ static int read_config_dword(struct pci_bus *bus, unsigned int devfn,
 	 * gives them time to settle
 	 */
 	if (where == PCI_VENDOR_ID) {
-		if (ret == 0xffffffff || ret == 0x00000000 ||
-		    ret == 0x0000ffff || ret == 0xffff0000) {
+		if (*val == 0xffffffff || *val == 0x00000000 ||
+		    *val == 0x0000ffff || *val == 0xffff0000) {
 			if (delay > 4)
 				return 0;
 			delay *= 2;
-- 
2.39.2


