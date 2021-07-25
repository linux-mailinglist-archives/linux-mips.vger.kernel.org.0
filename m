Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D4F3D4E87
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jul 2021 18:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhGYPWe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Jul 2021 11:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbhGYPWd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Jul 2021 11:22:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2494C061764;
        Sun, 25 Jul 2021 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=OBseuT+N1uLWvI9BZ5Zt8MzUMNrkT9p4ujmDQ7WP/W4=; b=BBtWzZdi1nuHT9zaH7jxlcnJdF
        5wP0coEeiOKMzTivxwZOEOIV5K+XnWW4ued+nbO+iDodPTum3OM0Zin9LtP0Pw5h8icchmhY37BqF
        lGJc2nRmWz/hPMrZqSrx4WpyA2pYV6obK0XIv8Fh3Ene9i4gsMgcoDtnqEjYZCT5oO55wP7aiYZJw
        5RIRHFaonpHpx+2j8dQVEsDuVjCNLzMlTeT8CpfhYy16l+LrGGh5PHThfNR+eenXw4uKVEIcHoGAq
        66ftNlJF6L702sWUir3D1gAHaXFF2CzdLsfhUIG+O0ZXKK6bEO7brpbjOIhtjXpNPo8MlwXd1nXRr
        2HYWRjkQ==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m7gaj-008oIU-53; Sun, 25 Jul 2021 16:03:01 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH 1/3] mips: clean up (remove) kernel-doc in cavium-octeon/executive/
Date:   Sun, 25 Jul 2021 09:02:56 -0700
Message-Id: <20210725160258.28950-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210725160258.28950-1-rdunlap@infradead.org>
References: <20210725160258.28950-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove all kernel-doc notation in arch/mips/cavium-octeon/executive/.
This removes dozens of kernel-doc warnings.

