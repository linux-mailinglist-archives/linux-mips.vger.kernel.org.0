Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FC33D4E86
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jul 2021 18:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhGYPWe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jul 2021 11:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbhGYPWd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jul 2021 11:22:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19ABC061760;
        Sun, 25 Jul 2021 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=jUS3uVX7qCY8Zqt4eCdPC4NShmGg5y/gOwJV6l7jljc=; b=nDk7Si10PIJPTgvosvXTHCtSVS
        Kn49cGMsSS0HINLRjrNuWWrY2xD+N1/5NCDOiOr9VECNbb55blwQsfodMgIGmUjkQzEgayYPoBtK3
        mYCLnO/SBA1bd4fXkcLHfutsPMrlriGPuffbQjn3aK1tOqnMWqbchmbc+pDq8YpNS23j1FsE9bOfx
        fyvdp9LaAbzkpN0hALkPBii63NZOp9uYY7RfrfC/nDq4SVLZJmG9E+QtNwQQauIwbkJCFpP51+pZr
        5XquhKLYA4kK1UQyon0vBSMTrJb8b/XG/O96Q0ToXw7GlgwqaJgFz7scC21Q683VI8hGmSHMtlADs
        N9uUAqtg==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m7gaj-008oIU-Hd; Sun, 25 Jul 2021 16:03:01 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH 2/3] mips: clean up kernel-doc in cavium-octeon/*.c
Date:   Sun, 25 Jul 2021 09:02:57 -0700
Message-Id: <20210725160258.28950-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210725160258.28950-1-rdunlap@infradead.org>
References: <20210725160258.28950-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert function comments to kernel-doc notation to remove
kernel-doc warnings in arch/mips/cavium-octeon/*.c.
Also clean up the comments in a few places.

   arch/mips/cavium-octeon/flash_setup.c:66: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Module/ driver initialization.
--
   arch/mips/cavium-octeon/setup.c:308: warning: expecting prototype for Return non zero if we are currently running in the Octeon simulator(). Prototype was for octeon_is_simulation() instead
   arch/mips/cavium-octeon/setup.c:314: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return true if Octeon is in PCI Host mode. This means
   arch/mips/cavium-octeon/setup.c:334: warning: expecting prototype for Get the clock rate of Octeon(). Prototype was for octeon_get_clock_rate() instead
   arch/mips/cavium-octeon/setup.c:351: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write to the LCD display connected to the bootbus. This display
   arch/mips/cavium-octeon/setup.c:380: warning: expecting prototype for Return the console uart passed by the bootloader(). Prototype was for octeon_get_boot_uart() instead
   arch/mips/cavium-octeon/setup.c:386: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get the coremask Linux was booted on.
   arch/mips/cavium-octeon/setup.c:399: warning: expecting prototype for Check the hardware BIST results for a CPU(). Prototype was for octeon_check_cpu_bist() instead
   arch/mips/cavium-octeon/setup.c:432: warning: expecting prototype for Reboot Octeon(). Prototype was for octeon_restart() instead
   arch/mips/cavium-octeon/setup.c:452: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Permanently stop a core.
   arch/mips/cavium-octeon/setup.c:475: warning: expecting prototype for Halt the system(). Prototype was for octeon_halt() instead
   arch/mips/cavium-octeon/setup.c:520: warning: expecting prototype for Return a string representing the system type(). Prototype was for octeon_board_type_string() instead
   arch/mips/cavium-octeon/setup.c:661: warning: expecting prototype for Early entry point for arch setup(). Prototype was for prom_init() instead
--
   arch/mips/cavium-octeon/smp.c:100: warning: Function parameter or member 'cpu' not described in 'octeon_send_ipi_single'
   arch/mips/cavium-octeon/smp.c:100: warning: Function parameter or member 'action' not described in 'octeon_send_ipi_single'
   arch/mips/cavium-octeon/smp.c:100: warning: expecting prototype for Cause the function described by call_data to be executed on the passed(). Prototype was for octeon_send_ipi_single() instead
   arch/mips/cavium-octeon/smp.c:119: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Detect available CPUs, populate cpu_possible_mask
   arch/mips/cavium-octeon/smp.c:210: warning: Function parameter or member 'cpu' not described in 'octeon_boot_secondary'
   arch/mips/cavium-octeon/smp.c:210: warning: Function parameter or member 'idle' not described in 'octeon_boot_secondary'
   arch/mips/cavium-octeon/smp.c:210: warning: expecting prototype for Firmware CPU startup hook(). Prototype was for octeon_boot_secondary() instead
   arch/mips/cavium-octeon/smp.c:236: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * After we've done initial boot, this function is called to allow the
   arch/mips/cavium-octeon/smp.c:258: warning: Function parameter or member 'max_cpus' not described in 'octeon_prepare_cpus'
   arch/mips/cavium-octeon/smp.c:258: warning: expecting prototype for Callout to firmware before smp_init(). Prototype was for octeon_prepare_cpus() instead
   arch/mips/cavium-octeon/smp.c:276: warning: expecting prototype for Last chance for the board code to finish SMP initialization before(). Prototype was for octeon_smp_finish() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/cavium-octeon/flash_setup.c |    2 -
 arch/mips/cavium-octeon/setup.c       |   43 ++++++++++++------------
 arch/mips/cavium-octeon/smp.c         |   14 +++----
 3 files changed, 29 insertions(+), 30 deletions(-)

--- linux-next-20210723.orig/arch/mips/cavium-octeon/flash_setup.c
+++ linux-next-20210723/arch/mips/cavium-octeon/flash_setup.c
@@ -62,7 +62,7 @@ static void octeon_flash_map_copy_to(str
 	up(&octeon_bootbus_sem);
 }
 
-/**
+/*
  * Module/ driver initialization.
  *
  * Returns Zero on success
--- linux-next-20210723.orig/arch/mips/cavium-octeon/setup.c
+++ linux-next-20210723/arch/mips/cavium-octeon/setup.c
@@ -295,9 +295,10 @@ static int octeon_uart;
 extern asmlinkage void handle_int(void);
 
 /**
- * Return non zero if we are currently running in the Octeon simulator
+ * octeon_is_simulation - Return non-zero if we are currently running
+ * in the Octeon simulator
  *
- * Returns
+ * Return: non-0 if running in the Octeon simulator, 0 otherwise
  */
 int octeon_is_simulation(void)
 {
@@ -306,10 +307,10 @@ int octeon_is_simulation(void)
 EXPORT_SYMBOL(octeon_is_simulation);
 
 /**
- * Return true if Octeon is in PCI Host mode. This means
+ * octeon_is_pci_host - Return true if Octeon is in PCI Host mode. This means
  * Linux can control the PCI bus.
  *
- * Returns Non zero if Octeon in host mode.
+ * Return: Non-zero if Octeon is in host mode.
  */
 int octeon_is_pci_host(void)
 {
@@ -321,9 +322,9 @@ int octeon_is_pci_host(void)
 }
 
 /**
- * Get the clock rate of Octeon
+ * octeon_get_clock_rate - Get the clock rate of Octeon
  *
- * Returns Clock rate in HZ
+ * Return: Clock rate in HZ
  */
 uint64_t octeon_get_clock_rate(void)
 {
@@ -343,11 +344,11 @@ EXPORT_SYMBOL(octeon_get_io_clock_rate);
 
 
 /**
- * Write to the LCD display connected to the bootbus. This display
- * exists on most Cavium evaluation boards. If it doesn't exist, then
- * this function doesn't do anything.
- *
+ * octeon_write_lcd - Write to the LCD display connected to the bootbus.
  * @s:	    String to write
+ *
+ * This display exists on most Cavium evaluation boards. If it doesn't exist,
+ * then this function doesn't do anything.
  */
 static void octeon_write_lcd(const char *s)
 {
@@ -367,9 +368,9 @@ static void octeon_write_lcd(const char
 }
 
 /**
- * Return the console uart passed by the bootloader
+ * octeon_get_boot_uart - Return the console uart passed by the bootloader
  *
- * Returns uart	  (0 or 1)
+ * Return: uart number (0 or 1)
  */
 static int octeon_get_boot_uart(void)
 {
@@ -378,9 +379,9 @@ static int octeon_get_boot_uart(void)
 }
 
 /**
- * Get the coremask Linux was booted on.
+ * octeon_get_boot_coremask - Get the coremask Linux was booted on.
  *
- * Returns Core mask
+ * Return: Core mask
  */
 int octeon_get_boot_coremask(void)
 {
@@ -388,7 +389,7 @@ int octeon_get_boot_coremask(void)
 }
 
 /**
- * Check the hardware BIST results for a CPU
+ * octeon_check_cpu_bist - Check the hardware BIST results for a CPU
  */
 void octeon_check_cpu_bist(void)
 {
@@ -419,7 +420,7 @@ void octeon_check_cpu_bist(void)
 }
 
 /**
- * Reboot Octeon
+ * octeon_restart - Reboot Octeon
  *
  * @command: Command to pass to the bootloader. Currently ignored.
  */
@@ -444,7 +445,7 @@ static void octeon_restart(char *command
 
 
 /**
- * Permanently stop a core.
+ * octeon_kill_core - Permanently stop a core.
  *
  * @arg: Ignored.
  */
@@ -464,7 +465,7 @@ static void octeon_kill_core(void *arg)
 
 
 /**
- * Halt the system
+ * octeon_halt - Halt the system
  */
 static void octeon_halt(void)
 {
@@ -507,9 +508,9 @@ static void __init init_octeon_system_ty
 }
 
 /**
- * Return a string representing the system type
+ * octeon_board_type_string - Return a string representing the system type
  *
- * Returns
+ * Return: system type string
  */
 const char *octeon_board_type_string(void)
 {
@@ -650,7 +651,7 @@ void octeon_user_io_init(void)
 }
 
 /**
- * Early entry point for arch setup
+ * prom_init - Early entry point for arch setup
  */
 void __init prom_init(void)
 {
--- linux-next-20210723.orig/arch/mips/cavium-octeon/smp.c
+++ linux-next-20210723/arch/mips/cavium-octeon/smp.c
@@ -91,7 +91,7 @@ static irqreturn_t mailbox_interrupt(int
 	return IRQ_HANDLED;
 }
 
-/**
+/*
  * Cause the function described by call_data to be executed on the passed
  * cpu.	 When the function has finished, increment the finished field of
  * call_data.
@@ -115,7 +115,7 @@ static inline void octeon_send_ipi_mask(
 		octeon_send_ipi_single(i, action);
 }
 
-/**
+/*
  * Detect available CPUs, populate cpu_possible_mask
  */
 static void octeon_smp_hotplug_setup(void)
@@ -202,9 +202,8 @@ int plat_post_relocation(long offset)
 }
 #endif /* CONFIG_RELOCATABLE */
 
-/**
+/*
  * Firmware CPU startup hook
- *
  */
 static int octeon_boot_secondary(int cpu, struct task_struct *idle)
 {
@@ -232,7 +231,7 @@ static int octeon_boot_secondary(int cpu
 	return 0;
 }
 
-/**
+/*
  * After we've done initial boot, this function is called to allow the
  * board code to clean up state, if needed
  */
@@ -250,9 +249,8 @@ static void octeon_init_secondary(void)
 	octeon_irq_setup_secondary();
 }
 
-/**
+/*
  * Callout to firmware before smp_init
- *
  */
 static void __init octeon_prepare_cpus(unsigned int max_cpus)
 {
@@ -268,7 +266,7 @@ static void __init octeon_prepare_cpus(u
 	}
 }
 
-/**
+/*
  * Last chance for the board code to finish SMP initialization before
  * the CPU is "online".
  */
