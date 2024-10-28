Return-Path: <linux-mips+bounces-6511-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A632D9B3875
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B721F21EEE
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 17:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09A41DF983;
	Mon, 28 Oct 2024 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mv+S12iB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019B1DF75E;
	Mon, 28 Oct 2024 17:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138383; cv=none; b=d2ixP7NywGDtjZvHKnQADqFXhhbzyCIEYeYxiUX4yk8btBXTiMnwdmY0j3yGaH1RukVyvfDIK6AUuh5djXkgr1M5emjHoW+TRH5m5uSgB+0uXTOoA46z4loL6IZ3kHXmxgi5LBHXjN96RjuSuVfUz8zFhxTTx7qXxH+xoAxr0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138383; c=relaxed/simple;
	bh=g/1ApDou+MUUyNEHqOoygo6PYzuXo+hPEGPlqFa/bXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dkoC5Lp4Kkj7hdYmuTcZpJwSaLMJgQudmTHV05/diYEKdheO4QXUouZMx4snjI001vH23P2DCVf0DeyRFlUWBrzo63bJF7TCqYtMpE0Zb8rU0qgxPJlnVQA0X4gB5jwo23gPZSQM8NDxijeqxK/je/GcAoZkM4/MzBET23zQp6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mv+S12iB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso68637951fa.3;
        Mon, 28 Oct 2024 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138379; x=1730743179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWL0ijAA/7luWmJ6xP8UZoU8tUf5IZQXPW2EFiLZpL8=;
        b=mv+S12iBV8pZx3DgrjU8NtAg3yKDwFoMY4fnqV2DdsccHxOHZ9IM/sxwMSTV0Mc4uz
         SSV3vR2Vg2TzlW5wlRUUwr7jbwDs0iEkxNSdXMAUAO461PVuYEgnJa1sWLtHnfPbcjS4
         FLMqz1idoNOi7AQm3iFOb9V+iYRLad7hVNL4AE+qEbd/TaLSD0ScKlCnqSGLd2xjJ2Dq
         G+OtrMsGubN9m+nSFZydFttWO8XwomnAbs3eQqyLT587XIXUqWdergkdt7Y0QL59uI14
         wV+lm/VDqUyCcmjaz37Tu/oUx8T5/zR7MgrvPWyDbp/p3ALQBOGzHjGDsbM6bRsHQmyj
         3nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138379; x=1730743179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWL0ijAA/7luWmJ6xP8UZoU8tUf5IZQXPW2EFiLZpL8=;
        b=n8cToRu4h4n3nx7mVKBEEDJ4qL3CNC8IyTYRml15ScurCnggqareeuh3W4ONVjAFgy
         0xONo61EllcBfxUkEiLocOzgQAITQDfGtUFe4kyDGfAhWwbDURrNWfT9icTploWb6lir
         8S1tCtMGJ3biPetdCRBCx/xe9J8Gq1P1g1yVR9DBpcOsLhcLVWWz736OhpDRQEFjBDCO
         w7Msk/8ObD/ifpOSqobz13OfkpXZWbmldBjfC2EfegOr8CWOWrK8CdPs8MENJG1Ij7kJ
         GJPPYuNCQ9qT0a/81GYXNzXg3i07XMLtVNhYNxYBC3fOVC6zzrSWbE2eXBtrqjLm/uBd
         VOWw==
X-Forwarded-Encrypted: i=1; AJvYcCVjV+He0WFAGiphCVXKyugMLN/SIhKyaUh5tAjEI3asDM5+RDzuGgGPD+/YhwfXDaqw4m7tkSph0qSB@vger.kernel.org, AJvYcCW+yAuNvnkscNILdfyad21/VWCaB2vpl8FDfaRfMLoXq/3r9Gq49Wnaj+rfCpy6v34y4x4x6o5r3x4Axlic@vger.kernel.org, AJvYcCX2CEidoKOf5powxV7Ys/KC5etrYZOypzlBC6G5mLVZQ7Aa61Me6uFay4S7O4PkqztjYDQCbGH6dpYC0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDqylu1kJvlpRyrIjnDBkXZhFKF5QYue1afHzYMVqQ0OM1RNy
	UpKnru2QjPQSm6izgzfPLVeaD6u6nzT0cfYV6ghqCsMLu4gecdF7
X-Google-Smtp-Source: AGHT+IE4wZOrxBGDczr6W+gTxkO6LW+u/+0VFfkJ/WAb0XKbP4UU4zd224H+MxBcDhYNo+LAhLsCBw==
X-Received: by 2002:a2e:2403:0:b0:2fb:357a:be4d with SMTP id 38308e7fff4ca-2fcbe0a35aemr48417031fa.43.1730138378952;
        Mon, 28 Oct 2024 10:59:38 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:38 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v8 00/13] MIPS: Support I6500 multi-cluster configuration
Date: Mon, 28 Oct 2024 18:59:22 +0100
Message-Id: <20241028175935.51250-1-arikalo@gmail.com>
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

v8:
 - irqchip: mips-gic: Handle case with cluster without CPU cores.
 - Add Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com> for the entire series.
 - Re-base onto the master branch, with no functionality impact.

v7:
 - Add fixes for specific CM3.5 which is used in EyeQ6H SoCs, suggested by Gregory Clement.
 - Re-base onto the master branch, with no functionality impact.

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

Gregory CLEMENT (4):
  dt-bindings: mips: cpu: Add property for broken HCI information
  MIPS: CPS: Support broken HCI for multicluster
  MIPS: mobileye: dts: eyeq6h: Enable cluster support
  irqchip: mips-gic: Handle case with cluster without CPU cores

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

 .../devicetree/bindings/mips/cpus.yaml        |   6 +
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi       |   1 +
 arch/mips/include/asm/mips-cm.h               |  18 ++
 arch/mips/include/asm/smp-cps.h               |   7 +-
 arch/mips/kernel/asm-offsets.c                |   3 +
 arch/mips/kernel/cps-vec.S                    |  19 +-
 arch/mips/kernel/mips-cm.c                    |   4 +-
 arch/mips/kernel/pm-cps.c                     |  35 +-
 arch/mips/kernel/smp-cps.c                    | 305 +++++++++++++++---
 drivers/clocksource/mips-gic-timer.c          |  45 ++-
 drivers/irqchip/Kconfig                       |   1 +
 drivers/irqchip/irq-mips-gic.c                | 269 ++++++++++++---
 12 files changed, 599 insertions(+), 114 deletions(-)

-- 
2.25.1