Most of these functions are static and don't need to be documented
with kernel-doc.
The function comments are still present for anyone who wants to read them.
These files are part of the OCTEON SDK so presumably they are documented
there as well.

   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:61: warning: Function parameter or member 'addr' not described in 'CVMX_BOOTMEM_NAMED_GET_FIELD'
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:61: warning: Function parameter or member 'field' not described in 'CVMX_BOOTMEM_NAMED_GET_FIELD'
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:61: warning: expecting prototype for This macro returns a member of the(). Prototype was for CVMX_BOOTMEM_NAMED_GET_FIELD() instead
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:77: warning: Function parameter or member 'base' not described in '__cvmx_bootmem_desc_get'
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:77: warning: Function parameter or member 'offset' not described in '__cvmx_bootmem_desc_get'
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:77: warning: Function parameter or member 'size' not described in '__cvmx_bootmem_desc_get'
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:77: warning: expecting prototype for This function is the implementation of the get macros defined(). Prototype was for __cvmx_bootmem_desc_get() instead
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:133: warning: expecting prototype for Allocate a block of memory from the free list that was(). Prototype was for cvmx_bootmem_alloc_range() instead
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:554: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Finds a named memory block by name.
   arch/mips/cavium-octeon/executive/cvmx-bootmem.c:661: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Frees a named block.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/cavium-octeon/executive/cvmx-helper-board.c:64: warning: expecting prototype for Return the MII PHY address associated with the given IPD(). Prototype was for cvmx_helper_board_get_mii_address() instead
   arch/mips/cavium-octeon/executive/cvmx-helper-board.c:211: warning: expecting prototype for This function is the board specific method of determining an(). Prototype was for __cvmx_helper_board_link_get() instead
   arch/mips/cavium-octeon/executive/cvmx-helper-board.c:278: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called by cvmx_helper_interface_probe() after it
   arch/mips/cavium-octeon/executive/cvmx-helper-board.c:324: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get the clock type used for the USB block based on board type.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/cavium-octeon/executive/cvmx-spi.c:77: warning: expecting prototype for Get current SPI4 initialization callbacks(). Prototype was for cvmx_spi_get_callbacks() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:87: warning: expecting prototype for Set new SPI4 initialization callbacks(). Prototype was for cvmx_spi_set_callbacks() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:92: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialize and start the SPI interface.
   arch/mips/cavium-octeon/executive/cvmx-spi.c:151: warning: expecting prototype for This routine restarts the SPI interface after it has lost synchronization(). Prototype was for cvmx_spi_restart_interface() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:196: warning: expecting prototype for Callback to perform SPI4 reset(). Prototype was for cvmx_spi_reset_cb() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:313: warning: expecting prototype for Callback to setup calendar and miscellaneous settings before clock detection(). Prototype was for cvmx_spi_calendar_setup_cb() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:431: warning: expecting prototype for Callback to perform clock detection(). Prototype was for cvmx_spi_clock_detect_cb() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:509: warning: expecting prototype for Callback to perform link training(). Prototype was for cvmx_spi_training_cb() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:578: warning: expecting prototype for Callback to perform calendar data synchronization(). Prototype was for cvmx_spi_calendar_sync_cb() instead
   arch/mips/cavium-octeon/executive/cvmx-spi.c:634: warning: expecting prototype for Callback to handle interface up(). Prototype was for cvmx_spi_interface_up_cb() instead
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c:67: warning: expecting prototype for Probe a XAUI interface and determine the number of ports(). Prototype was for __cvmx_helper_xaui_probe() instead
   arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c:106: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Bringup and enable a XAUI interface. After this call packet
   arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return the link state of an IPD/PKO port as returned by
   arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c:292: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Configure an IPD/PKO port for the specified link state. This
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/cavium-octeon/executive/cvmx-pko.c:43: warning: Function parameter or member 'interface' not described in '__cvmx_pko_int'
   arch/mips/cavium-octeon/executive/cvmx-pko.c:43: warning: Function parameter or member 'index' not described in '__cvmx_pko_int'
   arch/mips/cavium-octeon/executive/cvmx-pko.c:43: warning: expecting prototype for Internal state of packet output(). Prototype was for __cvmx_pko_int() instead
   arch/mips/cavium-octeon/executive/cvmx-pko.c:186: warning: expecting prototype for Call before any other calls to initialize the packet(). Prototype was for cvmx_pko_initialize_global() instead
   arch/mips/cavium-octeon/executive/cvmx-pko.c:241: warning: expecting prototype for This function does per(). Prototype was for cvmx_pko_initialize_local() instead
   arch/mips/cavium-octeon/executive/cvmx-pko.c:247: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enables the packet output hardware. It must already be
   arch/mips/cavium-octeon/executive/cvmx-pko.c:270: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Disables the packet output. Does not affect any configuration.
   arch/mips/cavium-octeon/executive/cvmx-pko.c:282: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Reset the packet output.
   arch/mips/cavium-octeon/executive/cvmx-pko.c:293: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Shutdown and free resources required by packet output.
   arch/mips/cavium-octeon/executive/cvmx-pko.c:324: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Configure a output port and the associated queues for use.
   arch/mips/cavium-octeon/executive/cvmx-pko.c:555: warning: expecting prototype for Show map of ports(). Prototype was for cvmx_pko_show_queue_map() instead
   arch/mips/cavium-octeon/executive/cvmx-pko.c:577: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Rate limit a PKO port to a max packets/sec. This function is only
   arch/mips/cavium-octeon/executive/cvmx-pko.c:610: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Rate limit a PKO port to a max bits/sec. This function is only
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c:49: warning: cannot understand function prototype: '__cvmx_cmd_queue_all_state_t *__cvmx_cmd_queue_state_ptr; '
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c:53: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialize the Global queue state pointer.
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c:101: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialize a command queue for use. The initial FPA buffer is
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c:199: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Shutdown a queue a free it's command buffers to the FPA. The
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c:235: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return the number of command words pending in the queue. This
   arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c:291: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return the command buffer to be written to. The purpose of this
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c:53: warning: expecting prototype for Probe RGMII ports and determine the number present(). Prototype was for __cvmx_helper_rgmii_probe() instead
   arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c:92: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Put an RGMII interface in loopback mode. Internal packets sent
   arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c:135: warning: expecting prototype for Workaround ASX setup errata with CN38XX pass1(). Prototype was for __cvmx_helper_errata_asx_pass1() instead
   arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c:152: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Configure all of the ASX, GMX, and PKO registers required
   arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c:255: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return the link state of an IPD/PKO port as returned by
   arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c:284: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Configure an IPD/PKO port for the specified link state. This
