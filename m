Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FB81EB8E3
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jun 2020 11:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgFBJv4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jun 2020 05:51:56 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:54684 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgFBJvz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Jun 2020 05:51:55 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 854CC8030836;
        Tue,  2 Jun 2020 09:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kXqPIGerUUjQ; Tue,  2 Jun 2020 12:51:48 +0300 (MSK)
Date:   Tue, 2 Jun 2020 12:51:46 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Joe Perches <joe@perches.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, <linux-mips@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH -next] MAINTAINERS: Update F: and X: entry ordering
 (was Re: [PATCH v2 6/6] MAINTAINERS: Add maintainers for MIPS core drivers)
Message-ID: <20200602095146.whjqqt25u2q5lgsa@mobilestation>
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
 <20200601122121.15809-7-Sergey.Semin@baikalelectronics.ru>
 <CAHp75Vec8DA+dVDGif7UhBtxDPFZG0nnCav=qLJON=j8=9QxSA@mail.gmail.com>
 <20200601151903.ipd5ikw35z53eq2t@mobilestation>
 <CAHp75VdQYBqRUbUEHqjp0XE8bEsRcfTuDRn=R-j4c9TYH6niqw@mail.gmail.com>
 <20200601155204.hsatjbukj6haxhld@mobilestation>
 <CAHp75Vej9gRAVspzfruciQ7weFunNBtj8GxbgBCVWtGwk5_ntQ@mail.gmail.com>
 <2e96576791604862a11f094665b0c4e9c3263fd4.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2e96576791604862a11f094665b0c4e9c3263fd4.camel@perches.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Joe

On Mon, Jun 01, 2020 at 11:22:58AM -0700, Joe Perches wrote:
> On Mon, 2020-06-01 at 19:04 +0300, Andy Shevchenko wrote:
> > On Mon, Jun 1, 2020 at 6:52 PM Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote:
> > > On Mon, Jun 01, 2020 at 06:30:22PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Jun 1, 2020 at 6:19 PM Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote:
> > > > > On Mon, Jun 01, 2020 at 04:56:21PM +0300, Andy Shevchenko wrote:
> > > > > > On Mon, Jun 1, 2020 at 3:26 PM Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote:
> > > > > > > Add myself as a maintainer of MIPS CPU and GIC IRQchip, MIPS GIC timer
> > > > > > > and MIPS CPS CPUidle drivers.
> > > > > > ...
> > > > > > > +MIPS CORE DRIVERS
> > > > > > > +M:     Serge Semin <fancer.lancer@gmail.com>
> > > > > > > +L:     linux-mips@vger.kernel.org
> > > > > > > +S:     Supported
> > > > > > > +F:     drivers/bus/mips_cdmm.c
> > > > > > > +F:     drivers/irqchip/irq-mips-cpu.c
> > > > > > > +F:     drivers/irqchip/irq-mips-gic.c
> > > > > > > +F:     drivers/clocksource/mips-gic-timer.c
> > > > > > > +F:     drivers/cpuidle/cpuidle-cps.c
> > > > > > 
> > > > > > I think nowadays checkpatch.pl warns on wrong ordering in this data base.
> []
> > > Next time I won't forget that then. BTW the notes at the top of the MAINTAINERS
> > > file don't explicitly say about the files-list order. Only about the
> > > whole maintainers list entries order. Seeing the rest of the sub-entries like
> > > L:, M:, etc. aren't ordered then it's probably better to have an explicit
> > > statement, that files should be alphabetically listed, especially when
> > > checkpatch.pl starts warning about that.
> > 
> > Joe, what do you think?
> 
> Fine by me.  Maybe something like the below.
> 
> Another thing might be to intermix the F and X entries so that
> exclusions are more obviously against the F: entries.
> 
> There aren't many MAINTAINERS lines changed when the modified
> parse-maintainers is run, but I think it reads better.
> 
> It doesn't seem the last major reordering with parse-maintainers
> caused any significant issue for anyone.

