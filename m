Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC6341A6E9
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 07:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbhI1FLa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 01:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhI1FLa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 01:11:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3DEC061575;
        Mon, 27 Sep 2021 22:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=oOd9LxoociUm+XQt9zv+ciORRiD3WJaBIAs9vhJ/RBU=; b=QEti/cNOWw+cTSUuHKYv5niedv
        OTE+5bQlj2w39HoDBdfnfzLOSKu3EaUm7Uqwg6U53WWuCvTB+l9Wr1XV7dfgAJfLqlK9hDJl9wW1q
        kEV2OpRJabiiPgPlsptDYH2oN85MbCfbHnm56jZD4kw0ZoGv+k6luGN2seSqXnQnsexa9JiHqlO44
        qqz4L4UZUi/24mUjAqJfskHIrxCGp46f2SpYytuhL0YpYSSJpkk3zq0cwCMlT1RCWMI7Db9NtC8p6
        PqkdY0xfj1B0qU8f2iFHlK14HB7hq0PHB7GrLJPeLXI8/2Qliro4TT6O06ecWmzeIpgz4uGrR6ni3
        38wNVRIQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mV5MJ-00AVbC-Nz; Tue, 28 Sep 2021 05:09:00 +0000
Date:   Tue, 28 Sep 2021 06:08:51 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 01/12] arch: Export cpu_logical_map to modules
Message-ID: <YVKjYxf5bzJzWJDb@infradead.org>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
 <20210928022715.369160-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928022715.369160-2-f.fainelli@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 27, 2021 at 07:27:04PM -0700, Florian Fainelli wrote:
> In order to allow drivers/irqchip/irq-bcm7038-l1.c to be built as a
> module and usable in GKI, export cpu_logical_map or __cpu_logical_map
> towards the modules. This follows what MIPS has been doing since
> 2dc2ae344e0e ("MIPS: Export __cpu_number_map and __cpu_logical_map.")

This seems like a pretty bad idea.  For one you should export an
accessor instead of the data structure.  And this probably should be an
EXPORT_SYMBOL_GPL.
