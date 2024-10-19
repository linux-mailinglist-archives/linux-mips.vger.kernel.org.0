Return-Path: <linux-mips+bounces-6145-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B274F9A4BA1
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A9A1F230B5
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849991D5CF5;
	Sat, 19 Oct 2024 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHPb+Rl4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062A018C910;
	Sat, 19 Oct 2024 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321845; cv=none; b=AwthiTLgrRqHrRo5vu7/yDNQr/6/as7GFmR+wObGLW7hNkWwqiZtPhVUH7mbF5BWJzvsdD8m9Ew0uHZX/YENAFZPGgbE/NYmenLLCXDU64iN1JMrfLyasbrU6KXSSpXJkPJiqUlRAVSLsV29KCvYVpnSx7akXqOO/82HFP2fIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321845; c=relaxed/simple;
	bh=E2DK4yqi+Iin/pWz2JehGdvCbHmvxu90/CxWZm4YBWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZMXr5ofu/Zyb637V/1KRyPk+UFfsaCvhB7fLOJvbhNFyxGKbB7fU1zRrVDPMaYinz/d8hhKW6hIATIY7tNXLMx6KOVE772LVJKiwkAcZehUiJLclmtzJocjWfiFnTYCkk71FjS19T6RP6OAYQ67zSwpOdovbpKFLdGbxGez3bxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHPb+Rl4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a850270e2so29319666b.0;
        Sat, 19 Oct 2024 00:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321841; x=1729926641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YNrWhVgQ4tQOoRn//FFdhZ2CccmGfkY5PexNuqzKSs4=;
        b=cHPb+Rl4e6aGiyApjio8ecye+pen0lEhuImGORDVXoPImmkc9Q8p84m1wAZL27qFuw
         viEMaM4p+31fKRTV25R7qi3EMs9ejkqokwPlEUP6CJdEwJz1IAGOFPIaUFGuw6RsVE8R
         Kvn2ahY0YyS2rESqbsu/Is9G19ra6eXQRFMMpzkYkpti/14GOwWSYOBP+TPMvgqSTvMH
         7IaG9qyD23T6Hj2SY+YHz6f+2Jgz5cL4LPISLIhYMu3rbsegzV6YB3A/bcLl6b8Zu13g
         V6sk2I4eOGoLlwEzXCyFOnof+DNAmyavRGR9LA6XO9hVD5it75B0ueCItlnRBJZXnVPa
         rt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321841; x=1729926641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNrWhVgQ4tQOoRn//FFdhZ2CccmGfkY5PexNuqzKSs4=;
        b=vWB9nss6LHOSANszdYGwwZ/fJKT7qnnW/8A9vzCf3rW64Lc7RMEvU+XMGVFMNFUJou
         xk9jVue8VPzlDprTXnZ67vBVqJdhJsmm8VJz2oWYp/i8c5qEMdkk1YFYFPrUlR/DtDh/
         KLngyG0C2lxjzZuuEfoGHp+vnJg7gtoVVzjXmqfnUUmIs0Rpzwk+ACL8vRXJkYv5LFP7
         js5St0eM8574eMVb0RXHO1KOB0JLJq79Sw6yISaOVVqeaXl38S3tbb9pj4jG+2pSOrGH
         hwlyw+HjfdBBWSjDhdp1QMNGH8upZRIj5zfcVeMG/LjGKWBBzXcrHmPaz22PWMlmx0tK
         Mw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkJV++zM8+RFFfaeaXfc8pB9MhBWkffQvdM3avs3sKElSsOCnQx9pvMJ4EqffweJqL3PGintd5VYrXfw==@vger.kernel.org, AJvYcCW6jquOdRiluMMxYA9tO5MtFdxTpKRfv1Ob1tIv4mgvfpaC4PxUAifyqKNSjRm78eTzo+1tIWwy4BlNIvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxhtpZzfSmFBP3rFUMSvK69y/FVVRmOTEQnrMqmwUZhbVf+51W
	Js18ubJrWHXid6iUcuIQhrFQbw2pLJnO2GWHee/09QgTED0J25NZ
X-Google-Smtp-Source: AGHT+IG6rS9Mpi++Jk312jnpopUsSfd9yYFoDzgaqUZMnzezLhLtPNfR7oFw2watbvQ9OqgLHJB2zg==
X-Received: by 2002:a17:906:730d:b0:a99:ebbb:1307 with SMTP id a640c23a62f3a-a9a69de9af8mr489340666b.59.1729321840906;
        Sat, 19 Oct 2024 00:10:40 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:10:40 -0700 (PDT)
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v7 00/12] MIPS: Support I6500 multi-cluster configuration
Date: Sat, 19 Oct 2024 09:10:25 +0200
Message-Id: <20241019071037.145314-1-arikalo@gmail.com>
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

v7:
 - Add fixes for specific CM3.5 which is used in EyeQ6H SoCs, suggested by
   Gregory Clement.
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

Gregory CLEMENT (3):
  dt-bindings: mips: cpu: Add property for broken HCI information
  MIPS: CPS: Support broken HCI for multicluster
  MIPS: mobileye: dts: eyeq6h: Enable cluster support

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
 drivers/irqchip/irq-mips-gic.c                | 257 ++++++++++++---
 12 files changed, 587 insertions(+), 114 deletions(-)

-- 
2.25.1