I was also thinking about a text explaining the F: section order requirement.
Like this:

diff --git a/MAINTAINERS b/MAINTAINERS
index 865aeafee3b2..253f8f97891f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -111,7 +111,8 @@ Descriptions of section entries and preferred order
 	   F:	drivers/net/	all files in and below drivers/net
 	   F:	drivers/net/*	all files in drivers/net, but not below
 	   F:	*/net/*		all files in "any top level directory"/net
-	   One pattern per line.  Multiple F: lines acceptable.
+	   One pattern per line. Multiple F: lines acceptable, but are
+	   supposed to be listed in alphabetical order.
 	X: *Excluded* files and directories that are NOT maintained, same
 	   rules as F:. Files exclusions are tested before file matches.
 	   Can be useful for excluding a specific subdirectory, for instance:

The rest suggested by you is fine with me. Intermixing F and X seems reasonable
so the maintainers could group inclusion and exclusion sections together
with respect to the files/directories they refer to.

-Sergey

> 
> I think having Linus run scripts/parse-maintainers.pl just before
> every release or every few releases would make this issue go away.
> ---
>  MAINTAINERS                  |  1 +
>  scripts/checkpatch.pl        | 17 +++++++----------
>  scripts/parse-maintainers.pl |  5 ++---
>  3 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b045b70e54df..4b53119504ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -118,6 +118,7 @@ Descriptions of section entries and preferred order
>  	   F:	net/
>  	   X:	net/ipv6/
>  	   matches all files in and below net excluding net/ipv6/
> +	   F: and X: entries are intermixed in case sensitive alphabetic order
>  	N: Files and directories *Regex* patterns.
>  	   N:	[^a-z]tegra	all files whose path contains tegra
>  	                        (not including files like integrator)
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index dd750241958b..499c85be0b2f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3099,16 +3099,13 @@ sub process {
>  				if ($curindex < 0) {
>  					WARN("MAINTAINERS_STYLE",
>  					     "Unknown MAINTAINERS entry type: '$cur'\n" . $herecurr);
> -				} else {
> -					if ($previndex >= 0 && $curindex < $previndex) {
> -						WARN("MAINTAINERS_STYLE",
> -						     "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev);
> -					} elsif ((($prev eq 'F' && $cur eq 'F') ||
> -						  ($prev eq 'X' && $cur eq 'X')) &&
> -						 ($prevval cmp $curval) > 0) {
> -						WARN("MAINTAINERS_STYLE",
> -						     "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev);
> -					}
> +				} elsif ($previndex >= 0 && $curindex < $previndex && !($prev =~ /[FX]/ && $cur =~ /[FX]/)) {
> +					WARN("MAINTAINERS_STYLE",
> +					     "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev);
> +				} elsif ((($prev =~ /[FX]/ && $cur =~ /[FX]/) &&
> +					  ($prevval cmp $curval) > 0)) {
> +					WARN("MAINTAINERS_STYLE",
> +					     "Misordered MAINTAINERS entry - list F and X file patterns in alphabetic order\n" . $hereprev);
>  				}
>  			}
>  		}
> diff --git a/scripts/parse-maintainers.pl b/scripts/parse-maintainers.pl
> index 2ca4eb3f190d..8d2247a596f0 100755
> --- a/scripts/parse-maintainers.pl
> +++ b/scripts/parse-maintainers.pl
> @@ -84,9 +84,8 @@ sub by_pattern($$) {
>      $a_index = 1000 if ($a_index == -1);
>      $b_index = 1000 if ($b_index == -1);
>  
> -    if (($a1 =~ /^F$/ && $b1 =~ /^F$/) ||
> -	($a1 =~ /^X$/ && $b1 =~ /^X$/)) {
> -	return $a cmp $b;
> +    if (($a1 =~ /^[FX]$/ && $b1 =~ /^[FX]$/)) {
> +	return substr($a, 1) cmp substr($b, 1);
>      }
>  
>      if ($a_index < $b_index) {
> 
> 
