Return-Path: <linux-mips+bounces-11920-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B1C1C8E3
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 18:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E3C62242A
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 16:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B4C3469F7;
	Wed, 29 Oct 2025 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3R2fIp3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266512BE7CD
	for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 16:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755639; cv=none; b=tCj/Rab8w2q9CANjVfIeGgLPIDCNDouf07MKPupPTElJYqWZMAc6htz6TtsII5W4xr6fRwHZq+bg7J9gDDcTqcfbSyAu7S+0Pz1nwac0jjxmsIDkrOSZ9YUZZzxQ7KEaq4hzSeFrKeo5bKPCYEdzpRZI+rEs84fX1RbzJKJjjRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755639; c=relaxed/simple;
	bh=dLYeOkEOPuIM7U9Iue8rNz1PEvQbU/hko6IFG76HeCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuzrWl/HmA4ZaSNwIwKocdRvT+Yib9WmKj+cEWqMvzV+NabOIQJQyemnpFEiRUqx+g4VKwwOwxXRT35hCzqemSMYYbLFHH70uVXHZB9VXc2vg0iSldS4Mi6XS+QYITBbj5anPVXL7OtfDK9xpoEMpX/2IMkuoxVaCNMZbQIBtkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3R2fIp3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d855ca585so19101866b.0
        for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755626; x=1762360426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxZR2vFcKqCQTHArwAXh359MN44MgbOergiRoRTQBic=;
        b=Y3R2fIp3mwTX/BRVaCaWxCTbW+OS76VkB9Ot+CUjOQ6bzH/IIAwlYQp6XfxyiMP3hO
         /QwM9XCBuJYlmUK3B8hbJFHN1V5uuVVk8zMXGFrdv7XyjJZfsR5kEgm8Fn3MQrTeUT36
         FDA9x2B7mOSUvYR+6eEclfH82TxarsOrYIT/clp0Jeb6Hv25djW391MIjdbYrSn4qEv8
         Rn2+VGTxHdn89J+Dcjbwi9Q8tVGiszJdqW6Pmg7KY97aoQROnHw29JIt6RMRkEawtRsY
         rM+TEKtrv1Fe87MNeaRrcrXY5TNL013ByjRkzyWL8MTp+uzLMEWBGiEivyTA+6qfENaP
         EsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755626; x=1762360426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxZR2vFcKqCQTHArwAXh359MN44MgbOergiRoRTQBic=;
        b=Wi7kJm0YLz9LAkQC9+BVItSvucDHackei4a3pZykLvB5Jld3hNyBHEtdDNR4mJjRDJ
         XgUBUsylU5eVNYwq/88Iq02cZXEDj8a26KHpYo39bS4mXiAH4lQIkDiYqRlaZLvXxqHy
         Rme9fX3napR7tAr0fRRMUKPeShkBLRKFi/zgJ9daNE5DO47y3CPOI5Z1NZzRo73lD703
         WBarKkKauLxx4ECexS3G3Nm3a5fxw71axsdW+XSWTY5m7QZM7qxfViZJy9sdDcZUFuHm
         RK4aQnAcc9HjYwSUWS5TSkBVWb3SXWkGzPa79gUloFASbZCGV/4Q1Qh1OimPzrBTmINK
         ENQw==
X-Forwarded-Encrypted: i=1; AJvYcCXxpWFhjOaXS1uAWZSVcW+epLe4hXNVlUDGK7rAd++zX/V8IF9ZK6sNlUTRyzt2OfYBlTgTAT3ALz/s@vger.kernel.org
X-Gm-Message-State: AOJu0YzzNTBOtqvZ6cG5OtaPiqroZuTfzpxWbVE+YBZX24pEbz+hxx6c
	exZ0Gkb3UWVXA5GGhSejGvQFuFQoj74WtYOOP8VWQDz5dTLcuTFP8brK
X-Gm-Gg: ASbGnct2s7XKE97m0Htku0kVoNlFIrtLTgGn3sNk3I2S7CjDg6RbY6x1fcSnfMQedsb
	TiqZ08jNeQoPr6ANXRe7wxIItddYPK9IRIvVk/Pg+F/NDjajRpDoYk1+m/ody4ZhfPqBtz94K+P
	oBDrcN4v944cK0c/IZAg0mRasmf2VkPEqphncfnVDUdeIQEgQp/T/gyMwsm0+Orr4R14t34mM2e
	YCNx3lVqVUif28FpRCqBqXsXLYVnJ3Ylxx9XGbwIOilYVQujMHYwbxvv/JaGnGT9V934SETSE/J
	0YS7Pd81upkhyTUJrGl3ywEpn+u27FSpVaZU/dEx8wAGzZV/f+zd8TFTz5lYP5z6VcE7XGj+Qnd
	9i70JnHcBmPNgJ9vkucf3ugrBnHW01x8OHHGVCJet/M7t2IgYPaqqUz/NpfVYT1B7hZxg5Yzg58
	5QduAF8yr+KqINEV/tTAnQyp2RlqrLDmf//rNObpIOAH1BWyegJN9O/TwFCrQsK6Yg21bZ8ERIC
	0euWM0=
X-Google-Smtp-Source: AGHT+IGiCUEzJotH5SXgLN+vuCfpwRfWgWY8U/HYJV6c14Jnwv+Vc0PGPiTMMNlg/7DFar4Ied8xvA==
X-Received: by 2002:a17:907:72c9:b0:b54:25dc:a644 with SMTP id a640c23a62f3a-b703d5cb645mr329074966b.60.1761755625591;
        Wed, 29 Oct 2025 09:33:45 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d8540807bsm1469570266b.54.2025.10.29.09.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] syscore: Pass context data to callbacks
Date: Wed, 29 Oct 2025 17:33:30 +0100
Message-ID: <20251029163336.2785270-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Several drivers can benefit from registering per-instance data along
with the syscore operations. To achieve this, move the modifiable fields
out of the syscore_ops structure and into a separate struct syscore that
can be registered with the framework. Add a void * driver data field for
drivers to store contextual data that will be passed to the syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- extract modifiable field into separate structure so that syscore_ops
  can be constified
- upon popular request, make context data void *

Changes in v2:
- add missing kerneldoc for added ops parameter

 arch/arm/mach-exynos/mcpm-exynos.c        | 12 ++--
 arch/arm/mach-exynos/suspend.c            | 48 +++++++------
 arch/arm/mach-pxa/generic.h               |  6 +-
 arch/arm/mach-pxa/irq.c                   | 10 ++-
 arch/arm/mach-pxa/mfp-pxa2xx.c            | 10 ++-
 arch/arm/mach-pxa/mfp-pxa3xx.c            | 10 ++-
 arch/arm/mach-pxa/pxa25x.c                |  4 +-
 arch/arm/mach-pxa/pxa27x.c                |  4 +-
 arch/arm/mach-pxa/pxa3xx.c                |  4 +-
 arch/arm/mach-pxa/smemc.c                 | 12 ++--
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        | 12 ++--
 arch/arm/mach-s5pv210/pm.c                | 10 ++-
 arch/arm/mach-versatile/integrator_ap.c   | 12 ++--
 arch/arm/mm/cache-b15-rac.c               | 12 ++--
 arch/loongarch/kernel/smp.c               | 12 ++--
 arch/mips/alchemy/common/dbdma.c          | 12 ++--
 arch/mips/alchemy/common/irq.c            | 24 ++++---
 arch/mips/alchemy/common/usb.c            | 12 ++--
 arch/mips/pci/pci-alchemy.c               | 16 +++--
 arch/powerpc/platforms/cell/spu_base.c    | 10 ++-
 arch/powerpc/platforms/powermac/pic.c     | 12 ++--
 arch/powerpc/sysdev/fsl_lbc.c             | 12 ++--
 arch/powerpc/sysdev/fsl_pci.c             | 12 ++--
 arch/powerpc/sysdev/ipic.c                | 12 ++--
 arch/powerpc/sysdev/mpic.c                | 14 ++--
 arch/powerpc/sysdev/mpic_timer.c          | 10 ++-
 arch/sh/mm/pmb.c                          | 10 ++-
 arch/x86/events/amd/ibs.c                 | 12 ++--
 arch/x86/hyperv/hv_init.c                 | 12 ++--
 arch/x86/kernel/amd_gart_64.c             | 10 ++-
 arch/x86/kernel/apic/apic.c               | 12 ++--
 arch/x86/kernel/apic/io_apic.c            | 17 +++--
 arch/x86/kernel/cpu/aperfmperf.c          | 20 +++---
 arch/x86/kernel/cpu/intel_epb.c           | 16 +++--
 arch/x86/kernel/cpu/mce/core.c            | 14 ++--
 arch/x86/kernel/cpu/microcode/core.c      | 15 ++++-
 arch/x86/kernel/cpu/mtrr/legacy.c         | 12 ++--
 arch/x86/kernel/cpu/umwait.c              | 10 ++-
 arch/x86/kernel/i8237.c                   | 10 ++-
 arch/x86/kernel/i8259.c                   | 14 ++--
 arch/x86/kernel/kvm.c                     | 12 ++--
 drivers/acpi/pci_link.c                   | 10 ++-
 drivers/acpi/sleep.c                      | 12 ++--
 drivers/base/firmware_loader/main.c       | 12 ++--
 drivers/base/syscore.c                    | 82 ++++++++++++-----------
 drivers/bus/mvebu-mbus.c                  | 16 +++--
 drivers/clk/at91/pmc.c                    | 12 ++--
 drivers/clk/imx/clk-vf610.c               | 12 ++--
 drivers/clk/ingenic/jz4725b-cgu.c         |  2 +-
 drivers/clk/ingenic/jz4740-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4755-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4760-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4770-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4780-cgu.c          |  2 +-
 drivers/clk/ingenic/pm.c                  | 14 ++--
 drivers/clk/ingenic/pm.h                  |  2 +-
 drivers/clk/ingenic/tcu.c                 | 12 ++--
 drivers/clk/ingenic/x1000-cgu.c           |  2 +-
 drivers/clk/ingenic/x1830-cgu.c           |  2 +-
 drivers/clk/mvebu/common.c                | 12 ++--
 drivers/clk/rockchip/clk-rk3288.c         | 12 ++--
 drivers/clk/samsung/clk-s5pv210-audss.c   | 12 ++--
 drivers/clk/samsung/clk.c                 | 12 ++--
 drivers/clk/tegra/clk-tegra210.c          | 12 ++--
 drivers/clocksource/timer-armada-370-xp.c | 12 ++--
 drivers/cpuidle/cpuidle-psci.c            | 12 ++--
 drivers/gpio/gpio-mxc.c                   | 12 ++--
 drivers/gpio/gpio-pxa.c                   | 12 ++--
 drivers/gpio/gpio-sa1100.c                | 12 ++--
 drivers/hv/vmbus_drv.c                    | 14 ++--
 drivers/iommu/amd/init.c                  | 12 ++--
 drivers/iommu/intel/iommu.c               | 12 ++--
 drivers/irqchip/exynos-combiner.c         | 14 ++--
 drivers/irqchip/irq-armada-370-xp.c       | 12 ++--
 drivers/irqchip/irq-bcm7038-l1.c          | 12 ++--
 drivers/irqchip/irq-gic-v3-its.c          | 12 ++--
 drivers/irqchip/irq-i8259.c               | 12 ++--
 drivers/irqchip/irq-imx-gpcv2.c           | 16 +++--
 drivers/irqchip/irq-loongson-eiointc.c    | 12 ++--
 drivers/irqchip/irq-loongson-htpic.c      | 10 ++-
 drivers/irqchip/irq-loongson-htvec.c      | 12 ++--
 drivers/irqchip/irq-loongson-pch-lpc.c    | 12 ++--
 drivers/irqchip/irq-loongson-pch-pic.c    | 12 ++--
 drivers/irqchip/irq-mchp-eic.c            | 12 ++--
 drivers/irqchip/irq-mst-intc.c            | 12 ++--
 drivers/irqchip/irq-mtk-cirq.c            | 12 ++--
 drivers/irqchip/irq-renesas-rzg2l.c       | 12 ++--
 drivers/irqchip/irq-sa11x0.c              | 12 ++--
 drivers/irqchip/irq-sifive-plic.c         | 12 ++--
 drivers/irqchip/irq-sun6i-r.c             | 18 +++--
 drivers/irqchip/irq-tegra.c               | 12 ++--
 drivers/irqchip/irq-vic.c                 | 12 ++--
 drivers/leds/trigger/ledtrig-cpu.c        | 14 ++--
 drivers/macintosh/via-pmu.c               | 12 ++--
 drivers/power/reset/sc27xx-poweroff.c     | 10 ++-
 drivers/sh/clk/core.c                     | 10 ++-
 drivers/sh/intc/core.c                    | 12 ++--
 drivers/soc/bcm/brcmstb/biuctrl.c         | 12 ++--
 drivers/soc/tegra/pmc.c                   | 17 +++--
 drivers/thermal/intel/intel_hfi.c         | 12 ++--
 drivers/xen/xen-acpi-processor.c          | 12 ++--
 include/linux/syscore_ops.h               | 15 +++--
 kernel/cpu_pm.c                           | 12 ++--
 kernel/irq/generic-chip.c                 | 14 ++--
 kernel/irq/pm.c                           | 11 ++-
 kernel/printk/printk.c                    | 11 ++-
 kernel/time/sched_clock.c                 | 22 ++++--
 kernel/time/timekeeping.c                 | 22 ++++--
 virt/kvm/kvm_main.c                       | 18 +++--
 109 files changed, 896 insertions(+), 468 deletions(-)

diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
index fd0dbeb93357..cb7d8a7b14e0 100644
--- a/arch/arm/mach-exynos/mcpm-exynos.c
+++ b/arch/arm/mach-exynos/mcpm-exynos.c
@@ -215,7 +215,7 @@ static const struct of_device_id exynos_dt_mcpm_match[] = {
 	{},
 };
 
-static void exynos_mcpm_setup_entry_point(void)
+static void exynos_mcpm_setup_entry_point(void *data)
 {
 	/*
 	 * U-Boot SPL is hardcoded to jump to the start of ns_sram_base_addr
@@ -228,10 +228,14 @@ static void exynos_mcpm_setup_entry_point(void)
 	__raw_writel(__pa_symbol(mcpm_entry_point), ns_sram_base_addr + 8);
 }
 
-static struct syscore_ops exynos_mcpm_syscore_ops = {
+static const struct syscore_ops exynos_mcpm_syscore_ops = {
 	.resume	= exynos_mcpm_setup_entry_point,
 };
 
+static struct syscore exynos_mcpm_syscore = {
+	.ops = &exynos_mcpm_syscore_ops,
+};
+
 static int __init exynos_mcpm_init(void)
 {
 	struct device_node *node;
@@ -300,9 +304,9 @@ static int __init exynos_mcpm_init(void)
 		pmu_raw_writel(value, EXYNOS_COMMON_OPTION(i));
 	}
 
-	exynos_mcpm_setup_entry_point();
+	exynos_mcpm_setup_entry_point(NULL);
 
-	register_syscore_ops(&exynos_mcpm_syscore_ops);
+	register_syscore(&exynos_mcpm_syscore);
 
 	return ret;
 }
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 150a1e56dcae..22d723553f62 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -53,9 +53,9 @@ struct exynos_pm_data {
 
 	void (*pm_prepare)(void);
 	void (*pm_resume_prepare)(void);
-	void (*pm_resume)(void);
-	int (*pm_suspend)(void);
 	int (*cpu_suspend)(unsigned long);
+
+	const struct syscore_ops *syscore_ops;
 };
 
 /* Used only on Exynos542x/5800 */
@@ -376,7 +376,7 @@ static void exynos5420_pm_prepare(void)
 }
 
 
-static int exynos_pm_suspend(void)
+static int exynos_pm_suspend(void *data)
 {
 	exynos_pm_central_suspend();
 
@@ -390,7 +390,7 @@ static int exynos_pm_suspend(void)
 	return 0;
 }
 
-static int exynos5420_pm_suspend(void)
+static int exynos5420_pm_suspend(void *data)
 {
 	u32 this_cluster;
 
@@ -408,7 +408,7 @@ static int exynos5420_pm_suspend(void)
 	return 0;
 }
 
-static void exynos_pm_resume(void)
+static void exynos_pm_resume(void *data)
 {
 	u32 cpuid = read_cpuid_part();
 
@@ -429,7 +429,7 @@ static void exynos_pm_resume(void)
 	exynos_set_delayed_reset_assertion(true);
 }
 
-static void exynos3250_pm_resume(void)
+static void exynos3250_pm_resume(void *data)
 {
 	u32 cpuid = read_cpuid_part();
 
@@ -473,7 +473,7 @@ static void exynos5420_prepare_pm_resume(void)
 	}
 }
 
