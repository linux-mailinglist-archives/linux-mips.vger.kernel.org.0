Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD691B130B
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 19:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgDTRak (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 13:30:40 -0400
Received: from smtprelay0214.hostedemail.com ([216.40.44.214]:39548 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726396AbgDTRaj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 13:30:39 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id CD7071802EC18;
        Mon, 20 Apr 2020 17:30:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:334:355:368:369:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3872:3873:3874:4321:5007:6742:6743:10004:10400:11026:11232:11658:11914:12050:12295:12297:12740:12760:12895:13069:13071:13311:13357:13439:14180:14659:14721:21060:21080:21324:21627:30054:30089:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: wire77_794acccb34a52
X-Filterd-Recvd-Size: 2900
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf06.hostedemail.com (Postfix) with ESMTPA;
        Mon, 20 Apr 2020 17:30:33 +0000 (UTC)
Message-ID: <0cff04825062a6e4b04a19cac80152b9943402b1.camel@perches.com>
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
Date:   Mon, 20 Apr 2020 10:28:17 -0700
In-Reply-To: <7616c5f4-def1-7362-ceef-db76107b9c2b@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
         <20200418201944.482088-2-dima@arista.com>
         <24a1f021e52ccabfd53baa22b93947ef10e6bf3b.camel@perches.com>
         <7616c5f4-def1-7362-ceef-db76107b9c2b@arista.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 2020-04-20 at 18:25 +0100, Dmitry Safonov wrote:
> Hi Joe,

Hi Dmitry.

> On 4/18/20 9:40 PM, Joe Perches wrote:
> > On Sat, 2020-04-18 at 21:18 +0100, Dmitry Safonov wrote:
> > > print_ip_sym() needs to have a log level parameter to comply with other
> > > parts being printed. Otherwise, half of the expected backtrace would be
> > > printed and other may be missing with some logging level.
> > 
> > I'd rather create another extension to %ps that also emits
> > the [<address>] along with the symbol lookup and retire
> > print_ip_sym altogether.
> 
> Makes sense.
> Would you mind if I'll do it on the top of these patches?
> [not to mix new printk-format with patches those add loglvl parameter]

Of course not, but the proposal below doesn't compile
and I've been playing with a slightly different
implementation.

I'll post it in a few days.