--
arch/mips/cavium-octeon/executive/cvmx-l2c.c:768: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return log base 2 of the number of sets in the L2 cache
   arch/mips/cavium-octeon/executive/cvmx-l2c.c:861: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Flush a line from the L2 cache

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/cavium-octeon/executive/cvmx-bootmem.c      |   10 ++--
 arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c    |   12 ++---
 arch/mips/cavium-octeon/executive/cvmx-helper-board.c |    8 +--
 arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c |   12 ++---
 arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c  |    8 +--
 arch/mips/cavium-octeon/executive/cvmx-l2c.c          |    9 +---
 arch/mips/cavium-octeon/executive/cvmx-pko.c          |   22 +++++-----
 arch/mips/cavium-octeon/executive/cvmx-spi.c          |   20 ++++-----
 8 files changed, 50 insertions(+), 51 deletions(-)

--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-bootmem.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-bootmem.c
@@ -44,7 +44,7 @@ static struct cvmx_bootmem_desc *cvmx_bo
 
 /* See header file for descriptions of functions */
 
-/**
+/*
  * This macro returns a member of the
  * cvmx_bootmem_named_block_desc_t structure. These members can't
  * be directly addressed as they might be in memory not directly
@@ -60,7 +60,7 @@ static struct cvmx_bootmem_desc *cvmx_bo
 		offsetof(struct cvmx_bootmem_named_block_desc, field),	\
 		sizeof_field(struct cvmx_bootmem_named_block_desc, field))
 
-/**
+/*
  * This function is the implementation of the get macros defined
  * for individual structure members. The argument are generated
  * by the macros inorder to read only the needed memory.
@@ -115,7 +115,7 @@ static uint64_t cvmx_bootmem_phy_get_nex
 	return cvmx_read64_uint64((addr + NEXT_OFFSET) | (1ull << 63));
 }
 
-/**
+/*
  * Allocate a block of memory from the free list that was
  * passed to the application by the bootloader within a specified
  * address range. This is an allocate-only algorithm, so
@@ -550,7 +550,7 @@ bootmem_free_done:
 
 }
 
-/**
+/*
  * Finds a named memory block by name.
  * Also used for finding an unused entry in the named block table.
  *
@@ -657,7 +657,7 @@ struct cvmx_bootmem_named_block_desc *cv
 }
 EXPORT_SYMBOL(cvmx_bootmem_find_named_block);
 
-/**
+/*
  * Frees a named block.
  *
  * @name:   name of block to free
--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
@@ -44,7 +44,7 @@
 #include <asm/octeon/cvmx-gmxx-defs.h>
 #include <asm/octeon/cvmx-asxx-defs.h>
 
-/**
+/*
  * Return the MII PHY address associated with the given IPD
  * port. A result of -1 means there isn't a MII capable PHY
  * connected to this port. On chips supporting multiple MII
@@ -189,7 +189,7 @@ int cvmx_helper_board_get_mii_address(in
 	return -1;
 }
 
-/**
+/*
  * This function is the board specific method of determining an
  * ethernet ports link speed. Most Octeon boards have Marvell PHYs
  * and are handled by the fall through case. This function must be
@@ -274,7 +274,7 @@ union cvmx_helper_link_info __cvmx_helpe
 	return result;
 }
 
-/**
+/*
  * This function is called by cvmx_helper_interface_probe() after it
  * determines the number of ports Octeon can support on a specific
  * interface. This function is the per board location to override
@@ -320,7 +320,7 @@ int __cvmx_helper_board_interface_probe(
 	return supported_ports;
 }
 
-/**
+/*
  * Get the clock type used for the USB block based on board type.
  * Used by the USB code for auto configuration of clock type.
  *
--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-spi.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-spi.c
@@ -66,7 +66,7 @@ static cvmx_spi_callbacks_t cvmx_spi_cal
 	.interface_up_cb = cvmx_spi_interface_up_cb
 };
 
-/**
+/*
  * Get current SPI4 initialization callbacks
  *
  * @callbacks:	Pointer to the callbacks structure.to fill
@@ -78,7 +78,7 @@ void cvmx_spi_get_callbacks(cvmx_spi_cal
 	memcpy(callbacks, &cvmx_spi_callbacks, sizeof(cvmx_spi_callbacks));
 }
 
-/**
+/*
  * Set new SPI4 initialization callbacks
  *
  * @new_callbacks:  Pointer to an updated callbacks structure.
@@ -88,7 +88,7 @@ void cvmx_spi_set_callbacks(cvmx_spi_cal
 	memcpy(&cvmx_spi_callbacks, new_callbacks, sizeof(cvmx_spi_callbacks));
 }
 
-/**
+/*
  * Initialize and start the SPI interface.
  *
  * @interface: The identifier of the packet interface to configure and
@@ -133,7 +133,7 @@ int cvmx_spi_start_interface(int interfa
 	return res;
 }
 
-/**
+/*
  * This routine restarts the SPI interface after it has lost synchronization
  * with its correspondent system.
  *
@@ -179,7 +179,7 @@ int cvmx_spi_restart_interface(int inter
 }
 EXPORT_SYMBOL_GPL(cvmx_spi_restart_interface);
 
-/**
+/*
  * Callback to perform SPI4 reset
  *
  * @interface: The identifier of the packet interface to configure and
@@ -294,7 +294,7 @@ int cvmx_spi_reset_cb(int interface, cvm
 	return 0;
 }
 
-/**
+/*
  * Callback to setup calendar and miscellaneous settings before clock detection
  *
  * @interface: The identifier of the packet interface to configure and
@@ -413,7 +413,7 @@ int cvmx_spi_calendar_setup_cb(int inter
 	return 0;
 }
 
-/**
+/*
  * Callback to perform clock detection
  *
  * @interface: The identifier of the packet interface to configure and
@@ -491,7 +491,7 @@ int cvmx_spi_clock_detect_cb(int interfa
 	return 0;
 }
 
-/**
+/*
  * Callback to perform link training
  *
  * @interface: The identifier of the packet interface to configure and
@@ -560,7 +560,7 @@ int cvmx_spi_training_cb(int interface,
 	return 0;
 }
 
-/**
+/*
  * Callback to perform calendar data synchronization
  *
  * @interface: The identifier of the packet interface to configure and
@@ -617,7 +617,7 @@ int cvmx_spi_calendar_sync_cb(int interf
 	return 0;
 }
 
-/**
+/*
  * Callback to handle interface up
  *
  * @interface: The identifier of the packet interface to configure and
--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c
@@ -54,7 +54,7 @@ int __cvmx_helper_xaui_enumerate(int int
 		return 1;
 }
 
-/**
+/*
  * Probe a XAUI interface and determine the number of ports
  * connected to it. The XAUI interface should still be down
  * after this call.
@@ -102,7 +102,7 @@ int __cvmx_helper_xaui_probe(int interfa
 	return __cvmx_helper_xaui_enumerate(interface);
 }
 
-/**
+/*
  * Bringup and enable a XAUI interface. After this call packet
  * I/O should be fully functional. This is called with IPD
  * enabled but PKO disabled.
@@ -249,7 +249,7 @@ int __cvmx_helper_xaui_enable(int interf
 	return 0;
 }
 
-/**
+/*
  * Return the link state of an IPD/PKO port as returned by
  * auto negotiation. The result of this function may not match
  * Octeon's link config if auto negotiation has changed since
@@ -288,7 +288,7 @@ union cvmx_helper_link_info __cvmx_helpe
 	return result;
 }
 
-/**
+/*
  * Configure an IPD/PKO port for the specified link state. This
  * function does not influence auto negotiation at the PHY level.
  * The passed link state must always match the link state returned
--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -35,7 +35,7 @@
 #include <asm/octeon/cvmx-pko.h>
 #include <asm/octeon/cvmx-helper.h>
 
-/**
+/*
  * Internal state of packet output
  */
 
