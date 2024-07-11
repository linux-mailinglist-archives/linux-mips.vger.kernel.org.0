Return-Path: <linux-mips+bounces-4271-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3B92E225
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC7A1C22BB4
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2C21509AC;
	Thu, 11 Jul 2024 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5NjDIWo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65E150992;
	Thu, 11 Jul 2024 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686424; cv=none; b=OR9ZfSdjFUdrEhnywYkXWQ6Ry/OqU12VO7rbPGMUtQcwK/3WWpXRBjd2t3eAmNxpnzrPZzotP+g6/bU8LxhRgB+0WT3gM++BD53FIQKBxL95d33RM7Df+rgx7MJaxF2Qk03+GO7KqUC0CS99/LGcul8Psmqy+MTIujSO/EVe71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686424; c=relaxed/simple;
	bh=hHvgA1N6OD+v1hXn+85G/CpUfntPyTBTaK5FuOJj6+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PC6o7deWMEKjJXCiXKktvx8Y6KBJ6oLDd6LKdI6KWvH9LWUA/jymOh5aZsR7Rt2M3AMxARpaTz6WUHjl25N+1qUkH37vYaHkp9rRwmNpOsXTpdVSt51Q92KZBlHWPKU0ohiwQHr71kX4724TZclk7wIB9G24zGiGI9+OjYWmQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5NjDIWo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-367975543a8so311834f8f.3;
        Thu, 11 Jul 2024 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686421; x=1721291221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kwgDJL2f7tRH6grjtf3qqUGG9T9HojThLpab76Ix9A=;
        b=S5NjDIWohXLEPVT3OB+Y4Lof+WhMTHnBODIrj6mDkck6QITYaqMLQBFwjDQo9i5FbA
         nnz9FRPlhcyp3qjwIvwJEaA/6DlpbEiX1kClVt/xGCVua0s+/335z0YAY8akDArFwZE+
         e2kdUoXLp2B3qbTc/WhAhIjObZJXF5vWg2WUjVlYpvhUCzpvbXAukhYPt8W+efMF8Hre
         GD158Kp+0pqk7CANYmFUQMvsARARV/KN1+6pZmLX3jAj8s4MLOKMagGYolCyUM63+FWY
         8mCKsrK7RZUrxpMiPIhnb5o1yZY4gL9CijZHwdiF5EBZkzJzEtOO19JdedScK9580Xj5
         4iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686421; x=1721291221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kwgDJL2f7tRH6grjtf3qqUGG9T9HojThLpab76Ix9A=;
        b=P7D4Ieg3Tk2hBiuzAuWjLwsuCKY6oJmdKNC9WbfU0GtXPP4y8rVpnPemajfvA6wShQ
         xkq/gh63yqqsbZFRfrK1Z5Xhj0E1iFnEm9yhHfF0jyjIB1h5VGJYx65JGGjSiWbkfFY2
         cope5uXnFy7LqT58l0vk48TFIrqs39Kplq9SefUNrQ2oHxb+zP+2pXtN3WAE3p8M3HBl
         sQ3WpHXX4Us/9IUbVdrcX6Wks8LO8BRIaZTZvhFLvEUtZ5vJC2j8HbOZu1tILLRA0r9B
         3ExSvBy1s8anj/HObC8LKLf70/TeOkeZisHgHHREHP3zwf7P5kkVTHUT57JyRn94dutv
         NoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7q2Ip8ZIALkC6l9VNFvqwvtWa6wF27A7xu2SJzWSCbYa6sb3b9iKeGg4o2fkcZ5YoCFzCIeEF7PJ+ZLTM/td3vfCDEwW549lOmTokVw6uIUXwfqFam8GvUlJtIVKbw7ZVR1TB4htt5Q==
X-Gm-Message-State: AOJu0Yyoc3FuggQFXiSejA9lOTY/UeLz3TQtAyzIPxbGfswrEpCVUVva
	qFnrisvmcVKiozRhJUM85TfwRfEX0LXmsqeWnqpW1sWYDEEtICiM
X-Google-Smtp-Source: AGHT+IEKrCSaZSXIgceFsCqDZIpSspHR4/RiWP0Q2xKkDi9Les/DviDve3Ny/qirrAqQD3I359zraA==
X-Received: by 2002:a05:6000:156a:b0:364:aafb:6020 with SMTP id ffacd0b85a97d-367cea46790mr6259869f8f.14.1720686420394;
        Thu, 11 Jul 2024 01:27:00 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:26:59 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
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
Subject: [PATCH v5 00/11] MIPS: Support I6500 multi-cluster configuration
Date: Thu, 11 Jul 2024 10:26:45 +0200
Message-Id: <20240711082656.1889440-1-arikalo@gmail.com>
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

Paul Burton (10):
  MIPS: CPS: Add a couple of multi-cluster utility functions
  MIPS: GIC: Generate redirect block accessors
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
 arch/mips/include/asm/mips-cps.h     |  39 ++++
 arch/mips/include/asm/mips-gic.h     |  50 +++--
 arch/mips/include/asm/smp-cps.h      |   7 +-
 arch/mips/kernel/asm-offsets.c       |   3 +
 arch/mips/kernel/cps-vec.S           |  19 +-
 arch/mips/kernel/mips-cm.c           |  41 +++-
 arch/mips/kernel/pm-cps.c            |  35 ++--
 arch/mips/kernel/smp-cps.c           | 288 ++++++++++++++++++++++-----
 drivers/clocksource/mips-gic-timer.c |  45 ++++-
 drivers/irqchip/Kconfig              |   1 +
 drivers/irqchip/irq-mips-gic.c       | 257 ++++++++++++++++++++----
 12 files changed, 670 insertions(+), 133 deletions(-)

-- 
2.25.1


