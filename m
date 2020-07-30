Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3EC233191
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 14:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgG3MD7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 08:03:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbgG3MD6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jul 2020 08:03:58 -0400
Received: from gaia (unknown [95.146.230.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E80B20829;
        Thu, 30 Jul 2020 12:03:52 +0000 (UTC)
Date:   Thu, 30 Jul 2020 13:03:50 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>, Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: Re: [PATCH 04/15] arm64: numa: simplify dummy_numa_init()
Message-ID: <20200730120349.GL25149@gaia>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-5-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 08:11:42AM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> dummy_numa_init() loops over memblock.memory and passes nid=0 to
> numa_add_memblk() which essentially wraps memblock_set_node(). However,
> memblock_set_node() can cope with entire memory span itself, so the loop
> over memblock.memory regions is redundant.
> 
> Replace the loop with a single call to memblock_set_node() to the entire
> memory.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
