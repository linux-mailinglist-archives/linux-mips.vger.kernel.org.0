Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D921E78AC
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 10:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgE2Ir3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 04:47:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:51220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE2Ir2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 04:47:28 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED3D82075A;
        Fri, 29 May 2020 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590742048;
        bh=pxiiu9xqqkiXKrFjgHAuys/IAK5bZGOOkPDarFrmq58=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=03qgbRgrutFPSwgNQGcnHfA3qNKi8K1gN6exO6igM9hw6I1JMbgAvWLyZbxN5kkC8
         X4ItvWrbD1K5VhRerc9Mr1E0b/DZg/IdhP/n9KCmPyRJLRJA9Qoeb1WNLhstTO6lAU
         WMe49b583l1kp4OmECVFAaWbHaLJzxThNRxnnPso=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jeafm-00GDoF-CQ; Fri, 29 May 2020 09:47:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 29 May 2020 09:47:26 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 1/6] irqchip: Add Loongson HyperTransport Vector
 support
In-Reply-To: <20200528152757.1028711-2-jiaxun.yang@flygoat.com>
References: <20200528152757.1028711-1-jiaxun.yang@flygoat.com>
 <20200528152757.1028711-2-jiaxun.yang@flygoat.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <913f1c809fc1fa479c5d6cd6fb375bf7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, chenhc@lemote.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-05-28 16:27, Jiaxun Yang wrote:
> This controller appears on Loongson-3 chips for receiving interrupt
> vectors from PCH's PIC and PCH's PCIe MSI interrupts.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
> 	- Style cleanup
> 	- Set ack callback and set correct edge_irq handler
> 
> v3:
> 	- Correct bitops in ACK callback
> v4:
> 	- Drop irqsave for spinlocks
> 	- Fix brace align and ordering issue thanks to tglx
> ---

When adding a changelog to a patch, please add the text after the '---'
delimiter, without adding an extra '---' at the end. This otherwise
confuses tools like mb2q or b4.

Please see Documentation/process/submitting-patches.rst ("14) The 
canonical patch format").

I've fixed it up locally, no need to resend.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
