Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97437244E6E
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 20:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgHNSVf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 14:21:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:44372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726700AbgHNSVe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Aug 2020 14:21:34 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD83720768;
        Fri, 14 Aug 2020 18:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597429293;
        bh=byesp7nJC1JbkmKEenD/7UKydY3gVcGD/Yd1EnJiwqM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q5bgXLAMQS3eLaGcePUfo7IoWRuJ2XUPL4ofLAMGlhZ3P61+/LIe0qetWIwrXjkfX
         oQATgwk2XtAoVUe+jm8yexzVZuUEhGmIP192I6nMPURrdXlDwLFjlS52/Ai2z8s7xl
         CFaHfpMdciMh6nyG+khp0JNtEhU5hY3pLWQkzXG8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k6eKZ-002Dom-QY; Fri, 14 Aug 2020 19:21:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Aug 2020 19:21:31 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-mips@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v4 1/5] of_address: Add bus type match for pci ranges
 parser
In-Reply-To: <20200728153708.1296374-2-jiaxun.yang@flygoat.com>
References: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
 <20200728153708.1296374-2-jiaxun.yang@flygoat.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <889508bae5da3c55690a7adbd101a5cd@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, robh+dt@kernel.org, frowand.list@gmail.com, linux-mips@vger.kernel.org, robh@kernel.org, tsbogend@alpha.franken.de, chenhc@lemote.com, paulburton@kernel.org, arnd@arndb.de, natechancellor@gmail.com, ndesaulniers@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

On 2020-07-28 16:36, Jiaxun Yang wrote:
> So the parser can be used to parse range property of ISA bus.
> 
> As they're all using PCI-like method of range property, there is no 
> need
> start a new parser.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch, although it looks correct, breaks the RK3399-based
systems, as they miss the (now required) 'device_type = "pci";'
property.

We can fix the in-tree DT, but that's not really an option
if someone relies on the DT being provided by the firmware
(I for one definitely do).

I came up with the following hack, which solves the issue for
me. Definitely not my finest hour, but I really need this box
to keep going. I will post a patch fixing the DT separately.

Thanks,

         M.

 From ceef5fd9c4d2005eb577505c68868ebe527c098f Mon Sep 17 00:00:00 2001
 From: Marc Zyngier <maz@kernel.org>
Date: Fri, 14 Aug 2020 19:10:12 +0100
Subject: [PATCH] of: address: Workaround broken DTs missing the 
'device_type =
  "pci"' property

Recent changes to the PCI bus parsing made it mandatory for
device trees nodes describing a PCI controller to have the
'device_type = "pci"' property for the node to be matched.

Although this is compliant with the specification, it breaks
existing device-trees that have been working fine for years
(the Rockchip rk3399-based systems being a prime example of
such breakage).

In order to paper over the blunder, let's also match nodes
that have the "linux,pci-domain" property, as they are
pretty likely to be PCI nodes. This fixes the issue for
systems such as the above platforms.

Fixes: 2f96593ecc37 ("of_address: Add bus type match for pci ranges 
parser")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
  drivers/of/address.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 590493e04b01..712e03781a2a 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -134,9 +134,12 @@ static int of_bus_pci_match(struct device_node *np)
   	 * "pciex" is PCI Express
  	 * "vci" is for the /chaos bridge on 1st-gen PCI powermacs
  	 * "ht" is hypertransport
+	 * "linux,pci-domain" is a workaround for broken device trees
+	 * lacking the required "device_type" property.
  	 */
  	return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
-		of_node_is_type(np, "vci") || of_node_is_type(np, "ht");
+		of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
+		of_find_property(np, "linux,pci-domain", NULL);
  }

  static void of_bus_pci_count_cells(struct device_node *np,
-- 
2.27.0


-- 
Jazz is not dead. It just smells funny...
