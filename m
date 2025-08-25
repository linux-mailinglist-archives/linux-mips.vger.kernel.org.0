Return-Path: <linux-mips+bounces-10582-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FAB34782
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 18:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5A33B31C8
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 16:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D784D289802;
	Mon, 25 Aug 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQ4JtXe6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB02367B5;
	Mon, 25 Aug 2025 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139757; cv=none; b=J5pwUrLHqUxUdfLv4+Gjafiq5Q/S47gao4DQn0dfdF3dsuhPWO5IGGZWAg5Vlb396QyV45PFVtuwiQESWuWQqJzAXtlP6OsvIcfquTHTKiFbcJnKggEWq1ZguB3Scb5mIS+b5DFq2jL+19w37xlM4DmFyHSEn2UZRphlOAyk29U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139757; c=relaxed/simple;
	bh=L2un3Tp24kq84D49bPeqtKFgx0ttvdt2Oi+LfIRW2Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+wT30xuGlRhD1VS9y4xnkmQWjuE0zeIVyTWWGRObzs+IjVYfCwmSer/69gWp3DRILELdbDdL8utUK0MA9DoswtUH1GJGSCImXcu47PZmBQUhfrVUHJQzyIB9Yj/1WdCF5n+sQzgittFyN70QyQkX+8GtMYGFUfFox/CAUA2CrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQ4JtXe6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139756; x=1787675756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L2un3Tp24kq84D49bPeqtKFgx0ttvdt2Oi+LfIRW2Jk=;
  b=aQ4JtXe64l+megZLLTslxyNO3mJqjxdtJ26XSa/vg7Ok0/CPcoWHylNS
   sy7pZklbtxpurn/BksnbsqCcROHvDk6acKNemmeoCLgviZMx9To+ysikz
   EdWm7ujPGtjUyp8MohOgTFCufJzi5KQ0cMNvOl+AzGO5N52dsnVC/dpTp
   JP2GkFp+B4U7cXsOqor3Jq6ku+sW4EGsBmdVrX1dLtNXZFulX9PA0+ZxU
   TCqaefv5XJmYMQdXjFqGC7ZsHjmSKJQCskjGAauLG/aMOV77ejuZpgaHC
   daCGL962vrAplIU/KS0uGjxyp1jnq+tEWKEflG7ocsis59TMXvx69grQ2
   g==;
X-CSE-ConnectionGUID: TonUE+BYSi2EtIOi3kn5rw==
X-CSE-MsgGUID: Lj7NOPs8TAKPfDvF5eODHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69459506"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69459506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:55 -0700
X-CSE-ConnectionGUID: orFQ8jjkTR+a1kLWJels8Q==
X-CSE-MsgGUID: l5OrMqmGT8icT6nXAJqR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169241087"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D581B94; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] floppy: A couple of cleanups
Date: Mon, 25 Aug 2025 18:32:54 +0200
Message-ID: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a few places in architecture code for the floppy driver
that may be cleaned up. Do it so.

Assumed to route via Andrew Morton's tree as floppy is basically orphaned.

Changelog v2:
- combined separate patches sent earlier into a series
- added tags (Helge, Geert)
- fixed typo in the commit message (Geert)

Andy Shevchenko (3):
  floppy: Remove unused CROSS_64KB() macro from arch/ code
  floppy: Replace custom SZ_64K constant
  floppy: Sort headers alphabetically

 arch/alpha/include/asm/floppy.h    | 19 ----------
 arch/arm/include/asm/floppy.h      |  2 --
 arch/m68k/include/asm/floppy.h     |  4 ---
 arch/mips/include/asm/floppy.h     | 15 --------
 arch/parisc/include/asm/floppy.h   | 11 +++---
 arch/powerpc/include/asm/floppy.h  |  5 ---
 arch/sparc/include/asm/floppy_32.h |  3 --
 arch/sparc/include/asm/floppy_64.h |  3 --
 arch/x86/include/asm/floppy.h      |  8 ++---
 drivers/block/floppy.c             | 56 ++++++++++++++----------------
 10 files changed, 34 insertions(+), 92 deletions(-)

-- 
2.50.1


