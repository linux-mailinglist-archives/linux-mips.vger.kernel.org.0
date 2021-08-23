Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A993F4B29
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 14:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237037AbhHWM4Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 08:56:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232574AbhHWM4X (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 08:56:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3C32613AC;
        Mon, 23 Aug 2021 12:55:36 +0000 (UTC)
Date:   Mon, 23 Aug 2021 13:55:33 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/9] arm64: kdump: Remove custom
 linux,usable-memory-range handling
Message-ID: <20210823125533.GE8603@arm.com>
References: <cover.1628670468.git.geert+renesas@glider.be>
 <7356c531c49a24b4a55577bf8e46d93f4d8ae460.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7356c531c49a24b4a55577bf8e46d93f4d8ae460.1628670468.git.geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 11, 2021 at 10:51:06AM +0200, Geert Uytterhoeven wrote:
> Remove the architecture-specific code for handling the
> "linux,usable-memory-range" property under the "/chosen" node in DT, as
> the platform-agnostic FDT core code already takes care of this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
