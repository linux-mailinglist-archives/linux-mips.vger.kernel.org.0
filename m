Return-Path: <linux-mips+bounces-8428-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFCA7A79F
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 18:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6D916C92F
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 16:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2B22512C0;
	Thu,  3 Apr 2025 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XMawi/yb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0024EF7B
	for <linux-mips@vger.kernel.org>; Thu,  3 Apr 2025 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696715; cv=none; b=JiYgIwP9o2U1nJO8p7jbVkNHjw/lBjZmReIXA+CqkpajLzixjYI9sT8efkFTckWapJkQ4ciYX5zJn8O8wn3/prbnFF+tQmo4bFtJXaPKe44uafPbps9jAVmmx69oMtDW6x3CefvYvEwMhFPvmfji2w8bDMplW3Ok3nDF5ZTJA0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696715; c=relaxed/simple;
	bh=lGyfO4gIma4Oj5qkfJ57pkYMWl5NBVmzYdOeV93jPgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N8mXiHLIoTbMkyT7x2qOEnj8f67OoIzOVNPEukpHZYtU0p6nNlNrMTmsQRkE4kRkJ40RH+zhMOTOrK/mpSbsdL+palY+cDJ94P0TGlN6qWm08ExMPcYVAePUzAP/xwesA72rXpX/3G/e3QiLmHHP7ROWRsrg7oXKa00zWadSxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XMawi/yb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso708874f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 03 Apr 2025 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743696711; x=1744301511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbCA5EnpK3GbHkhltbHt5Uy2DViRFKY5hJRw/vEZruk=;
        b=XMawi/ybsbVCNXJ9Tmklux+k2OA7KtSmykmV6QkLrA4pXX/CRnTceA3QUrrhkLyM3p
         ubFb5PhLFRMJoR0aEz5uxS/RApAbmhf1aV4cEvYGTbI8G02BtDNWHangNdkKZSudHl8V
         wV+rsgkz5iPDm71x8O7SQO3DIpCmQABU5ilV+cYktldjRJipqKj6MnzGRNKbpMT/YwaE
         yE3WpVk2KBHzj9rwM6iBtLLd20mxMK66jJXdT8WCHs52YLskNK7veVEtWhQhxGcErKAV
         +T22SyqwGkkXKYQ0HUbX4qBO8IXliYwXJmijpcjDtck0kHYdQb+YabaQJfpMmWaG8CrK
         e3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696711; x=1744301511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbCA5EnpK3GbHkhltbHt5Uy2DViRFKY5hJRw/vEZruk=;
        b=mX8fCMOiNvU1/vsoUokp1kaqw/Sb3IyjwCNA1qvIrIV1OAp7MCUBPt6XBRi6ym3w61
         Fj6e+DZAk2FDPKgsRWqEMJ46sh7rpa0IkQrQaukkp2j3c7T/4gPnYdjhJ+4DzevepLRa
         oUWIOmRPY7EfxrmsqfDpb77VV27PUI8IKrQENE4p0Ipw0eIraxsKluls3+FUfPxPLpir
         /scsVpHRxuXSyMBTkZoif2mhod7avdRPUTh8fWR3mJgGJ31x8d7Dz9WNCH3g78yQvS/Z
         0wZFV8n/QoCtvYRiIAkjIc+eL0FiU/jCVmNxJW+ZdNWUQf002X5RdK2En+uBOGhwjTJB
         WHlg==
X-Gm-Message-State: AOJu0Yz4AYF4A1QCRDIrGym1x8HIk4vayvRUqC9EV4xx0Noa+EfNUMgB
	c9ScxnOSBsmGwjbBdalf01DmWHQZyIifMCZreuJ7ZrAbjywoiBXyCfRvyJtzcB6BDNQ/q81AH3B
	i
X-Gm-Gg: ASbGncvhLDN0W+HiyORoQztOlpFilcTkM3FvTZQvsPxOYJUmL7H3mT9v1vJ9Pi0eDzY
	xEsvktuPeXhDtIMU3V3E9qdcRiGntRDNqkYfyb25LZqz6wUUP9ALlt3zStr5QivkQNvLnCiwNPu
	/E2thseDJ5WvBY3td+g7LWDTXGN5VWxny91xqAE8JeZWU/1I9kCTrqQ7nUaYU0DkkGtfSal+FV0
	PnJxkwLvg6P81A822mNf6DPxiSAddnS8/uHS5hiORF4FlvBo2F+myowj8C/Ytj8OvS5W4dfBRHU
	NqDqUVwkPPWmg2wKJ5cqOZxFfTZJYvcph91CYO11wEqX+xYI108yhW69qN1QqNK0Xz4=
X-Google-Smtp-Source: AGHT+IHk+rY+9t42v3FHXm37pqM5VS3PNMNXgS/IMHtIz8wnmpMjaYHaz+yWJEDXmcQ9h3GclT0Xag==
X-Received: by 2002:a05:6000:2288:b0:39c:1f04:bb4a with SMTP id ffacd0b85a97d-39c30321ed2mr2783967f8f.10.1743696710942;
        Thu, 03 Apr 2025 09:11:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226acfsm2112383f8f.88.2025.04.03.09.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:11:50 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v7 0/2] MIPS: Fix idle VS timer enqueue
Date: Thu,  3 Apr 2025 18:11:41 +0200
Message-ID: <20250403161143.361461-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aims to fix idle routine while the CPU receive an interrupt,
because __r4k_wait() only checks if TIF_NEED_RESCHED is set before
going to sleep.
The same behavior has been changed in LoongArch [1].

Code (cross) compiled successfully and I manage to test it on a VM
emulating a malta board. I ran QEMU with:

qemu-system-mips64el -M malta -m 2G -kernel vmlinux -serial stdio -drive \
file=rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -cpu 5Kc

rootfs generated using buildroot (malta default configuration).

- [1] https://github.com/chenhuacai/linux/commit/a8aa673ea46c03b3f62992ffa4ffe810ac84f6e3

---
Changes in v7:
 - patch 2 to handle __r4k_wait() moved to .cpuidle.text section
 - removed .noreorder section from __r4k_wait()
 - idle region of 32-bytes
 - removed C wrapper r4k_wait() and renamed __r4k_wait() to r4k_wait()
 - changes discussed in:
    https://lore.kernel.org/lkml/20250315194002.13778-1-marco.crivellari@suse.com/T/#m07f2568d9099101637063bd057a497ceb846be3d

Changes in v6:
 - typo in comment, capitalise sentences and full stops

Changes in v5:
 - comment: idle interrupt region, instead of rollback region

Changes in v4:
 - comments: 36 byte region

Changes in v3:
 - changed "daddiu k0, 1" with PTR_ADDIU k0, 5
 - replaced CONFIG_CPU_MICROMIPS with 3 _ssnop followed by _ehb
 - integrated the commit message with explanation about
   CONFIG_CPU_MICROMIPS replacement

Changes in v2:
 - Changes introduced by Huacai:
    https://lore.kernel.org/linux-mips/20250214105047.150835-1-marco.crivellari@suse.com/T/#m75d9c587829e15e0d7baec13078be4e65c936408

Marco Crivellari (2):
  MIPS: Fix idle VS timer enqueue
  MIPS: Move __r4k_wait() to .cpuidle.text section

 arch/mips/include/asm/idle.h |  3 +-
 arch/mips/kernel/genex.S     | 63 +++++++++++++++++++++---------------
 arch/mips/kernel/idle.c      |  7 ----
 3 files changed, 38 insertions(+), 35 deletions(-)

-- 
2.49.0


