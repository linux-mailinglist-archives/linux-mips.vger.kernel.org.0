Return-Path: <linux-mips+bounces-8207-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9BEA63211
	for <lists+linux-mips@lfdr.de>; Sat, 15 Mar 2025 20:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C4153B68D8
	for <lists+linux-mips@lfdr.de>; Sat, 15 Mar 2025 19:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830D019B5A3;
	Sat, 15 Mar 2025 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DKNWfG5x"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECBC1917E4
	for <linux-mips@vger.kernel.org>; Sat, 15 Mar 2025 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742067620; cv=none; b=rKknBwjxSgHOcjxvEcHAmTJzqiY3+TJOgtJBIgzFkLMNej9U2zYODZpySdOYbjhk8nHvBkd+wuYcYoqfZSPmJuScCYEvBhGqkftB3kEdvQw8QtQlFKHiOsna5WOoK1cZVlG2ovOCHiJEbVIovxQueATe4uQgg9+SkrezO9UEODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742067620; c=relaxed/simple;
	bh=r5Stmtgpk8Wi9fduQ+/G2v1eHh9gD3FMDC6RMsg9odM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=roz9whto3cNIbw9A8UKzyoohl/4ip3KIEtHO0X8grA+jhIoCwnE7lduCBpCJXamL6vHQg2EV7lJsqeha+CaEulAwzUZYPGzuShlMysATaGDq94IW60VQX1ITIw9IqJ5Nk64epSP2fwYeii/ocS1wULF2dAK28tpqpWcMi1H9bPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DKNWfG5x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so4293445e9.1
        for <linux-mips@vger.kernel.org>; Sat, 15 Mar 2025 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742067615; x=1742672415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzVQsvyb6KHejLLGQLOiEXPwh6+yupfMj+KbGcnKHsU=;
        b=DKNWfG5xPFBQuCdmnqT4G5rK/sEbP4k7WsdKEpSWGETq7P/QnXIOo3kM3e2WhLvbEf
         DMUfjO+OADK3vlRBAK349a3tkeXI+DwvP0POU3c+19OHPi7yh6u7loy29/QvMevU65xR
         9KBscPs0CY1VBj9lkwE1+AFIj0uNEHFJglGPiQo8w9N1bqmazIdIkFeVO+T9hQxsv91N
         e8gPxcGXxO7SxDkh7osaeLH7owKuwFsi/rMiZdRtTLYF8nzpUEFakjwcIdQDrnY3qYBs
         gejHCXk1ViG+dZ6/YZkU0ZxyPNWYDrVmROpzZJKrMV7FyTclsjfxJblDkSASIrkTBnLD
         J2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742067615; x=1742672415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzVQsvyb6KHejLLGQLOiEXPwh6+yupfMj+KbGcnKHsU=;
        b=eEybvKNlupa8uzIvvIpPU+3ZV0bDox4mT022yZ0m8LfAqo3aj6uIOMUMAXwcgTpKWZ
         jG5Ke4D9RLMbQjKl/b7P4uMMDrZWEJO7O2kSt2ATvLxIXjcWzNNkao2jIJQuWJ48wC22
         87EwphO9i2ZMZ1dQCkoONI9VXEUdI2x+hDMwXL+oSgppu1jujU23lgArCBdN/QbUUfVA
         I5adG+QMs2UfPhziIpj/X1Lx8YSEWCNEsyQIo9RzXCjWgpKnGr5O1dVaOnKbEvNZwdPa
         BgnOIGtRI1YqxiWX4qMbkHlkEtXktF0FKD+MPXuvpHHccShY1ozmwKMH1fEoL3R+N8jB
         JVvA==
X-Gm-Message-State: AOJu0Yy4JbenXmfuB77xt3LQgxmfpRfs/m/6XG8SUh+jwZFdRXj4hXHM
	ggWHwMmyJGyVC55pXnfj7O8ARlrAg59uyi/Tr/rLvsGVA2fJSeW+ijcO1tqJKaGSKwOsMEP+sYO
	z
X-Gm-Gg: ASbGncsAp7H0JkbXA0jlQBhFqf/uHAqK7P/aOnJJjxTgNwHEVtdUQlIZUvi0Nq+gOk1
	oe4UYLL6i3TeGvL3b+70wtF96fM6Uwdx0ibKh1zub4EPZ9X8fcn2isn19hjOYqZbeVI0Wayh2g2
	8f/QhDehk65PGb6eVDYJrmdun393t1YaWnAwCOKgP2M3rcOx3yiGEOhPEx8+teAkBX/BbgABFkW
	kHotbnjwUb7pTDb1XozlOeUcnEVNgpWBLM9hEdjJyrTA+1ddYuXNecEonhJjm9BnatXIKuzyfPg
	zw+8c+s9Sm7MUCuft9UF2k8k7DJbws/thesSNeYkQ9wxEM8FvpoMT3gvPOGIuPvwU8G9
X-Google-Smtp-Source: AGHT+IHJGwse9XKFAh4SKGf4ahJOahoAldZedJFtSXR1JqmikUsc8hiwm713P4tUDi+iNRZkQyeaig==
X-Received: by 2002:a05:600c:4587:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43d1805a2d2mr122934525e9.1.1742067615151;
        Sat, 15 Mar 2025 12:40:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6e92sm10067447f8f.38.2025.03.15.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 12:40:14 -0700 (PDT)
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
Subject: [PATCH v6 0/1] MIPS: Fix idle VS timer enqueue
Date: Sat, 15 Mar 2025 20:40:01 +0100
Message-ID: <20250315194002.13778-1-marco.crivellari@suse.com>
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

Marco Crivellari (1):
  MIPS: Fix idle VS timer enqueue

 arch/mips/kernel/genex.S | 42 ++++++++++++++++++++++------------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.48.1