@@ -176,7 +176,7 @@ static void __cvmx_pko_chip_init(void)
 	}
 }
 
-/**
+/*
  * Call before any other calls to initialize the packet
  * output system.  This does chip global config, and should only be
  * done by one core.
@@ -229,7 +229,7 @@ void cvmx_pko_initialize_global(void)
 	}
 }
 
-/**
+/*
  * This function does per-core initialization required by the PKO routines.
  * This must be called on all cores that will do packet output, and must
  * be called after the FPA has been initialized and filled with pages.
@@ -243,7 +243,7 @@ int cvmx_pko_initialize_local(void)
 	return 0;
 }
 
-/**
+/*
  * Enables the packet output hardware. It must already be
  * configured.
  */
@@ -266,7 +266,7 @@ void cvmx_pko_enable(void)
 	cvmx_write_csr(CVMX_PKO_REG_FLAGS, flags.u64);
 }
 
-/**
+/*
  * Disables the packet output. Does not affect any configuration.
  */
 void cvmx_pko_disable(void)
@@ -278,7 +278,7 @@ void cvmx_pko_disable(void)
 }
 EXPORT_SYMBOL_GPL(cvmx_pko_disable);
 
-/**
+/*
  * Reset the packet output.
  */
 static void __cvmx_pko_reset(void)
