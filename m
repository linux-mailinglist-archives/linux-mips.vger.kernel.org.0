Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884EE46B41C
	for <lists+linux-mips@lfdr.de>; Tue,  7 Dec 2021 08:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhLGHq2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 02:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhLGHq1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Dec 2021 02:46:27 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE15C061746;
        Mon,  6 Dec 2021 23:42:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D31C1CE19DD;
        Tue,  7 Dec 2021 07:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D81AC341C1;
        Tue,  7 Dec 2021 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638862974;
        bh=2qIgL0JBG4vV/MINd0ETzL6k1r509RSkk45xSKKLJ7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rEqXyxtMWZFlcF8r3yxH1/TtAEbDHBaUwIDAPsv9sHOOC0Rmzi+lrDEkr6FW8lcZr
         /vMFQ/81Tv7pxgdvjTeFJkR4e1RX4olYyYFOA3hLqZw2/Xn7l2GFzYB4NYCzFkanis
         14vBaVGOTC4Y8SHo20NGaCX7CBAe2IriKWHo0K/0=
Date:   Tue, 7 Dec 2021 08:42:51 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Marc Zygnier <maz@kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Megha Dey <megha.dey@intel.com>,
        Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
        Cedric Le Goater <clg@kaod.org>,
        Juergen Gross <jgross@suse.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
        sparclinux@vger.kernel.org, x86@kernel.org,
        xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
        Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 03/23] genirq/msi: Guard sysfs code
Message-ID: <Ya8Qe7Mol8STLvkd@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.985907940@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210223.985907940@linutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 06, 2021 at 11:27:28PM +0100, Thomas Gleixner wrote:
> No point in building unused code when CONFIG_SYSFS=n.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