-static void exynos5420_pm_resume(void)
+static void exynos5420_pm_resume(void *data)
 {
 	unsigned long tmp;
 
@@ -596,41 +596,52 @@ static const struct platform_suspend_ops exynos_suspend_ops = {
 	.valid		= suspend_valid_only_mem,
 };
 
+static const struct syscore_ops exynos3250_syscore_ops = {
+	.suspend = exynos_pm_suspend,
+	.resume = exynos3250_pm_resume,
+};
+
 static const struct exynos_pm_data exynos3250_pm_data = {
 	.wkup_irq	= exynos3250_wkup_irq,
 	.wake_disable_mask = ((0xFF << 8) | (0x1F << 1)),
-	.pm_suspend	= exynos_pm_suspend,
-	.pm_resume	= exynos3250_pm_resume,
 	.pm_prepare	= exynos3250_pm_prepare,
 	.cpu_suspend	= exynos3250_cpu_suspend,
+	.syscore_ops	= &exynos3250_syscore_ops,
+};
+
+static const struct syscore_ops exynos_syscore_ops = {
+	.suspend = exynos_pm_suspend,
+	.resume = exynos_pm_resume,
 };
 
 static const struct exynos_pm_data exynos4_pm_data = {
 	.wkup_irq	= exynos4_wkup_irq,
 	.wake_disable_mask = ((0xFF << 8) | (0x1F << 1)),
-	.pm_suspend	= exynos_pm_suspend,
-	.pm_resume	= exynos_pm_resume,
 	.pm_prepare	= exynos_pm_prepare,
 	.cpu_suspend	= exynos_cpu_suspend,
+	.syscore_ops	= &exynos_syscore_ops,
 };
 
 static const struct exynos_pm_data exynos5250_pm_data = {
 	.wkup_irq	= exynos5250_wkup_irq,
 	.wake_disable_mask = ((0xFF << 8) | (0x1F << 1)),
-	.pm_suspend	= exynos_pm_suspend,
-	.pm_resume	= exynos_pm_resume,
 	.pm_prepare	= exynos_pm_prepare,
 	.cpu_suspend	= exynos_cpu_suspend,
+	.syscore_ops	= &exynos_syscore_ops,
+};
+
+static const struct syscore_ops exynos5420_syscore_ops = {
+	.resume = exynos5420_pm_resume,
+	.suspend = exynos5420_pm_suspend,
 };
 
 static const struct exynos_pm_data exynos5420_pm_data = {
 	.wkup_irq	= exynos5250_wkup_irq,
 	.wake_disable_mask = (0x7F << 7) | (0x1F << 1),
 	.pm_resume_prepare = exynos5420_prepare_pm_resume,
-	.pm_resume	= exynos5420_pm_resume,
-	.pm_suspend	= exynos5420_pm_suspend,
 	.pm_prepare	= exynos5420_pm_prepare,
 	.cpu_suspend	= exynos5420_cpu_suspend,
+	.syscore_ops	= &exynos5420_syscore_ops,
 };
 
 static const struct of_device_id exynos_pmu_of_device_ids[] __initconst = {
@@ -656,7 +667,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] __initconst = {
 	{ /*sentinel*/ },
 };
 
-static struct syscore_ops exynos_pm_syscore_ops;
+static struct syscore exynos_pm_syscore;
 
 void __init exynos_pm_init(void)
 {
@@ -684,10 +695,9 @@ void __init exynos_pm_init(void)
 	tmp |= pm_data->wake_disable_mask;
 	pmu_raw_writel(tmp, S5P_WAKEUP_MASK);
 
-	exynos_pm_syscore_ops.suspend	= pm_data->pm_suspend;
-	exynos_pm_syscore_ops.resume	= pm_data->pm_resume;
+	exynos_pm_syscore.ops = pm_data->syscore_ops;
 
-	register_syscore_ops(&exynos_pm_syscore_ops);
+	register_syscore(&exynos_pm_syscore);
 	suspend_set_ops(&exynos_suspend_ops);
 
 	/*
diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index c9c2c46ecead..caad4fca8de3 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -34,9 +34,9 @@ extern void __init pxa27x_map_io(void);
 extern void __init pxa3xx_init_irq(void);
 extern void __init pxa3xx_map_io(void);
 
-extern struct syscore_ops pxa_irq_syscore_ops;
-extern struct syscore_ops pxa2xx_mfp_syscore_ops;
-extern struct syscore_ops pxa3xx_mfp_syscore_ops;
+extern struct syscore pxa_irq_syscore;
+extern struct syscore pxa2xx_mfp_syscore;
+extern struct syscore pxa3xx_mfp_syscore;
 
 void __init pxa_set_ffuart_info(void *info);
 void __init pxa_set_btuart_info(void *info);
diff --git a/arch/arm/mach-pxa/irq.c b/arch/arm/mach-pxa/irq.c
index 5bfce8aa4102..99acebbbf065 100644
--- a/arch/arm/mach-pxa/irq.c
+++ b/arch/arm/mach-pxa/irq.c
@@ -178,7 +178,7 @@ void __init pxa_init_irq(int irq_nr, int (*fn)(struct irq_data *, unsigned int))
 static unsigned long saved_icmr[MAX_INTERNAL_IRQS/32];
 static unsigned long saved_ipr[MAX_INTERNAL_IRQS];
 
-static int pxa_irq_suspend(void)
+static int pxa_irq_suspend(void *data)
 {
 	int i;
 
@@ -197,7 +197,7 @@ static int pxa_irq_suspend(void)
 	return 0;
 }
 
-static void pxa_irq_resume(void)
+static void pxa_irq_resume(void *data)
 {
 	int i;
 
@@ -219,11 +219,15 @@ static void pxa_irq_resume(void)
 #define pxa_irq_resume		NULL
 #endif
 
-struct syscore_ops pxa_irq_syscore_ops = {
+static const struct syscore_ops pxa_irq_syscore_ops = {
 	.suspend	= pxa_irq_suspend,
 	.resume		= pxa_irq_resume,
 };
 
+struct syscore pxa_irq_syscore = {
+	.ops = &pxa_irq_syscore_ops,
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id intc_ids[] __initconst = {
 	{ .compatible = "marvell,pxa-intc", },
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.c b/arch/arm/mach-pxa/mfp-pxa2xx.c
index f5a3d890f682..d1347055fbe4 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.c
@@ -346,7 +346,7 @@ static unsigned long saved_gpdr[4];
 static unsigned long saved_gplr[4];
 static unsigned long saved_pgsr[4];
 
-static int pxa2xx_mfp_suspend(void)
+static int pxa2xx_mfp_suspend(void *data)
 {
 	int i;
 
@@ -385,7 +385,7 @@ static int pxa2xx_mfp_suspend(void)
 	return 0;
 }
 
-static void pxa2xx_mfp_resume(void)
+static void pxa2xx_mfp_resume(void *data)
 {
 	int i;
 
@@ -404,11 +404,15 @@ static void pxa2xx_mfp_resume(void)
 #define pxa2xx_mfp_resume	NULL
 #endif
 
-struct syscore_ops pxa2xx_mfp_syscore_ops = {
+static const struct syscore_ops pxa2xx_mfp_syscore_ops = {
 	.suspend	= pxa2xx_mfp_suspend,
 	.resume		= pxa2xx_mfp_resume,
 };
 
+struct syscore pxa2xx_mfp_syscore = {
+	.ops = &pxa2xx_mfp_syscore_ops,
+};
+
 static int __init pxa2xx_mfp_init(void)
 {
 	int i;
diff --git a/arch/arm/mach-pxa/mfp-pxa3xx.c b/arch/arm/mach-pxa/mfp-pxa3xx.c
index d16ab7451efe..fe7498fbb62b 100644
--- a/arch/arm/mach-pxa/mfp-pxa3xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa3xx.c
@@ -27,13 +27,13 @@
  * a pull-down mode if they're an active low chip select, and we're
  * just entering standby.
  */
-static int pxa3xx_mfp_suspend(void)
+static int pxa3xx_mfp_suspend(void *data)
 {
 	mfp_config_lpm();
 	return 0;
 }
 
-static void pxa3xx_mfp_resume(void)
+static void pxa3xx_mfp_resume(void *data)
 {
 	mfp_config_run();
 
@@ -49,7 +49,11 @@ static void pxa3xx_mfp_resume(void)
 #define pxa3xx_mfp_resume	NULL
 #endif
 
-struct syscore_ops pxa3xx_mfp_syscore_ops = {
+static const struct syscore_ops pxa3xx_mfp_syscore_ops = {
 	.suspend	= pxa3xx_mfp_suspend,
 	.resume		= pxa3xx_mfp_resume,
 };
+
+struct syscore pxa3xx_mfp_syscore = {
+	.ops = &pxa3xx_mfp_syscore_ops,
+};
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 03e34841fc00..70509a599814 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -235,8 +235,8 @@ static int __init pxa25x_init(void)
 
 		pxa25x_init_pm();
 
-		register_syscore_ops(&pxa_irq_syscore_ops);
-		register_syscore_ops(&pxa2xx_mfp_syscore_ops);
+		register_syscore(&pxa_irq_syscore);
+		register_syscore(&pxa2xx_mfp_syscore);
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index f8382477d629..ff6361979038 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -337,8 +337,8 @@ static int __init pxa27x_init(void)
 
 		pxa27x_init_pm();
 
-		register_syscore_ops(&pxa_irq_syscore_ops);
-		register_syscore_ops(&pxa2xx_mfp_syscore_ops);
+		register_syscore(&pxa_irq_syscore);
+		register_syscore(&pxa2xx_mfp_syscore);
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 1d1e5713464d..06c578ea658e 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -424,8 +424,8 @@ static int __init pxa3xx_init(void)
 		if (cpu_is_pxa320())
 			enable_irq_wake(IRQ_WAKEUP1);
 
-		register_syscore_ops(&pxa_irq_syscore_ops);
-		register_syscore_ops(&pxa3xx_mfp_syscore_ops);
+		register_syscore(&pxa_irq_syscore);
+		register_syscore(&pxa3xx_mfp_syscore);
 	}
 
 	return ret;
diff --git a/arch/arm/mach-pxa/smemc.c b/arch/arm/mach-pxa/smemc.c
index 2d2a321d82f8..fb93a8f28356 100644
--- a/arch/arm/mach-pxa/smemc.c
+++ b/arch/arm/mach-pxa/smemc.c
@@ -18,7 +18,7 @@ static unsigned long msc[2];
 static unsigned long sxcnfg, memclkcfg;
 static unsigned long csadrcfg[4];
 
-static int pxa3xx_smemc_suspend(void)
+static int pxa3xx_smemc_suspend(void *data)
 {
 	msc[0] = __raw_readl(MSC0);
 	msc[1] = __raw_readl(MSC1);
@@ -32,7 +32,7 @@ static int pxa3xx_smemc_suspend(void)
 	return 0;
 }
 
-static void pxa3xx_smemc_resume(void)
+static void pxa3xx_smemc_resume(void *data)
 {
 	__raw_writel(msc[0], MSC0);
 	__raw_writel(msc[1], MSC1);
@@ -46,11 +46,15 @@ static void pxa3xx_smemc_resume(void)
 	__raw_writel(0x2, CSMSADRCFG);
 }
 
-static struct syscore_ops smemc_syscore_ops = {
+static const struct syscore_ops smemc_syscore_ops = {
 	.suspend	= pxa3xx_smemc_suspend,
 	.resume		= pxa3xx_smemc_resume,
 };
 
+static struct syscore smemc_syscore = {
+	.ops = &smemc_syscore_ops,
+};
+
 static int __init smemc_init(void)
 {
 	if (cpu_is_pxa3xx()) {
@@ -64,7 +68,7 @@ static int __init smemc_init(void)
 		 */
 		__raw_writel(0x2, CSMSADRCFG);
 
-		register_syscore_ops(&smemc_syscore_ops);
+		register_syscore(&smemc_syscore);
 	}
 
 	return 0;
diff --git a/arch/arm/mach-s3c/irq-pm-s3c64xx.c b/arch/arm/mach-s3c/irq-pm-s3c64xx.c
index 4a1e935bada1..ab726c595001 100644
--- a/arch/arm/mach-s3c/irq-pm-s3c64xx.c
+++ b/arch/arm/mach-s3c/irq-pm-s3c64xx.c
@@ -58,7 +58,7 @@ static struct irq_grp_save {
 
 static u32 irq_uart_mask[SERIAL_SAMSUNG_UARTS];
 
-static int s3c64xx_irq_pm_suspend(void)
+static int s3c64xx_irq_pm_suspend(void *data)
 {
 	struct irq_grp_save *grp = eint_grp_save;
 	int i;
@@ -79,7 +79,7 @@ static int s3c64xx_irq_pm_suspend(void)
 	return 0;
 }
 
-static void s3c64xx_irq_pm_resume(void)
+static void s3c64xx_irq_pm_resume(void *data)
 {
 	struct irq_grp_save *grp = eint_grp_save;
 	int i;
@@ -100,18 +100,22 @@ static void s3c64xx_irq_pm_resume(void)
 	S3C_PMDBG("%s: IRQ configuration restored\n", __func__);
 }
 
-static struct syscore_ops s3c64xx_irq_syscore_ops = {
+static const struct syscore_ops s3c64xx_irq_syscore_ops = {
 	.suspend = s3c64xx_irq_pm_suspend,
 	.resume	 = s3c64xx_irq_pm_resume,
 };
 
+static struct syscore s3c64xx_irq_syscore = {
+	.ops = &s3c64xx_irq_syscore_ops,
+};
+
 static __init int s3c64xx_syscore_init(void)
 {
 	/* Appropriate drivers (pinctrl, uart) handle this when using DT. */
 	if (of_have_populated_dt() || !soc_is_s3c64xx())
 		return 0;
 
-	register_syscore_ops(&s3c64xx_irq_syscore_ops);
+	register_syscore(&s3c64xx_irq_syscore);
 
 	return 0;
 }
diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
index 6fa70f787df4..fa270750364c 100644
--- a/arch/arm/mach-s5pv210/pm.c
+++ b/arch/arm/mach-s5pv210/pm.c
@@ -195,20 +195,24 @@ static const struct platform_suspend_ops s5pv210_suspend_ops = {
 /*
  * Syscore operations used to delay restore of certain registers.
  */
-static void s5pv210_pm_resume(void)
+static void s5pv210_pm_resume(void *data)
 {
 	s3c_pm_do_restore_core(s5pv210_core_save, ARRAY_SIZE(s5pv210_core_save));
 }
 
-static struct syscore_ops s5pv210_pm_syscore_ops = {
+static const struct syscore_ops s5pv210_pm_syscore_ops = {
 	.resume		= s5pv210_pm_resume,
 };
 
+static struct syscore s5pv210_pm_syscore = {
+	.ops = &s5pv210_pm_syscore_ops,
+};
+
 /*
  * Initialization entry point.
  */
 void __init s5pv210_pm_init(void)
 {
-	register_syscore_ops(&s5pv210_pm_syscore_ops);
+	register_syscore(&s5pv210_pm_syscore);
 	suspend_set_ops(&s5pv210_suspend_ops);
 }
diff --git a/arch/arm/mach-versatile/integrator_ap.c b/arch/arm/mach-versatile/integrator_ap.c
index 4bd6712e9f52..ee90d6619d0d 100644
--- a/arch/arm/mach-versatile/integrator_ap.c
+++ b/arch/arm/mach-versatile/integrator_ap.c
@@ -63,13 +63,13 @@ static void __init ap_map_io(void)
 #ifdef CONFIG_PM
 static unsigned long ic_irq_enable;
 
-static int irq_suspend(void)
+static int irq_suspend(void *data)
 {
 	ic_irq_enable = readl(VA_IC_BASE + IRQ_ENABLE);
 	return 0;
 }
 
-static void irq_resume(void)
+static void irq_resume(void *data)
 {
 	/* disable all irq sources */
 	cm_clear_irqs();
@@ -83,14 +83,18 @@ static void irq_resume(void)
 #define irq_resume NULL
 #endif
 
-static struct syscore_ops irq_syscore_ops = {
+static const struct syscore_ops irq_syscore_ops = {
 	.suspend	= irq_suspend,
 	.resume		= irq_resume,
 };
 
+static struct syscore irq_syscore = {
+	.ops = &irq_syscore_ops,
+};
+
 static int __init irq_syscore_init(void)
 {
-	register_syscore_ops(&irq_syscore_ops);
+	register_syscore(&irq_syscore);
 
 	return 0;
 }
diff --git a/arch/arm/mm/cache-b15-rac.c b/arch/arm/mm/cache-b15-rac.c
index 6f63b90f9e1a..e7807356dfab 100644
--- a/arch/arm/mm/cache-b15-rac.c
+++ b/arch/arm/mm/cache-b15-rac.c
@@ -256,7 +256,7 @@ static int b15_rac_dead_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int b15_rac_suspend(void)
+static int b15_rac_suspend(void *data)
 {
 	/* Suspend the read-ahead cache oeprations, forcing our cache
 	 * implementation to fallback to the regular ARMv7 calls.
@@ -271,7 +271,7 @@ static int b15_rac_suspend(void)
 	return 0;
 }
 
-static void b15_rac_resume(void)
+static void b15_rac_resume(void *data)
 {
 	/* Coming out of a S3 suspend/resume cycle, the read-ahead cache
 	 * register RAC_CONFIG0_REG will be restored to its default value, make
@@ -282,11 +282,15 @@ static void b15_rac_resume(void)
 	clear_bit(RAC_SUSPENDED, &b15_rac_flags);
 }
 
-static struct syscore_ops b15_rac_syscore_ops = {
+static const struct syscore_ops b15_rac_syscore_ops = {
 	.suspend	= b15_rac_suspend,
 	.resume		= b15_rac_resume,
 };
 
+static struct syscore b15_rac_syscore = {
+	.ops = &b15_rac_syscore_ops,
+};
+
 static int __init b15_rac_init(void)
 {
 	struct device_node *dn, *cpu_dn;
@@ -347,7 +351,7 @@ static int __init b15_rac_init(void)
 	}
 
 	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore_ops(&b15_rac_syscore_ops);
+		register_syscore(&b15_rac_syscore);
 
 	spin_lock(&rac_lock);
 	reg = __raw_readl(b15_rac_base + RAC_CONFIG0_REG);
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 46036d98da75..8b2fcb3fb874 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -535,28 +535,32 @@ int hibernate_resume_nonboot_cpu_disable(void)
  */
 #ifdef CONFIG_PM
 
-static int loongson_ipi_suspend(void)
+static int loongson_ipi_suspend(void *data)
 {
 	return 0;
 }
 
-static void loongson_ipi_resume(void)
+static void loongson_ipi_resume(void *data)
 {
 	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_EN);
 }
 
-static struct syscore_ops loongson_ipi_syscore_ops = {
+static const struct syscore_ops loongson_ipi_syscore_ops = {
 	.resume         = loongson_ipi_resume,
 	.suspend        = loongson_ipi_suspend,
 };
 
+static struct syscore loongson_ipi_syscore = {
+	.ops = &loongson_ipi_syscore_ops,
+};
+
 /*
  * Enable boot cpu ipi before enabling nonboot cpus
  * during syscore_resume.
  */
 static int __init ipi_pm_init(void)
 {
-	register_syscore_ops(&loongson_ipi_syscore_ops);
+	register_syscore(&loongson_ipi_syscore);
 	return 0;
 }
 
diff --git a/arch/mips/alchemy/common/dbdma.c b/arch/mips/alchemy/common/dbdma.c
index 6a3c890f7bbf..6c2c2010bbae 100644
--- a/arch/mips/alchemy/common/dbdma.c
+++ b/arch/mips/alchemy/common/dbdma.c
@@ -982,7 +982,7 @@ u32 au1xxx_dbdma_put_dscr(u32 chanid, au1x_ddma_desc_t *dscr)
 
 static unsigned long alchemy_dbdma_pm_data[NUM_DBDMA_CHANS + 1][6];
 
-static int alchemy_dbdma_suspend(void)
+static int alchemy_dbdma_suspend(void *data)
 {
 	int i;
 	void __iomem *addr;
@@ -1019,7 +1019,7 @@ static int alchemy_dbdma_suspend(void)
 	return 0;
 }
 
-static void alchemy_dbdma_resume(void)
+static void alchemy_dbdma_resume(void *data)
 {
 	int i;
 	void __iomem *addr;
@@ -1044,11 +1044,15 @@ static void alchemy_dbdma_resume(void)
 	}
 }
 
-static struct syscore_ops alchemy_dbdma_syscore_ops = {
+static const struct syscore_ops alchemy_dbdma_syscore_ops = {
 	.suspend	= alchemy_dbdma_suspend,
 	.resume		= alchemy_dbdma_resume,
 };
 
+static struct syscore alchemy_dbdma_syscore = {
+	.ops = &alchemy_dbdma_syscore_ops,
+};
+
 static int __init dbdma_setup(unsigned int irq, dbdev_tab_t *idtable)
 {
 	int ret;
@@ -1071,7 +1075,7 @@ static int __init dbdma_setup(unsigned int irq, dbdev_tab_t *idtable)
 		printk(KERN_ERR "Cannot grab DBDMA interrupt!\n");
 	else {
 		dbdma_initialized = 1;
-		register_syscore_ops(&alchemy_dbdma_syscore_ops);
+		register_syscore(&alchemy_dbdma_syscore);
 	}
 
 	return ret;
diff --git a/arch/mips/alchemy/common/irq.c b/arch/mips/alchemy/common/irq.c
index da9f9220048f..2403afcd2fb9 100644
--- a/arch/mips/alchemy/common/irq.c
+++ b/arch/mips/alchemy/common/irq.c
@@ -758,7 +758,7 @@ static inline void alchemy_ic_resume_one(void __iomem *base, unsigned long *d)
 	wmb();
 }
 
-static int alchemy_ic_suspend(void)
+static int alchemy_ic_suspend(void *data)
 {
 	alchemy_ic_suspend_one((void __iomem *)KSEG1ADDR(AU1000_IC0_PHYS_ADDR),
 			       alchemy_gpic_pmdata);
@@ -767,7 +767,7 @@ static int alchemy_ic_suspend(void)
 	return 0;
 }
 
-static void alchemy_ic_resume(void)
+static void alchemy_ic_resume(void *data)
 {
 	alchemy_ic_resume_one((void __iomem *)KSEG1ADDR(AU1000_IC1_PHYS_ADDR),
 			      &alchemy_gpic_pmdata[7]);
@@ -775,7 +775,7 @@ static void alchemy_ic_resume(void)
 			      alchemy_gpic_pmdata);
 }
 
-static int alchemy_gpic_suspend(void)
+static int alchemy_gpic_suspend(void *data)
 {
 	void __iomem *base = (void __iomem *)KSEG1ADDR(AU1300_GPIC_PHYS_ADDR);
 	int i;
@@ -806,7 +806,7 @@ static int alchemy_gpic_suspend(void)
 	return 0;
 }
 
-static void alchemy_gpic_resume(void)
+static void alchemy_gpic_resume(void *data)
 {
 	void __iomem *base = (void __iomem *)KSEG1ADDR(AU1300_GPIC_PHYS_ADDR);
 	int i;
@@ -837,16 +837,24 @@ static void alchemy_gpic_resume(void)
 	wmb();
 }
 
-static struct syscore_ops alchemy_ic_pmops = {
+static const struct syscore_ops alchemy_ic_pmops = {
 	.suspend	= alchemy_ic_suspend,
 	.resume		= alchemy_ic_resume,
 };
 
-static struct syscore_ops alchemy_gpic_pmops = {
+static struct syscore alchemy_ic_pm = {
+	.ops = &alchemy_ic_pmops,
+};
+
+static const struct syscore_ops alchemy_gpic_pmops = {
 	.suspend	= alchemy_gpic_suspend,
 	.resume		= alchemy_gpic_resume,
 };
 
+static struct syscore alchemy_gpic_pm = {
+	.ops = &alchemy_gpic_pmops,
+};
+
 /******************************************************************************/
 
 /* create chained handlers for the 4 IC requests to the MIPS IRQ ctrl */
@@ -880,7 +888,7 @@ static void __init au1000_init_irq(struct alchemy_irqmap *map)
 
 	ic_init((void __iomem *)KSEG1ADDR(AU1000_IC0_PHYS_ADDR));
 	ic_init((void __iomem *)KSEG1ADDR(AU1000_IC1_PHYS_ADDR));
-	register_syscore_ops(&alchemy_ic_pmops);
+	register_syscore(&alchemy_ic_pm);
 	mips_cpu_irq_init();
 
 	/* register all 64 possible IC0+IC1 irq sources as type "none".
@@ -925,7 +933,7 @@ static void __init alchemy_gpic_init_irq(const struct alchemy_irqmap *dints)
 	int i;
 	void __iomem *bank_base;
 
-	register_syscore_ops(&alchemy_gpic_pmops);
+	register_syscore(&alchemy_gpic_pm);
 	mips_cpu_irq_init();
 
 	/* disable & ack all possible interrupt sources */
diff --git a/arch/mips/alchemy/common/usb.c b/arch/mips/alchemy/common/usb.c
index 5d618547ebf0..a55f32bf517c 100644
--- a/arch/mips/alchemy/common/usb.c
+++ b/arch/mips/alchemy/common/usb.c
@@ -580,22 +580,26 @@ static void alchemy_usb_pm(int susp)
 	}
 }
 
-static int alchemy_usb_suspend(void)
+static int alchemy_usb_suspend(void *data)
 {
 	alchemy_usb_pm(1);
 	return 0;
 }
 
-static void alchemy_usb_resume(void)
+static void alchemy_usb_resume(void *data)
 {
 	alchemy_usb_pm(0);
 }
 
-static struct syscore_ops alchemy_usb_pm_ops = {
+static const struct syscore_ops alchemy_usb_pm_syscore_ops = {
 	.suspend	= alchemy_usb_suspend,
 	.resume		= alchemy_usb_resume,
 };
 
+static struct syscore alchemy_usb_pm_syscore = {
+	.ops = &alchemy_usb_pm_syscore_ops,
+};
+
 static int __init alchemy_usb_init(void)
 {
 	int ret = 0;
@@ -620,7 +624,7 @@ static int __init alchemy_usb_init(void)
 	}
 
 	if (!ret)
-		register_syscore_ops(&alchemy_usb_pm_ops);
+		register_syscore(&alchemy_usb_pm_syscore);
 
 	return ret;
 }
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 58625d1b6465..6bfee0f71803 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -304,7 +304,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 }
 
 /* save PCI controller register contents. */
-static int alchemy_pci_suspend(void)
+static int alchemy_pci_suspend(void *data)
 {
 	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
 	if (!ctx)
@@ -326,7 +326,7 @@ static int alchemy_pci_suspend(void)
 	return 0;
 }
 
-static void alchemy_pci_resume(void)
+static void alchemy_pci_resume(void *data)
 {
 	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
 	if (!ctx)
@@ -354,9 +354,13 @@ static void alchemy_pci_resume(void)
 	alchemy_pci_wired_entry(ctx);	/* install it */
 }
 
-static struct syscore_ops alchemy_pci_pmops = {
-	.suspend	= alchemy_pci_suspend,
-	.resume		= alchemy_pci_resume,
+static const struct syscore_ops alchemy_pci_syscore_ops = {
+	.suspend = alchemy_pci_suspend,
+	.resume = alchemy_pci_resume,
+};
+
+static struct syscore alchemy_pci_syscore = {
+	.ops = &alchemy_pci_syscore_ops,
 };
 
 static int alchemy_pci_probe(struct platform_device *pdev)
@@ -478,7 +482,7 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 
 	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore_ops(&alchemy_pci_pmops);
+	register_syscore(&alchemy_pci_syscore);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index 733b512992c0..3c8624870967 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -726,7 +726,7 @@ static inline void crash_register_spus(struct list_head *list)
 }
 #endif
 
-static void spu_shutdown(void)
+static void spu_shutdown(void *data)
 {
 	struct spu *spu;
 
@@ -738,10 +738,14 @@ static void spu_shutdown(void)
 	mutex_unlock(&spu_full_list_mutex);
 }
 
-static struct syscore_ops spu_syscore_ops = {
+static const struct syscore_ops spu_syscore_ops = {
 	.shutdown = spu_shutdown,
 };
 
+static struct syscore spu_syscore = {
+	.ops = &spu_syscore_ops,
+};
+
 static int __init init_spu_base(void)
 {
 	int i, ret = 0;
@@ -774,7 +778,7 @@ static int __init init_spu_base(void)
 	crash_register_spus(&spu_full_list);
 	mutex_unlock(&spu_full_list_mutex);
 	spu_add_dev_attr(&dev_attr_stat);
-	register_syscore_ops(&spu_syscore_ops);
+	register_syscore(&spu_syscore);
 
 	spu_init_affinity();
 
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index c37783a03d25..1959cc13438f 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -600,7 +600,7 @@ static int pmacpic_find_viaint(void)
 	return viaint;
 }
 
-static int pmacpic_suspend(void)
+static int pmacpic_suspend(void *data)
 {
 	int viaint = pmacpic_find_viaint();
 
@@ -621,7 +621,7 @@ static int pmacpic_suspend(void)
         return 0;
 }
 
-static void pmacpic_resume(void)
+static void pmacpic_resume(void *data)
 {
 	int i;
 
@@ -634,15 +634,19 @@ static void pmacpic_resume(void)
 			pmac_unmask_irq(irq_get_irq_data(i));
 }
 
-static struct syscore_ops pmacpic_syscore_ops = {
+static const struct syscore_ops pmacpic_syscore_ops = {
 	.suspend	= pmacpic_suspend,
 	.resume		= pmacpic_resume,
 };
 
+static struct syscore pmacpic_syscore = {
+	.ops = &pmacpic_syscore_ops,
+};
+
 static int __init init_pmacpic_syscore(void)
 {
 	if (pmac_irq_hw[0])
-		register_syscore_ops(&pmacpic_syscore_ops);
+		register_syscore(&pmacpic_syscore);
 	return 0;
 }
 
diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 217cea150987..7ed07232a69a 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -350,7 +350,7 @@ static int fsl_lbc_ctrl_probe(struct platform_device *dev)
 #ifdef CONFIG_SUSPEND
 
 /* save lbc registers */
-static int fsl_lbc_syscore_suspend(void)
+static int fsl_lbc_syscore_suspend(void *data)
 {
 	struct fsl_lbc_ctrl *ctrl;
 	struct fsl_lbc_regs __iomem *lbc;
@@ -374,7 +374,7 @@ static int fsl_lbc_syscore_suspend(void)
 }
 
 /* restore lbc registers */
-static void fsl_lbc_syscore_resume(void)
+static void fsl_lbc_syscore_resume(void *data)
 {
 	struct fsl_lbc_ctrl *ctrl;
 	struct fsl_lbc_regs __iomem *lbc;
@@ -408,10 +408,14 @@ static const struct of_device_id fsl_lbc_match[] = {
 };
 
 #ifdef CONFIG_SUSPEND
-static struct syscore_ops lbc_syscore_pm_ops = {
+static const struct syscore_ops lbc_syscore_pm_ops = {
 	.suspend = fsl_lbc_syscore_suspend,
 	.resume = fsl_lbc_syscore_resume,
 };
+
+static struct syscore lbc_syscore_pm = {
+	.ops = &lbc_syscore_pm_ops,
+};
 #endif
 
 static struct platform_driver fsl_lbc_ctrl_driver = {
@@ -425,7 +429,7 @@ static struct platform_driver fsl_lbc_ctrl_driver = {
 static int __init fsl_lbc_init(void)
 {
 #ifdef CONFIG_SUSPEND
-	register_syscore_ops(&lbc_syscore_pm_ops);
+	register_syscore(&lbc_syscore_pm);
 #endif
 	return platform_driver_register(&fsl_lbc_ctrl_driver);
 }
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index ef7707ea0db7..4e501654cb41 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1258,7 +1258,7 @@ static void fsl_pci_syscore_do_suspend(struct pci_controller *hose)
 	send_pme_turnoff_message(hose);
 }
 
-static int fsl_pci_syscore_suspend(void)
+static int fsl_pci_syscore_suspend(void *data)
 {
 	struct pci_controller *hose, *tmp;
 
@@ -1291,7 +1291,7 @@ static void fsl_pci_syscore_do_resume(struct pci_controller *hose)
 	setup_pci_atmu(hose);
 }
 
-static void fsl_pci_syscore_resume(void)
+static void fsl_pci_syscore_resume(void *data)
 {
 	struct pci_controller *hose, *tmp;
 
@@ -1299,10 +1299,14 @@ static void fsl_pci_syscore_resume(void)
 		fsl_pci_syscore_do_resume(hose);
 }
 
-static struct syscore_ops pci_syscore_pm_ops = {
+static const struct syscore_ops pci_syscore_pm_ops = {
 	.suspend = fsl_pci_syscore_suspend,
 	.resume = fsl_pci_syscore_resume,
 };
+
+static struct syscore pci_syscore_pm = {
+	.ops = &pci_syscore_pm_ops,
+};
 #endif
 
 void fsl_pcibios_fixup_phb(struct pci_controller *phb)
@@ -1359,7 +1363,7 @@ static struct platform_driver fsl_pci_driver = {
 static int __init fsl_pci_init(void)
 {
 #ifdef CONFIG_PM_SLEEP
-	register_syscore_ops(&pci_syscore_pm_ops);
+	register_syscore(&pci_syscore_pm);
 #endif
 	return platform_driver_register(&fsl_pci_driver);
 }
diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 70be2105865d..290ba8427239 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -817,7 +817,7 @@ static struct {
 	u32 sercr;
 } ipic_saved_state;
 
-static int ipic_suspend(void)
+static int ipic_suspend(void *data)
 {
 	struct ipic *ipic = primary_ipic;
 
@@ -848,7 +848,7 @@ static int ipic_suspend(void)
 	return 0;
 }
 
-static void ipic_resume(void)
+static void ipic_resume(void *data)
 {
 	struct ipic *ipic = primary_ipic;
 
@@ -870,18 +870,22 @@ static void ipic_resume(void)
 #define ipic_resume NULL
 #endif
 
-static struct syscore_ops ipic_syscore_ops = {
+static const struct syscore_ops ipic_syscore_ops = {
 	.suspend = ipic_suspend,
 	.resume = ipic_resume,
 };
 
+static struct syscore ipic_syscore = {
+	.ops = &ipic_syscore_ops,
+};
+
 static int __init init_ipic_syscore(void)
 {
 	if (!primary_ipic || !primary_ipic->regs)
 		return -ENODEV;
 
 	printk(KERN_DEBUG "Registering ipic system core operations\n");
-	register_syscore_ops(&ipic_syscore_ops);
+	register_syscore(&ipic_syscore);
 
 	return 0;
 }
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index ad7310bba00b..67e51998d1ae 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1944,7 +1944,7 @@ static void mpic_suspend_one(struct mpic *mpic)
 	}
 }
 
-static int mpic_suspend(void)
+static int mpic_suspend(void *data)
 {
 	struct mpic *mpic = mpics;
 
@@ -1986,7 +1986,7 @@ static void mpic_resume_one(struct mpic *mpic)
 	} /* end for loop */
 }
 
-static void mpic_resume(void)
+static void mpic_resume(void *data)
 {
 	struct mpic *mpic = mpics;
 
@@ -1996,19 +1996,23 @@ static void mpic_resume(void)
 	}
 }
 
-static struct syscore_ops mpic_syscore_ops = {
+static const struct syscore_ops mpic_syscore_ops = {
 	.resume = mpic_resume,
 	.suspend = mpic_suspend,
 };
 
+static struct syscore mpic_syscore = {
+	.ops = &mpic_syscore_ops,
+};
+
 static int mpic_init_sys(void)
 {
 	int rc;
 
-	register_syscore_ops(&mpic_syscore_ops);
+	register_syscore(&mpic_syscore);
 	rc = subsys_system_register(&mpic_subsys, NULL);
 	if (rc) {
-		unregister_syscore_ops(&mpic_syscore_ops);
+		unregister_syscore(&mpic_syscore);
 		pr_err("mpic: Failed to register subsystem!\n");
 		return rc;
 	}
diff --git a/arch/powerpc/sysdev/mpic_timer.c b/arch/powerpc/sysdev/mpic_timer.c
index 7166e2e0baaf..60f5b3934b51 100644
--- a/arch/powerpc/sysdev/mpic_timer.c
+++ b/arch/powerpc/sysdev/mpic_timer.c
@@ -519,7 +519,7 @@ static void __init timer_group_init(struct device_node *np)
 	kfree(priv);
 }
 
-static void mpic_timer_resume(void)
+static void mpic_timer_resume(void *data)
 {
 	struct timer_group_priv *priv;
 
@@ -535,10 +535,14 @@ static const struct of_device_id mpic_timer_ids[] = {
 	{},
 };
 
-static struct syscore_ops mpic_timer_syscore_ops = {
+static const struct syscore_ops mpic_timer_syscore_ops = {
 	.resume = mpic_timer_resume,
 };
 
+static struct syscore mpic_timer_syscore = {
+	.ops = &mpic_timer_syscore_ops,
+};
+
 static int __init mpic_timer_init(void)
 {
 	struct device_node *np = NULL;
@@ -546,7 +550,7 @@ static int __init mpic_timer_init(void)
 	for_each_matching_node(np, mpic_timer_ids)
 		timer_group_init(np);
 
-	register_syscore_ops(&mpic_timer_syscore_ops);
+	register_syscore(&mpic_timer_syscore);
 
 	if (list_empty(&timer_group_list))
 		return -ENODEV;
diff --git a/arch/sh/mm/pmb.c b/arch/sh/mm/pmb.c
index 68eb7cc6e564..482eec50f404 100644
--- a/arch/sh/mm/pmb.c
+++ b/arch/sh/mm/pmb.c
@@ -857,7 +857,7 @@ static int __init pmb_debugfs_init(void)
 subsys_initcall(pmb_debugfs_init);
 
 #ifdef CONFIG_PM
-static void pmb_syscore_resume(void)
+static void pmb_syscore_resume(void *data)
 {
 	struct pmb_entry *pmbe;
 	int i;
@@ -874,13 +874,17 @@ static void pmb_syscore_resume(void)
 	read_unlock(&pmb_rwlock);
 }
 
-static struct syscore_ops pmb_syscore_ops = {
+static const struct syscore_ops pmb_syscore_ops = {
 	.resume = pmb_syscore_resume,
 };
 
+static struct syscore pmb_syscore = {
+	.ops = &pmb_syscore_ops,
+};
+
 static int __init pmb_sysdev_init(void)
 {
-	register_syscore_ops(&pmb_syscore_ops);
+	register_syscore(&pmb_syscore);
 	return 0;
 }
 subsys_initcall(pmb_sysdev_init);
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 112f43b23ebf..aca89f23d2e0 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1718,26 +1718,30 @@ static int x86_pmu_amd_ibs_starting_cpu(unsigned int cpu)
 
 #ifdef CONFIG_PM
 
-static int perf_ibs_suspend(void)
+static int perf_ibs_suspend(void *data)
 {
 	clear_APIC_ibs();
 	return 0;
 }
 
-static void perf_ibs_resume(void)
+static void perf_ibs_resume(void *data)
 {
 	ibs_eilvt_setup();
 	setup_APIC_ibs();
 }
 
-static struct syscore_ops perf_ibs_syscore_ops = {
+static const struct syscore_ops perf_ibs_syscore_ops = {
 	.resume		= perf_ibs_resume,
 	.suspend	= perf_ibs_suspend,
 };
 
+static struct syscore perf_ibs_syscore = {
+	.ops = &perf_ibs_syscore_ops,
+};
+
 static void perf_ibs_pm_init(void)
 {
-	register_syscore_ops(&perf_ibs_syscore_ops);
+	register_syscore(&perf_ibs_syscore);
 }
 
 #else
diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index e28737ec7054..c08a9cc1be89 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -358,7 +358,7 @@ static int __init hv_pci_init(void)
 	return 1;
 }
 
-static int hv_suspend(void)
+static int hv_suspend(void *data)
 {
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int ret;
@@ -385,7 +385,7 @@ static int hv_suspend(void)
 	return ret;
 }
 
-static void hv_resume(void)
+static void hv_resume(void *data)
 {
 	union hv_x64_msr_hypercall_contents hypercall_msr;
 	int ret;
@@ -412,11 +412,15 @@ static void hv_resume(void)
 }
 
 /* Note: when the ops are called, only CPU0 is online and IRQs are disabled. */
-static struct syscore_ops hv_syscore_ops = {
+static const struct syscore_ops hv_syscore_ops = {
 	.suspend	= hv_suspend,
 	.resume		= hv_resume,
 };
 
+static struct syscore hv_syscore = {
+	.ops = &hv_syscore_ops,
+};
+
 static void (* __initdata old_setup_percpu_clockev)(void);
 
 static void __init hv_stimer_setup_percpu_clockev(void)
@@ -577,7 +581,7 @@ void __init hyperv_init(void)
 
 	x86_init.pci.arch_init = hv_pci_init;
 
-	register_syscore_ops(&hv_syscore_ops);
+	register_syscore(&hv_syscore);
 
 	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
 		hv_get_partition_id();
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 3485d419c2f5..e6e68a31634c 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -591,7 +591,7 @@ static void gart_fixup_northbridges(void)
 	}
 }
 
-static void gart_resume(void)
+static void gart_resume(void *data)
 {
 	pr_info("PCI-DMA: Resuming GART IOMMU\n");
 
@@ -600,11 +600,15 @@ static void gart_resume(void)
 	enable_gart_translations();
 }
 
-static struct syscore_ops gart_syscore_ops = {
+static const struct syscore_ops gart_syscore_ops = {
 	.resume		= gart_resume,
 
 };
 
+static struct syscore gart_syscore = {
+	.ops = &gart_syscore_ops,
+};
+
 /*
  * Private Northbridge GATT initialization in case we cannot use the
  * AGP driver for some reason.
@@ -650,7 +654,7 @@ static __init int init_amd_gatt(struct agp_kern_info *info)
 
 	agp_gatt_table = gatt;
 
-	register_syscore_ops(&gart_syscore_ops);
+	register_syscore(&gart_syscore);
 
 	flush_gart();
 
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 680d305589a3..fd87b1562c7e 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2381,7 +2381,7 @@ static struct {
 	unsigned int apic_cmci;
 } apic_pm_state;
 
-static int lapic_suspend(void)
+static int lapic_suspend(void *data)
 {
 	unsigned long flags;
 	int maxlvt;
@@ -2429,7 +2429,7 @@ static int lapic_suspend(void)
 	return 0;
 }
 
-static void lapic_resume(void)
+static void lapic_resume(void *data)
 {
 	unsigned int l, h;
 	unsigned long flags;
@@ -2504,11 +2504,15 @@ static void lapic_resume(void)
  * are needed on every CPU up until machine_halt/restart/poweroff.
  */
 
-static struct syscore_ops lapic_syscore_ops = {
+static const struct syscore_ops lapic_syscore_ops = {
 	.resume		= lapic_resume,
 	.suspend	= lapic_suspend,
 };
 
+static struct syscore lapic_syscore = {
+	.ops = &lapic_syscore_ops,
+};
+
 static void apic_pm_activate(void)
 {
 	apic_pm_state.active = 1;
@@ -2518,7 +2522,7 @@ static int __init init_lapic_sysfs(void)
 {
 	/* XXX: remove suspend/resume procs if !apic_pm_state.active? */
 	if (boot_cpu_has(X86_FEATURE_APIC))
-		register_syscore_ops(&lapic_syscore_ops);
+		register_syscore(&lapic_syscore);
 
 	return 0;
 }
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index 1e0442e867b1..28f934f05a85 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2308,7 +2308,12 @@ static void resume_ioapic_id(int ioapic_idx)
 	}
 }
 
-static void ioapic_resume(void)
+static int ioapic_suspend(void *data)
+{
+	return save_ioapic_entries();
+}
+
+static void ioapic_resume(void *data)
 {
 	int ioapic_idx;
 
@@ -2318,14 +2323,18 @@ static void ioapic_resume(void)
 	restore_ioapic_entries();
 }
 
-static struct syscore_ops ioapic_syscore_ops = {
-	.suspend	= save_ioapic_entries,
+static const struct syscore_ops ioapic_syscore_ops = {
+	.suspend	= ioapic_suspend,
 	.resume		= ioapic_resume,
 };
 
+static struct syscore ioapic_syscore = {
+	.ops = &ioapic_syscore_ops,
+};
+
 static int __init ioapic_init_ops(void)
 {
-	register_syscore_ops(&ioapic_syscore_ops);
+	register_syscore(&ioapic_syscore);
 
 	return 0;
 }
diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
index a315b0627dfb..7ffc78d5ebf2 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -37,7 +37,7 @@ static DEFINE_PER_CPU_SHARED_ALIGNED(struct aperfmperf, cpu_samples) = {
 	.seq = SEQCNT_ZERO(cpu_samples.seq)
 };
 
-static void init_counter_refs(void)
+static void init_counter_refs(void *data)
 {
 	u64 aperf, mperf;
 
@@ -289,16 +289,20 @@ static bool __init intel_set_max_freq_ratio(void)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static struct syscore_ops freq_invariance_syscore_ops = {
+static const struct syscore_ops freq_invariance_syscore_ops = {
 	.resume = init_counter_refs,
 };
 
-static void register_freq_invariance_syscore_ops(void)
+static struct syscore freq_invariance_syscore = {
+	.ops = &freq_invariance_syscore_ops,
+};
+
+static void register_freq_invariance_syscore(void)
 {
-	register_syscore_ops(&freq_invariance_syscore_ops);
+	register_syscore(&freq_invariance_syscore);
 }
 #else
-static inline void register_freq_invariance_syscore_ops(void) {}
+static inline void register_freq_invariance_syscore(void) {}
 #endif
 
 static void freq_invariance_enable(void)
@@ -308,7 +312,7 @@ static void freq_invariance_enable(void)
 		return;
 	}
 	static_branch_enable_cpuslocked(&arch_scale_freq_key);
-	register_freq_invariance_syscore_ops();
+	register_freq_invariance_syscore();
 	pr_info("Estimated ratio of average max frequency by base frequency (times 1024): %llu\n", arch_max_freq_ratio);
 }
 
@@ -535,7 +539,7 @@ static int __init bp_init_aperfmperf(void)
 	if (!cpu_feature_enabled(X86_FEATURE_APERFMPERF))
 		return 0;
 
-	init_counter_refs();
+	init_counter_refs(NULL);
 	bp_init_freq_invariance();
 	return 0;
 }
@@ -544,5 +548,5 @@ early_initcall(bp_init_aperfmperf);
 void ap_init_aperfmperf(void)
 {
 	if (cpu_feature_enabled(X86_FEATURE_APERFMPERF))
-		init_counter_refs();
+		init_counter_refs(NULL);
 }
diff --git a/arch/x86/kernel/cpu/intel_epb.c b/arch/x86/kernel/cpu/intel_epb.c
index bc7671f920a7..2c56f8730f59 100644
--- a/arch/x86/kernel/cpu/intel_epb.c
+++ b/arch/x86/kernel/cpu/intel_epb.c
@@ -75,7 +75,7 @@ static u8 energ_perf_values[] = {
 	[EPB_INDEX_POWERSAVE] = ENERGY_PERF_BIAS_POWERSAVE,
 };
 
-static int intel_epb_save(void)
+static int intel_epb_save(void *data)
 {
 	u64 epb;
 
@@ -89,7 +89,7 @@ static int intel_epb_save(void)
 	return 0;
 }
 
-static void intel_epb_restore(void)
+static void intel_epb_restore(void *data)
 {
 	u64 val = this_cpu_read(saved_epb);
 	u64 epb;
@@ -114,11 +114,15 @@ static void intel_epb_restore(void)
 	wrmsrq(MSR_IA32_ENERGY_PERF_BIAS, (epb & ~EPB_MASK) | val);
 }
 
-static struct syscore_ops intel_epb_syscore_ops = {
+static const struct syscore_ops intel_epb_syscore_ops = {
 	.suspend = intel_epb_save,
 	.resume = intel_epb_restore,
 };
 
+static struct syscore intel_epb_syscore = {
+	.ops = &intel_epb_syscore_ops,
+};
+
 static const char * const energy_perf_strings[] = {
 	[EPB_INDEX_PERFORMANCE] = "performance",
 	[EPB_INDEX_BALANCE_PERFORMANCE] = "balance-performance",
@@ -185,7 +189,7 @@ static int intel_epb_online(unsigned int cpu)
 {
 	struct device *cpu_dev = get_cpu_device(cpu);
 
-	intel_epb_restore();
+	intel_epb_restore(NULL);
 	if (!cpuhp_tasks_frozen)
 		sysfs_merge_group(&cpu_dev->kobj, &intel_epb_attr_group);
 
@@ -199,7 +203,7 @@ static int intel_epb_offline(unsigned int cpu)
 	if (!cpuhp_tasks_frozen)
 		sysfs_unmerge_group(&cpu_dev->kobj, &intel_epb_attr_group);
 
-	intel_epb_save();
+	intel_epb_save(NULL);
 	return 0;
 }
 
@@ -230,7 +234,7 @@ static __init int intel_epb_init(void)
 	if (ret < 0)
 		goto err_out_online;
 
-	register_syscore_ops(&intel_epb_syscore_ops);
+	register_syscore(&intel_epb_syscore);
 	return 0;
 
 err_out_online:
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 460e90a1a0b1..23bfbc7dfb8e 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2410,13 +2410,13 @@ static void vendor_disable_error_reporting(void)
 	mce_disable_error_reporting();
 }
 
-static int mce_syscore_suspend(void)
+static int mce_syscore_suspend(void *data)
 {
 	vendor_disable_error_reporting();
 	return 0;
 }
 
-static void mce_syscore_shutdown(void)
+static void mce_syscore_shutdown(void *data)
 {
 	vendor_disable_error_reporting();
 }
@@ -2426,7 +2426,7 @@ static void mce_syscore_shutdown(void)
  * Only one CPU is active at this time, the others get re-added later using
  * CPU hotplug:
  */
-static void mce_syscore_resume(void)
+static void mce_syscore_resume(void *data)
 {
 	__mcheck_cpu_init_generic();
 	__mcheck_cpu_init_vendor(raw_cpu_ptr(&cpu_info));
@@ -2434,12 +2434,16 @@ static void mce_syscore_resume(void)
 	cr4_set_bits(X86_CR4_MCE);
 }
 
-static struct syscore_ops mce_syscore_ops = {
+static const struct syscore_ops mce_syscore_ops = {
 	.suspend	= mce_syscore_suspend,
 	.shutdown	= mce_syscore_shutdown,
 	.resume		= mce_syscore_resume,
 };
 
+static struct syscore mce_syscore = {
+	.ops = &mce_syscore_ops,
+};
+
 /*
  * mce_device: Sysfs support
  */
@@ -2840,7 +2844,7 @@ static __init int mcheck_init_device(void)
 	if (err < 0)
 		goto err_out_online;
 
-	register_syscore_ops(&mce_syscore_ops);
+	register_syscore(&mce_syscore);
 
 	return 0;
 
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index d7baec8ec0b4..e1fdc7a64c0f 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -823,8 +823,17 @@ void microcode_bsp_resume(void)
 		reload_early_microcode(cpu);
 }
 
-static struct syscore_ops mc_syscore_ops = {
-	.resume	= microcode_bsp_resume,
+static void microcode_bsp_syscore_resume(void *data)
+{
+	microcode_bsp_resume();
+}
+
+static const struct syscore_ops mc_syscore_ops = {
+	.resume	= microcode_bsp_syscore_resume,
+};
+
+static struct syscore mc_syscore = {
+	.ops = &mc_syscore_ops,
 };
 
 static int mc_cpu_online(unsigned int cpu)
@@ -903,7 +912,7 @@ static int __init microcode_init(void)
 		}
 	}
 
-	register_syscore_ops(&mc_syscore_ops);
+	register_syscore(&mc_syscore);
 	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "x86/microcode:online",
 			  mc_cpu_online, mc_cpu_down_prep);
 
diff --git a/arch/x86/kernel/cpu/mtrr/legacy.c b/arch/x86/kernel/cpu/mtrr/legacy.c
index d25882fcf181..2415ffaaf02c 100644
--- a/arch/x86/kernel/cpu/mtrr/legacy.c
+++ b/arch/x86/kernel/cpu/mtrr/legacy.c
@@ -41,7 +41,7 @@ struct mtrr_value {
 
 static struct mtrr_value *mtrr_value;
 
-static int mtrr_save(void)
+static int mtrr_save(void *data)
 {
 	int i;
 
@@ -56,7 +56,7 @@ static int mtrr_save(void)
 	return 0;
 }
 
-static void mtrr_restore(void)
+static void mtrr_restore(void *data)
 {
 	int i;
 
@@ -69,11 +69,15 @@ static void mtrr_restore(void)
 	}
 }
 
-static struct syscore_ops mtrr_syscore_ops = {
+static const struct syscore_ops mtrr_syscore_ops = {
 	.suspend	= mtrr_save,
 	.resume		= mtrr_restore,
 };
 
+static struct syscore mtrr_syscore = {
+	.ops = &mtrr_syscore_ops,
+};
+
 void mtrr_register_syscore(void)
 {
 	mtrr_value = kcalloc(num_var_ranges, sizeof(*mtrr_value), GFP_KERNEL);
@@ -86,5 +90,5 @@ void mtrr_register_syscore(void)
 	 * TBD: is there any system with such CPU which supports
 	 * suspend/resume? If no, we should remove the code.
 	 */
-	register_syscore_ops(&mtrr_syscore_ops);
+	register_syscore(&mtrr_syscore);
 }
diff --git a/arch/x86/kernel/cpu/umwait.c b/arch/x86/kernel/cpu/umwait.c
index 933fcd7ff250..e4a31c536642 100644
--- a/arch/x86/kernel/cpu/umwait.c
+++ b/arch/x86/kernel/cpu/umwait.c
@@ -86,15 +86,19 @@ static int umwait_cpu_offline(unsigned int cpu)
  * trust the firmware nor does it matter if the same value is written
  * again.
  */
-static void umwait_syscore_resume(void)
+static void umwait_syscore_resume(void *data)
 {
 	umwait_update_control_msr(NULL);
 }
 
-static struct syscore_ops umwait_syscore_ops = {
+static const struct syscore_ops umwait_syscore_ops = {
 	.resume	= umwait_syscore_resume,
 };
 
+static struct syscore umwait_syscore = {
+	.ops = &umwait_syscore_ops,
+};
+
 /* sysfs interface */
 
 /*
@@ -226,7 +230,7 @@ static int __init umwait_init(void)
 		return ret;
 	}
 
-	register_syscore_ops(&umwait_syscore_ops);
+	register_syscore(&umwait_syscore);
 
 	/*
 	 * Add umwait control interface. Ignore failure, so at least the
diff --git a/arch/x86/kernel/i8237.c b/arch/x86/kernel/i8237.c
index 2cd124ad9380..896d46b44284 100644
--- a/arch/x86/kernel/i8237.c
+++ b/arch/x86/kernel/i8237.c
@@ -19,7 +19,7 @@
  * in asm/dma.h.
  */
 
-static void i8237A_resume(void)
+static void i8237A_resume(void *data)
 {
 	unsigned long flags;
 	int i;
@@ -41,10 +41,14 @@ static void i8237A_resume(void)
 	release_dma_lock(flags);
 }
 
-static struct syscore_ops i8237_syscore_ops = {
+static const struct syscore_ops i8237_syscore_ops = {
 	.resume		= i8237A_resume,
 };
 
+static struct syscore i8237_syscore = {
+	.ops = &i8237_syscore_ops,
+};
+
 static int __init i8237A_init_ops(void)
 {
 	/*
@@ -70,7 +74,7 @@ static int __init i8237A_init_ops(void)
 	if (x86_pnpbios_disabled() && dmi_get_bios_year() >= 2017)
 		return -ENODEV;
 
-	register_syscore_ops(&i8237_syscore_ops);
+	register_syscore(&i8237_syscore);
 	return 0;
 }
 device_initcall(i8237A_init_ops);
diff --git a/arch/x86/kernel/i8259.c b/arch/x86/kernel/i8259.c
index 2bade73f49e3..f67063df6723 100644
--- a/arch/x86/kernel/i8259.c
+++ b/arch/x86/kernel/i8259.c
@@ -247,19 +247,19 @@ static void save_ELCR(char *trigger)
 	trigger[1] = inb(PIC_ELCR2) & 0xDE;
 }
 
-static void i8259A_resume(void)
+static void i8259A_resume(void *data)
 {
 	init_8259A(i8259A_auto_eoi);
 	restore_ELCR(irq_trigger);
 }
 
-static int i8259A_suspend(void)
+static int i8259A_suspend(void *data)
 {
 	save_ELCR(irq_trigger);
 	return 0;
 }
 
-static void i8259A_shutdown(void)
+static void i8259A_shutdown(void *data)
 {
 	/* Put the i8259A into a quiescent state that
 	 * the kernel initialization code can get it
@@ -269,12 +269,16 @@ static void i8259A_shutdown(void)
 	outb(0xff, PIC_SLAVE_IMR);	/* mask all of 8259A-2 */
 }
 
-static struct syscore_ops i8259_syscore_ops = {
+static const struct syscore_ops i8259_syscore_ops = {
 	.suspend = i8259A_suspend,
 	.resume = i8259A_resume,
 	.shutdown = i8259A_shutdown,
 };
 
+static struct syscore i8259_syscore = {
+	.ops = &i8259_syscore_ops,
+};
+
 static void mask_8259A(void)
 {
 	unsigned long flags;
@@ -444,7 +448,7 @@ EXPORT_SYMBOL(legacy_pic);
 static int __init i8259A_init_ops(void)
 {
 	if (legacy_pic == &default_legacy_pic)
-		register_syscore_ops(&i8259_syscore_ops);
+		register_syscore(&i8259_syscore);
 
 	return 0;
 }
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b67d7c59dca0..1500852ba03c 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -720,7 +720,7 @@ static int kvm_cpu_down_prepare(unsigned int cpu)
 
 #endif
 
-static int kvm_suspend(void)
+static int kvm_suspend(void *data)
 {
 	u64 val = 0;
 
@@ -734,7 +734,7 @@ static int kvm_suspend(void)
 	return 0;
 }
 
-static void kvm_resume(void)
+static void kvm_resume(void *data)
 {
 	kvm_cpu_online(raw_smp_processor_id());
 
@@ -744,11 +744,15 @@ static void kvm_resume(void)
 #endif
 }
 
-static struct syscore_ops kvm_syscore_ops = {
+static const struct syscore_ops kvm_syscore_ops = {
 	.suspend	= kvm_suspend,
 	.resume		= kvm_resume,
 };
 
+static struct syscore kvm_syscore = {
+	.ops = &kvm_syscore_ops,
+};
+
 static void kvm_pv_guest_cpu_reboot(void *unused)
 {
 	kvm_guest_cpu_offline(true);
@@ -858,7 +862,7 @@ static void __init kvm_guest_init(void)
 	machine_ops.crash_shutdown = kvm_crash_shutdown;
 #endif
 
-	register_syscore_ops(&kvm_syscore_ops);
+	register_syscore(&kvm_syscore);
 
 	/*
 	 * Hard lockup detection is enabled by default. Disable it, as guests
diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
index e4560b33b8ad..bed7dc85612e 100644
--- a/drivers/acpi/pci_link.c
+++ b/drivers/acpi/pci_link.c
@@ -761,7 +761,7 @@ static int acpi_pci_link_resume(struct acpi_pci_link *link)
 	return 0;
 }
 
-static void irqrouter_resume(void)
+static void irqrouter_resume(void *data)
 {
 	struct acpi_pci_link *link;
 
@@ -888,10 +888,14 @@ static int __init acpi_irq_balance_set(char *str)
 
 __setup("acpi_irq_balance", acpi_irq_balance_set);
 
-static struct syscore_ops irqrouter_syscore_ops = {
+static const struct syscore_ops irqrouter_syscore_ops = {
 	.resume = irqrouter_resume,
 };
 
+static struct syscore irqrouter_syscore = {
+	.ops = &irqrouter_syscore_ops,
+};
+
 void __init acpi_pci_link_init(void)
 {
 	if (acpi_noirq)
@@ -904,6 +908,6 @@ void __init acpi_pci_link_init(void)
 		else
 			acpi_irq_balance = 0;
 	}
-	register_syscore_ops(&irqrouter_syscore_ops);
+	register_syscore(&irqrouter_syscore);
 	acpi_scan_add_handler(&pci_link_handler);
 }
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index c8ee8e42b0f6..aaf57d0aaa19 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -884,13 +884,13 @@ bool acpi_s2idle_wakeup(void)
 #ifdef CONFIG_PM_SLEEP
 static u32 saved_bm_rld;
 
-static int  acpi_save_bm_rld(void)
+static int  acpi_save_bm_rld(void *data)
 {
 	acpi_read_bit_register(ACPI_BITREG_BUS_MASTER_RLD, &saved_bm_rld);
 	return 0;
 }
 
-static void  acpi_restore_bm_rld(void)
+static void  acpi_restore_bm_rld(void *data)
 {
 	u32 resumed_bm_rld = 0;
 
@@ -901,14 +901,18 @@ static void  acpi_restore_bm_rld(void)
 	acpi_write_bit_register(ACPI_BITREG_BUS_MASTER_RLD, saved_bm_rld);
 }
 
-static struct syscore_ops acpi_sleep_syscore_ops = {
+static const struct syscore_ops acpi_sleep_syscore_ops = {
 	.suspend = acpi_save_bm_rld,
 	.resume = acpi_restore_bm_rld,
 };
 
+static struct syscore acpi_sleep_syscore = {
+	.ops = &acpi_sleep_syscore_ops,
+};
+
 static void acpi_sleep_syscore_init(void)
 {
-	register_syscore_ops(&acpi_sleep_syscore_ops);
+	register_syscore(&acpi_sleep_syscore);
 }
 #else
 static inline void acpi_sleep_syscore_init(void) {}
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 6942c62fa59d..8191dbab92c4 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1585,16 +1585,20 @@ static int fw_pm_notify(struct notifier_block *notify_block,
 }
 
 /* stop caching firmware once syscore_suspend is reached */
-static int fw_suspend(void)
+static int fw_suspend(void *data)
 {
 	fw_cache.state = FW_LOADER_NO_CACHE;
 	return 0;
 }
 
-static struct syscore_ops fw_syscore_ops = {
+static const struct syscore_ops fw_syscore_ops = {
 	.suspend = fw_suspend,
 };
 
+static struct syscore fw_syscore = {
+	.ops = &fw_syscore_ops,
+};
+
 static int __init register_fw_pm_ops(void)
 {
 	int ret;
@@ -1610,14 +1614,14 @@ static int __init register_fw_pm_ops(void)
 	if (ret)
 		return ret;
 
-	register_syscore_ops(&fw_syscore_ops);
+	register_syscore(&fw_syscore);
 
 	return ret;
 }
 
 static inline void unregister_fw_pm_ops(void)
 {
-	unregister_syscore_ops(&fw_syscore_ops);
+	unregister_syscore(&fw_syscore);
 	unregister_pm_notifier(&fw_cache.pm_notify);
 }
 #else
diff --git a/drivers/base/syscore.c b/drivers/base/syscore.c
index 13db1f78d2ce..483adb796654 100644
--- a/drivers/base/syscore.c
+++ b/drivers/base/syscore.c
@@ -11,32 +11,32 @@
 #include <linux/suspend.h>
 #include <trace/events/power.h>
 
-static LIST_HEAD(syscore_ops_list);
-static DEFINE_MUTEX(syscore_ops_lock);
+static LIST_HEAD(syscore_list);
+static DEFINE_MUTEX(syscore_lock);
 
 /**
- * register_syscore_ops - Register a set of system core operations.
- * @ops: System core operations to register.
+ * register_syscore - Register a set of system core operations.
+ * @syscore: System core operations to register.
  */
-void register_syscore_ops(struct syscore_ops *ops)
+void register_syscore(struct syscore *syscore)
 {
-	mutex_lock(&syscore_ops_lock);
-	list_add_tail(&ops->node, &syscore_ops_list);
-	mutex_unlock(&syscore_ops_lock);
+	mutex_lock(&syscore_lock);
+	list_add_tail(&syscore->node, &syscore_list);
+	mutex_unlock(&syscore_lock);
 }
-EXPORT_SYMBOL_GPL(register_syscore_ops);
+EXPORT_SYMBOL_GPL(register_syscore);
 
 /**
- * unregister_syscore_ops - Unregister a set of system core operations.
- * @ops: System core operations to unregister.
+ * unregister_syscore - Unregister a set of system core operations.
+ * @syscore: System core operations to unregister.
  */
-void unregister_syscore_ops(struct syscore_ops *ops)
+void unregister_syscore(struct syscore *syscore)
 {
-	mutex_lock(&syscore_ops_lock);
-	list_del(&ops->node);
-	mutex_unlock(&syscore_ops_lock);
+	mutex_lock(&syscore_lock);
+	list_del(&syscore->node);
+	mutex_unlock(&syscore_lock);
 }
-EXPORT_SYMBOL_GPL(unregister_syscore_ops);
+EXPORT_SYMBOL_GPL(unregister_syscore);
 
 #ifdef CONFIG_PM_SLEEP
 /**
@@ -46,7 +46,7 @@ EXPORT_SYMBOL_GPL(unregister_syscore_ops);
  */
 int syscore_suspend(void)
 {
-	struct syscore_ops *ops;
+	struct syscore *syscore;
 	int ret = 0;
 
 	trace_suspend_resume(TPS("syscore_suspend"), 0, true);
@@ -59,25 +59,27 @@ int syscore_suspend(void)
 	WARN_ONCE(!irqs_disabled(),
 		"Interrupts enabled before system core suspend.\n");
 
-	list_for_each_entry_reverse(ops, &syscore_ops_list, node)
-		if (ops->suspend) {
-			pm_pr_dbg("Calling %pS\n", ops->suspend);
-			ret = ops->suspend();
+	list_for_each_entry_reverse(syscore, &syscore_list, node)
+		if (syscore->ops->suspend) {
+			pm_pr_dbg("Calling %pS\n", syscore->ops->suspend);
+			ret = syscore->ops->suspend(syscore->data);
 			if (ret)
 				goto err_out;
 			WARN_ONCE(!irqs_disabled(),
-				"Interrupts enabled after %pS\n", ops->suspend);
+				"Interrupts enabled after %pS\n",
+				syscore->ops->suspend);
 		}
 
 	trace_suspend_resume(TPS("syscore_suspend"), 0, false);
 	return 0;
 
  err_out:
-	pr_err("PM: System core suspend callback %pS failed.\n", ops->suspend);
+	pr_err("PM: System core suspend callback %pS failed.\n",
+	       syscore->ops->suspend);
 
-	list_for_each_entry_continue(ops, &syscore_ops_list, node)
-		if (ops->resume)
-			ops->resume();
+	list_for_each_entry_continue(syscore, &syscore_list, node)
+		if (syscore->ops->resume)
+			syscore->ops->resume(syscore->data);
 
 	return ret;
 }
@@ -90,18 +92,19 @@ EXPORT_SYMBOL_GPL(syscore_suspend);
  */
 void syscore_resume(void)
 {
-	struct syscore_ops *ops;
+	struct syscore *syscore;
 
 	trace_suspend_resume(TPS("syscore_resume"), 0, true);
 	WARN_ONCE(!irqs_disabled(),
 		"Interrupts enabled before system core resume.\n");
 
-	list_for_each_entry(ops, &syscore_ops_list, node)
-		if (ops->resume) {
-			pm_pr_dbg("Calling %pS\n", ops->resume);
-			ops->resume();
+	list_for_each_entry(syscore, &syscore_list, node)
+		if (syscore->ops->resume) {
+			pm_pr_dbg("Calling %pS\n", syscore->ops->resume);
+			syscore->ops->resume(syscore->data);
 			WARN_ONCE(!irqs_disabled(),
-				"Interrupts enabled after %pS\n", ops->resume);
+				"Interrupts enabled after %pS\n",
+				syscore->ops->resume);
 		}
 	trace_suspend_resume(TPS("syscore_resume"), 0, false);
 }
@@ -113,16 +116,17 @@ EXPORT_SYMBOL_GPL(syscore_resume);
  */
 void syscore_shutdown(void)
 {
-	struct syscore_ops *ops;
+	struct syscore *syscore;
 
-	mutex_lock(&syscore_ops_lock);
+	mutex_lock(&syscore_lock);
 
-	list_for_each_entry_reverse(ops, &syscore_ops_list, node)
-		if (ops->shutdown) {
+	list_for_each_entry_reverse(syscore, &syscore_list, node)
+		if (syscore->ops->shutdown) {
 			if (initcall_debug)
-				pr_info("PM: Calling %pS\n", ops->shutdown);
-			ops->shutdown();
+				pr_info("PM: Calling %pS\n",
+					syscore->ops->shutdown);
+			syscore->ops->shutdown(syscore->data);
 		}
 
-	mutex_unlock(&syscore_ops_lock);
+	mutex_unlock(&syscore_lock);
 }
diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 00cb792bda18..dd94145c9b22 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -1006,7 +1006,7 @@ static __init int mvebu_mbus_debugfs_init(void)
 }
 fs_initcall(mvebu_mbus_debugfs_init);
 
-static int mvebu_mbus_suspend(void)
+static int mvebu_mbus_suspend(void *data)
 {
 	struct mvebu_mbus_state *s = &mbus_state;
 	int win;
@@ -1040,7 +1040,7 @@ static int mvebu_mbus_suspend(void)
 	return 0;
 }
 
-static void mvebu_mbus_resume(void)
+static void mvebu_mbus_resume(void *data)
 {
 	struct mvebu_mbus_state *s = &mbus_state;
 	int win;
@@ -1069,9 +1069,13 @@ static void mvebu_mbus_resume(void)
 	}
 }
 
-static struct syscore_ops mvebu_mbus_syscore_ops = {
-	.suspend	= mvebu_mbus_suspend,
-	.resume		= mvebu_mbus_resume,
+static const struct syscore_ops mvebu_mbus_syscore_ops = {
+	.suspend = mvebu_mbus_suspend,
+	.resume = mvebu_mbus_resume,
+};
+
+static struct syscore mvebu_mbus_syscore = {
+	.ops = &mvebu_mbus_syscore_ops,
 };
 
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
@@ -1118,7 +1122,7 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore_ops(&mvebu_mbus_syscore_ops);
+	register_syscore(&mvebu_mbus_syscore);
 
 	return 0;
 }
diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index acf780a81589..2310f6f73162 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -115,7 +115,7 @@ struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
 /* Address in SECURAM that say if we suspend to backup mode. */
 static void __iomem *at91_pmc_backup_suspend;
 
-static int at91_pmc_suspend(void)
+static int at91_pmc_suspend(void *data)
 {
 	unsigned int backup;
 
@@ -129,7 +129,7 @@ static int at91_pmc_suspend(void)
 	return clk_save_context();
 }
 
-static void at91_pmc_resume(void)
+static void at91_pmc_resume(void *data)
 {
 	unsigned int backup;
 
@@ -143,11 +143,15 @@ static void at91_pmc_resume(void)
 	clk_restore_context();
 }
 
-static struct syscore_ops pmc_syscore_ops = {
+static const struct syscore_ops pmc_syscore_ops = {
 	.suspend = at91_pmc_suspend,
 	.resume = at91_pmc_resume,
 };
 
+static struct syscore pmc_syscore = {
+	.ops = &pmc_syscore_ops,
+};
+
 static const struct of_device_id pmc_dt_ids[] = {
 	{ .compatible = "atmel,sama5d2-pmc" },
 	{ .compatible = "microchip,sama7g5-pmc", },
@@ -185,7 +189,7 @@ static int __init pmc_register_ops(void)
 		return -ENOMEM;
 	}
 
-	register_syscore_ops(&pmc_syscore_ops);
+	register_syscore(&pmc_syscore);
 
 	return 0;
 }
diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 9e11f1c7c397..41eb38552a9c 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -139,7 +139,7 @@ static struct clk * __init vf610_get_fixed_clock(
 	return clk;
 };
 
-static int vf610_clk_suspend(void)
+static int vf610_clk_suspend(void *data)
 {
 	int i;
 
@@ -156,7 +156,7 @@ static int vf610_clk_suspend(void)
 	return 0;
 }
 
-static void vf610_clk_resume(void)
+static void vf610_clk_resume(void *data)
 {
 	int i;
 
@@ -171,11 +171,15 @@ static void vf610_clk_resume(void)
 		writel_relaxed(ccgr[i], CCM_CCGRx(i));
 }
 
-static struct syscore_ops vf610_clk_syscore_ops = {
+static const struct syscore_ops vf610_clk_syscore_ops = {
 	.suspend = vf610_clk_suspend,
 	.resume = vf610_clk_resume,
 };
 
+static struct syscore vf610_clk_syscore = {
+	.ops = &vf610_clk_syscore_ops,
+};
+
 static void __init vf610_clocks_init(struct device_node *ccm_node)
 {
 	struct device_node *np;
@@ -462,7 +466,7 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
 	for (i = 0; i < ARRAY_SIZE(clks_init_on); i++)
 		clk_prepare_enable(clk[clks_init_on[i]]);
 
-	register_syscore_ops(&vf610_clk_syscore_ops);
+	register_syscore(&vf610_clk_syscore);
 
 	/* Add the clocks to provider list */
 	clk_data.clks = clk;
diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index 590e9c85cb25..94cee44c854f 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -268,6 +268,6 @@ static void __init jz4725b_cgu_init(struct device_node *np)
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 CLK_OF_DECLARE_DRIVER(jz4725b_cgu, "ingenic,jz4725b-cgu", jz4725b_cgu_init);
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 3e0a30574ebb..2def3aedc8dd 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -266,6 +266,6 @@ static void __init jz4740_cgu_init(struct device_node *np)
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-cgu", jz4740_cgu_init);
diff --git a/drivers/clk/ingenic/jz4755-cgu.c b/drivers/clk/ingenic/jz4755-cgu.c
index f2c2d848dab7..17cf5dcaece9 100644
--- a/drivers/clk/ingenic/jz4755-cgu.c
+++ b/drivers/clk/ingenic/jz4755-cgu.c
@@ -337,7 +337,7 @@ static void __init jz4755_cgu_init(struct device_node *np)
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 /*
  * CGU has some children devices, this is useful for probing children devices
diff --git a/drivers/clk/ingenic/jz4760-cgu.c b/drivers/clk/ingenic/jz4760-cgu.c
index e407f00bd594..372fe4b07992 100644
--- a/drivers/clk/ingenic/jz4760-cgu.c
+++ b/drivers/clk/ingenic/jz4760-cgu.c
@@ -436,7 +436,7 @@ static void __init jz4760_cgu_init(struct device_node *np)
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 
 /* We only probe via devicetree, no need for a platform driver */
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 6ae1740367f9..58f1d3bad677 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -456,7 +456,7 @@ static void __init jz4770_cgu_init(struct device_node *np)
 	if (retval)
 		pr_err("%s: failed to register CGU Clocks\n", __func__);
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 
 /* We only probe via devicetree, no need for a platform driver */
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 07e2f3c5c454..1e88aef7ac0f 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -803,6 +803,6 @@ static void __init jz4780_cgu_init(struct device_node *np)
 		return;
 	}
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 CLK_OF_DECLARE_DRIVER(jz4780_cgu, "ingenic,jz4780-cgu", jz4780_cgu_init);
diff --git a/drivers/clk/ingenic/pm.c b/drivers/clk/ingenic/pm.c
index 341752b640d2..206d5cf2872f 100644
--- a/drivers/clk/ingenic/pm.c
+++ b/drivers/clk/ingenic/pm.c
@@ -15,7 +15,7 @@
 
 static void __iomem * __maybe_unused ingenic_cgu_base;
 
-static int __maybe_unused ingenic_cgu_pm_suspend(void)
+static int __maybe_unused ingenic_cgu_pm_suspend(void *data)
 {
 	u32 val = readl(ingenic_cgu_base + CGU_REG_LCR);
 
@@ -24,22 +24,26 @@ static int __maybe_unused ingenic_cgu_pm_suspend(void)
 	return 0;
 }
 
-static void __maybe_unused ingenic_cgu_pm_resume(void)
+static void __maybe_unused ingenic_cgu_pm_resume(void *data)
 {
 	u32 val = readl(ingenic_cgu_base + CGU_REG_LCR);
 
 	writel(val & ~LCR_LOW_POWER_MODE, ingenic_cgu_base + CGU_REG_LCR);
 }
 
-static struct syscore_ops __maybe_unused ingenic_cgu_pm_ops = {
+static const struct syscore_ops __maybe_unused ingenic_cgu_pm_ops = {
 	.suspend = ingenic_cgu_pm_suspend,
 	.resume = ingenic_cgu_pm_resume,
 };
 
-void ingenic_cgu_register_syscore_ops(struct ingenic_cgu *cgu)
+static struct syscore __maybe_unused ingenic_cgu_pm = {
+	.ops = &ingenic_cgu_pm_ops,
+};
+
+void ingenic_cgu_register_syscore(struct ingenic_cgu *cgu)
 {
 	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
 		ingenic_cgu_base = cgu->base;
-		register_syscore_ops(&ingenic_cgu_pm_ops);
+		register_syscore(&ingenic_cgu_pm);
 	}
 }
diff --git a/drivers/clk/ingenic/pm.h b/drivers/clk/ingenic/pm.h
index fa7540407b6b..0dcb57dc64cb 100644
--- a/drivers/clk/ingenic/pm.h
+++ b/drivers/clk/ingenic/pm.h
@@ -7,6 +7,6 @@
 
 struct ingenic_cgu;
 
-void ingenic_cgu_register_syscore_ops(struct ingenic_cgu *cgu);
+void ingenic_cgu_register_syscore(struct ingenic_cgu *cgu);
 
 #endif /* DRIVERS_CLK_INGENIC_PM_H */
diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 7d04ef40b7cf..bc6a51da2072 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -455,7 +455,7 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(void)
+static int __maybe_unused tcu_pm_suspend(void *data)
 {
 	struct ingenic_tcu *tcu = ingenic_tcu;
 
@@ -465,7 +465,7 @@ static int __maybe_unused tcu_pm_suspend(void)
 	return 0;
 }
 
-static void __maybe_unused tcu_pm_resume(void)
+static void __maybe_unused tcu_pm_resume(void *data)
 {
 	struct ingenic_tcu *tcu = ingenic_tcu;
 
@@ -473,11 +473,15 @@ static void __maybe_unused tcu_pm_resume(void)
 		clk_enable(tcu->clk);
 }
 
-static struct syscore_ops __maybe_unused tcu_pm_ops = {
+static const struct syscore_ops __maybe_unused tcu_pm_ops = {
 	.suspend = tcu_pm_suspend,
 	.resume = tcu_pm_resume,
 };
 
+static struct syscore __maybe_unused tcu_pm = {
+	.ops = &tcu_pm_ops,
+};
+
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
@@ -486,7 +490,7 @@ static void __init ingenic_tcu_init(struct device_node *np)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
 
 	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore_ops(&tcu_pm_ops);
+		register_syscore(&tcu_pm);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index d80886caf393..d89bdfb7c219 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -556,7 +556,7 @@ static void __init x1000_cgu_init(struct device_node *np)
 		return;
 	}
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 /*
  * CGU has some children devices, this is useful for probing children devices
diff --git a/drivers/clk/ingenic/x1830-cgu.c b/drivers/clk/ingenic/x1830-cgu.c
index 0fd46e50a513..acf856e5009e 100644
--- a/drivers/clk/ingenic/x1830-cgu.c
+++ b/drivers/clk/ingenic/x1830-cgu.c
@@ -463,7 +463,7 @@ static void __init x1830_cgu_init(struct device_node *np)
 		return;
 	}
 
-	ingenic_cgu_register_syscore_ops(cgu);
+	ingenic_cgu_register_syscore(cgu);
 }
 /*
  * CGU has some children devices, this is useful for probing children devices
diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 785dbede4835..5adbbd91a6db 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -215,22 +215,26 @@ static struct clk *clk_gating_get_src(
 	return ERR_PTR(-ENODEV);
 }
 
-static int mvebu_clk_gating_suspend(void)
+static int mvebu_clk_gating_suspend(void *data)
 {
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
-static void mvebu_clk_gating_resume(void)
+static void mvebu_clk_gating_resume(void *data)
 {
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
-static struct syscore_ops clk_gate_syscore_ops = {
+static const struct syscore_ops clk_gate_syscore_ops = {
 	.suspend = mvebu_clk_gating_suspend,
 	.resume = mvebu_clk_gating_resume,
 };
 
+static struct syscore clk_gate_syscore = {
+	.ops = &clk_gate_syscore_ops,
+};
+
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
@@ -284,7 +288,7 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore_ops(&clk_gate_syscore_ops);
+	register_syscore(&clk_gate_syscore);
 
 	return;
 gates_out:
diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 0a1e017df7c6..9cf3e1e43b78 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -871,7 +871,7 @@ static const int rk3288_saved_cru_reg_ids[] = {
 
 static u32 rk3288_saved_cru_regs[ARRAY_SIZE(rk3288_saved_cru_reg_ids)];
 
-static int rk3288_clk_suspend(void)
+static int rk3288_clk_suspend(void *data)
 {
 	int i, reg_id;
 
@@ -906,7 +906,7 @@ static int rk3288_clk_suspend(void)
 	return 0;
 }
 
-static void rk3288_clk_resume(void)
+static void rk3288_clk_resume(void *data)
 {
 	int i, reg_id;
 
@@ -923,11 +923,15 @@ static void rk3288_clk_shutdown(void)
 	writel_relaxed(0xf3030000, rk3288_cru_base + RK3288_MODE_CON);
 }
 
-static struct syscore_ops rk3288_clk_syscore_ops = {
+static const struct syscore_ops rk3288_clk_syscore_ops = {
 	.suspend = rk3288_clk_suspend,
 	.resume = rk3288_clk_resume,
 };
 
+static struct syscore rk3288_clk_syscore = {
+	.ops = &rk3288_clk_syscore_ops,
+};
+
 static void __init rk3288_common_init(struct device_node *np,
 				      enum rk3288_variant soc)
 {
@@ -976,7 +980,7 @@ static void __init rk3288_common_init(struct device_node *np,
 
 	rockchip_register_restart_notifier(ctx, RK3288_GLB_SRST_FST,
 					   rk3288_clk_shutdown);
-	register_syscore_ops(&rk3288_clk_syscore_ops);
+	register_syscore(&rk3288_clk_syscore);
 
 	rockchip_clk_of_add_provider(np, ctx);
 }
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index b1fd8fac3a4c..c9fcb23de183 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -36,7 +36,7 @@ static unsigned long reg_save[][2] = {
 	{ASS_CLK_GATE, 0},
 };
 
-static int s5pv210_audss_clk_suspend(void)
+static int s5pv210_audss_clk_suspend(void *data)
 {
 	int i;
 
@@ -46,7 +46,7 @@ static int s5pv210_audss_clk_suspend(void)
 	return 0;
 }
 
-static void s5pv210_audss_clk_resume(void)
+static void s5pv210_audss_clk_resume(void *data)
 {
 	int i;
 
@@ -54,10 +54,14 @@ static void s5pv210_audss_clk_resume(void)
 		writel(reg_save[i][1], reg_base + reg_save[i][0]);
 }
 
-static struct syscore_ops s5pv210_audss_clk_syscore_ops = {
+static const struct syscore_ops s5pv210_audss_clk_syscore_ops = {
 	.suspend	= s5pv210_audss_clk_suspend,
 	.resume		= s5pv210_audss_clk_resume,
 };
+
+static struct syscore s5pv210_audss_clk_syscore = {
+	.ops = &s5pv210_audss_clk_syscore_ops,
+};
 #endif /* CONFIG_PM_SLEEP */
 
 /* register s5pv210_audss clocks */
@@ -175,7 +179,7 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_PM_SLEEP
-	register_syscore_ops(&s5pv210_audss_clk_syscore_ops);
+	register_syscore(&s5pv210_audss_clk_syscore);
 #endif
 
 	return 0;
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index dbc9925ca8f4..c149ca6c2217 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -271,7 +271,7 @@ void __init samsung_clk_of_register_fixed_ext(struct samsung_clk_provider *ctx,
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int samsung_clk_suspend(void)
+static int samsung_clk_suspend(void *data)
 {
 	struct samsung_clock_reg_cache *reg_cache;
 
@@ -284,7 +284,7 @@ static int samsung_clk_suspend(void)
 	return 0;
 }
 
-static void samsung_clk_resume(void)
+static void samsung_clk_resume(void *data)
 {
 	struct samsung_clock_reg_cache *reg_cache;
 
@@ -293,11 +293,15 @@ static void samsung_clk_resume(void)
 				reg_cache->rd_num);
 }
 
-static struct syscore_ops samsung_clk_syscore_ops = {
+static const struct syscore_ops samsung_clk_syscore_ops = {
 	.suspend = samsung_clk_suspend,
 	.resume = samsung_clk_resume,
 };
 
+static struct syscore samsung_clk_syscore = {
+	.ops = &samsung_clk_syscore_ops,
+};
+
 void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 			const unsigned long *rdump,
 			unsigned long nr_rdump,
@@ -316,7 +320,7 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 		panic("could not allocate register dump storage.\n");
 
 	if (list_empty(&clock_reg_cache_list))
-		register_syscore_ops(&samsung_clk_syscore_ops);
+		register_syscore(&samsung_clk_syscore);
 
 	reg_cache->reg_base = reg_base;
 	reg_cache->rd_num = nr_rdump;
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 412902f573b5..504d0ea997a5 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3444,7 +3444,7 @@ static void tegra210_disable_cpu_clock(u32 cpu)
 static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
 static u32 cpu_softrst_ctx[3];
 
-static int tegra210_clk_suspend(void)
+static int tegra210_clk_suspend(void *data)
 {
 	unsigned int i;
 
@@ -3465,7 +3465,7 @@ static int tegra210_clk_suspend(void)
 	return 0;
 }
 
-static void tegra210_clk_resume(void)
+static void tegra210_clk_resume(void *data)
 {
 	unsigned int i;
 
@@ -3523,13 +3523,17 @@ static void tegra210_cpu_clock_resume(void)
 }
 #endif
 
-static struct syscore_ops tegra_clk_syscore_ops = {
+static const struct syscore_ops tegra_clk_syscore_ops = {
 #ifdef CONFIG_PM_SLEEP
 	.suspend = tegra210_clk_suspend,
 	.resume = tegra210_clk_resume,
 #endif
 };
 
+static struct syscore tegra_clk_syscore = {
+	.ops = &tegra_clk_syscore_ops,
+};
+
 static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
 	.wait_for_reset	= tegra210_wait_cpu_in_reset,
 	.disable_clock	= tegra210_disable_cpu_clock,
@@ -3813,6 +3817,6 @@ static void __init tegra210_clock_init(struct device_node *np)
 
 	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
 
-	register_syscore_ops(&tegra_clk_syscore_ops);
+	register_syscore(&tegra_clk_syscore);
 }
 CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
diff --git a/drivers/clocksource/timer-armada-370-xp.c b/drivers/clocksource/timer-armada-370-xp.c
index 54284c1c0651..f2b4cc40db93 100644
--- a/drivers/clocksource/timer-armada-370-xp.c
+++ b/drivers/clocksource/timer-armada-370-xp.c
@@ -207,14 +207,14 @@ static int armada_370_xp_timer_dying_cpu(unsigned int cpu)
 
 static u32 timer0_ctrl_reg, timer0_local_ctrl_reg;
 
-static int armada_370_xp_timer_suspend(void)
+static int armada_370_xp_timer_suspend(void *data)
 {
 	timer0_ctrl_reg = readl(timer_base + TIMER_CTRL_OFF);
 	timer0_local_ctrl_reg = readl(local_base + TIMER_CTRL_OFF);
 	return 0;
 }
 
-static void armada_370_xp_timer_resume(void)
+static void armada_370_xp_timer_resume(void *data)
 {
 	writel(0xffffffff, timer_base + TIMER0_VAL_OFF);
 	writel(0xffffffff, timer_base + TIMER0_RELOAD_OFF);
@@ -222,11 +222,15 @@ static void armada_370_xp_timer_resume(void)
 	writel(timer0_local_ctrl_reg, local_base + TIMER_CTRL_OFF);
 }
 
-static struct syscore_ops armada_370_xp_timer_syscore_ops = {
+static const struct syscore_ops armada_370_xp_timer_syscore_ops = {
 	.suspend	= armada_370_xp_timer_suspend,
 	.resume		= armada_370_xp_timer_resume,
 };
 
+static struct syscore armada_370_xp_timer_syscore = {
+	.ops = &armada_370_xp_timer_syscore_ops,
+};
+
 static unsigned long armada_370_delay_timer_read(void)
 {
 	return ~readl(timer_base + TIMER0_VAL_OFF);
@@ -324,7 +328,7 @@ static int __init armada_370_xp_timer_common_init(struct device_node *np)
 		return res;
 	}
 
-	register_syscore_ops(&armada_370_xp_timer_syscore_ops);
+	register_syscore(&armada_370_xp_timer_syscore);
 	
 	return 0;
 }
diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index e75d85a8f90d..dcf20ea5ef5e 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -177,26 +177,30 @@ static void psci_idle_syscore_switch(bool suspend)
 	}
 }
 
-static int psci_idle_syscore_suspend(void)
+static int psci_idle_syscore_suspend(void *data)
 {
 	psci_idle_syscore_switch(true);
 	return 0;
 }
 
-static void psci_idle_syscore_resume(void)
+static void psci_idle_syscore_resume(void *data)
 {
 	psci_idle_syscore_switch(false);
 }
 
-static struct syscore_ops psci_idle_syscore_ops = {
+static const struct syscore_ops psci_idle_syscore_ops = {
 	.suspend = psci_idle_syscore_suspend,
 	.resume = psci_idle_syscore_resume,
 };
 
+static struct syscore psci_idle_syscore = {
+	.ops = &psci_idle_syscore_ops,
+};
+
 static void psci_idle_init_syscore(void)
 {
 	if (psci_cpuidle_use_syscore)
-		register_syscore_ops(&psci_idle_syscore_ops);
+		register_syscore(&psci_idle_syscore);
 }
 
 static void psci_idle_init_cpuhp(void)
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 52060b3ec745..d7666fe9dbf8 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -667,7 +667,7 @@ static const struct dev_pm_ops mxc_gpio_dev_pm_ops = {
 	RUNTIME_PM_OPS(mxc_gpio_runtime_suspend, mxc_gpio_runtime_resume, NULL)
 };
 
-static int mxc_gpio_syscore_suspend(void)
+static int mxc_gpio_syscore_suspend(void *data)
 {
 	struct mxc_gpio_port *port;
 	int ret;
@@ -684,7 +684,7 @@ static int mxc_gpio_syscore_suspend(void)
 	return 0;
 }
 
-static void mxc_gpio_syscore_resume(void)
+static void mxc_gpio_syscore_resume(void *data)
 {
 	struct mxc_gpio_port *port;
 	int ret;
@@ -701,11 +701,15 @@ static void mxc_gpio_syscore_resume(void)
 	}
 }
 
-static struct syscore_ops mxc_gpio_syscore_ops = {
+static const struct syscore_ops mxc_gpio_syscore_ops = {
 	.suspend = mxc_gpio_syscore_suspend,
 	.resume = mxc_gpio_syscore_resume,
 };
 
+static struct syscore mxc_gpio_syscore = {
+	.ops = &mxc_gpio_syscore_ops,
+};
+
 static struct platform_driver mxc_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-mxc",
@@ -718,7 +722,7 @@ static struct platform_driver mxc_gpio_driver = {
 
 static int __init gpio_mxc_init(void)
 {
-	register_syscore_ops(&mxc_gpio_syscore_ops);
+	register_syscore(&mxc_gpio_syscore);
 
 	return platform_driver_register(&mxc_gpio_driver);
 }
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa22f3faa163..664cf1eef494 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -747,7 +747,7 @@ static int __init pxa_gpio_dt_init(void)
 device_initcall(pxa_gpio_dt_init);
 
 #ifdef CONFIG_PM
-static int pxa_gpio_suspend(void)
+static int pxa_gpio_suspend(void *data)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	struct pxa_gpio_bank *c;
@@ -768,7 +768,7 @@ static int pxa_gpio_suspend(void)
 	return 0;
 }
 
-static void pxa_gpio_resume(void)
+static void pxa_gpio_resume(void *data)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	struct pxa_gpio_bank *c;
@@ -792,14 +792,18 @@ static void pxa_gpio_resume(void)
 #define pxa_gpio_resume		NULL
 #endif
 
-static struct syscore_ops pxa_gpio_syscore_ops = {
+static const struct syscore_ops pxa_gpio_syscore_ops = {
 	.suspend	= pxa_gpio_suspend,
 	.resume		= pxa_gpio_resume,
 };
 
+static struct syscore pxa_gpio_syscore = {
+	.ops = &pxa_gpio_syscore_ops,
+};
+
 static int __init pxa_gpio_sysinit(void)
 {
-	register_syscore_ops(&pxa_gpio_syscore_ops);
+	register_syscore(&pxa_gpio_syscore);
 	return 0;
 }
 postcore_initcall(pxa_gpio_sysinit);
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 7f6a62f5d1ee..1938ffa2f4f3 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -256,7 +256,7 @@ static void sa1100_gpio_handler(struct irq_desc *desc)
 	} while (mask);
 }
 
-static int sa1100_gpio_suspend(void)
+static int sa1100_gpio_suspend(void *data)
 {
 	struct sa1100_gpio_chip *sgc = &sa1100_gpio_chip;
 
@@ -275,19 +275,23 @@ static int sa1100_gpio_suspend(void)
 	return 0;
 }
 
-static void sa1100_gpio_resume(void)
+static void sa1100_gpio_resume(void *data)
 {
 	sa1100_update_edge_regs(&sa1100_gpio_chip);
 }
 
-static struct syscore_ops sa1100_gpio_syscore_ops = {
+static const struct syscore_ops sa1100_gpio_syscore_ops = {
 	.suspend	= sa1100_gpio_suspend,
 	.resume		= sa1100_gpio_resume,
 };
 
+static struct syscore sa1100_gpio_syscore = {
+	.ops = &sa1100_gpio_syscore_ops,
+};
+
 static int __init sa1100_gpio_init_devicefs(void)
 {
-	register_syscore_ops(&sa1100_gpio_syscore_ops);
+	register_syscore(&sa1100_gpio_syscore);
 	return 0;
 }
 
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 0dc4692b411a..bc36b85c7af0 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2857,7 +2857,7 @@ static void hv_crash_handler(struct pt_regs *regs)
 	hv_hyp_synic_disable_regs(cpu);
 };
 
-static int hv_synic_suspend(void)
+static int hv_synic_suspend(void *data)
 {
 	/*
 	 * When we reach here, all the non-boot CPUs have been offlined.
@@ -2884,7 +2884,7 @@ static int hv_synic_suspend(void)
 	return 0;
 }
 
-static void hv_synic_resume(void)
+static void hv_synic_resume(void *data)
 {
 	hv_hyp_synic_enable_regs(0);
 
@@ -2896,11 +2896,15 @@ static void hv_synic_resume(void)
 }
 
 /* The callbacks run only on CPU0, with irqs_disabled. */
-static struct syscore_ops hv_synic_syscore_ops = {
+static const struct syscore_ops hv_synic_syscore_ops = {
 	.suspend = hv_synic_suspend,
 	.resume = hv_synic_resume,
 };
 
+static struct syscore hv_synic_syscore = {
+	.ops = &hv_synic_syscore_ops,
+};
+
 static int __init hv_acpi_init(void)
 {
 	int ret;
@@ -2943,7 +2947,7 @@ static int __init hv_acpi_init(void)
 	hv_setup_kexec_handler(hv_kexec_handler);
 	hv_setup_crash_handler(hv_crash_handler);
 
-	register_syscore_ops(&hv_synic_syscore_ops);
+	register_syscore(&hv_synic_syscore);
 
 	return 0;
 
@@ -2957,7 +2961,7 @@ static void __exit vmbus_exit(void)
 {
 	int cpu;
 
-	unregister_syscore_ops(&hv_synic_syscore_ops);
+	unregister_syscore(&hv_synic_syscore);
 
 	hv_remove_kexec_handler();
 	hv_remove_crash_handler();
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index f2991c11867c..4b65de731860 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -3024,7 +3024,7 @@ static void disable_iommus(void)
  * disable suspend until real resume implemented
  */
 
-static void amd_iommu_resume(void)
+static void amd_iommu_resume(void *data)
 {
 	struct amd_iommu *iommu;
 
@@ -3038,7 +3038,7 @@ static void amd_iommu_resume(void)
 	amd_iommu_enable_interrupts();
 }
 
-static int amd_iommu_suspend(void)
+static int amd_iommu_suspend(void *data)
 {
 	/* disable IOMMUs to go out of the way for BIOS */
 	disable_iommus();
@@ -3046,11 +3046,15 @@ static int amd_iommu_suspend(void)
 	return 0;
 }
 
-static struct syscore_ops amd_iommu_syscore_ops = {
+static const struct syscore_ops amd_iommu_syscore_ops = {
 	.suspend = amd_iommu_suspend,
 	.resume = amd_iommu_resume,
 };
 
+static struct syscore amd_iommu_syscore = {
+	.ops = &amd_iommu_syscore_ops,
+};
+
 static void __init free_iommu_resources(void)
 {
 	free_iommu_all();
@@ -3395,7 +3399,7 @@ static int __init state_next(void)
 		init_state = IOMMU_ENABLED;
 		break;
 	case IOMMU_ENABLED:
-		register_syscore_ops(&amd_iommu_syscore_ops);
+		register_syscore(&amd_iommu_syscore);
 		iommu_snp_enable();
 		ret = amd_iommu_init_pci();
 		init_state = ret ? IOMMU_INIT_ERROR : IOMMU_PCI_INIT;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e236c7ec221f..fdaf7f64dd33 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2303,7 +2303,7 @@ static void iommu_flush_all(void)
 	}
 }
 
-static int iommu_suspend(void)
+static int iommu_suspend(void *data)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu = NULL;
@@ -2330,7 +2330,7 @@ static int iommu_suspend(void)
 	return 0;
 }
 
-static void iommu_resume(void)
+static void iommu_resume(void *data)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu = NULL;
@@ -2361,14 +2361,18 @@ static void iommu_resume(void)
 	}
 }
 
-static struct syscore_ops iommu_syscore_ops = {
+static const struct syscore_ops iommu_syscore_ops = {
 	.resume		= iommu_resume,
 	.suspend	= iommu_suspend,
 };
 
+static struct syscore iommu_syscore = {
+	.ops = &iommu_syscore_ops,
+};
+
 static void __init init_iommu_pm_ops(void)
 {
-	register_syscore_ops(&iommu_syscore_ops);
+	register_syscore(&iommu_syscore);
 }
 
 #else
diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index e7dfcf0cda43..495848442b35 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -200,12 +200,13 @@ static void __init combiner_init(void __iomem *combiner_base,
 
 /**
  * combiner_suspend - save interrupt combiner state before suspend
+ * @data: syscore context
  *
  * Save the interrupt enable set register for all combiner groups since
  * the state is lost when the system enters into a sleep state.
  *
  */
-static int combiner_suspend(void)
+static int combiner_suspend(void *data)
 {
 	int i;
 
@@ -218,12 +219,13 @@ static int combiner_suspend(void)
 
 /**
  * combiner_resume - restore interrupt combiner state after resume
+ * @data: syscore context
  *
  * Restore the interrupt enable set register for all combiner groups since
  * the state is lost when the system enters into a sleep state on suspend.
  *
  */
-static void combiner_resume(void)
+static void combiner_resume(void *data)
 {
 	int i;
 
@@ -240,11 +242,15 @@ static void combiner_resume(void)
 #define combiner_resume		NULL
 #endif
 
-static struct syscore_ops combiner_syscore_ops = {
+static const struct syscore_ops combiner_syscore_ops = {
 	.suspend	= combiner_suspend,
 	.resume		= combiner_resume,
 };
 
+static struct syscore combiner_syscore = {
+	.ops = &combiner_syscore_ops,
+};
+
 static int __init combiner_of_init(struct device_node *np,
 				   struct device_node *parent)
 {
@@ -264,7 +270,7 @@ static int __init combiner_of_init(struct device_node *np,
 
 	combiner_init(combiner_base, np);
 
-	register_syscore_ops(&combiner_syscore_ops);
+	register_syscore(&combiner_syscore);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index a44c49e985b7..a4d03a2d1569 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -726,7 +726,7 @@ static void __exception_irq_entry mpic_handle_irq(struct pt_regs *regs)
 	} while (1);
 }
 
-static int mpic_suspend(void)
+static int mpic_suspend(void *data)
 {
 	struct mpic *mpic = mpic_data;
 
@@ -735,7 +735,7 @@ static int mpic_suspend(void)
 	return 0;
 }
 
-static void mpic_resume(void)
+static void mpic_resume(void *data)
 {
 	struct mpic *mpic = mpic_data;
 	bool src0, src1;
@@ -788,11 +788,15 @@ static void mpic_resume(void)
 		mpic_ipi_resume(mpic);
 }
 
-static struct syscore_ops mpic_syscore_ops = {
+static const struct syscore_ops mpic_syscore_ops = {
 	.suspend	= mpic_suspend,
 	.resume		= mpic_resume,
 };
 
+static struct syscore mpic_syscore = {
+	.ops = &mpic_syscore_ops,
+};
+
 static int __init mpic_map_region(struct device_node *np, int index,
 				  void __iomem **base, phys_addr_t *phys_base)
 {
@@ -905,7 +909,7 @@ static int __init mpic_of_init(struct device_node *node, struct device_node *par
 						 mpic_handle_cascade_irq, mpic);
 	}
 
-	register_syscore_ops(&mpic_syscore_ops);
+	register_syscore(&mpic_syscore);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 821b288587ca..674138668f1c 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -291,7 +291,7 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
 static LIST_HEAD(bcm7038_l1_intcs_list);
 static DEFINE_RAW_SPINLOCK(bcm7038_l1_intcs_lock);
 
-static int bcm7038_l1_suspend(void)
+static int bcm7038_l1_suspend(void *data)
 {
 	struct bcm7038_l1_chip *intc;
 	int boot_cpu, word;
@@ -317,7 +317,7 @@ static int bcm7038_l1_suspend(void)
 	return 0;
 }
 
-static void bcm7038_l1_resume(void)
+static void bcm7038_l1_resume(void *data)
 {
 	struct bcm7038_l1_chip *intc;
 	int boot_cpu, word;
@@ -338,11 +338,15 @@ static void bcm7038_l1_resume(void)
 	}
 }
 
-static struct syscore_ops bcm7038_l1_syscore_ops = {
+static const struct syscore_ops bcm7038_l1_syscore_ops = {
 	.suspend	= bcm7038_l1_suspend,
 	.resume		= bcm7038_l1_resume,
 };
 
+static struct syscore bcm7038_l1_syscore = {
+	.ops = &bcm7038_l1_syscore_ops,
+};
+
 static int bcm7038_l1_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct bcm7038_l1_chip *intc = irq_data_get_irq_chip_data(d);
@@ -430,7 +434,7 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
 	raw_spin_unlock(&bcm7038_l1_intcs_lock);
 
 	if (list_is_singular(&bcm7038_l1_intcs_list))
-		register_syscore_ops(&bcm7038_l1_syscore_ops);
+		register_syscore(&bcm7038_l1_syscore);
 #endif
 
 	pr_info("registered BCM7038 L1 intc (%pOF, IRQs: %d)\n",
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 467cb78435a9..ada585bfa451 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4992,7 +4992,7 @@ static void its_enable_quirks(struct its_node *its)
 				     its_quirks, its);
 }
 
-static int its_save_disable(void)
+static int its_save_disable(void *data)
 {
 	struct its_node *its;
 	int err = 0;
@@ -5028,7 +5028,7 @@ static int its_save_disable(void)
 	return err;
 }
 
-static void its_restore_enable(void)
+static void its_restore_enable(void *data)
 {
 	struct its_node *its;
 	int ret;
@@ -5088,11 +5088,15 @@ static void its_restore_enable(void)
 	raw_spin_unlock(&its_lock);
 }
 
-static struct syscore_ops its_syscore_ops = {
+static const struct syscore_ops its_syscore_ops = {
 	.suspend = its_save_disable,
 	.resume = its_restore_enable,
 };
 
+static struct syscore its_syscore = {
+	.ops = &its_syscore_ops,
+};
+
 static void __init __iomem *its_map_one(struct resource *res, int *err)
 {
 	void __iomem *its_base;
@@ -5864,7 +5868,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
 		}
 	}
 
-	register_syscore_ops(&its_syscore_ops);
+	register_syscore(&its_syscore);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-i8259.c b/drivers/irqchip/irq-i8259.c
index 91b2f587119c..cca77f9948a3 100644
--- a/drivers/irqchip/irq-i8259.c
+++ b/drivers/irqchip/irq-i8259.c
@@ -202,13 +202,13 @@ static void mask_and_ack_8259A(struct irq_data *d)
 	}
 }
 
-static void i8259A_resume(void)
+static void i8259A_resume(void *data)
 {
 	if (i8259A_auto_eoi >= 0)
 		init_8259A(i8259A_auto_eoi);
 }
 
-static void i8259A_shutdown(void)
+static void i8259A_shutdown(void *data)
 {
 	/* Put the i8259A into a quiescent state that
 	 * the kernel initialization code can get it
@@ -220,11 +220,15 @@ static void i8259A_shutdown(void)
 	}
 }
 
-static struct syscore_ops i8259_syscore_ops = {
+static const struct syscore_ops i8259_syscore_ops = {
 	.resume = i8259A_resume,
 	.shutdown = i8259A_shutdown,
 };
 
+static struct syscore i8259_syscore = {
+	.ops = &i8259_syscore_ops,
+};
+
 static void init_8259A(int auto_eoi)
 {
 	unsigned long flags;
@@ -320,7 +324,7 @@ struct irq_domain * __init __init_i8259_irqs(struct device_node *node)
 
 	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
 		pr_err("Failed to register cascade interrupt\n");
-	register_syscore_ops(&i8259_syscore_ops);
+	register_syscore(&i8259_syscore);
 	return domain;
 }
 
diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index b91f5c14b405..04f7ba0657be 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -33,7 +33,7 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 	return cd->gpc_base + cd->cpu2wakeup + i * 4;
 }
 
-static int gpcv2_wakeup_source_save(void)
+static int gpcv2_wakeup_source_save(void *data)
 {
 	struct gpcv2_irqchip_data *cd;
 	void __iomem *reg;
@@ -52,7 +52,7 @@ static int gpcv2_wakeup_source_save(void)
 	return 0;
 }
 
-static void gpcv2_wakeup_source_restore(void)
+static void gpcv2_wakeup_source_restore(void *data)
 {
 	struct gpcv2_irqchip_data *cd;
 	int i;
@@ -65,9 +65,13 @@ static void gpcv2_wakeup_source_restore(void)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
 
-static struct syscore_ops imx_gpcv2_syscore_ops = {
-	.suspend	= gpcv2_wakeup_source_save,
-	.resume		= gpcv2_wakeup_source_restore,
+static const struct syscore_ops gpcv2_syscore_ops = {
+	.suspend = gpcv2_wakeup_source_save,
+	.resume = gpcv2_wakeup_source_restore,
+};
+
+static struct syscore gpcv2_syscore = {
+	.ops = &gpcv2_syscore_ops,
 };
 
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
@@ -276,7 +280,7 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
 	imx_gpcv2_instance = cd;
-	register_syscore_ops(&imx_gpcv2_syscore_ops);
+	register_syscore(&gpcv2_syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index 39e5a72ccd3c..ad2105685b48 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -407,21 +407,25 @@ static struct irq_domain *acpi_get_vec_parent(int node, struct acpi_vector_group
 	return NULL;
 }
 
-static int eiointc_suspend(void)
+static int eiointc_suspend(void *data)
 {
 	return 0;
 }
 
-static void eiointc_resume(void)
+static void eiointc_resume(void *data)
 {
 	eiointc_router_init(0);
 }
 
-static struct syscore_ops eiointc_syscore_ops = {
+static const struct syscore_ops eiointc_syscore_ops = {
 	.suspend = eiointc_suspend,
 	.resume = eiointc_resume,
 };
 
+static struct syscore eiointc_syscore = {
+	.ops = &eiointc_syscore_ops,
+};
+
 static int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
 					const unsigned long end)
 {
@@ -540,7 +544,7 @@ static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
 	eiointc_router_init(0);
 
 	if (nr_pics == 1) {
-		register_syscore_ops(&eiointc_syscore_ops);
+		register_syscore(&eiointc_syscore);
 		cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_EIOINTC_STARTING,
 					  "irqchip/loongarch/eiointc:starting",
 					  eiointc_router_init, NULL);
diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loongson-htpic.c
index f4abdf156de7..1c691c4be989 100644
--- a/drivers/irqchip/irq-loongson-htpic.c
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -71,15 +71,19 @@ static void htpic_reg_init(void)
 	writel(0xffff, htpic->base + HTINT_EN_OFF);
 }
 
-static void htpic_resume(void)
+static void htpic_resume(void *data)
 {
 	htpic_reg_init();
 }
 
-struct syscore_ops htpic_syscore_ops = {
+static const struct syscore_ops htpic_syscore_ops = {
 	.resume		= htpic_resume,
 };
 
+static struct syscore htpic_syscore = {
+	.ops = &htpic_syscore_ops,
+};
+
 static int __init htpic_of_init(struct device_node *node, struct device_node *parent)
 {
 	unsigned int parent_irq[4];
@@ -130,7 +134,7 @@ static int __init htpic_of_init(struct device_node *node, struct device_node *pa
 						htpic_irq_dispatch, htpic);
 	}
 
-	register_syscore_ops(&htpic_syscore_ops);
+	register_syscore(&htpic_syscore);
 
 	return 0;
 
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index d8558eb35044..d2be8e954e92 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -159,7 +159,7 @@ static void htvec_reset(struct htvec *priv)
 	}
 }
 
-static int htvec_suspend(void)
+static int htvec_suspend(void *data)
 {
 	int i;
 
@@ -169,7 +169,7 @@ static int htvec_suspend(void)
 	return 0;
 }
 
-static void htvec_resume(void)
+static void htvec_resume(void *data)
 {
 	int i;
 
@@ -177,11 +177,15 @@ static void htvec_resume(void)
 		writel(htvec_priv->saved_vec_en[i], htvec_priv->base + HTVEC_EN_OFF + 4 * i);
 }
 
-static struct syscore_ops htvec_syscore_ops = {
+static const struct syscore_ops htvec_syscore_ops = {
 	.suspend = htvec_suspend,
 	.resume = htvec_resume,
 };
 
+static struct syscore htvec_syscore = {
+	.ops = &htvec_syscore_ops,
+};
+
 static int htvec_init(phys_addr_t addr, unsigned long size,
 		int num_parents, int parent_irq[], struct fwnode_handle *domain_handle)
 {
@@ -214,7 +218,7 @@ static int htvec_init(phys_addr_t addr, unsigned long size,
 
 	htvec_priv = priv;
 
-	register_syscore_ops(&htvec_syscore_ops);
+	register_syscore(&htvec_syscore);
 
 	return 0;
 
diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 912bf50a5c7c..3a125f3e4287 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -151,7 +151,7 @@ static int pch_lpc_disabled(struct pch_lpc *priv)
 			(readl(priv->base + LPC_INT_STS) == 0xffffffff);
 }
 
-static int pch_lpc_suspend(void)
+static int pch_lpc_suspend(void *data)
 {
 	pch_lpc_priv->saved_reg_ctl = readl(pch_lpc_priv->base + LPC_INT_CTL);
 	pch_lpc_priv->saved_reg_ena = readl(pch_lpc_priv->base + LPC_INT_ENA);
@@ -159,18 +159,22 @@ static int pch_lpc_suspend(void)
 	return 0;
 }
 
-static void pch_lpc_resume(void)
+static void pch_lpc_resume(void *data)
 {
 	writel(pch_lpc_priv->saved_reg_ctl, pch_lpc_priv->base + LPC_INT_CTL);
 	writel(pch_lpc_priv->saved_reg_ena, pch_lpc_priv->base + LPC_INT_ENA);
 	writel(pch_lpc_priv->saved_reg_pol, pch_lpc_priv->base + LPC_INT_POL);
 }
 
-static struct syscore_ops pch_lpc_syscore_ops = {
+static const struct syscore_ops pch_lpc_syscore_ops = {
 	.suspend = pch_lpc_suspend,
 	.resume = pch_lpc_resume,
 };
 
+static struct syscore pch_lpc_syscore = {
+	.ops = &pch_lpc_syscore_ops,
+};
+
 int __init pch_lpc_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_lpc_pic *acpi_pchlpc)
 {
@@ -222,7 +226,7 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
 	pch_lpc_priv = priv;
 	pch_lpc_handle = irq_handle;
-	register_syscore_ops(&pch_lpc_syscore_ops);
+	register_syscore(&pch_lpc_syscore);
 
 	return 0;
 
diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index 62e6bf3a0611..c6b369a974a7 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -278,7 +278,7 @@ static void pch_pic_reset(struct pch_pic *priv)
 	}
 }
 
-static int pch_pic_suspend(void)
+static int pch_pic_suspend(void *data)
 {
 	int i, j;
 
@@ -296,7 +296,7 @@ static int pch_pic_suspend(void)
 	return 0;
 }
 
-static void pch_pic_resume(void)
+static void pch_pic_resume(void *data)
 {
 	int i, j;
 
@@ -313,11 +313,15 @@ static void pch_pic_resume(void)
 	}
 }
 
-static struct syscore_ops pch_pic_syscore_ops = {
+static const struct syscore_ops pch_pic_syscore_ops = {
 	.suspend =  pch_pic_suspend,
 	.resume =  pch_pic_resume,
 };
 
+static struct syscore pch_pic_syscore = {
+	.ops = &pch_pic_syscore_ops,
+};
+
 static int pch_pic_init(phys_addr_t addr, unsigned long size, int vec_base,
 			struct irq_domain *parent_domain, struct fwnode_handle *domain_handle,
 			u32 gsi_base)
@@ -356,7 +360,7 @@ static int pch_pic_init(phys_addr_t addr, unsigned long size, int vec_base,
 	pch_pic_priv[nr_pics++] = priv;
 
 	if (nr_pics == 1)
-		register_syscore_ops(&pch_pic_syscore_ops);
+		register_syscore(&pch_pic_syscore);
 
 	return 0;
 
diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index b513a899c085..2474fa467a05 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -109,7 +109,7 @@ static int mchp_eic_irq_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
-static int mchp_eic_irq_suspend(void)
+static int mchp_eic_irq_suspend(void *data)
 {
 	unsigned int hwirq;
 
@@ -123,7 +123,7 @@ static int mchp_eic_irq_suspend(void)
 	return 0;
 }
 
-static void mchp_eic_irq_resume(void)
+static void mchp_eic_irq_resume(void *data)
 {
 	unsigned int hwirq;
 
@@ -135,11 +135,15 @@ static void mchp_eic_irq_resume(void)
 			       MCHP_EIC_SCFG(hwirq));
 }
 
-static struct syscore_ops mchp_eic_syscore_ops = {
+static const struct syscore_ops mchp_eic_syscore_ops = {
 	.suspend = mchp_eic_irq_suspend,
 	.resume = mchp_eic_irq_resume,
 };
 
+static struct syscore mchp_eic_syscore = {
+	.ops = &mchp_eic_syscore_ops,
+};
+
 static struct irq_chip mchp_eic_chip = {
 	.name		= "eic",
 	.flags		= IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SET_TYPE_MASKED,
@@ -258,7 +262,7 @@ static int mchp_eic_probe(struct platform_device *pdev, struct device_node *pare
 		goto clk_unprepare;
 	}
 
-	register_syscore_ops(&mchp_eic_syscore_ops);
+	register_syscore(&mchp_eic_syscore);
 
 	pr_info("%pOF: EIC registered, nr_irqs %u\n", node, MCHP_EIC_NIRQ);
 
diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index 9643cc3a77d7..7f760f555a76 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -143,7 +143,7 @@ static void mst_intc_polarity_restore(struct mst_intc_chip_data *cd)
 		writew_relaxed(cd->saved_polarity_conf[i], addr + i * 4);
 }
 
-static void mst_irq_resume(void)
+static void mst_irq_resume(void *data)
 {
 	struct mst_intc_chip_data *cd;
 
@@ -151,7 +151,7 @@ static void mst_irq_resume(void)
 		mst_intc_polarity_restore(cd);
 }
 
-static int mst_irq_suspend(void)
+static int mst_irq_suspend(void *data)
 {
 	struct mst_intc_chip_data *cd;
 
@@ -160,14 +160,18 @@ static int mst_irq_suspend(void)
 	return 0;
 }
 
-static struct syscore_ops mst_irq_syscore_ops = {
+static const struct syscore_ops mst_irq_syscore_ops = {
 	.suspend	= mst_irq_suspend,
 	.resume		= mst_irq_resume,
 };
 
+static struct syscore mst_irq_syscore = {
+	.ops = &mst_irq_syscore_ops,
+};
+
 static int __init mst_irq_pm_init(void)
 {
-	register_syscore_ops(&mst_irq_syscore_ops);
+	register_syscore(&mst_irq_syscore);
 	return 0;
 }
 late_initcall(mst_irq_pm_init);
diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index de481ba340f8..9571f622774e 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -199,7 +199,7 @@ static const struct irq_domain_ops cirq_domain_ops = {
 };
 
 #ifdef CONFIG_PM_SLEEP
-static int mtk_cirq_suspend(void)
+static int mtk_cirq_suspend(void *data)
 {
 	void __iomem *reg;
 	u32 value, mask;
@@ -257,7 +257,7 @@ static int mtk_cirq_suspend(void)
 	return 0;
 }
 
-static void mtk_cirq_resume(void)
+static void mtk_cirq_resume(void *data)
 {
 	void __iomem *reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	u32 value;
@@ -272,14 +272,18 @@ static void mtk_cirq_resume(void)
 	writel_relaxed(value, reg);
 }
 
-static struct syscore_ops mtk_cirq_syscore_ops = {
+static const struct syscore_ops mtk_cirq_syscore_ops = {
 	.suspend	= mtk_cirq_suspend,
 	.resume		= mtk_cirq_resume,
 };
 
+static struct syscore mtk_cirq_syscore = {
+	.ops = &mtk_cirq_syscore_ops,
+};
+
 static void mtk_cirq_syscore_init(void)
 {
-	register_syscore_ops(&mtk_cirq_syscore_ops);
+	register_syscore(&mtk_cirq_syscore);
 }
 #else
 static inline void mtk_cirq_syscore_init(void) {}
diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 1bf19deb02c4..e73d426cea6d 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -398,7 +398,7 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
-static int rzg2l_irqc_irq_suspend(void)
+static int rzg2l_irqc_irq_suspend(void *data)
 {
 	struct rzg2l_irqc_reg_cache *cache = &rzg2l_irqc_data->cache;
 	void __iomem *base = rzg2l_irqc_data->base;
@@ -410,7 +410,7 @@ static int rzg2l_irqc_irq_suspend(void)
 	return 0;
 }
 
-static void rzg2l_irqc_irq_resume(void)
+static void rzg2l_irqc_irq_resume(void *data)
 {
 	struct rzg2l_irqc_reg_cache *cache = &rzg2l_irqc_data->cache;
 	void __iomem *base = rzg2l_irqc_data->base;
@@ -425,11 +425,15 @@ static void rzg2l_irqc_irq_resume(void)
 	writel_relaxed(cache->iitsr, base + IITSR);
 }
 
-static struct syscore_ops rzg2l_irqc_syscore_ops = {
+static const struct syscore_ops rzg2l_irqc_syscore_ops = {
 	.suspend	= rzg2l_irqc_irq_suspend,
 	.resume		= rzg2l_irqc_irq_resume,
 };
 
+static struct syscore rzg2l_irqc_syscore = {
+	.ops = &rzg2l_irqc_syscore_ops,
+};
+
 static const struct irq_chip rzg2l_irqc_chip = {
 	.name			= "rzg2l-irqc",
 	.irq_eoi		= rzg2l_irqc_eoi,
@@ -577,7 +581,7 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 		return -ENOMEM;
 	}
 
-	register_syscore_ops(&rzg2l_irqc_syscore_ops);
+	register_syscore(&rzg2l_irqc_syscore);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-sa11x0.c b/drivers/irqchip/irq-sa11x0.c
index d8d4dff16276..e5f24c5f3f41 100644
--- a/drivers/irqchip/irq-sa11x0.c
+++ b/drivers/irqchip/irq-sa11x0.c
@@ -85,7 +85,7 @@ static struct sa1100irq_state {
 	unsigned int	iccr;
 } sa1100irq_state;
 
-static int sa1100irq_suspend(void)
+static int sa1100irq_suspend(void *data)
 {
 	struct sa1100irq_state *st = &sa1100irq_state;
 
@@ -102,7 +102,7 @@ static int sa1100irq_suspend(void)
 	return 0;
 }
 
-static void sa1100irq_resume(void)
+static void sa1100irq_resume(void *data)
 {
 	struct sa1100irq_state *st = &sa1100irq_state;
 
@@ -114,14 +114,18 @@ static void sa1100irq_resume(void)
 	}
 }
 
-static struct syscore_ops sa1100irq_syscore_ops = {
+static const struct syscore_ops sa1100irq_syscore_ops = {
 	.suspend	= sa1100irq_suspend,
 	.resume		= sa1100irq_resume,
 };
 
+static struct syscore sa1100irq_syscore = {
+	.ops = &sa1100irq_syscore_ops,
+};
+
 static int __init sa1100irq_init_devicefs(void)
 {
-	register_syscore_ops(&sa1100irq_syscore_ops);
+	register_syscore(&sa1100irq_syscore);
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index d518a8b46874..8902a0090606 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -252,7 +252,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 	return IRQ_SET_MASK_OK;
 }
 
-static int plic_irq_suspend(void)
+static int plic_irq_suspend(void *data)
 {
 	struct plic_priv *priv;
 
@@ -267,7 +267,7 @@ static int plic_irq_suspend(void)
 	return 0;
 }
 
-static void plic_irq_resume(void)
+static void plic_irq_resume(void *data)
 {
 	unsigned int i, index, cpu;
 	unsigned long flags;
@@ -298,11 +298,15 @@ static void plic_irq_resume(void)
 	}
 }
 
-static struct syscore_ops plic_irq_syscore_ops = {
+static const struct syscore_ops plic_irq_syscore_ops = {
 	.suspend	= plic_irq_suspend,
 	.resume		= plic_irq_resume,
 };
 
+static struct syscore plic_irq_syscore = {
+	.ops = &plic_irq_syscore_ops,
+};
+
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
@@ -668,7 +672,7 @@ static int plic_probe(struct fwnode_handle *fwnode)
 			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 					  "irqchip/sifive/plic:starting",
 					  plic_starting_cpu, plic_dying_cpu);
-			register_syscore_ops(&plic_irq_syscore_ops);
+			register_syscore(&plic_irq_syscore);
 			plic_global_setup_done = true;
 		}
 	}
diff --git a/drivers/irqchip/irq-sun6i-r.c b/drivers/irqchip/irq-sun6i-r.c
index 37d4b29763bc..23251831c06e 100644
--- a/drivers/irqchip/irq-sun6i-r.c
+++ b/drivers/irqchip/irq-sun6i-r.c
@@ -268,7 +268,7 @@ static const struct irq_domain_ops sun6i_r_intc_domain_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
-static int sun6i_r_intc_suspend(void)
+static int sun6i_r_intc_suspend(void *data)
 {
 	u32 buf[BITS_TO_U32(MAX(SUN6I_NR_TOP_LEVEL_IRQS, SUN6I_NR_MUX_BITS))];
 	int i;
@@ -284,7 +284,7 @@ static int sun6i_r_intc_suspend(void)
 	return 0;
 }
 
-static void sun6i_r_intc_resume(void)
+static void sun6i_r_intc_resume(void *data)
 {
 	int i;
 
@@ -294,17 +294,21 @@ static void sun6i_r_intc_resume(void)
 		writel_relaxed(0, base + SUN6I_IRQ_ENABLE(i));
 }
 
-static void sun6i_r_intc_shutdown(void)
+static void sun6i_r_intc_shutdown(void *data)
 {
-	sun6i_r_intc_suspend();
+	sun6i_r_intc_suspend(data);
 }
 
-static struct syscore_ops sun6i_r_intc_syscore_ops = {
+static const struct syscore_ops sun6i_r_intc_syscore_ops = {
 	.suspend	= sun6i_r_intc_suspend,
 	.resume		= sun6i_r_intc_resume,
 	.shutdown	= sun6i_r_intc_shutdown,
 };
 
+static struct syscore sun6i_r_intc_syscore = {
+	.ops = &sun6i_r_intc_syscore_ops,
+};
+
 static int __init sun6i_r_intc_init(struct device_node *node,
 				    struct device_node *parent,
 				    const struct sun6i_r_intc_variant *v)
@@ -346,10 +350,10 @@ static int __init sun6i_r_intc_init(struct device_node *node,
 		return -ENOMEM;
 	}
 
-	register_syscore_ops(&sun6i_r_intc_syscore_ops);
+	register_syscore(&sun6i_r_intc_syscore);
 
 	sun6i_r_intc_ack_nmi();
-	sun6i_r_intc_resume();
+	sun6i_r_intc_resume(NULL);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index 66cbb9f77ff3..b6382cf6359a 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -132,7 +132,7 @@ static int tegra_set_wake(struct irq_data *d, unsigned int enable)
 	return 0;
 }
 
-static int tegra_ictlr_suspend(void)
+static int tegra_ictlr_suspend(void *data)
 {
 	unsigned long flags;
 	unsigned int i;
@@ -161,7 +161,7 @@ static int tegra_ictlr_suspend(void)
 	return 0;
 }
 
-static void tegra_ictlr_resume(void)
+static void tegra_ictlr_resume(void *data)
 {
 	unsigned long flags;
 	unsigned int i;
@@ -184,14 +184,18 @@ static void tegra_ictlr_resume(void)
 	local_irq_restore(flags);
 }
 
-static struct syscore_ops tegra_ictlr_syscore_ops = {
+static const struct syscore_ops tegra_ictlr_syscore_ops = {
 	.suspend	= tegra_ictlr_suspend,
 	.resume		= tegra_ictlr_resume,
 };
 
+static struct syscore tegra_ictlr_syscore = {
+	.ops = &tegra_ictlr_syscore_ops,
+};
+
 static void tegra_ictlr_syscore_init(void)
 {
-	register_syscore_ops(&tegra_ictlr_syscore_ops);
+	register_syscore(&tegra_ictlr_syscore);
 }
 #else
 #define tegra_set_wake	NULL
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index 2bcdf216a000..e38104c5064e 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -120,7 +120,7 @@ static void resume_one_vic(struct vic_device *vic)
 	writel(~vic->soft_int, base + VIC_INT_SOFT_CLEAR);
 }
 
-static void vic_resume(void)
+static void vic_resume(void *data)
 {
 	int id;
 
@@ -146,7 +146,7 @@ static void suspend_one_vic(struct vic_device *vic)
 	writel(~vic->resume_irqs, base + VIC_INT_ENABLE_CLEAR);
 }
 
-static int vic_suspend(void)
+static int vic_suspend(void *data)
 {
 	int id;
 
@@ -156,11 +156,15 @@ static int vic_suspend(void)
 	return 0;
 }
 
-static struct syscore_ops vic_syscore_ops = {
+static const struct syscore_ops vic_syscore_ops = {
 	.suspend	= vic_suspend,
 	.resume		= vic_resume,
 };
 
+static struct syscore vic_syscore = {
+	.ops = &vic_syscore_ops,
+};
+
 /**
  * vic_pm_init - initcall to register VIC pm
  *
@@ -171,7 +175,7 @@ static struct syscore_ops vic_syscore_ops = {
 static int __init vic_pm_init(void)
 {
 	if (vic_id > 0)
-		register_syscore_ops(&vic_syscore_ops);
+		register_syscore(&vic_syscore);
 
 	return 0;
 }
diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 05848a2fecff..679323c2ccda 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -94,28 +94,32 @@ void ledtrig_cpu(enum cpu_led_event ledevt)
 }
 EXPORT_SYMBOL(ledtrig_cpu);
 
-static int ledtrig_cpu_syscore_suspend(void)
+static int ledtrig_cpu_syscore_suspend(void *data)
 {
 	ledtrig_cpu(CPU_LED_STOP);
 	return 0;
 }
 
-static void ledtrig_cpu_syscore_resume(void)
+static void ledtrig_cpu_syscore_resume(void *data)
 {
 	ledtrig_cpu(CPU_LED_START);
 }
 
-static void ledtrig_cpu_syscore_shutdown(void)
+static void ledtrig_cpu_syscore_shutdown(void *data)
 {
 	ledtrig_cpu(CPU_LED_HALTED);
 }
 
-static struct syscore_ops ledtrig_cpu_syscore_ops = {
+static const struct syscore_ops ledtrig_cpu_syscore_ops = {
 	.shutdown	= ledtrig_cpu_syscore_shutdown,
 	.suspend	= ledtrig_cpu_syscore_suspend,
 	.resume		= ledtrig_cpu_syscore_resume,
 };
 
+static struct syscore ledtrig_cpu_syscore = {
+	.ops = &ledtrig_cpu_syscore_ops,
+};
+
 static int ledtrig_online_cpu(unsigned int cpu)
 {
 	ledtrig_cpu(CPU_LED_START);
@@ -157,7 +161,7 @@ static int __init ledtrig_cpu_init(void)
 		led_trigger_register_simple(trig->name, &trig->_trig);
 	}
 
-	register_syscore_ops(&ledtrig_cpu_syscore_ops);
+	register_syscore(&ledtrig_cpu_syscore);
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "leds/trigger:starting",
 				ledtrig_online_cpu, ledtrig_prepare_down_cpu);
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index b0f09c70f1ff..5fe47e784d43 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -2600,7 +2600,7 @@ void pmu_blink(int n)
 #if defined(CONFIG_SUSPEND) && defined(CONFIG_PPC32)
 int pmu_sys_suspended;
 
-static int pmu_syscore_suspend(void)
+static int pmu_syscore_suspend(void *data)
 {
 	/* Suspend PMU event interrupts */
 	pmu_suspend();
@@ -2614,7 +2614,7 @@ static int pmu_syscore_suspend(void)
 	return 0;
 }
 
-static void pmu_syscore_resume(void)
+static void pmu_syscore_resume(void *data)
 {
 	struct adb_request req;
 
@@ -2634,14 +2634,18 @@ static void pmu_syscore_resume(void)
 	pmu_sys_suspended = 0;
 }
 
-static struct syscore_ops pmu_syscore_ops = {
+static const struct syscore_ops pmu_syscore_ops = {
 	.suspend = pmu_syscore_suspend,
 	.resume = pmu_syscore_resume,
 };
 
+static struct syscore pmu_syscore = {
+	.ops = &pmu_syscore_ops,
+};
+
 static int pmu_syscore_register(void)
 {
-	register_syscore_ops(&pmu_syscore_ops);
+	register_syscore(&pmu_syscore);
 
 	return 0;
 }
diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/sc27xx-poweroff.c
index 90287c31992c..393bd1c33b73 100644
--- a/drivers/power/reset/sc27xx-poweroff.c
+++ b/drivers/power/reset/sc27xx-poweroff.c
@@ -28,7 +28,7 @@ static struct regmap *regmap;
  * taking cpus down to avoid racing regmap or spi mutex lock when poweroff
  * system through PMIC.
  */
-static void sc27xx_poweroff_shutdown(void)
+static void sc27xx_poweroff_shutdown(void *data)
 {
 #ifdef CONFIG_HOTPLUG_CPU
 	int cpu;
@@ -40,10 +40,14 @@ static void sc27xx_poweroff_shutdown(void)
 #endif
 }
 
-static struct syscore_ops poweroff_syscore_ops = {
+static const struct syscore_ops poweroff_syscore_ops = {
 	.shutdown = sc27xx_poweroff_shutdown,
 };
 
+static struct syscore poweroff_syscore = {
+	.ops = &poweroff_syscore_ops,
+};
+
 static void sc27xx_poweroff_do_poweroff(void)
 {
 	/* Disable the external subsys connection's power firstly */
@@ -62,7 +66,7 @@ static int sc27xx_poweroff_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	pm_power_off = sc27xx_poweroff_do_poweroff;
-	register_syscore_ops(&poweroff_syscore_ops);
+	register_syscore(&poweroff_syscore);
 	return 0;
 }
 
diff --git a/drivers/sh/clk/core.c b/drivers/sh/clk/core.c
index 7a73f5e4a1fc..f02e12dfa5f6 100644
--- a/drivers/sh/clk/core.c
+++ b/drivers/sh/clk/core.c
@@ -569,7 +569,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
 #ifdef CONFIG_PM
-static void clks_core_resume(void)
+static void clks_core_resume(void *data)
 {
 	struct clk *clkp;
 
@@ -588,13 +588,17 @@ static void clks_core_resume(void)
 	}
 }
 
-static struct syscore_ops clks_syscore_ops = {
+static const struct syscore_ops clks_syscore_ops = {
 	.resume = clks_core_resume,
 };
 
+static struct syscore clks_syscore = {
+	.ops = &clks_syscore_ops,
+};
+
 static int __init clk_syscore_init(void)
 {
-	register_syscore_ops(&clks_syscore_ops);
+	register_syscore(&clks_syscore);
 
 	return 0;
 }
diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
index ea571eeb3078..3dde703b7766 100644
--- a/drivers/sh/intc/core.c
+++ b/drivers/sh/intc/core.c
@@ -394,7 +394,7 @@ int __init register_intc_controller(struct intc_desc *desc)
 	return -ENOMEM;
 }
 
-static int intc_suspend(void)
+static int intc_suspend(void *data)
 {
 	struct intc_desc_int *d;
 
@@ -420,7 +420,7 @@ static int intc_suspend(void)
 	return 0;
 }
 
-static void intc_resume(void)
+static void intc_resume(void *data)
 {
 	struct intc_desc_int *d;
 
@@ -450,11 +450,15 @@ static void intc_resume(void)
 	}
 }
 
-struct syscore_ops intc_syscore_ops = {
+static const struct syscore_ops intc_syscore_ops = {
 	.suspend	= intc_suspend,
 	.resume		= intc_resume,
 };
 
+static struct syscore intc_syscore = {
+	.ops = &intc_syscore_ops,
+};
+
 const struct bus_type intc_subsys = {
 	.name		= "intc",
 	.dev_name	= "intc",
@@ -477,7 +481,7 @@ static int __init register_intc_devs(void)
 	struct intc_desc_int *d;
 	int error;
 
-	register_syscore_ops(&intc_syscore_ops);
+	register_syscore(&intc_syscore);
 
 	error = subsys_system_register(&intc_subsys, NULL);
 	if (!error) {
diff --git a/drivers/soc/bcm/brcmstb/biuctrl.c b/drivers/soc/bcm/brcmstb/biuctrl.c
index 364ddbe365c2..bd830649b60d 100644
--- a/drivers/soc/bcm/brcmstb/biuctrl.c
+++ b/drivers/soc/bcm/brcmstb/biuctrl.c
@@ -298,7 +298,7 @@ static int __init setup_hifcpubiuctrl_regs(struct device_node *np)
 #ifdef CONFIG_PM_SLEEP
 static u32 cpubiuctrl_reg_save[NUM_CPU_BIUCTRL_REGS];
 
-static int brcmstb_cpu_credit_reg_suspend(void)
+static int brcmstb_cpu_credit_reg_suspend(void *data)
 {
 	unsigned int i;
 
@@ -311,7 +311,7 @@ static int brcmstb_cpu_credit_reg_suspend(void)
 	return 0;
 }
 
-static void brcmstb_cpu_credit_reg_resume(void)
+static void brcmstb_cpu_credit_reg_resume(void *data)
 {
 	unsigned int i;
 
@@ -322,10 +322,14 @@ static void brcmstb_cpu_credit_reg_resume(void)
 		cbc_writel(cpubiuctrl_reg_save[i], i);
 }
 
-static struct syscore_ops brcmstb_cpu_credit_syscore_ops = {
+static const struct syscore_ops brcmstb_cpu_credit_syscore_ops = {
 	.suspend = brcmstb_cpu_credit_reg_suspend,
 	.resume = brcmstb_cpu_credit_reg_resume,
 };
+
+static struct syscore brcmstb_cpu_credit_syscore = {
+	.ops = &brcmstb_cpu_credit_syscore_ops,
+};
 #endif
 
 
@@ -354,7 +358,7 @@ static int __init brcmstb_biuctrl_init(void)
 	a72_b53_rac_enable_all(np);
 	mcp_a72_b53_set();
 #ifdef CONFIG_PM_SLEEP
-	register_syscore_ops(&brcmstb_cpu_credit_syscore_ops);
+	register_syscore(&brcmstb_cpu_credit_syscore);
 #endif
 	ret = 0;
 out_put:
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 443e33a459be..f57e5a4b4d96 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -467,7 +467,7 @@ struct tegra_pmc {
 	unsigned long *wake_type_dual_edge_map;
 	unsigned long *wake_sw_status_map;
 	unsigned long *wake_cntrl_level_map;
-	struct syscore_ops syscore;
+	struct syscore syscore;
 };
 
 static struct tegra_pmc *pmc = &(struct tegra_pmc) {
@@ -3148,7 +3148,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 	}
 }
 
-static void tegra186_pmc_wake_syscore_resume(void)
+static void tegra186_pmc_wake_syscore_resume(void *data)
 {
 	u32 status, mask;
 	unsigned int i;
@@ -3161,7 +3161,7 @@ static void tegra186_pmc_wake_syscore_resume(void)
 	}
 }
 
-static int tegra186_pmc_wake_syscore_suspend(void)
+static int tegra186_pmc_wake_syscore_suspend(void *data)
 {
 	wke_read_sw_wake_status(pmc);
 
@@ -3180,6 +3180,11 @@ static int tegra186_pmc_wake_syscore_suspend(void)
 	return 0;
 }
 
+static const struct syscore_ops tegra186_pmc_wake_syscore_ops = {
+	.suspend = tegra186_pmc_wake_syscore_suspend,
+	.resume = tegra186_pmc_wake_syscore_resume,
+};
+
 #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
 static int tegra_pmc_suspend(struct device *dev)
 {
@@ -3830,10 +3835,8 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
 
 static void tegra186_pmc_init(struct tegra_pmc *pmc)
 {
-	pmc->syscore.suspend = tegra186_pmc_wake_syscore_suspend;
-	pmc->syscore.resume = tegra186_pmc_wake_syscore_resume;
-
-	register_syscore_ops(&pmc->syscore);
+	pmc->syscore.ops = &tegra186_pmc_wake_syscore_ops;
+	register_syscore(&pmc->syscore);
 }
 
 static void tegra186_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/intel_hfi.c
index bd2fca7dc017..8a2f441cd2ec 100644
--- a/drivers/thermal/intel/intel_hfi.c
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -592,7 +592,7 @@ static void hfi_disable_instance(void *ptr)
 	hfi_disable();
 }
 
-static void hfi_syscore_resume(void)
+static void hfi_syscore_resume(void *data)
 {
 	/* This code runs only on the boot CPU. */
 	struct hfi_cpu_info *info = &per_cpu(hfi_cpu_info, 0);
@@ -603,7 +603,7 @@ static void hfi_syscore_resume(void)
 		hfi_enable_instance(hfi_instance);
 }
 
-static int hfi_syscore_suspend(void)
+static int hfi_syscore_suspend(void *data)
 {
 	/* No locking needed. There is no concurrency with CPU offline. */
 	hfi_disable();
@@ -611,11 +611,15 @@ static int hfi_syscore_suspend(void)
 	return 0;
 }
 
-static struct syscore_ops hfi_pm_ops = {
+static const struct syscore_ops hfi_pm_ops = {
 	.resume = hfi_syscore_resume,
 	.suspend = hfi_syscore_suspend,
 };
 
+static struct syscore hfi_pm = {
+	.ops = &hfi_pm_ops,
+};
+
 static int hfi_thermal_notify(struct notifier_block *nb, unsigned long state,
 			      void *_notify)
 {
@@ -710,7 +714,7 @@ void __init intel_hfi_init(void)
 	if (thermal_genl_register_notifier(&hfi_thermal_nb))
 		goto err_nl_notif;
 
-	register_syscore_ops(&hfi_pm_ops);
+	register_syscore(&hfi_pm);
 
 	return;
 
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index 296703939846..f2e8eaf684ba 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -495,7 +495,7 @@ static void xen_acpi_processor_resume_worker(struct work_struct *dummy)
 		pr_info("ACPI data upload failed, error = %d\n", rc);
 }
 
-static void xen_acpi_processor_resume(void)
+static void xen_acpi_processor_resume(void *data)
 {
 	static DECLARE_WORK(wq, xen_acpi_processor_resume_worker);
 
@@ -509,10 +509,14 @@ static void xen_acpi_processor_resume(void)
 	schedule_work(&wq);
 }
 
-static struct syscore_ops xap_syscore_ops = {
+static const struct syscore_ops xap_syscore_ops = {
 	.resume	= xen_acpi_processor_resume,
 };
 
+static struct syscore xap_syscore = {
+	.ops = &xap_syscore_ops,
+};
+
 static int __init xen_acpi_processor_init(void)
 {
 	int i;
@@ -563,7 +567,7 @@ static int __init xen_acpi_processor_init(void)
 	if (rc)
 		goto err_unregister;
 
-	register_syscore_ops(&xap_syscore_ops);
+	register_syscore(&xap_syscore);
 
 	return 0;
 err_unregister:
@@ -580,7 +584,7 @@ static void __exit xen_acpi_processor_exit(void)
 {
 	int i;
 
-	unregister_syscore_ops(&xap_syscore_ops);
+	unregister_syscore(&xap_syscore);
 	bitmap_free(acpi_ids_done);
 	bitmap_free(acpi_id_present);
 	bitmap_free(acpi_id_cst_present);
diff --git a/include/linux/syscore_ops.h b/include/linux/syscore_ops.h
index ae4d48e4c970..ac6d71be5c38 100644
--- a/include/linux/syscore_ops.h
+++ b/include/linux/syscore_ops.h
@@ -11,14 +11,19 @@
 #include <linux/list.h>
 
 struct syscore_ops {
+	int (*suspend)(void *data);
+	void (*resume)(void *data);
+	void (*shutdown)(void *data);
+};
+
+struct syscore {
 	struct list_head node;
-	int (*suspend)(void);
-	void (*resume)(void);
-	void (*shutdown)(void);
+	const struct syscore_ops *ops;
+	void *data;
 };
 
-extern void register_syscore_ops(struct syscore_ops *ops);
-extern void unregister_syscore_ops(struct syscore_ops *ops);
+extern void register_syscore(struct syscore *syscore);
+extern void unregister_syscore(struct syscore *syscore);
 #ifdef CONFIG_PM_SLEEP
 extern int syscore_suspend(void);
 extern void syscore_resume(void);
diff --git a/kernel/cpu_pm.c b/kernel/cpu_pm.c
index b0f0d15085db..7481fbb947d3 100644
--- a/kernel/cpu_pm.c
+++ b/kernel/cpu_pm.c
@@ -173,7 +173,7 @@ int cpu_cluster_pm_exit(void)
 EXPORT_SYMBOL_GPL(cpu_cluster_pm_exit);
 
 #ifdef CONFIG_PM
-static int cpu_pm_suspend(void)
+static int cpu_pm_suspend(void *data)
 {
 	int ret;
 
@@ -185,20 +185,24 @@ static int cpu_pm_suspend(void)
 	return ret;
 }
 
-static void cpu_pm_resume(void)
+static void cpu_pm_resume(void *data)
 {
 	cpu_cluster_pm_exit();
 	cpu_pm_exit();
 }
 
-static struct syscore_ops cpu_pm_syscore_ops = {
+static const struct syscore_ops cpu_pm_syscore_ops = {
 	.suspend = cpu_pm_suspend,
 	.resume = cpu_pm_resume,
 };
 
+static struct syscore cpu_pm_syscore = {
+	.ops = &cpu_pm_syscore_ops,
+};
+
 static int cpu_pm_init(void)
 {
-	register_syscore_ops(&cpu_pm_syscore_ops);
+	register_syscore(&cpu_pm_syscore);
 	return 0;
 }
 core_initcall(cpu_pm_init);
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index bf59e37d650a..3cd0c40282c0 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -650,7 +650,7 @@ static struct irq_data *irq_gc_get_irq_data(struct irq_chip_generic *gc)
 }
 
 #ifdef CONFIG_PM
-static int irq_gc_suspend(void)
+static int irq_gc_suspend(void *data)
 {
 	struct irq_chip_generic *gc;
 
@@ -670,7 +670,7 @@ static int irq_gc_suspend(void)
 	return 0;
 }
 
-static void irq_gc_resume(void)
+static void irq_gc_resume(void *data)
 {
 	struct irq_chip_generic *gc;
 
@@ -693,7 +693,7 @@ static void irq_gc_resume(void)
 #define irq_gc_resume NULL
 #endif
 
-static void irq_gc_shutdown(void)
+static void irq_gc_shutdown(void *data)
 {
 	struct irq_chip_generic *gc;
 
@@ -709,15 +709,19 @@ static void irq_gc_shutdown(void)
 	}
 }
 
-static struct syscore_ops irq_gc_syscore_ops = {
+static const struct syscore_ops irq_gc_syscore_ops = {
 	.suspend = irq_gc_suspend,
 	.resume = irq_gc_resume,
 	.shutdown = irq_gc_shutdown,
 };
 
+static struct syscore irq_gc_syscore = {
+	.ops = &irq_gc_syscore_ops,
+};
+
 static int __init irq_gc_init_ops(void)
 {
-	register_syscore_ops(&irq_gc_syscore_ops);
+	register_syscore(&irq_gc_syscore);
 	return 0;
 }
 device_initcall(irq_gc_init_ops);
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index f7394729cedc..99ff65466d87 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -211,21 +211,26 @@ void rearm_wake_irq(unsigned int irq)
 
 /**
  * irq_pm_syscore_resume - enable interrupt lines early
+ * @data: syscore context
  *
  * Enable all interrupt lines with %IRQF_EARLY_RESUME set.
  */
-static void irq_pm_syscore_resume(void)
+static void irq_pm_syscore_resume(void *data)
 {
 	resume_irqs(true);
 }
 
-static struct syscore_ops irq_pm_syscore_ops = {
+static const struct syscore_ops irq_pm_syscore_ops = {
 	.resume		= irq_pm_syscore_resume,
 };
 
+static struct syscore irq_pm_syscore = {
+	.ops = &irq_pm_syscore_ops,
+};
+
 static int __init irq_pm_init_ops(void)
 {
-	register_syscore_ops(&irq_pm_syscore_ops);
+	register_syscore(&irq_pm_syscore);
 	return 0;
 }
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index cb79d1d2e6e5..5c132be896c9 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3691,12 +3691,13 @@ static bool legacy_kthread_create(void)
 
 /**
  * printk_kthreads_shutdown - shutdown all threaded printers
+ * @data: syscore context
  *
  * On system shutdown all threaded printers are stopped. This allows printk
  * to transition back to atomic printing, thus providing a robust mechanism
  * for the final shutdown/reboot messages to be output.
  */
-static void printk_kthreads_shutdown(void)
+static void printk_kthreads_shutdown(void *data)
 {
 	struct console *con;
 
@@ -3718,10 +3719,14 @@ static void printk_kthreads_shutdown(void)
 	console_list_unlock();
 }
 
-static struct syscore_ops printk_syscore_ops = {
+static const struct syscore_ops printk_syscore_ops = {
 	.shutdown = printk_kthreads_shutdown,
 };
 
+static struct syscore printk_syscore = {
+	.ops = &printk_syscore_ops,
+};
+
 /*
  * If appropriate, start nbcon kthreads and set @printk_kthreads_running.
  * If any kthreads fail to start, those consoles are unregistered.
@@ -3789,7 +3794,7 @@ static void printk_kthreads_check_locked(void)
 
 static int __init printk_set_kthreads_ready(void)
 {
-	register_syscore_ops(&printk_syscore_ops);
+	register_syscore(&printk_syscore);
 
 	console_list_lock();
 	printk_kthreads_ready = true;
diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc1afec306b3..f39111830ca3 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -296,6 +296,11 @@ int sched_clock_suspend(void)
 	return 0;
 }
 
+static int sched_clock_syscore_suspend(void *data)
+{
+	return sched_clock_suspend();
+}
+
 void sched_clock_resume(void)
 {
 	struct clock_read_data *rd = &cd.read_data[0];
@@ -305,14 +310,23 @@ void sched_clock_resume(void)
 	rd->read_sched_clock = cd.actual_read_sched_clock;
 }
 
-static struct syscore_ops sched_clock_ops = {
-	.suspend	= sched_clock_suspend,
-	.resume		= sched_clock_resume,
+static void sched_clock_syscore_resume(void *data)
+{
+	sched_clock_resume();
+}
+
+static const struct syscore_ops sched_clock_syscore_ops = {
+	.suspend	= sched_clock_syscore_suspend,
+	.resume		= sched_clock_syscore_resume,
+};
+
+static struct syscore sched_clock_syscore = {
+	.ops = &sched_clock_syscore_ops,
 };
 
 static int __init sched_clock_syscore_init(void)
 {
-	register_syscore_ops(&sched_clock_ops);
+	register_syscore(&sched_clock_syscore);
 
 	return 0;
 }
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 3a4d3b2e3f74..744987f3db25 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1994,6 +1994,11 @@ void timekeeping_resume(void)
 	timerfd_resume();
 }
 
+static void timekeeping_syscore_resume(void *data)
+{
+	timekeeping_resume();
+}
+
 int timekeeping_suspend(void)
 {
 	struct timekeeper *tks = &tk_core.shadow_timekeeper;
@@ -2061,15 +2066,24 @@ int timekeeping_suspend(void)
 	return 0;
 }
 
+static int timekeeping_syscore_suspend(void *data)
+{
+	return timekeeping_suspend();
+}
+
 /* sysfs resume/suspend bits for timekeeping */
-static struct syscore_ops timekeeping_syscore_ops = {
-	.resume		= timekeeping_resume,
-	.suspend	= timekeeping_suspend,
+static const struct syscore_ops timekeeping_syscore_ops = {
+	.resume		= timekeeping_syscore_resume,
+	.suspend	= timekeeping_syscore_suspend,
+};
+
+static struct syscore timekeeping_syscore = {
+	.ops = &timekeeping_syscore_ops,
 };
 
 static int __init timekeeping_init_ops(void)
 {
-	register_syscore_ops(&timekeeping_syscore_ops);
+	register_syscore(&timekeeping_syscore);
 	return 0;
 }
 device_initcall(timekeeping_init_ops);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4845e5739436..87c621f63365 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5629,7 +5629,7 @@ static int kvm_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void kvm_shutdown(void)
+static void kvm_shutdown(void *data)
 {
 	/*
 	 * Disable hardware virtualization and set kvm_rebooting to indicate
@@ -5647,7 +5647,7 @@ static void kvm_shutdown(void)
 	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
 }
 
-static int kvm_suspend(void)
+static int kvm_suspend(void *data)
 {
 	/*
 	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
@@ -5664,7 +5664,7 @@ static int kvm_suspend(void)
 	return 0;
 }
 
-static void kvm_resume(void)
+static void kvm_resume(void *data)
 {
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
@@ -5672,12 +5672,16 @@ static void kvm_resume(void)
 	WARN_ON_ONCE(kvm_enable_virtualization_cpu());
 }
 
-static struct syscore_ops kvm_syscore_ops = {
+static const struct syscore_ops kvm_syscore_ops = {
 	.suspend = kvm_suspend,
 	.resume = kvm_resume,
 	.shutdown = kvm_shutdown,
 };
 
+static struct syscore kvm_syscore = {
+	.ops = &kvm_syscore_ops,
+};
+
 int kvm_enable_virtualization(void)
 {
 	int r;
@@ -5694,7 +5698,7 @@ int kvm_enable_virtualization(void)
 	if (r)
 		goto err_cpuhp;
 
-	register_syscore_ops(&kvm_syscore_ops);
+	register_syscore(&kvm_syscore);
 
 	/*
 	 * Undo virtualization enabling and bail if the system is going down.
@@ -5716,7 +5720,7 @@ int kvm_enable_virtualization(void)
 	return 0;
 
 err_rebooting:
-	unregister_syscore_ops(&kvm_syscore_ops);
+	unregister_syscore(&kvm_syscore);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 err_cpuhp:
 	kvm_arch_disable_virtualization();
@@ -5732,7 +5736,7 @@ void kvm_disable_virtualization(void)
 	if (--kvm_usage_count)
 		return;
 
-	unregister_syscore_ops(&kvm_syscore_ops);
+	unregister_syscore(&kvm_syscore);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 	kvm_arch_disable_virtualization();
 }
-- 
2.51.0


