Return-Path: <linux-mips+bounces-8036-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63493A49697
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 11:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E395616A9B1
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 10:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A489F25EFBA;
	Fri, 28 Feb 2025 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YeymNtEG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397725D1FD
	for <linux-mips@vger.kernel.org>; Fri, 28 Feb 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737123; cv=none; b=TqrotN1c4z7hqSOHGxhQ576DO949hTkVxzIQVmB34IIRZAChFUIlL6unv8e4SA/zaMht7amcCqP1WPltmNw0BWKnwTcGjqmodswVWTh2OXkb96mmIbDTzWAI9Z1kPZ/P1b68tWPKQKxaePqxBx8YN5IjRQC2csqP5ki8eamkS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737123; c=relaxed/simple;
	bh=Qzc5AefzWg5/rKF/uU4VJIoRT94mOKd/qPMsAj7dTT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KMWX979up6zHQkTw37mR55AJo3ehokqHAz0p8PVdfTUBW8vUoMla7cSTOAo6ZAsXVL6pQz4NayzknqFLYy4m3gooQjZSO6d/YsrWQo2OgFkV+SxzOSxZSiYBou64fmYdLPmtx/6IVRL2dioyl+WM2rkFEeIqelOkYD4BOU7Ouow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YeymNtEG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a39e659cso13310365e9.2
        for <linux-mips@vger.kernel.org>; Fri, 28 Feb 2025 02:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740737119; x=1741341919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yL9lEyEquO86Kxl4vX11fM0ypvSY+BpBD4MiVL6upRc=;
        b=YeymNtEGWUEvGcimFCHJQNxxnMirY58ihEOBqtnPP5ld+gTGvwA9AaaEi83OS3ndRw
         iDvPw1pxXXkT5QHmwIhx46eUBPetAKnpUkxrx4dejNzdF382KmboxsmJPAmRFG9omHMG
         v+FXy/VmsOZBRjkvWiwXysEBCe7E7iQAQ7Um1WAxlX5pk7G9uacqvdudukHRPvPAi/d9
         fup3UzNKpKNj0a/4H+zvP3QwPUb3a97e03M+5/gzE48WfLdBHSkFi4esBrK1TamDqi2P
         7IxuT8tzbaJe2QyRX8XmvX11XWaK7GcPDpBeJZEGGQzqk73oh/lscI+abwS4DP34pd9Z
         JiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740737119; x=1741341919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yL9lEyEquO86Kxl4vX11fM0ypvSY+BpBD4MiVL6upRc=;
        b=ohOoYsu0Se65GBJ0C43dlbAvG6wK9tReQiytgD+QWysEKLC7quBxFPdqrtf6bxLzgp
         q41/PeAFQCr4Z3KTp2g18eOmrJyGqbSWLUivAhyG8tBJc3fUVmEHZUYPdKBCFRCZScwP
         7Kwa3uVi87tj+qfsXmYPFMlVHaWOn76Ll7HDbLYqTUtGQcWbjZDGGojfENqf8ieun6LI
         Am+IoyT26KdaKCC/OJ9l8ixRyZet/tBY3JYzgJ35kTL9AkY9HgXdF2eejUZxCVz2KUxe
         V08KsBHqNpD1Zx4QvOT2S0N8G0paL9bB+1XQocrkk95Pg2w1L6SEonLbpDrnv3RX5uXQ
         BK9Q==
X-Gm-Message-State: AOJu0Yyfl390Kq2vJxemPe6MACRz39f5cQP1UUD7ZRZl1hKpzahL5fHV
	4rGzsipzO7peEYbLoXVBYkrD84x+9ULZ4KDj65QkEcbtrJwwp9NLPd2JEPQNgibbO145Kk+26A+
	9
X-Gm-Gg: ASbGncsQxEN6TAZfbTVPv51NH2/rcKW3xc2K1iVftf1IPbLC/ys2rPrmLGMj7sfuyys
	+REWx2mU4Ko2c9MnG+JlfZWiDvGiA2cdjzGqUp9t4pBeFLu31olUbDl7k51rrWoSisn8EPlpd1r
	Wa2b2suVq68bcFP6OG+RPNFKA50JF8nfIpKyWOwZlMNxqJDsX9NwgJyvc3RPiYtkIVjeWgF/FzS
	hueZ9eCxNO0YgULG2e5qynghBXBwBzQHAY4cpQOD+Q1AZxOjhRQ0M27fT+O0Nb0V+PjIl7W0nPK
	vtMphDCxSK90RJ79A5KA4ZxeOgLwTHIZvASFJtprer1oR8A8tg==
X-Google-Smtp-Source: AGHT+IHv4FtLxje5vUdur26g0chQhVf1h8nzlJ4iyiy363YRYtipSzVslT2XWY5JjzNlUJjvmXnx1A==
X-Received: by 2002:a05:600c:a01:b0:439:8a44:1e65 with SMTP id 5b1f17b1804b1-43ba66e67b6mr21535205e9.7.1740737118900;
        Fri, 28 Feb 2025 02:05:18 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73717230sm49964945e9.19.2025.02.28.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:05:18 -0800 (PST)
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
Subject: [PATCH v5 0/1] MIPS: Fix idle VS timer enqueue
Date: Fri, 28 Feb 2025 11:05:08 +0100
Message-ID: <20250228100509.91121-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
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

Marco Crivellari (1):
  MIPS: Fix idle VS timer enqueue

 arch/mips/kernel/genex.S | 42 ++++++++++++++++++++++------------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.48.1


