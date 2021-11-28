Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E150C4607F3
	for <lists+linux-mips@lfdr.de>; Sun, 28 Nov 2021 18:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347150AbhK1RVl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Nov 2021 12:21:41 -0500
Received: from smtprelay0209.hostedemail.com ([216.40.44.209]:52266 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236142AbhK1RTl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 28 Nov 2021 12:19:41 -0500
X-Greylist: delayed 460 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Nov 2021 12:19:40 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 862BB182D5121;
        Sun, 28 Nov 2021 17:10:46 +0000 (UTC)
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id D5832182CED2A;
        Sun, 28 Nov 2021 17:08:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 5EF1EA00041C;
        Sun, 28 Nov 2021 17:07:48 +0000 (UTC)
Message-ID: <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
From:   Joe Perches <joe@perches.com>
To:     Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Alexey Klimov <aklimov@redhat.com>,
        Amitkumar Karwar <amitkarwar@gmail.com>,
        Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Gross <agross@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Anup Patel <anup.patel@wdc.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Christoph Lameter <cl@linux.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        David Laight <David.Laight@ACULAB.COM>,
        Dennis Zhou <dennis@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geetha sowjanya <gakula@marvell.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guo Ren <guoren@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Ian Rogers <irogers@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Wessel <jason.wessel@windriver.com>,
        Jens Axboe <axboe@fb.com>, Jiri Olsa <jolsa@redhat.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <maz@kernel.org>, Marcin Wojtas <mw@semihalf.com>,
        Mark Gross <markgross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Solomon Peachy <pizza@shaftnet.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Sunil Goutham <sgoutham@marvell.com>,
        Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Date:   Sun, 28 Nov 2021 09:07:52 -0800
In-Reply-To: <20211128035704.270739-8-yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
         <20211128035704.270739-8-yury.norov@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Stat-Signature: umd6ft7bscstit6mcsb41shstont4bff
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 5EF1EA00041C
X-Spam-Status: No, score=1.60
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+NoJl8n1YyBqeqY0nk94+uRiGfczHPVi8=
X-HE-Tag: 1638119268-113142
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> with one of new functions where appropriate. This allows num_*_cpus_*()
> to return earlier depending on the condition.
[]
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
[]
> @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	 * if platform didn't set the present map already, do it now
>  	 * boot cpu is set to present already by init/main.c
>  	 */
> -	if (num_present_cpus() <= 1)
> +	if (num_present_cpus_le(2))
>  		init_cpu_present(cpu_possible_mask);

?  is this supposed to be 2 or 1

> diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
[]
> @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
>  		return ret;
>  	}
>  
> -	if (num_present_cpus() > 4) {
> +	if (num_present_cpus_gt(4)) {
>  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
>  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
>  		       __func__);

It looks as if the present variants should be using the same values
so the _le test above with 1 changed to 2 looks odd.


