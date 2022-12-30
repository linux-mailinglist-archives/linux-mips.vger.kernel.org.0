Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2C16597D3
	for <lists+linux-mips@lfdr.de>; Fri, 30 Dec 2022 12:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiL3LqP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Dec 2022 06:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiL3LqO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Dec 2022 06:46:14 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA0B62DB;
        Fri, 30 Dec 2022 03:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672400773; x=1703936773;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+C+F27SERRX5/mMHkFvQQdCIf1T1mofGj6ltPhh/hUw=;
  b=UEa/ZLr7wul3SdojNttLMFDxKCtJafnLcKDGVx2eUTSfftisfFJTgyoV
   5C789plYN8K2eWqxSir8DfTBSxNyEfXLw9gBm+gw+lzx+0/b2rjnHXswE
   RWLjkmnWzcxbsA9IgOQnKVyx3/6iOOL0azEJsf9u0JbN9AJAe1MYwVW1T
   cXu9ndJl2S+mLa1StRaOs7CI96tGrDuBfZKhXewFdwhOt97eXfOQkagXw
   CdUTWxHw5XwudfECJS7RnwsbNtLzLKik+EQU7Bq6/TKYhQahbQBB49Nb8
   V6RE2kGCoc5YF6+OeVPnfpwFF2F2/b0PWickWF46BveCdnAxyo1iPHvUi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="301567990"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; 
   d="scan'208";a="301567990"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 03:46:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="653865346"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; 
   d="scan'208";a="653865346"
Received: from vsemouch-mobl.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.249.41.102])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 03:46:09 -0800
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     inux-kernel@vger.kernel.org,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/3] serial: Separate RT288x/Au1xxx code into own file
Date:   Fri, 30 Dec 2022 13:46:00 +0200
Message-Id: <20221230114603.16946-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A non-trivial amount of RT288x/Au1xxx code is encapsulated into
ifdeffery in 8250_port / 8250_early and some if/switch UPIO_AU blocks.
Create a separate file from them and do a few additional cleanups.

I kept the Kconfig entry as bool because the code has somewhat tricky
dependency chain (mips arch code and 8250_of driver). It would be nice
to make it tristate but I don't know how blocking some invalid =m + =y
combinations would be best addressed. It should probably be best done
on top of this series independent of the split itself anyway.

UPIO_AU could now be removed because it's same as UPIO_MEM for the
remaining code path but I'm unsure if that's allowed (is the port
iotype part of stable ABI or not)?

Ilpo Järvinen (3):
  serial: 8250: RT288x/Au1xxx code away from core
  serial: 8250_rt288x: Name non-standard divisor latch reg
  serial: 8250_rt288x: Remove unnecessary UART_REG_UNMAPPED

 arch/mips/alchemy/common/platform.c   |  10 +-
 drivers/tty/serial/8250/8250_core.c   |   4 +
 drivers/tty/serial/8250/8250_early.c  |  21 ----
 drivers/tty/serial/8250/8250_of.c     |   4 +-
 drivers/tty/serial/8250/8250_port.c   |  78 ---------------
 drivers/tty/serial/8250/8250_rt288x.c | 135 ++++++++++++++++++++++++++
 drivers/tty/serial/8250/Makefile      |   1 +
 include/linux/serial_8250.h           |  14 ++-
 8 files changed, 163 insertions(+), 104 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_rt288x.c

-- 
2.30.2

