Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167E02A9973
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 17:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgKFQ2v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 11:28:51 -0500
Received: from mail-eopbgr140114.outbound.protection.outlook.com ([40.107.14.114]:44174
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726034AbgKFQ2v (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Nov 2020 11:28:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np05LUxtkTI4fVKmsOSZHyTfiU3fDU1pcJbJGTqHWjuM97GSiB8/iBsITXe6JQME8rTBosp44P/c+rKvH9I5y9lQ8iEH3nxG6PA0Y2BmUvlxzwY7yGAP+W87YNL1f+boOKKnlNb1it1A20FtI7K6bkrLJ7EzvfZT192Fj0nHGt2UvtXF4rQ9Ch13uBZHvesZQHTHXHbMzq2UZ542DGZZ5xorefzkMEUPCIEH+VGx6AMlQcjtDMztyt7QYitE96N1WYvPzFxNGUNxTeoJfg3WPL4fMuHzjW9Z00kMa1R9sZNyme+/fOV7Mm0J+egedDagYK+IQ2Evc4Sl7806MDzXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvHaSC+TRtCXpei2KkufaB+7XplGZOuEG4blKSR84VE=;
 b=efyseX+cvXFDQnbqDFzGNR7SB8tQZEFYcmlBOIXnBKtd7d8wE3AJxbr2kt6oskdQbjZWVSbPmD28EEI1WdLDuSS06go/L3h61PeRNIU49wkQO2tjKw/V8fwf38SytziA4YSAWLvsum82mZ528axoRXttsifaHXDOOh7BnZuivonIhJSO/NwLrQkb06U6mnPuplptN3sPjgJ+PKdkvypp+ZWVilT+PvXjd9KtefZVDqYWsVPiHvomFoHsrU8Cf6fNEFfk0XL/USxxVqnpj3HJ7ntUe+AGv0VyS6cbqk/IE5Y5CSlqtqUPqHRXCFoRqiCdI4bbyWroDnaKIwMLbs8dmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvHaSC+TRtCXpei2KkufaB+7XplGZOuEG4blKSR84VE=;
 b=ZJKCkAXZ8DhVKmPd6eBg/95ORjtX/8npA+N/29XY4bVobvNhdn0B++lT/+uXEyNVE+mWef4DEp2EBkb9iyABY22OQtBMzwn7CxI1rIXPtBn8fSUzU42t4Kv7VmxfUSB1lZ9USHAMqqn8rg+oxI6Ye7pKz1pQKHY+B6Hgkq/vOrQ=
Authentication-Results: linux-mips.org; dkim=none (message not signed)
 header.d=none;linux-mips.org; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM8PR07MB7380.eurprd07.prod.outlook.com (2603:10a6:20b:248::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Fri, 6 Nov
 2020 16:28:47 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::d527:e75b:546c:a85b]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::d527:e75b:546c:a85b%6]) with mapi id 15.20.3541.015; Fri, 6 Nov 2020
 16:28:47 +0000
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH 11/11] MIPS: Use queued spinlocks (qspinlock)
To:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>
References: <20170610002644.8434-1-paul.burton@imgtec.com>
 <20170610002644.8434-12-paul.burton@imgtec.com>
