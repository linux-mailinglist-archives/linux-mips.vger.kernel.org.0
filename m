Return-Path: <linux-mips+bounces-13908-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CR+Dl7DwmmjlQQAu9opvQ
	(envelope-from <linux-mips+bounces-13908-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:01:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3D319914
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1D1F3034283
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 16:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A313B39DBDE;
	Tue, 24 Mar 2026 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8JWN8wR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56C37BE6B;
	Tue, 24 Mar 2026 16:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371509; cv=none; b=Fdr/D0xLF3Ja6EjiiZ7NTK97HpVX04tDKHpmgIKzxfiWqRHAFCtv1GXfuQqnjT/H9mtPmO+HPCIY/xqn4dMlaU2uR7GwIQqh+jhI4vyNGPWjMjL+eK8p+a/0ufguEVY9QpSBM0l02fYuzyBbAzPEapfKv0V/nhKJy+2PYY3Az1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371509; c=relaxed/simple;
	bh=AVKqbcBAH58YtvbtTvUhV6tMedua8892v/x7yCDldr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U0vw+pusbKAm23CIdPa0XRLwuYI67n6kbZgzsVmiXhEqcGuWkoavWEklCL3p71LYeZ03fd/ZkoW+r8OSPTPS/RwjZnPwGDaMQ5I46Oo33LsmZtgn/zZLnmYmDxX6HL2naijhTNXH+dA6E2dhh+6/crCbikcbk6kPfJ3A6EhzJDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8JWN8wR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371507; x=1805907507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AVKqbcBAH58YtvbtTvUhV6tMedua8892v/x7yCDldr8=;
  b=R8JWN8wR3mMZgajMDJfTk7tF2WeGZPt8s1lVqLa4U34eHcwFVrzd8yWD
   QP4zMpT+Le9rT6/MxT8XVQUGK34+w4hWoXnechYNxg8bS4bUzvAsYrWmy
   KSs2OjfSWlxarirO1fc3C/bHvZx6a3cy0YUJpP2VqR/vplMLTcsUAUtpY
   hvCeUGyzd3DilI58UcA7ad9s4QmK4HumRSSoh3NiHKewHTASjNgDYv4SZ
   t8AhPEMy+SOnYZxUTATVy+W4yD8/Y3XjGoT4dBC06Kg1NnuC01A91LC4m
   d4EPiD0Srp8qjgpGdZk+ZauiVmICQXoIoTqyeBlMaeskmVzNSSZ3PUaMM
   Q==;
X-CSE-ConnectionGUID: FmR9B8xUQV2VisUKgez5WA==
X-CSE-MsgGUID: tl/rrci+RRSHChXkrnOI1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86471499"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86471499"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:25 -0700
X-CSE-ConnectionGUID: aesm43ZmRSeKftw4Z5hIbQ==
X-CSE-MsgGUID: C08Qc1D5Q9Gv1bbEQjAQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224421853"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 00/10] PCI: Improve head free space usage
Date: Tue, 24 Mar 2026 18:56:23 +0200
Message-Id: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13908-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 79C3D319914
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series attempts to take advantage of free head space (the free
space before the aligned start address) in order to generally produce a
tighter packing of the resources/bridge windows.

The recent changes to the resource fitting algorithm caused resource
allocation failures in some cases where a bridge window that is sized
to be gapless could no longer be assigned. The previous algorithm left
a huge gaps which allowed it to place the remainder (non-aligning part
of the size) before the start address of used for the gapless fit,
whereas the new gapless approach always had to place the remainder
after the aligning part of the resources. There is not always space
for the remainder triggering those failures (e.g., when the aligning
part must be placed at the top of the window).

This series attempts to allow placing the remainder once again before
the aligning part, but now without leaving huge gaps to retain the
benefits of the gapless bridge windows. The approach is somewhat hacky
but should work thanks to PCI resources fundamentally consisting only
power-of-two atoms.

There maybe cases where architecture would not want to do such
relocation. This series adds the relocation to arch
pcibios_align_resource() functions to allow all of them taking
advantage of the better resource packing but if somebody objects doing
this relocation for a particular arch, I can remove it, please just let
me know (this relocation doesn't seem critical unless there are
regressions).

Ilpo Järvinen (10):
  resource: Add __resource_contains_unbound() for internal contains
    checks
  resource: Pass full extent of empty space to resource_alignf CB
  resource: Rename 'tmp' variable to 'full_avail'
  ARM/PCI: Remove unnecessary second application of align
  am68k/PCI: Remove unnecessary second application of align
  MIPS: PCI: Remove unnecessary second application of align
  parisc/PCI: Cleanup align handling
  PCI: Rename window_alignment() to pci_min_window_alignment()
  PCI: Align head space better
  PCI: Fix alignment calculation for resource size larger than align

 arch/alpha/kernel/pci.c          |  1 +
 arch/arm/kernel/bios32.c         |  9 ++++---
 arch/m68k/kernel/pcibios.c       |  8 +++++--
 arch/mips/pci/pci-generic.c      |  8 ++++---
 arch/mips/pci/pci-legacy.c       |  3 +++
 arch/parisc/kernel/pci.c         | 17 ++++++++------
 arch/powerpc/kernel/pci-common.c |  6 ++++-
 arch/s390/pci/pci.c              |  1 +
 arch/sh/drivers/pci/pci.c        |  6 ++++-
 arch/x86/pci/i386.c              |  5 +++-
 arch/xtensa/kernel/pci.c         |  3 +++
 drivers/pci/pci.h                |  3 +++
 drivers/pci/setup-bus.c          | 15 ++++++++----
 drivers/pci/setup-res.c          | 40 +++++++++++++++++++++++++++++++-
 drivers/pcmcia/rsrc_nonstatic.c  |  3 ++-
 include/linux/ioport.h           | 22 +++++++++++++++---
 include/linux/pci.h              | 12 +++++++---
 kernel/resource.c                | 33 +++++++++++++-------------
 18 files changed, 149 insertions(+), 46 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.39.5


