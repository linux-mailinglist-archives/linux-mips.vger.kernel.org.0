Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FD282564
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2019 21:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730222AbfHETPI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 15:15:08 -0400
Received: from smtprelay0164.hostedemail.com ([216.40.44.164]:41192 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727830AbfHETPH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Aug 2019 15:15:07 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 005D552B7;
        Mon,  5 Aug 2019 19:15:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::,RULES_HIT:41:152:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:3138:3139:3140:3141:3142:3353:3622:3865:3867:3870:4321:4605:5007:10004:10400:10848:11026:11232:11473:11658:11914:12043:12048:12296:12297:12438:12555:12740:12895:12986:13069:13311:13357:13894:14096:14097:14181:14659:14721:21080:21451:21627:30054:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:30,LUA_SUMMARY:none
X-HE-Tag: cub04_4957d22cc6e16
X-Filterd-Recvd-Size: 2975
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Mon,  5 Aug 2019 19:15:03 +0000 (UTC)
Message-ID: <0f56d1fe577707e7804386592e1a5579bfd3abbf.camel@perches.com>
Subject: Re: [PATCH] MIPS: BCM63XX: Mark expected switch fall-through
From:   Joe Perches <joe@perches.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 05 Aug 2019 12:15:01 -0700
In-Reply-To: <20190805185533.GA10551@embeddedor>
References: <20190805185533.GA10551@embeddedor>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 2019-08-05 at 13:55 -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: bcm63xx_defconfig mips):
> 
> arch/mips/pci/ops-bcm63xx.c: In function ‘bcm63xx_pcie_can_access’:
> arch/mips/pci/ops-bcm63xx.c:474:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    if (PCI_SLOT(devfn) == 0)
>       ^
> arch/mips/pci/ops-bcm63xx.c:477:2: note: here
>   default:
>   ^~~~~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  arch/mips/pci/ops-bcm63xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/pci/ops-bcm63xx.c b/arch/mips/pci/ops-bcm63xx.c
> index d02eb9d16b55..925c72348fb6 100644
> --- a/arch/mips/pci/ops-bcm63xx.c
> +++ b/arch/mips/pci/ops-bcm63xx.c
> @@ -474,6 +474,7 @@ static int bcm63xx_pcie_can_access(struct pci_bus *bus, int devfn)
>  		if (PCI_SLOT(devfn) == 0)
>  			return bcm_pcie_readl(PCIE_DLSTATUS_REG)
>  					& DLSTATUS_PHYLINKUP;
> +		/* else, fall through */
>  	default:
>  		return false;
>  	}

Perhaps clearer as:
---
 arch/mips/pci/ops-bcm63xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/pci/ops-bcm63xx.c b/arch/mips/pci/ops-bcm63xx.c
index d02eb9d16b55..a5e4b1905958 100644
--- a/arch/mips/pci/ops-bcm63xx.c
+++ b/arch/mips/pci/ops-bcm63xx.c
@@ -471,12 +471,11 @@ static int bcm63xx_pcie_can_access(struct pci_bus *bus, int devfn)
 	case PCIE_BUS_BRIDGE:
 		return PCI_SLOT(devfn) == 0;
 	case PCIE_BUS_DEVICE:
-		if (PCI_SLOT(devfn) == 0)
-			return bcm_pcie_readl(PCIE_DLSTATUS_REG)
-					& DLSTATUS_PHYLINKUP;
-	default:
-		return false;
+		return PCI_SLOT(devfn) == 0 &&
+		       bcm_pcie_readl(PCIE_DLSTATUS_REG) & DLSTATUS_PHYLINKUP;
 	}
+
+	return false;
 }
 
 static int bcm63xx_pcie_read(struct pci_bus *bus, unsigned int devfn,


