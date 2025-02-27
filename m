Return-Path: <linux-mips+bounces-8016-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A048A47C69
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 12:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EA283A8BF4
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4712322AE6D;
	Thu, 27 Feb 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TVHtNsCQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558F2288D2
	for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656515; cv=none; b=b33rhsl4wd4rQ+9GCqRqFYU+l8hOtkik7vO6knWH2idIOtPDpOul7g9/o6vHiqmYo2+vexwa7p5h3hOoV5pF3rabi/82fS8TpqkgEsghUzHz38lesykWoWvQ9BnautwnRjyfBLwaPaIUUeq6TzLjmPC6c6fwYTj1G+kkZzuwOdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656515; c=relaxed/simple;
	bh=UhKXDiNbRqaboqPw0T80ytsUVX3HsBZbgLiN+7XE8OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKWyV/uMXWeJYcWO2QshQiXyzIyhKzFwO5czQsL2zVXH/nY8r3w3kO5T2YAZDJjbSX3SuUga9KM1xQfdn1syuQ08cthqUnc2qlngncX9PBOV/y3XyWkA7fcvpqYh9SFF+9+7NFGXkhH9OvhoHumoYdO7OO85VHdfe845g/8/PEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TVHtNsCQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390e702d481so228157f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 03:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740656511; x=1741261311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwEpUuK+jWtI1tmmhcd2Ps377ooQ2BUExOECDJXtCwY=;
        b=TVHtNsCQ+uf3km+XW0EXHotVVwm7SeSd02hQWroOBV54Ny2XdskynuW54VpT2pIuch
         0iDsLZgFNcFIjCnzCSDVZ0bL1DfW86kNitM1ml2uNEtIe8vSdtx/xl9jY/xitmaVyXGs
         nJZsUqOijUpDX1y9p0UkXteUYCFs/jaYa1sbITf7nPKUjHAF610dT/fGHM+hoVgzIBUV
         +6MwkTWI9Hx8yqe5H9R5jy1367nCRqnfd+w5m9VxGB0X4U5N3jpoaj1QbD1e4vtzXSGI
         k5lrBs+vyTxHaqtJ+MGh7GX3Uj5k4JZoYmYo/h/zXp8WO+7xTNDEx93+aGOsG/5wNnjE
         ZR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740656511; x=1741261311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwEpUuK+jWtI1tmmhcd2Ps377ooQ2BUExOECDJXtCwY=;
        b=ExP0BladWTPuQy3DL7wYAH825jmDn8fX37xZFlGpubXHMT7I9rCmm6x1QQRjCF7Leo
         SBmWIuXoIVGDJ5+A6LP427wj667g4UhmfIivOOKLZFznrvqPk9IlWtN6bMI/BzBE03Hi
         PaBjtFKBhuGJZ4bQtoBpX/7wsGo5z+uE9vfPfKoOKpppPMDFpxrLCkaSc6VqH1728rEz
         ORwBslBGCPuVGODEb3/ndK+kfDYMXAT4jSadEUqCDhNknSpZZ3aVF4uvIzn8SG8Ouyvg
         OqsmEu8WD+lhUFXTqrhS8XrnGWQIaLTg+5qdx5dEuo9wHyoRg/lO1/Kd7kV/EUuw8C/b
         X36w==
X-Gm-Message-State: AOJu0YwRDnQSNAadvVCKOtq+KpL2770QuE6GMIe7leTzvAF0n2YZmHpl
	aOaGJUJvQsOfS51CGwpkJHf25avit6KvlBFc6YQvr8Sbuioec/Q9Sm1YUFX0pF5zhykDozrZii0
	xeog=
X-Gm-Gg: ASbGncu84Tyf7XB4M+77XPaf6zQSLuSfRpmyQHqQ0j0qiriV/slUxIgBlRcvLvu5+ib
	sAo6YQUCTx//nGocNAu2+KYTn6z6it61UWfidm/tp80Fm1tn1j0Fgzvuc80f8XzXSE4izguiu4P
	F5ozAoc39NdITGmBGDk0IaoAKBjBjThlItw/tpGqR2ys4XtiQ0KAAvD6gn5wQQ/FTMZnhZ1YDhe
	1hI3VxmA356WnVzqh0GhkwiHAWwfPfs7lCFSGHrDS11Lb01p2tujqAZMDU2dy1FJIO40gv/doJX
	jLpjiCqZ02j2/IbibLYWwn+Xj23DwNgTGUhJOGZVzo1csFeIJQ==
X-Google-Smtp-Source: AGHT+IHhjeOslwW9uSp+o4eY+qrm98tuCNP/ecH8cpSNvE8u2fsXagBDR6tQzlCttFKBTeIo1ABeWw==
X-Received: by 2002:a05:6000:1541:b0:38f:355b:13e9 with SMTP id ffacd0b85a97d-390cc602582mr10421273f8f.15.1740656511286;
        Thu, 27 Feb 2025 03:41:51 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d6cdsm1738374f8f.84.2025.02.27.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:41:50 -0800 (PST)
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
Subject: [PATCH v3 0/1] MIPS: Fix idle VS timer enqueue
Date: Thu, 27 Feb 2025 12:41:40 +0100
Message-ID: <20250227114141.242421-1-marco.crivellari@suse.com>
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

 arch/mips/kernel/genex.S | 40 ++++++++++++++++++++++------------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 22 insertions(+), 19 deletions(-)

-- 
2.48.1


