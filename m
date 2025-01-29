Return-Path: <linux-mips+bounces-7632-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCEA21D25
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 13:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3391664C2
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D02F36D;
	Wed, 29 Jan 2025 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyfJIiYS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22047E1;
	Wed, 29 Jan 2025 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738153977; cv=none; b=jFW7H0k/AhYrP0450/OD7fGziH49lXRBAm3ycweqwt+oINwRxb5c3pf41d/a7YR1O8+UHHWwPcNmAKKHOsz/CYMEZdbcG8/PcC5wkBtZzQPT/VicmxhwNdw83MEXRb+hdFP+j2iIsFO+4znLo1xjjEsxq2KBIG9vcXn/YNiZdQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738153977; c=relaxed/simple;
	bh=cgZ1JxYnVydWwgGmlxlS+ITOlH4rfPVw7aLFtJArzFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VQgPXHYNDvi/Vbt8KZ/ENGOPR3uAmjik+tyMSym4c44Lhi+AYiHSeNCIeeHGAxe6VRBgSBUAMmYOBqzG3UMivBYss2skg4A/09lOhstu3Y6gZQWttrwZ9dKmcReiLfaGJ1mU+XfWh4MehlSOAyVgyjru50AY1vndNE8bIYgZvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyfJIiYS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so12447958a12.1;
        Wed, 29 Jan 2025 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738153974; x=1738758774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ILT57qX0StYgAofm/a+P+5TeYAcnDIEybRrnzXPO+U=;
        b=MyfJIiYSc5s+G+AtrG+gi/5SBTTpHoDag2k9cDwD+MHBVAchtGrk496V4YLgarfkaI
         iCrmBZo+ttL9NTk0uM6lCwKy7SHbB5CECRIgYk4YPDdyul84u1WY+AjCY6Ny4rOBGOxl
         ET4ScXnTDwEaco4rDlMHltW5X1BLv6Q4NuBrU3cAmm0p3bz1hFcw323oEW1M0xvBb4HR
         eujf78YfQ9Z5oQoBQUY/GfiiMjkJzFwq10j3k1ABPJxkIhTV24pgCZOuNiQC19fYO40h
         mJLcQo48AKdRzMgDMu55CPoFLqJL/bN+V/H0YVjWtqGUla48G++3DNDZNofnWyYFkGKb
         N8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153974; x=1738758774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ILT57qX0StYgAofm/a+P+5TeYAcnDIEybRrnzXPO+U=;
        b=vM/L/jHs5phn7g3rO13e41OWxsOrTHGa6FKAckk82RM12q64AteVcLAF55pmkpN0NP
         5/vvgQmGbzFAvKOsa2DWMfNVFxUxRc84MlCMMWBHAjaxHi+LDihXK+DVJJIDlvULQR9U
         Y4BnIVndx4CDeqHTWSDnwPhqsGrl/lOSqmnzMWdClkMUy+6p3aWb9RA7GPWpBb3PhdzA
         wgGgWcDDwhuau9N8Df/z06W0zEbqu5Nq2l9fOfM0+uqquhATEG1LcAGxJPRgzOxgfeXt
         ISnyRyjsxsrCdELrhZ0CJxr7Ew1dgEnNz6yn8u0OAeTYLwzOWLcIeQYlAgtPfJnBLNJB
         4Nfw==
X-Gm-Message-State: AOJu0YwKC1KZ1MUiXaow6KeIce0TdsSYLOlSnSUEBgF7UKG1boxkYmDB
	YuK9y135cy/0Kt6zc2wVFER6UySGsJpbngb6txo/JLnoSTNFEQ3oG3xuAHoB
X-Gm-Gg: ASbGncteUDuaStndlqdF2N8uqnqmyffVdXYh7a8nOpJXtWWNIuvb+9FLLA3lQ42WK/n
	oSk5TEEw3NVs26CSROLxTBFhuDg0QE0iCNGtx/75TPQhSo+H1YXMLMKzrRc7FQFS0nmcykNKNii
	4gm0ZP7n+QfuF7NsiC/ccDF7BOLxNqu7IJewx2XvThbEjHmHHHk7RmP+s8wNtzOTX6P8XGkh1zW
	RU2C/oESYz3fwtC+BneFl1yZPt/2xHwpla0SArPPomf/vnpltGK74JE17sG6qtb2eyXdoo18nCb
	yB550pDIFbmaClaWM7ymDWbO
X-Google-Smtp-Source: AGHT+IH4CE1D7ZTjnCpwVK019uItsBhKkXQJvsEL9SlVoM1SVwAVDOSsQ9IvzGKL/ZFQg3eyaP5lPQ==
X-Received: by 2002:a17:907:1c27:b0:ab6:9dfd:2200 with SMTP id a640c23a62f3a-ab6cfdc5fc6mr280597466b.53.1738153973399;
        Wed, 29 Jan 2025 04:32:53 -0800 (PST)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69051b1ddsm733540766b.180.2025.01.29.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:32:53 -0800 (PST)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: [PATCH v9 0/4] MIPS: Support I6500 multi-cluster configuration
Date: Wed, 29 Jan 2025 13:32:46 +0100
Message-Id: <20250129123250.711910-1-arikalo@gmail.com>
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

v9:
 - The changes related to the broken HCI have been removed as they are now part of a different series:
   https://lore.kernel.org/linux-mips/20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com/
 - Re-base onto the master branch, with no functionality impact.

v8:
 - irqchip: mips-gic: Handle case with cluster without CPU cores.
 - Add Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com> for the entire series.
 - Re-base onto the master branch, with no functionality impact.

v7:
 - Add fixes for specific CM3.5 which is used in EyeQ6H SoCs,
   suggested by Gregory Clement.
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

Paul Burton (4):
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
 drivers/clocksource/mips-gic-timer.c |   6 +-
 8 files changed, 307 insertions(+), 70 deletions(-)

-- 
2.25.1


