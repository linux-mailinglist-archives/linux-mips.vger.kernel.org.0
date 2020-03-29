Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F02196DB6
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 15:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgC2Nmv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 09:42:51 -0400
Received: from foss.arm.com ([217.140.110.172]:58288 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727903AbgC2Nmv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 29 Mar 2020 09:42:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B302231B;
        Sun, 29 Mar 2020 06:42:50 -0700 (PDT)
Received: from [10.163.1.70] (unknown [10.163.1.70])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5731E3F71F;
        Sun, 29 Mar 2020 06:42:43 -0700 (PDT)
Subject: Re: [PATCH 0/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
To:     linux-mm@kvack.org
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        nouveau@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2e67f1b8-d196-89e4-aee1-f552db1433a0@arm.com>
Date:   Sun, 29 Mar 2020 19:12:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/20/2020 10:24 AM, Anshuman Khandual wrote:
> This series renames pmd_mknotpresent() as pmd_mknotvalid(). Before that it
> drops an existing pmd_mknotpresent() definition from powerpc platform which
> was never required as it defines it's pmdp_invalidate() through subscribing
> __HAVE_ARCH_PMDP_INVALIDATE. This does not create any functional change.
> 
> This rename was suggested by Catalin during a previous discussion while we
> were trying to change the THP helpers on arm64 platform for migration.
> 
> https://patchwork.kernel.org/patch/11019637/
> 
> This series is based on v5.6-rc6.
> 
> Boot tested on arm64 and x86 platforms.
> Built tested on many other platforms including the ones changed here.

Gentle ping, any updates regarding this ?
