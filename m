Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4817186E97
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2020 16:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731505AbgCPPbW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Mar 2020 11:31:22 -0400
Received: from smtprelay0023.hostedemail.com ([216.40.44.23]:35616 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731483AbgCPPbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Mar 2020 11:31:22 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id F29A81802DEF8;
        Mon, 16 Mar 2020 15:31:20 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id E5402181D304D;
        Mon, 16 Mar 2020 15:31:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3872:4321:4605:5007:6742:6743:7903:10004:10400:11026:11658:11914:12043:12297:12740:12760:12895:13069:13161:13229:13311:13357:13439:14096:14097:14659:21080:21627:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: route18_624da6916fc3d
X-Filterd-Recvd-Size: 2711
Received: from XPS-9350.home (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Mon, 16 Mar 2020 15:31:15 +0000 (UTC)
Message-ID: <97ea305c0d336f3c36a804b37e6bbb4b1bbf24fd.camel@perches.com>
Subject: Re: [PATCHv2 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
From:   Joe Perches <joe@perches.com>
To:     Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greentime Hu <green.hu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Chen <deanbo422@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Will Deacon <will@kernel.org>, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Mon, 16 Mar 2020 08:29:28 -0700
In-Reply-To: <20200316143916.195608-2-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
         <20200316143916.195608-2-dima@arista.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 2020-03-16 at 14:38 +0000, Dmitry Safonov wrote:
> print_ip_sym() needs to have a log level parameter to comply with other
> parts being printed. Otherwise, half of the expected backtrace would be
> printed and other may be missing with some logging level.

There are 15 instances of print_ip_sym.

Perhaps it'd be better to get rid of print_ip_sym
altogether by expanding it in-place instead.

>  arch/microblaze/kernel/unwind.c | 2 +-
>  arch/mips/kernel/traps.c        | 4 ++--
>  arch/nds32/kernel/traps.c       | 4 ++--
>  arch/riscv/kernel/stacktrace.c  | 2 +-
>  include/linux/kallsyms.h        | 4 ++--
>  kernel/locking/lockdep.c        | 4 ++--
>  kernel/sched/core.c             | 6 ++----
>  kernel/trace/ftrace.c           | 8 ++++----
>  tools/include/linux/kallsyms.h  | 2 +-


