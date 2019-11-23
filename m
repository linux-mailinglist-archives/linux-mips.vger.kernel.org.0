Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C02C107E05
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 11:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfKWKZ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Nov 2019 05:25:59 -0500
Received: from elvis.franken.de ([193.175.24.41]:41375 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbfKWKZ6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Nov 2019 05:25:58 -0500
X-Greylist: delayed 3005 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 Nov 2019 05:25:57 EST
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1iYRpW-0002GN-00; Sat, 23 Nov 2019 10:35:50 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0E599C056C; Sat, 23 Nov 2019 10:35:41 +0100 (CET)
Date:   Sat, 23 Nov 2019 10:35:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v10 3/6] MIPS: PCI: Fix fake subdevice ID for IOC3
Message-ID: <20191123093540.GA8089@alpha.franken.de>
References: <20191015120953.2597-1-tbogendoerfer@suse.de>
 <20191015120953.2597-4-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015120953.2597-4-tbogendoerfer@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 15, 2019 at 02:09:48PM +0200, Thomas Bogendoerfer wrote:
> Generation of fake subdevice ID had vendor and device ID swapped.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  arch/mips/pci/pci-xtalk-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
> index dcf6117a17c3..d1d5f54c2632 100644
> --- a/arch/mips/pci/pci-xtalk-bridge.c
> +++ b/arch/mips/pci/pci-xtalk-bridge.c
> @@ -437,7 +437,7 @@ static int bridge_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
>  	return irq;
>  }
>  
> -#define IOC3_SID(sid)	(PCI_VENDOR_ID_SGI << 16 | (sid))
> +#define IOC3_SID(sid)	(PCI_VENDOR_ID_SGI | ((sid) << 16))
>  
>  static void bridge_setup_ip27_baseio6g(struct bridge_controller *bc)
>  {
> -- 
> 2.16.4

Paul,

can you take this patch and patch 6/6 of this series into
mips-linux for 5.5 ? I will submit patch 4/6 and 5/6 after the
merge window via net-next then.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
