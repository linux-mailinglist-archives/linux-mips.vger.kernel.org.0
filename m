Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F413845F866
	for <lists+linux-mips@lfdr.de>; Sat, 27 Nov 2021 02:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344743AbhK0BYZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 20:24:25 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:35546 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344503AbhK0BWX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Nov 2021 20:22:23 -0500
Message-ID: <20211126223825.320724006@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1637975948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=kh2ZB8gumt7yFa2wjaDhpeN9tXzUfJvLkALkOS94EFA=;
        b=rL3dSVq51HwJyrZ1GiK+2Uy987fWifzc93Kzd1rYDYc6CJES4RYQFW91VYz9giUBA4pc8g
        3Gp8SO0SCSSci4EB0aGRBsqUldeO9DZdmixm6jmAcLXOjd3EDQN4ceHT5qIHtZ1M4OOjCs
        5B1fwbTAHUDHkQfAY6r0w3SoQx1i3rzd1zp4I1umGTSQGLkl+Ug/rBlXyPGu1g3qmxiQdo
        9/IiaSvnNmIreFZA0hbCMbgvbZt32iGcp6GO/Dw3rrPbcAK+xJsiiVNJEaCAM2vKSnhji3
        6KWA27/ZxBzJeVpPdNFWb/PzJXwnrdawx9cM4YXt/mQphMHqQUhIcUngebAkPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1637975948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=kh2ZB8gumt7yFa2wjaDhpeN9tXzUfJvLkALkOS94EFA=;
        b=QLwf6Eyk3o45pGBEtsCZ2xr7a4DlyXTC6NnM3m6uL6iU2aPZXLRZf3PE6XQ/TuIY8Xwpt7
        hQcta2kLnH2eixAg==
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Megha Dey <megha.dey@intel.com>,
        Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        sparclinux@vger.kernel.org, x86@kernel.org,
        xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
        Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
        Juergen Gross <jgross@suse.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 21/22] genirq/msi: Handle PCI/MSI allocation fail in core code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date:   Sat, 27 Nov 2021 02:19:07 +0100 (CET)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Get rid of yet another irqdomain callback and let the core code return the
already available information of how many descriptors could be allocated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |   13 -------------
 include/linux/msi.h         |    5 +----
 kernel/irq/msi.c            |   29 +++++++++++++++++++++++++----
 3 files changed, 26 insertions(+), 21 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -95,16 +95,6 @@ static int pci_msi_domain_check_cap(stru
 	return 0;
 }
 
-static int pci_msi_domain_handle_error(struct irq_domain *domain,
-				       struct msi_desc *desc, int error)
-{
-	/* Special handling to support __pci_enable_msi_range() */
-	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
-		return 1;
-
-	return error;
-}
-
 static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -115,7 +105,6 @@ static void pci_msi_domain_set_desc(msi_
 static struct msi_domain_ops pci_msi_domain_ops_default = {
 	.set_desc	= pci_msi_domain_set_desc,
 	.msi_check	= pci_msi_domain_check_cap,
-	.handle_error	= pci_msi_domain_handle_error,
 };
 
 static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
@@ -129,8 +118,6 @@ static void pci_msi_domain_update_dom_op
 			ops->set_desc = pci_msi_domain_set_desc;
 		if (ops->msi_check == NULL)
 			ops->msi_check = pci_msi_domain_check_cap;
-		if (ops->handle_error == NULL)
-			ops->handle_error = pci_msi_domain_handle_error;
 	}
 }
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -285,7 +285,6 @@ struct msi_domain_info;
  * @msi_check:		Callback for verification of the domain/info/dev data
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
- * @handle_error:	Optional error handler if the allocation fails
  * @domain_alloc_irqs:	Optional function to override the default allocation
  *			function.
  * @domain_free_irqs:	Optional function to override the default free
@@ -294,7 +293,7 @@ struct msi_domain_info;
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
  *
- * @msi_check, @msi_prepare, @handle_error and @set_desc are callbacks used by
+ * @msi_check, @msi_prepare and @set_desc are callbacks used by
  * msi_domain_alloc/free_irqs().
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
@@ -331,8 +330,6 @@ struct msi_domain_ops {
 				       msi_alloc_info_t *arg);
 	void		(*set_desc)(msi_alloc_info_t *arg,
 				    struct msi_desc *desc);
-	int		(*handle_error)(struct irq_domain *domain,
-					struct msi_desc *desc, int error);
 	int		(*domain_alloc_irqs)(struct irq_domain *domain,
 					     struct device *dev, int nvec);
 	void		(*domain_free_irqs)(struct irq_domain *domain,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -538,6 +538,27 @@ static bool msi_check_reservation_mode(s
 	return desc->pci.msi_attrib.is_msix || desc->pci.msi_attrib.can_mask;
 }
 
+static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
+			       int allocated)
+{
+	switch(domain->bus_token) {
+	case DOMAIN_BUS_PCI_MSI:
+	case DOMAIN_BUS_VMD_MSI:
+		if (IS_ENABLED(CONFIG_PCI_MSI))
+			break;
+		fallthrough;
+	default:
+		return -ENOSPC;
+	}
+
+	/* Let a failed PCI multi MSI allocation retry */
+	if (desc->nvec_used > 1)
+		return 1;
+
+	/* If there was a successful allocation let the caller know */
+	return allocated ? allocated : -ENOSPC;
+}
+
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 			    int nvec)
 {
@@ -546,6 +567,7 @@ int __msi_domain_alloc_irqs(struct irq_d
 	struct irq_data *irq_data;
 	struct msi_desc *desc;
 	msi_alloc_info_t arg = { };
+	int allocated = 0;
 	int i, ret, virq;
 	bool can_reserve;
 
@@ -560,16 +582,15 @@ int __msi_domain_alloc_irqs(struct irq_d
 					       dev_to_node(dev), &arg, false,
 					       desc->affinity);
 		if (virq < 0) {
-			ret = -ENOSPC;
-			if (ops->handle_error)
-				ret = ops->handle_error(domain, desc, ret);
-			return ret;
+			ret = msi_handle_pci_fail(domain, desc, allocated);
+			goto cleanup;
 		}
 
 		for (i = 0; i < desc->nvec_used; i++) {
 			irq_set_msi_desc_off(virq, i, desc);
 			irq_debugfs_copy_devname(virq + i, dev);
 		}
+		allocated++;
 	}
 
 	can_reserve = msi_check_reservation_mode(domain, info, dev);