@@ -289,7 +289,7 @@ static void __cvmx_pko_reset(void)
 	cvmx_write_csr(CVMX_PKO_REG_FLAGS, pko_reg_flags.u64);
 }
 
-/**
+/*
  * Shutdown and free resources required by packet output.
  */
 void cvmx_pko_shutdown(void)
@@ -320,7 +320,7 @@ void cvmx_pko_shutdown(void)
 }
 EXPORT_SYMBOL_GPL(cvmx_pko_shutdown);
 
-/**
+/*
  * Configure a output port and the associated queues for use.
  *
  * @port:	Port to configure.
@@ -548,7 +548,7 @@ cvmx_pko_status_t cvmx_pko_config_port(u
 }
 
 #ifdef PKO_DEBUG
-/**
+/*
  * Show map of ports -> queues for different cores.
  */
 void cvmx_pko_show_queue_map()
@@ -573,7 +573,7 @@ void cvmx_pko_show_queue_map()
 }
 #endif
 
-/**
+/*
  * Rate limit a PKO port to a max packets/sec. This function is only
  * supported on CN51XX and higher, excluding CN58XX.
  *
@@ -606,7 +606,7 @@ int cvmx_pko_rate_limit_packets(int port
 	return 0;
 }
 
-/**
+/*
  * Rate limit a PKO port to a max bits/sec. This function is only
  * supported on CN51XX and higher, excluding CN58XX.
  *
--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
@@ -42,14 +42,14 @@
 #include <asm/octeon/cvmx-pexp-defs.h>
 #include <asm/octeon/cvmx-pko-defs.h>
 
-/**
+/*
  * This application uses this pointer to access the global queue
  * state. It points to a bootmem named block.
  */
 __cvmx_cmd_queue_all_state_t *__cvmx_cmd_queue_state_ptr;
 EXPORT_SYMBOL_GPL(__cvmx_cmd_queue_state_ptr);
 
