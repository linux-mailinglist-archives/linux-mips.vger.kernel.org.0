Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D92B1AF4F9
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2020 22:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgDRUnF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Apr 2020 16:43:05 -0400
Received: from smtprelay0199.hostedemail.com ([216.40.44.199]:41158 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726014AbgDRUnF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 18 Apr 2020 16:43:05 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id C8D98100E7B43;
        Sat, 18 Apr 2020 20:43:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:334:355:368:369:379:599:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3874:4321:5007:6119:6742:6743:10004:10400:10848:11026:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:13069:13161:13229:13311:13357:13439:14659:14721:21080:21324:21627:21990:30003:30054:30089:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: bikes51_54543769da122
X-Filterd-Recvd-Size: 3474
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Sat, 18 Apr 2020 20:42:59 +0000 (UTC)
Message-ID: <24a1f021e52ccabfd53baa22b93947ef10e6bf3b.camel@perches.com>
Subject: Re: [PATCHv3 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
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
Date:   Sat, 18 Apr 2020 13:40:45 -0700
In-Reply-To: <20200418201944.482088-2-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
         <20200418201944.482088-2-dima@arista.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 2020-04-18 at 21:18 +0100, Dmitry Safonov wrote:
> print_ip_sym() needs to have a log level parameter to comply with other
> parts being printed. Otherwise, half of the expected backtrace would be
> printed and other may be missing with some logging level.

I'd rather create another extension to %ps that also emits
the [<address>] along with the symbol lookup and retire
print_ip_sym altogether.

Something like:
---
 lib/vsprintf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7c488a..8fce8f 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2072,6 +2072,8 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  * - 'S' For symbolic direct pointers (or function descriptors) with offset
  * - 's' For symbolic direct pointers (or function descriptors) without offset
  * - '[Ss]R' as above with __builtin_extract_return_addr() translation
+ * - '[Ss]B' [<address>] and symbolic direct pointers as above
+ *	     (was used previously used as print_ip_sym)
  * - '[Ff]' %pf and %pF were obsoleted and later removed in favor of
  *	    %ps and %pS. Be careful when re-using these specifiers.
  * - 'B' For backtraced symbolic direct pointers with offset
@@ -2183,6 +2185,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 	case 'S':
 	case 's':
 		ptr = dereference_symbol_descriptor(ptr);
+		if (fmt[1] == 'B')
+			buf += vsprintf(buf, end, "[<%px>] ", ptr);
 		/* Fallthrough */
 	case 'B':
 		return symbol_string(buf, end, ptr, spec, fmt);


