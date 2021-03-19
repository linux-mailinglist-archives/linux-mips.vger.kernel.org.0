Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0FB3425BA
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 20:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhCSTGB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 15:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhCSTFp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Mar 2021 15:05:45 -0400
X-Greylist: delayed 3343 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 19 Mar 2021 12:05:43 PDT
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C26C06174A
        for <linux-mips@vger.kernel.org>; Fri, 19 Mar 2021 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
        References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Xm5DJPnBkSUmEeu2sgduQCmr2CiajGavlMfQRDLlDYI=; b=KaUKqF4mo4CLY4OHNeReIV7s5P
        Quuua0ul+xQkbS4gBLW3kCHQFRXnrO0jOVUhwzsJPxMwzXHpShsZ9LHPqIREkiKW4Qp7pqowRrOBV
        VIxoc9UWrmr5vVzZPhuDRIVFY+sBOsnQ0Ig0zQXF8RthDL0hFD397bqwH0dh0rGQs2g/hL3ZFnsdn
        VXmi4vggYLyLUvUBEMpuTXVRJG0GG/rBnBK4vd0qA4DEEEdPbtvaMzAw3aP2h85CeVEsZOH9KAIk9
        KfFOsU1ExfPkt6Q6vfsuGvhdSugH8WBqJhRg4Suv0UNeNgJjB51kRCXhFcMT1kM+iSm5Z6XyWz4xD
        JnSMd43g==;
Received: from rdunlap (helo=localhost)
        by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
        id 1lNJZC-001RhB-HF; Fri, 19 Mar 2021 18:09:47 +0000
Date:   Fri, 19 Mar 2021 11:09:46 -0700 (PDT)
From:   Randy Dunlap <rdunlap@bombadil.infradead.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
cc:     tsbogend@alpha.franken.de, robin.murphy@arm.com,
        tglx@linutronix.de, bhelgaas@google.com,
        andriy.shevchenko@linux.intel.com, maz@kernel.org,
        jonathan.derrick@intel.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: PCI: Fix a typo
In-Reply-To: <20210319051514.16447-1-unixbhaskar@gmail.com>
Message-ID: <d65057ff-c90-8cde-aef9-a5faf9e134a9@bombadil.infradead.org>
References: <20210319051514.16447-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_110946_595202_2B1F997F 
X-CRM114-Status: GOOD (  13.01  )
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "bombadil.infradead.org",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 19 Mar 2021, Bhaskar Chowdhury wrote: > > s/packt/packet/
    > > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com> Acked-by: Randy
    Dunlap <rdunlap@infradead.org> 
 Content analysis details:   (-0.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 NO_RELAYS              Informational: message was not relayed via SMTP
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Fri, 19 Mar 2021, Bhaskar Chowdhury wrote:

>
> s/packt/packet/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> arch/mips/pci/pci-xtalk-bridge.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
> index 50f7d42cca5a..d2216942af18 100644
> --- a/arch/mips/pci/pci-xtalk-bridge.c
> +++ b/arch/mips/pci/pci-xtalk-bridge.c
> @@ -385,7 +385,7 @@ static int bridge_domain_activate(struct irq_domain *domain,
> 	bridge_set(bc, b_int_enable, 0x7ffffe00); /* more stuff in int_enable */
>
> 	/*
> -	 * Enable sending of an interrupt clear packt to the hub on a high to
> +	 * Enable sending of an interrupt clear packet to the hub on a high to
> 	 * low transition of the interrupt pin.
> 	 *
> 	 * IRIX sets additional bits in the address which are documented as
> --
> 2.26.2
>
>