-/**
+/*
  * Initialize the Global queue state pointer.
  *
  * Returns CVMX_CMD_QUEUE_SUCCESS or a failure code
@@ -84,7 +84,7 @@ static cvmx_cmd_queue_result_t __cvmx_cm
 	return CVMX_CMD_QUEUE_SUCCESS;
 }
 
-/**
+/*
  * Initialize a command queue for use. The initial FPA buffer is
  * allocated and the hardware unit is configured to point to the
  * new command queue.
@@ -182,7 +182,7 @@ cvmx_cmd_queue_result_t cvmx_cmd_queue_i
 	}
 }
 
-/**
+/*
  * Shutdown a queue a free it's command buffers to the FPA. The
  * hardware connected to the queue must be stopped before this
  * function is called.
@@ -218,7 +218,7 @@ cvmx_cmd_queue_result_t cvmx_cmd_queue_s
 	return CVMX_CMD_QUEUE_SUCCESS;
 }
 
-/**
+/*
  * Return the number of command words pending in the queue. This
  * function may be relatively slow for some hardware units.
  *
@@ -274,7 +274,7 @@ int cvmx_cmd_queue_length(cvmx_cmd_queue
 	return CVMX_CMD_QUEUE_INVALID_PARAM;
 }
 
-/**
+/*
  * Return the command buffer to be written to. The purpose of this
  * function is to allow CVMX routine access t othe low level buffer
  * for initial hardware setup. User applications should not call this
--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c
@@ -42,7 +42,7 @@
 #include <asm/octeon/cvmx-asxx-defs.h>
 #include <asm/octeon/cvmx-dbg-defs.h>
 
-/**
+/*
  * Probe RGMII ports and determine the number present
  *
  * @interface: Interface to probe
@@ -88,7 +88,7 @@ int __cvmx_helper_rgmii_probe(int interf
 	return num_ports;
 }
 
-/**
+/*
  * Put an RGMII interface in loopback mode. Internal packets sent
  * out will be received back again on the same port. Externally
  * received packets will echo back out.
@@ -120,7 +120,7 @@ void cvmx_helper_rgmii_internal_loopback
 	cvmx_write_csr(CVMX_GMXX_PRTX_CFG(index, interface), gmx_cfg.u64);
 }
 
-/**
+/*
  * Workaround ASX setup errata with CN38XX pass1
  *
  * @interface: Interface to setup
@@ -148,7 +148,7 @@ static int __cvmx_helper_errata_asx_pass
 	return 0;
 }
 
-/**
+/*
  * Configure all of the ASX, GMX, and PKO registers required
  * to get RGMII to function on the supplied interface.
  *
@@ -251,7 +251,7 @@ int __cvmx_helper_rgmii_enable(int inter
 	return 0;
 }
 
-/**
+/*
  * Return the link state of an IPD/PKO port as returned by
  * auto negotiation. The result of this function may not match
  * Octeon's link config if auto negotiation has changed since
@@ -280,7 +280,7 @@ union cvmx_helper_link_info __cvmx_helpe
 		return __cvmx_helper_board_link_get(ipd_port);
 }
 
-/**
+/*
  * Configure an IPD/PKO port for the specified link state. This
  * function does not influence auto negotiation at the PHY level.
  * The passed link state must always match the link state returned
--- linux-next-20210723.orig/arch/mips/cavium-octeon/executive/cvmx-l2c.c
+++ linux-next-20210723/arch/mips/cavium-octeon/executive/cvmx-l2c.c
@@ -281,7 +281,7 @@ uint64_t cvmx_l2c_read_perf(uint32_t cou
 	}
 }
 
-/**
+/*
  * @INTERNAL
  * Helper function use to fault in cache lines for L2 cache locking
  *
@@ -575,7 +575,7 @@ union __cvmx_l2c_tag {
 };
 
 
-/**
+/*
  * @INTERNAL
  * Function to read a L2C tag.  This code make the current core
  * the 'debug core' for the L2.  This code must only be executed by
@@ -764,9 +764,8 @@ int cvmx_l2c_get_cache_size_bytes(void)
 		CVMX_CACHE_LINE_SIZE;
 }
 
-/**
+/*
  * Return log base 2 of the number of sets in the L2 cache
- * Returns
  */
 int cvmx_l2c_get_set_bits(void)
 {
@@ -857,7 +856,7 @@ int cvmx_l2c_get_num_assoc(void)
 	return l2_assoc;
 }
 
-/**
+/*
  * Flush a line from the L2 cache
  * This should only be called from one core at a time, as this routine
  * sets the core to the 'debug' core in order to flush the line.
