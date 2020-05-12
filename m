Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99E21CEE69
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 09:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgELHpg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 03:45:36 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:33396 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgELHpg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 May 2020 03:45:36 -0400
Received: from flygoat-x1e (unknown [IPv6:2409:891e:6960:188a:d689:51ea:9df3:fb0d])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 1B86220EF2;
        Tue, 12 May 2020 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1589269536; bh=gLTp49mpZiT1mKN/xk1CeZnPzNwoQHdm6EUF8eGHTgM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rG40wsRKJ6uQTQ64Ys7UF25V9HsQSUtEkolqpkkodA0hksCCNXDd6+CMEkDxM2mWt
         JcnEQgE8RR0iBu+UZig2p4t4R6KAN3oZkck/FQwI+yvJUSjjQR3qKSJkd1vtAtqvW6
         TtLbxnuo7qfN+yRteAFbsND/vT3Qz5It6srkI2ojM9+rznRz92kwOQtM9OSJewU0T7
         5JB+IYwEwHYS2sRKiI1ptPNBtWJgX4rnrnxi+7eKsX8TsEZZmH0Oz7xgY2mgs03k/z
         Q4FUw0T9G+/iWgewqq/8SKdTXED+rQBvdyNJX8TxUosSLjDdZ+JNWsf3LF8EtUtkMh
         TUOZkArcudZHQ==
Date:   Tue, 12 May 2020 15:45:21 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/6] irqchip: Add Loongson HyperTransport Vector
 support
Message-ID: <20200512154521.7d3c47b6@flygoat-x1e>
In-Reply-To: <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
        <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri,  1 May 2020 17:21:32 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

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

Any update about v3?

Thanks.

[...]
--
Jiaxun Yang
