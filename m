Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DF71D7560
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 12:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgERKlZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 06:41:25 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:43030 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbgERKlZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 May 2020 06:41:25 -0400
Received: from 89-64-86-21.dynamic.chello.pl (89.64.86.21) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.415)
 id 850b1f41962055eb; Mon, 18 May 2020 12:41:21 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Yue Hu <huyue2@yulong.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/20] cpufreq: Return zero on success in boost sw setting
Date:   Mon, 18 May 2020 12:41:19 +0200
Message-ID: <5284478.EF2IWm2iUs@kreacher>
In-Reply-To: <20200518103102.t3a3g4uxeeuwsnix@mobilestation>
References: <20200306124807.3596F80307C2@mail.baikalelectronics.ru> <20200518102415.k4c5qglodij5ac6h@vireshk-i7> <20200518103102.t3a3g4uxeeuwsnix@mobilestation>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Monday, May 18, 2020 12:31:02 PM CEST Serge Semin wrote:
> On Mon, May 18, 2020 at 03:54:15PM +0530, Viresh Kumar wrote:
> > On 18-05-20, 12:22, Rafael J. Wysocki wrote:
> > > On Monday, May 18, 2020 12:11:09 PM CEST Viresh Kumar wrote:
> > > > On 18-05-20, 11:53, Rafael J. Wysocki wrote:
> > > > > That said if you really only want it to return 0 on success, you may as well
> > > > > add a ret = 0; statement (with a comment explaining why it is needed) after
> > > > > the last break in the loop.
> > > > 
> > > > That can be done as well, but will be a bit less efficient as the loop
> > > > will execute once for each policy, and so the statement will run
> > > > multiple times. Though it isn't going to add any significant latency
> > > > in the code.
> > > 
> > > Right.
> > > 
> > > However, the logic in this entire function looks somewhat less than
> > > straightforward to me, because it looks like it should return an
> > > error on the first policy without a frequency table (having a frequency
> > > table depends on the driver and that is the same for all policies, so it
> > > is pointless to iterate any further in that case).
> > > 
> > > Also, the error should not be -EINVAL, because that means "invalid
> > > argument" which would be the state value.
> > > 
> > > So I would do something like this:
> > > 
> > > ---
> > >  drivers/cpufreq/cpufreq.c |   11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > Index: linux-pm/drivers/cpufreq/cpufreq.c
> > > ===================================================================
> > > --- linux-pm.orig/drivers/cpufreq/cpufreq.c
> > > +++ linux-pm/drivers/cpufreq/cpufreq.c
> > > @@ -2535,26 +2535,27 @@ EXPORT_SYMBOL_GPL(cpufreq_update_limits)
> > >  static int cpufreq_boost_set_sw(int state)
> > >  {
> > >  	struct cpufreq_policy *policy;
> > > -	int ret = -EINVAL;
> > >  
> > >  	for_each_active_policy(policy) {
> > > +		int ret;
> > > +
> > >  		if (!policy->freq_table)
> > > -			continue;
> > > +			return -ENXIO;
> > >  
> > >  		ret = cpufreq_frequency_table_cpuinfo(policy,
> > >  						      policy->freq_table);
> > >  		if (ret) {
> > >  			pr_err("%s: Policy frequency update failed\n",
> > >  			       __func__);
> > > -			break;
> > > +			return ret;
> > >  		}
> > >  
> > >  		ret = freq_qos_update_request(policy->max_freq_req, policy->max);
> > >  		if (ret < 0)
> > > -			break;
> > > +			return ret;
> > >  	}
> > >  
> > > -	return ret;
> > > +	return 0;
> > >  }
> > >  
> > >  int cpufreq_boost_trigger_state(int state)
> > 
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Ok. Thanks for the comments. Shall I resend the patch with update Rafael
> suggests or you'll merge the Rafael's fix in yourself?

I'll apply the fix directly, thanks!



