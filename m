Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2233CF313
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jul 2021 06:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239995AbhGTDib (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jul 2021 23:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244625AbhGTDgu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jul 2021 23:36:50 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A570C0613DE;
        Mon, 19 Jul 2021 21:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=g30jg8NB1Brb43FrZXVHM/lo1F0iHFWpMyrwA6Ghnfk=; b=ISM31k37L0xcmAwYDHyEwwgnUb
        mW3/XhFXAfUjV5V9pZ6tHgcHY3X/SKn31zGwgSnlGHGC92FSMlCo0C3KAzR+npiHWpD2UTq6WmTiJ
        GsTtnzRdd+BOFAN3uZ3qqa46+YY546QY8hFtDnR9SfdEnORVGQLnzAaLXT758/BtYXNy3Y1EmbSE3
        CO9OEMkz+bnDfBz+R5nA4ttVKjv6kjJ9pc38iQ1JHQJsoL1YRUif3DRpLtZA6mpRh321t54ZQtuRI
        CbtHB7/jrKfgNiYiAjW3MrCkXzmsJLo50XCk40fU7jP0CyaJpQ4Jrb3Vee0T2VMakUml0aLRn+C5W
        bDcFOvQQ==;
Received: from [2601:1c0:6280:3f0::a22f] (helo=smtpauth.infradead.org)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m5hB8-001MSK-L9; Tue, 20 Jul 2021 04:16:23 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        David Daney <ddaney@caviumnetworks.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH] mips: cavium-octeon: clean up kernel-doc in cvmx-interrupt-decodes.c
Date:   Mon, 19 Jul 2021 21:16:17 -0700
Message-Id: <20210720041617.30942-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix kernel-doc warnings reported by kernel test robot:

arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:49: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_gmxx_rxx_int_en_enable enables all interrupt bits in cvmx_gmxx_rxx_int_en_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:230: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_pcsx_intx_en_reg_enable enables all interrupt bits in cvmx_pcsx_intx_en_reg_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:271: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_pcsxx_int_en_reg_enable enables all interrupt bits in cvmx_pcsxx_int_en_reg_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:301: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_spxx_int_msk_enable enables all interrupt bits in cvmx_spxx_int_msk_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:340: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_stxx_int_msk_enable enables all interrupt bits in cvmx_stxx_int_msk_t

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: David Daney <ddaney@caviumnetworks.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
Thomas: There are also 2 warnings in cvmx-l2c.c but that file also says:
 * This file is part of the OCTEON SDK

arch/mips/cavium-octeon/executive/cvmx-l2c.c:768: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return log base 2 of the number of sets in the L2 cache
   arch/mips/cavium-octeon/executive/cvmx-l2c.c:861: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Flush a line from the L2 cache

so does it make sense to send a patch for these 2 warnings also?

 arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c |   17 +++++++---
 1 file changed, 12 insertions(+), 5 deletions(-)

--- linux-next-20210719.orig/arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c
+++ linux-next-20210719/arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c
@@ -46,7 +46,9 @@
 
 
 /**
- * __cvmx_interrupt_gmxx_rxx_int_en_enable enables all interrupt bits in cvmx_gmxx_rxx_int_en_t
+ * __cvmx_interrupt_gmxx_rxx_int_en_enable - enable all interrupt bits in cvmx_gmxx_rxx_int_en_t
+ * @index: interrupt register offset
+ * @block: interrupt register block_id
  */
 void __cvmx_interrupt_gmxx_rxx_int_en_enable(int index, int block)
 {
@@ -227,7 +229,9 @@ void __cvmx_interrupt_gmxx_rxx_int_en_en
 	cvmx_write_csr(CVMX_GMXX_RXX_INT_EN(index, block), gmx_rx_int_en.u64);
 }
 /**
- * __cvmx_interrupt_pcsx_intx_en_reg_enable enables all interrupt bits in cvmx_pcsx_intx_en_reg_t
+ * __cvmx_interrupt_pcsx_intx_en_reg_enable - enable all interrupt bits in cvmx_pcsx_intx_en_reg_t
+ * @index: interrupt register offset
+ * @block: interrupt register block_id
  */
 void __cvmx_interrupt_pcsx_intx_en_reg_enable(int index, int block)
 {
@@ -268,7 +272,8 @@ void __cvmx_interrupt_pcsx_intx_en_reg_e
 	cvmx_write_csr(CVMX_PCSX_INTX_EN_REG(index, block), pcs_int_en_reg.u64);
 }
 /**
- * __cvmx_interrupt_pcsxx_int_en_reg_enable enables all interrupt bits in cvmx_pcsxx_int_en_reg_t
+ * __cvmx_interrupt_pcsxx_int_en_reg_enable - enable all interrupt bits in cvmx_pcsxx_int_en_reg_t
+ * @index: interrupt register block_id
  */
 void __cvmx_interrupt_pcsxx_int_en_reg_enable(int index)
 {
@@ -298,7 +303,8 @@ void __cvmx_interrupt_pcsxx_int_en_reg_e
 }
 
 /**
- * __cvmx_interrupt_spxx_int_msk_enable enables all interrupt bits in cvmx_spxx_int_msk_t
+ * __cvmx_interrupt_spxx_int_msk_enable - enable all interrupt bits in cvmx_spxx_int_msk_t
+ * @index: interrupt register block_id
  */
 void __cvmx_interrupt_spxx_int_msk_enable(int index)
 {
@@ -337,7 +343,8 @@ void __cvmx_interrupt_spxx_int_msk_enabl
 	cvmx_write_csr(CVMX_SPXX_INT_MSK(index), spx_int_msk.u64);
 }
 /**
- * __cvmx_interrupt_stxx_int_msk_enable enables all interrupt bits in cvmx_stxx_int_msk_t
+ * __cvmx_interrupt_stxx_int_msk_enable - enable all interrupt bits in cvmx_stxx_int_msk_t
+ * @index: interrupt register block_id
  */
 void __cvmx_interrupt_stxx_int_msk_enable(int index)
 {
