Return-Path: <linux-mips+bounces-5539-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E40976598
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DDDFB23DDD
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DED2195962;
	Thu, 12 Sep 2024 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIxLwDtt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3818FDD8;
	Thu, 12 Sep 2024 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133458; cv=none; b=Oo+KmUjiK11U/O6G7vQhYiMCLqH2h/lJFxZabppPCHcajj267lQrPOxxXlVNpjxjHFPDfmHJRDFKkUnJFDAETldIfoFLBNNxR/dn+3vtHrrMJiypQ5MYPz4CJy8cz6gynSapBNh8QsbNeIqYjoC4N/VtWwKoU0TqEXdmxe3HqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133458; c=relaxed/simple;
	bh=75c0JWzLzPHdmAeuquabsf38JsqcZl6sGMXOC/sjHgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sckdxDUf35sgyYDQHFnYYgsIyyvpnuM3W0lJX83aNtk/DytkjB4yDuGLrXYcUJCFITw0LISpHJdluekIkmJVm6NgyLsEDhiStkMsnV4+N8EOyr3m7lk4IpnwyEG5Y226aQXrfFhQ7bf1TqU2YibqEGZzQbkbYOeagks7QcOX0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIxLwDtt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so6033385e9.0;
        Thu, 12 Sep 2024 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133454; x=1726738254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwD8SDtMDuYN59ioTbpBQfDFiemRVDz9PeV0tYn0Y9o=;
        b=mIxLwDttpaw8Ge7Gxl96LbHbi6TjJ1o8SKNPeXciKudejXXbHj+0nkZz72ERr9ePiQ
         O2afziririSEy6iOk52IElEt3EpXlQ9ShBX0lI0Mr18P6p87Z9g8CBfXgUrK+Jrsh+Kv
         AELYmevWn04gztsew59X1dwuwa3uPLVaCsULIbbby2NitQoRUQvyIRLlJiVFO4G5vfD6
         Qk4TzZZk7FiCajWWhHECR33rrvUCRaEWnSuLNWOPW/Hng9m5NEc3PUxH9maQrSEqJfUr
         prJFfr1gi5V/TuAvvj8Y9kmGARSAW5AlbmuR3Br+RxjtodLB1SSIfx8pPLm6e29Qkkkq
         egZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133454; x=1726738254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwD8SDtMDuYN59ioTbpBQfDFiemRVDz9PeV0tYn0Y9o=;
        b=LuJ3VLDNBLmAJnq1QYZOmoLbLIPuEkGSRJuYSXC1hhtbyOpcO49uCviEJpGlY3L/wx
         NfDwOJZzx6AwE84R3ysO03LQrcY4hNCBTAsXv4qsgLVfdPS63xkp5hOfAtLLq+tuokbR
         AV0NzXUwbiFERy5yA1k/KPJtoZ7cvMd5u4XKTSawjMVjR7BkCuer4CKU9+UVz4zXsSYT
         jB3Dl97uY/bBbMsNS6iOMOShAgVqih4jiBuTQfO57gYXxhtL4fGe+IAiX+eRAnpiftbo
         0BYIjQ/UMLhPAmcxTmrbI02ZTtjt3+HnDHSBIN4TM9mPoED/wWVC1ZnPl89WyHhb5y2c
         CwLA==
X-Forwarded-Encrypted: i=1; AJvYcCUYQCT1MJxbbdn42ZcB2Bm2B4J6h+qU+d3fiOwz6y0li/9NYsjnfWEmFgYdiHK9yn/s8X5IJ/P+fOOF4K4=@vger.kernel.org, AJvYcCXiWgkNA+vWAbeSZu2cSZBdnatn20+LrQqoQ1xsadD4ZeHvDoQad9/GlKaMzW8yCTd6GD6K+tsRbCso3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBfsj/3SdAV2zvBcggZk7uI24ldiJWmyofJz7oouCgq8oGfUR
	LdS+kuJYd6PfxWrIc6G1in1jR8LeDGygphSvj6C0icAGmVq7+mIW
X-Google-Smtp-Source: AGHT+IGT2Ij+VvI4m03GiMl+vozD/+bImoF9oyvXkaxyAqilMzAQyuAFsTr8JmVJUGhgywr5aXBvtA==
X-Received: by 2002:a05:600c:5121:b0:42c:b377:3f5f with SMTP id 5b1f17b1804b1-42cdb547e96mr17839175e9.14.1726133454508;
        Thu, 12 Sep 2024 02:30:54 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:30:54 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v6 0/9] MIPS: Support I6500 multi-cluster configuration
Date: Thu, 12 Sep 2024 11:30:42 +0200
Message-Id: <20240912093051.452172-1-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
1 cluster/4 VPU configurations.

v6:
 - Re-base onto the master branch, with no functionality impact.
 - Correct the issue reported by the kernel test robot.

v5:
 - Drop FDC related changes (patches 12, 13, and 14).
 - Apply changes suggested by Thomas Gleixner (patches 3 and 4).
 - Add #include <linux/cpumask.h> to patch 1, suggested by Thomas Bogendoerfer.
 - Add Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org> for the patch 08/11.
 - Add Tested-by: Serge Semin <fancer.lancer@gmail.com> for the entire series.
 - Correct some commit messages.

v4:
 - Re-base onto the master branch, with no functionality impact.
 - Refactor MIPS FDC driver in the context of multicluster support.

v3:
 - Add Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com> for the patch 02/12.
 - Add the changes requested by Marc Zyngier for the 3/12 patch.
 - Remove the patch 11/12 (a consequence of a discussion between Jiaxun Yang
   and Marc Zyngier.
 - Re-base onto the master branch, with no functionality impact.

v2:
 - Apply correct Signed-off-by to avoid confusion.

Chao-ying Fu (1):
  irqchip/mips-gic: Setup defaults in each cluster

Paul Burton (8):
  irqchip/mips-gic: Introduce for_each_online_cpu_gic()
  irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
  irqchip/mips-gic: Multi-cluster support
  clocksource: mips-gic-timer: Always use cluster 0 counter as
    clocksource
  clocksource: mips-gic-timer: Enable counter when CPUs start
  MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
  MIPS: CPS: Introduce struct cluster_boot_config
  MIPS: CPS: Boot CPUs in secondary clusters

 arch/mips/include/asm/mips-cm.h      |  18 ++
 arch/mips/include/asm/smp-cps.h      |   7 +-
 arch/mips/kernel/asm-offsets.c       |   3 +
 arch/mips/kernel/cps-vec.S           |  19 +-
 arch/mips/kernel/mips-cm.c           |   4 +-
 arch/mips/kernel/pm-cps.c            |  35 ++--
 arch/mips/kernel/smp-cps.c           | 285 ++++++++++++++++++++++-----
 drivers/clocksource/mips-gic-timer.c |  45 ++++-
 drivers/irqchip/Kconfig              |   1 +
 drivers/irqchip/irq-mips-gic.c       | 257 ++++++++++++++++++++----
 10 files changed, 560 insertions(+), 114 deletions(-)

-- 
2.25.1