Message-ID: <332f7fd1-4bc6-739c-e79e-6e0b3b8676a1@nokia.com>
Date:   Fri, 6 Nov 2020 17:28:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20170610002644.8434-12-paul.burton@imgtec.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.166]
X-ClientProxiedBy: AM0PR10CA0078.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::31) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.166) by AM0PR10CA0078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Fri, 6 Nov 2020 16:28:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e2c8db0-c954-4273-de69-08d882710923
X-MS-TrafficTypeDiagnostic: AM8PR07MB7380:
X-Microsoft-Antispam-PRVS: <AM8PR07MB7380824C45A8E9E4C55825E588ED0@AM8PR07MB7380.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:29;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHYHe5f8STNIEM9jXlgXqqMc2/AOH/x51Rk0kojBoauZUQ6o99Pq1I+Ng9CajmMZro/Q5/maDqbQoNwUrpvmHnJK4K1llRa94SjceXjPKe5mCKXSIbwpyksOiKgWiNeHxXR9tyrjZLD8uOIHoxigMNaRLxBxZVMsBlwQ5D4U+uTo9fnj0iZ8HKHfebcZTqw4lLslmsiK9PCFUfc6JKnIHfpfygH08Y7eaYlQ2klbsYceDdikVl0nDpUlySkruJqMGf4aQk1oYdBTCSpzzorFyEp84IVZ/Ofw7Sq0Dyp9kdY5pThmd+OY9qlvMAwqqbmEecA2ZChSZDBZcAZGqaF/PFDgTAfF2pCBI7WgUN6H1/Y8amcmQ3A9h/QUtaiuSWHR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(2906002)(2616005)(53546011)(52116002)(6486002)(30864003)(8676002)(478600001)(6512007)(956004)(8936002)(16526019)(83380400001)(31686004)(86362001)(66946007)(36756003)(186003)(4326008)(316002)(66476007)(66556008)(5660300002)(44832011)(31696002)(26005)(6506007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: OqyxXTJoeGC3Av/L4j09Evdps8gjhpJx4u9mb7wnNF/eeqZlhdZ+y/8W1SU3pAEsp4Z1uYwcjsz7hMgfAPqsPdoQXC7dBeWAeALDT2sjsoifhscnB/vUgKnkZn6RVYZvK5q9JHwQRFGWHHGBIqi1Voaz/rQrF8ILvdp590+TaTTtAAKyYjNo4Dlld52/0as7kA9d3d/K2R8M6ZW40RAT/o8aQm0QB0qR2ILzj3DejYIIGL5rZbrIBC3eVPZ/e2uiYNfBDbEYhWlwrBCPdHVZBivK1xTrzvc568x/Y5hpIxI9E7qbj3id6mOJn0ljpwt7lhfDM2Xjwr5FhN0QCdkhOqWVk6HIEfkdruxFp99dG4U1lLSxctx0HRKydb6LKNTPrt3Iy/aaSNewGqCbfOhLX3ZsVshD3mBHmb6qEDbhsgJDrInMp3+9YKbFS1t5au4bzlBfXxjLWRtrv1DmXkq5H/b0LY3xanvaiAU1holIF6lXqKkGdYC40GMPBr4Eas7m6IxgQqrQxTdtVQFOMRGUbhUw1h/jDaupgVTj2bVg21kvbip2P7QkWhht90rFDkf6ZyGNahZvVZexZ8CQHWkYKHIqCQg8aT/m6vl66VNB2oOx52FgGeqWTs+unmzqeG3mQLg6rqlPsuLzN8RILvjB+BOwJiU5OsXN3GuklomFePiVyWDi1EtdNtMUBxVTNhiWes6STwOmtqxRiHTQNbhytpkKb/CAw9oyJv8b8c8AZ/eE/5/AO13jSBoZ3rlByFY36Xvuqv+EsFIWXdIby+Kco2NHsbo+JgIKto5XMrnfg+NWWivBeAv0rssaHofCxCdg4IcFVQ5BKXdiKTFW+L4D2izgiAJ0IAHshReccFTKM1uo/+43xYsESI5Bu0Ghgie56qfjQTonfAfsRVNIsEJgsQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2c8db0-c954-4273-de69-08d882710923
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 16:28:47.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uME3tOjho5eLTrC3oMZa5ChaoSZbS7eP+Mm41PLz8QvBxehCnB0TbZmd6rn/1fktt39c8ZSjZhx0NGxIqhxSJEsoi1dQnDa3mG2amK5yT24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7380
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Paul and all,

On 10/06/2017 02:26, Paul Burton wrote:
> This patch switches MIPS to make use of generically implemented queued
> spinlocks, rather than the ticket spinlocks used previously. This allows
> us to drop a whole load of inline assembly, share more generic code, and
> is also a performance win.

unfortunately this patch made spin_locks on Octeon two times slower.
Further patches didn't improve the situation and my measurement show that
currently in 5.9 the situation is even worse (which I still have to analyze).

I've performed two kinds of test for this particular patch, based on upstream
lock_torture test and using my own kernel module with a more tight loop
around spin_lock (which I could share on request).

The CONFIG_LOCK_TORTURE_TEST results were obtained with the following parameters:
modprobe locktorture nwriters_stress=6; sleep 62; rmmod locktorture;

Before the patch:
Writes:  Total: 40973197  Max/Min: 0/0   Fail: 0 

After the patch:
Writes:  Total: 34317903  Max/Min: 0/0   Fail: 0

This shows 17% performance loss.

However if I test a tighter loop:
        for (i = 0; i < NUM_ITERATIONS; i++) {                                                                                                                                  
                spin_lock(&locktest_spinlock);                                                                                                                                  
                locktest_counter++;                                                                                                                                             
                spin_unlock(&locktest_spinlock);                                                                                                                                
        }                                                                                                                                                                       

again with 6 threads, I get 1.499s (for 1M iterations) instead of 0.731s.
This is 105% overhead per lock-unlock combination in comparison to MIPS-specific
implementation!

What do you think, should I prepare a revert of this conversion to queued locks
or do you have ideas I might try on Octeon?
I suspect locks other than spin_lock might be affected as well.

> Results from running the AIM7 short workload on a MIPS Creator Ci40 (ie.
> 2 core 2 thread interAptiv CPU clocked at 546MHz) with v4.12-rc4
> pistachio_defconfig, with ftrace disabled due to a current bug, and both
> with & without use of queued rwlocks & spinlocks:
> 
>   Forks | v4.12-rc4 | +qlocks  | Change
>  -------|-----------|----------|--------
>      10 | 52630.32  | 53316.31 | +1.01%
>      20 | 51777.80  | 52623.15 | +1.02%
>      30 | 51645.92  | 52517.26 | +1.02%
>      40 | 51634.88  | 52419.89 | +1.02%
>      50 | 51506.75  | 52307.81 | +1.02%
>      60 | 51500.74  | 52322.72 | +1.02%
>      70 | 51434.81  | 52288.60 | +1.02%
>      80 | 51423.22  | 52434.85 | +1.02%
>      90 | 51428.65  | 52410.10 | +1.02%
> 
> The kernels used for these tests also had my "MIPS: Hardcode cpu_has_*
> where known at compile time due to ISA" patch applied, which allows the
> kernel_uses_llsc checks in cmpxchg() & xchg() to be optimised away at
> compile time.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---
> 
>  arch/mips/Kconfig                      |   1 +
>  arch/mips/include/asm/Kbuild           |   1 +
>  arch/mips/include/asm/spinlock.h       | 210 +--------------------------------
>  arch/mips/include/asm/spinlock_types.h |  24 +---
>  4 files changed, 4 insertions(+), 232 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 50c71273f569..398f0a55d4fa 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -71,6 +71,7 @@ config MIPS
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_COPY_THREAD_TLS
>  	select ARCH_USE_QUEUED_RWLOCKS
> +	select ARCH_USE_QUEUED_SPINLOCKS
>  
>  menu "Machine selection"
>  
> diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
> index ae6cb47e9d22..7c8aab23bce8 100644
> --- a/arch/mips/include/asm/Kbuild
> +++ b/arch/mips/include/asm/Kbuild
> @@ -13,6 +13,7 @@ generic-y += parport.h
>  generic-y += percpu.h
>  generic-y += preempt.h
>  generic-y += qrwlock.h
> +generic-y += qspinlock.h
>  generic-y += sections.h
>  generic-y += segment.h
>  generic-y += serial.h
> diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
> index 3e7afff196cd..a7d21da16b6a 100644
> --- a/arch/mips/include/asm/spinlock.h
> +++ b/arch/mips/include/asm/spinlock.h
> @@ -9,217 +9,9 @@
>  #ifndef _ASM_SPINLOCK_H
>  #define _ASM_SPINLOCK_H
>  
> -#include <linux/compiler.h>
> -
> -#include <asm/barrier.h>
>  #include <asm/processor.h>
>  #include <asm/qrwlock.h>
> -#include <asm/compiler.h>
> -#include <asm/war.h>
> -
> -/*
> - * Your basic SMP spinlocks, allowing only a single CPU anywhere
> - *
> - * Simple spin lock operations.	 There are two variants, one clears IRQ's
> - * on the local processor, one does not.
> - *
> - * These are fair FIFO ticket locks
> - *
> - * (the type definitions are in asm/spinlock_types.h)
> - */
> -
> -
> -/*
> - * Ticket locks are conceptually two parts, one indicating the current head of
> - * the queue, and the other indicating the current tail. The lock is acquired
> - * by atomically noting the tail and incrementing it by one (thus adding
> - * ourself to the queue and noting our position), then waiting until the head
> - * becomes equal to the the initial value of the tail.
> - */
> -
> -static inline int arch_spin_is_locked(arch_spinlock_t *lock)
> -{
> -	u32 counters = ACCESS_ONCE(lock->lock);
> -
> -	return ((counters >> 16) ^ counters) & 0xffff;
> -}
> -
> -static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> -{
> -	return lock.h.serving_now == lock.h.ticket;
> -}
> -
> -#define arch_spin_lock_flags(lock, flags) arch_spin_lock(lock)
> -
> -static inline void arch_spin_unlock_wait(arch_spinlock_t *lock)
> -{
> -	u16 owner = READ_ONCE(lock->h.serving_now);
> -	smp_rmb();
> -	for (;;) {
> -		arch_spinlock_t tmp = READ_ONCE(*lock);
> -
> -		if (tmp.h.serving_now == tmp.h.ticket ||
> -		    tmp.h.serving_now != owner)
> -			break;
> -
> -		cpu_relax();
> -	}
> -	smp_acquire__after_ctrl_dep();
> -}
> -
> -static inline int arch_spin_is_contended(arch_spinlock_t *lock)
> -{
> -	u32 counters = ACCESS_ONCE(lock->lock);
> -
> -	return (((counters >> 16) - counters) & 0xffff) > 1;
> -}
> -#define arch_spin_is_contended	arch_spin_is_contended
> -
> -static inline void arch_spin_lock(arch_spinlock_t *lock)
> -{
> -	int my_ticket;
> -	int tmp;
> -	int inc = 0x10000;
> -
> -	if (R10000_LLSC_WAR) {
> -		__asm__ __volatile__ (
> -		"	.set push		# arch_spin_lock	\n"
> -		"	.set noreorder					\n"
> -		"							\n"
> -		"1:	ll	%[ticket], %[ticket_ptr]		\n"
> -		"	addu	%[my_ticket], %[ticket], %[inc]		\n"
> -		"	sc	%[my_ticket], %[ticket_ptr]		\n"
> -		"	beqzl	%[my_ticket], 1b			\n"
> -		"	 nop						\n"
> -		"	srl	%[my_ticket], %[ticket], 16		\n"
> -		"	andi	%[ticket], %[ticket], 0xffff		\n"
> -		"	bne	%[ticket], %[my_ticket], 4f		\n"
> -		"	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
> -		"2:							\n"
> -		"	.subsection 2					\n"
> -		"4:	andi	%[ticket], %[ticket], 0xffff		\n"
> -		"	sll	%[ticket], 5				\n"
> -		"							\n"
> -		"6:	bnez	%[ticket], 6b				\n"
> -		"	 subu	%[ticket], 1				\n"
> -		"							\n"
> -		"	lhu	%[ticket], %[serving_now_ptr]		\n"
> -		"	beq	%[ticket], %[my_ticket], 2b		\n"
> -		"	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
> -		"	b	4b					\n"
> -		"	 subu	%[ticket], %[ticket], 1			\n"
> -		"	.previous					\n"
> -		"	.set pop					\n"
> -		: [ticket_ptr] "+" GCC_OFF_SMALL_ASM() (lock->lock),
> -		  [serving_now_ptr] "+m" (lock->h.serving_now),
> -		  [ticket] "=&r" (tmp),
> -		  [my_ticket] "=&r" (my_ticket)
> -		: [inc] "r" (inc));
> -	} else {
> -		__asm__ __volatile__ (
> -		"	.set push		# arch_spin_lock	\n"
> -		"	.set noreorder					\n"
> -		"							\n"
> -		"1:	ll	%[ticket], %[ticket_ptr]		\n"
> -		"	addu	%[my_ticket], %[ticket], %[inc]		\n"
> -		"	sc	%[my_ticket], %[ticket_ptr]		\n"
> -		"	beqz	%[my_ticket], 1b			\n"
> -		"	 srl	%[my_ticket], %[ticket], 16		\n"
> -		"	andi	%[ticket], %[ticket], 0xffff		\n"
> -		"	bne	%[ticket], %[my_ticket], 4f		\n"
> -		"	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
> -		"2:	.insn						\n"
> -		"	.subsection 2					\n"
> -		"4:	andi	%[ticket], %[ticket], 0xffff		\n"
> -		"	sll	%[ticket], 5				\n"
> -		"							\n"
> -		"6:	bnez	%[ticket], 6b				\n"
> -		"	 subu	%[ticket], 1				\n"
> -		"							\n"
> -		"	lhu	%[ticket], %[serving_now_ptr]		\n"
> -		"	beq	%[ticket], %[my_ticket], 2b		\n"
> -		"	 subu	%[ticket], %[my_ticket], %[ticket]	\n"
> -		"	b	4b					\n"
> -		"	 subu	%[ticket], %[ticket], 1			\n"
> -		"	.previous					\n"
> -		"	.set pop					\n"
> -		: [ticket_ptr] "+" GCC_OFF_SMALL_ASM() (lock->lock),
> -		  [serving_now_ptr] "+m" (lock->h.serving_now),
> -		  [ticket] "=&r" (tmp),
> -		  [my_ticket] "=&r" (my_ticket)
> -		: [inc] "r" (inc));
> -	}
> -
> -	smp_llsc_mb();
> -}
> -
> -static inline void arch_spin_unlock(arch_spinlock_t *lock)
> -{
> -	unsigned int serving_now = lock->h.serving_now + 1;
> -	wmb();
> -	lock->h.serving_now = (u16)serving_now;
> -	nudge_writes();
> -}
> -
> -static inline unsigned int arch_spin_trylock(arch_spinlock_t *lock)
> -{
> -	int tmp, tmp2, tmp3;
> -	int inc = 0x10000;
> -
> -	if (R10000_LLSC_WAR) {
> -		__asm__ __volatile__ (
> -		"	.set push		# arch_spin_trylock	\n"
> -		"	.set noreorder					\n"
> -		"							\n"
> -		"1:	ll	%[ticket], %[ticket_ptr]		\n"
> -		"	srl	%[my_ticket], %[ticket], 16		\n"
> -		"	andi	%[now_serving], %[ticket], 0xffff	\n"
> -		"	bne	%[my_ticket], %[now_serving], 3f	\n"
> -		"	 addu	%[ticket], %[ticket], %[inc]		\n"
> -		"	sc	%[ticket], %[ticket_ptr]		\n"
> -		"	beqzl	%[ticket], 1b				\n"
> -		"	 li	%[ticket], 1				\n"
> -		"2:							\n"
> -		"	.subsection 2					\n"
> -		"3:	b	2b					\n"
> -		"	 li	%[ticket], 0				\n"
> -		"	.previous					\n"
> -		"	.set pop					\n"
> -		: [ticket_ptr] "+" GCC_OFF_SMALL_ASM() (lock->lock),
> -		  [ticket] "=&r" (tmp),
> -		  [my_ticket] "=&r" (tmp2),
> -		  [now_serving] "=&r" (tmp3)
> -		: [inc] "r" (inc));
> -	} else {
> -		__asm__ __volatile__ (
> -		"	.set push		# arch_spin_trylock	\n"
> -		"	.set noreorder					\n"
> -		"							\n"
> -		"1:	ll	%[ticket], %[ticket_ptr]		\n"
> -		"	srl	%[my_ticket], %[ticket], 16		\n"
> -		"	andi	%[now_serving], %[ticket], 0xffff	\n"
> -		"	bne	%[my_ticket], %[now_serving], 3f	\n"
> -		"	 addu	%[ticket], %[ticket], %[inc]		\n"
> -		"	sc	%[ticket], %[ticket_ptr]		\n"
> -		"	beqz	%[ticket], 1b				\n"
> -		"	 li	%[ticket], 1				\n"
> -		"2:	.insn						\n"
> -		"	.subsection 2					\n"
> -		"3:	b	2b					\n"
> -		"	 li	%[ticket], 0				\n"
> -		"	.previous					\n"
> -		"	.set pop					\n"
> -		: [ticket_ptr] "+" GCC_OFF_SMALL_ASM() (lock->lock),
> -		  [ticket] "=&r" (tmp),
> -		  [my_ticket] "=&r" (tmp2),
> -		  [now_serving] "=&r" (tmp3)
> -		: [inc] "r" (inc));
> -	}
> -
> -	smp_llsc_mb();
> -
> -	return tmp;
> -}
> +#include <asm/qspinlock.h>
>  
>  #define arch_read_lock_flags(lock, flags) arch_read_lock(lock)
>  #define arch_write_lock_flags(lock, flags) arch_write_lock(lock)
> diff --git a/arch/mips/include/asm/spinlock_types.h b/arch/mips/include/asm/spinlock_types.h
> index 3d38bfad9b49..177e722eb96c 100644
> --- a/arch/mips/include/asm/spinlock_types.h
> +++ b/arch/mips/include/asm/spinlock_types.h
> @@ -1,29 +1,7 @@
>  #ifndef _ASM_SPINLOCK_TYPES_H
>  #define _ASM_SPINLOCK_TYPES_H
>  
> -#include <linux/types.h>
> -
> -#include <asm/byteorder.h>
> -
> -typedef union {
> -	/*
> -	 * bits	 0..15 : serving_now
> -	 * bits 16..31 : ticket
> -	 */
> -	u32 lock;
> -	struct {
> -#ifdef __BIG_ENDIAN
> -		u16 ticket;
> -		u16 serving_now;
> -#else
> -		u16 serving_now;
> -		u16 ticket;
> -#endif
> -	} h;
> -} arch_spinlock_t;
> -
> -#define __ARCH_SPIN_LOCK_UNLOCKED	{ .lock = 0 }
> -
> +#include <asm-generic/qspinlock_types.h>
>  #include <asm-generic/qrwlock_types.h>
>  
>  #endif
> 

-- 
Best regards,
Alexander Sverdlin.
