Return-Path: <linux-mips+bounces-7811-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16EA396A7
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 10:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69C693A1974
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 09:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EAD2080C5;
	Tue, 18 Feb 2025 09:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EHKVsVAl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5185612CDA5
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869339; cv=none; b=Xm2kmrdp8/tdycMHBMhOMDc01nZPQUoh/VMImygUOkcnsZHwcqjehJcYmO3wxo3Sgjym8AoXYsvxrsPti+pt//ibwLZDaBB0zCoBWSno/9VvdgeMPGtpeKoQ3m9NLk5GP4oRroJdJfw8zj7y6bnPP24VyHQFOy8VPfs1dixG8G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869339; c=relaxed/simple;
	bh=oarkjXVLNesvBgN+1HvI9A2bxn4Y0qdmQIl4RN1lPtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/vT7GXbUFWR/7f+uiz5tiV7ZTd6Uhh9SjSLzin4NnstL+jPuVDkbcbBkji6t+rMK9mY2p1Isu7bRF2MncjMYozbyNUTBkZ1O6olnGilO0lmw90VrHa/pjje4NNLk48d9jEwrkHtgiwYVgyeUyU2yF3yclcL8QFDTCt76At/JMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EHKVsVAl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso7041227a12.3
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 01:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739869335; x=1740474135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4NUZe5vZLnQIBsjbsiyFT1DNPvBzyyucEtcVSRHJCo4=;
        b=EHKVsVAlSNDMP1Vi/XD+ri3MhxFxMbSUykq5weBo8Go1sNxdWAN87eQC87xL10Jwwd
         vG/RuEjJhHC8Ll8c0wQE2/LM31rL46nWo258ZDOUcTGvAHyAXL48ieZ3RzAyU4ZkLbKT
         nOmxgz6MlASG8uRpxNSOuovgX4qVfYgWBxqeciv6TegzVe7xfA370BAGe3GSSHYlH6Cw
         tbeFkL3Zz81/XDDjMB1VVzCUO0MEAaZdgPBQuxg7N/4Fc7N0fPMrgG4xsui4EvAA8gNL
         zv3MwQA1KxMIzLMwLk0XTRBm+6VDBC90rj2YmA44VZ+PnV6znCDBbMe3TWIdRhZlWYPt
         a96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869335; x=1740474135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NUZe5vZLnQIBsjbsiyFT1DNPvBzyyucEtcVSRHJCo4=;
        b=Dl1hZhmYP8LtaMvqOxcv+BLE74iQH7+7nz8U/KjMvuGZ+iXPY5Vu1z3BdpviumyXfH
         w+tmW+6ScbwRhu6dmYK5SEdu7KnVgc+EyvmnC2U+eln3iSn52u7pxu0VXYYN6wPlyZqC
         9fAnZbQYyJbYYxAJPwZIztc4erMkvan+2h51lLOrzOExAi3bnfHxrjhVzXe+Fw14/2nT
         LZcR8Z3YZwWRXvSQRtpiV7a7MAQGrsQRf60XvQ7nK5YF4p2rHmsrYXZ69/lD8G3RCMc5
         hff5V+IYe1xK1Y3iDafM7R5+i01yzpt/NxqLMAfniEI8Ly9SIpTSBtDdK4IpTYk97OqK
         p5WA==
X-Gm-Message-State: AOJu0Yw6cO0ty1Hb4qrMwRzlh9omGFcZUSo4TZaLepNYgmuuLYIxKFl6
	DrScjaKom4HuiQEMR8MHBuz7Q9Wl9l4h1CPDb3NIujsIZdE69HsucjiR4I9VfPEjRWSf//owZEy
	GnBA=
X-Gm-Gg: ASbGncsXUyzV1SXepm8rLzEt/LC4UQ6zGnOeR1xAfJrwjCMUScCiKe2vsTES490Scul
	HbN+iE66QDQ+zZuF90DQ/aySH5KqaGGB2mO8jf83HxIPQSJXaeENQvnXZS4/hdGw8UIyPe77trA
	3hZEoxUxS5f76BNcZtaO5GGlp1Lc821owkpmXwrvJnPS+3kYJw5AY2cvCmirF0+ECdeKPtjnOnG
	E3lGLmo6ClxCkoopGAb5lU7d8MMxIup9jRSStVkXZqcn5zNcBc/GQqeYCDUTp3GP2mO0qyAUZAY
	s+YP4r+8rRbl707KXTEtff8ORwl4ytZ62htazmY=
X-Google-Smtp-Source: AGHT+IEVKDOaJ8wgRnpp688LJVlZFeYtPJ8ll89AQslLn/CISzFdJoslLGXPdUYDZ/rO+DSFM5ORrg==
X-Received: by 2002:a17:906:370c:b0:abb:519e:d395 with SMTP id a640c23a62f3a-abb70a959d9mr1056524866b.20.1739869335339;
        Tue, 18 Feb 2025 01:02:15 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb89ac2e27sm477482966b.80.2025.02.18.01.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 01:02:15 -0800 (PST)
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
Subject: [PATCH v2 0/1] MIPS: Fix idle VS timer enqueue
Date: Tue, 18 Feb 2025 10:02:02 +0100
Message-ID: <20250218090203.43137-1-marco.crivellari@suse.com>
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

Changes in v2:
 - Changes introduced by Huacai:
	https://lore.kernel.org/linux-mips/20250214105047.150835-1-marco.crivellari@suse.com/T/#m75d9c587829e15e0d7baec13078be4e65c936408

Marco Crivellari (1):
  MIPS: Fix idle VS timer enqueue

 arch/mips/kernel/genex.S | 39 +++++++++++++++++++++------------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 21 insertions(+), 19 deletions(-)

-- 
2.48.1


