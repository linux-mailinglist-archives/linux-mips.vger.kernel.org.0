Return-Path: <linux-mips+bounces-15876-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 42QNC2bIVWoXtAAAu9opvQ
	(envelope-from <linux-mips+bounces-15876-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 07:25:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F57511E4
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 07:25:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=R4QERsU8;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15876-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15876-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 427DC300139C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 05:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA51327BFA;
	Tue, 14 Jul 2026 05:25:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7539320CD3;
	Tue, 14 Jul 2026 05:25:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006752; cv=none; b=ZsdaBOqxziHjj3G8lc5Jm/zdmhYR6ayFWvYrd7v1cNY3/0mz7CDDmg1k8ARttkASCK4+tCBtoJyo9CD+Fa5gtF2NWGbe5yhaXgVuCxd56WqW1HBDowRtPKLvf/D6Su51FIfq+cinIgKag9nRj+8+W6EXNPHjLHdIL/c2rxWaNE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006752; c=relaxed/simple;
	bh=nvUp6ixQ/4WO1OpQur/BaHDEnmJshINP5l4vlNHwZLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1ArbopyttnJ6Ly3ecIHSD4RE1DQ1mk216QJZo20YKraBnyS0we+FB4xKcu5/fsZWgWrLBekds7Ln2CTDo55UCx9qvP+lG2KOeKmjdnnfzVepUlpaWeiLfJxzkHTT1gtDBkxWzofRq3t/iDg+hGPvzt2ehhmAsStcQvU3schr0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4QERsU8; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784006750; x=1815542750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nvUp6ixQ/4WO1OpQur/BaHDEnmJshINP5l4vlNHwZLQ=;
  b=R4QERsU8RS0GjehHw65G9hMQISGMMXokVI4xaMMSs+bOu9blneZkwnd6
   QNmnoujEGVfkWnB8P4azE3YuxkHgmiQaqdIKPPC+/yntrdKiQ/qu4AJDn
   y1WHUr0pekFjz0MzMtBf+fFxEWNcbPj03PVGoHcSDGALkVQ8AofMev/C+
   W+d7bfCzZo9ary/yp82+PeJXpkMjkf86la1/3alb0xl0VwceUvzAOaEwB
   FcFbnSjW4AZqWxU5a4Z4o6Mdu4Z/5GbISn56zMFBFCpdglX7ojsWKG/Gd
   ddpk41P0ipGOceLPeJMScfSSypXynLSp3MxJhlwk0+mBpcJ8S1y1Bki0Y
   g==;
X-CSE-ConnectionGUID: 8abq/H3/RguevLrjiOw64Q==
X-CSE-MsgGUID: w6gzDah7T9mHmJ2ILezqrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84583596"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84583596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:25:48 -0700
X-CSE-ConnectionGUID: b7VVUikhRGC8aHkOs9IFiw==
X-CSE-MsgGUID: Jy/VK4toSbSQTUtrikKzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="280169706"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.248])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:25:36 -0700
Date: Tue, 14 Jul 2026 08:25:32 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-mips@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Message-ID: <alXITHzkv4TlvwcT@tlindgre-MOBL1>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
 <20260710043746.GM30058@atomide.com>
 <alSv8BPCOiyKvOI2@tlindgre-MOBL1>
 <alTKNEk97jkVGfML@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTKNEk97jkVGfML@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15876-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:tony@atomide.com,m:praveen.talari@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,
 m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tony.lindgren@linux.intel.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tony.lindgren@linux.intel.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[atomide.com,oss.qualcomm.com,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,armlinux.org.uk,alpha.franken.de,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 249F57511E4

On Mon, Jul 13, 2026 at 02:21:24PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 13, 2026 at 12:29:20PM +0300, Tony Lindgren wrote:
> > On Fri, Jul 10, 2026 at 07:37:46AM +0300, Tony Lindgren wrote:
> > > * Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> > > > Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> > > > with that and we still have them IIRC. Tony, do you know what is the state of
> > > > affairs with runtime PM for UART?
> > > 
> > > The RX side of things should work for hardware that can wake up to an incoming
> > > event. Linux for sure needs more work to properly handle the various corner case
> > > TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
> > > will check my notes for more details next week.
> > 
> > For the TX side handling, my understanding is that at least uart_update_mctrl()
> > needs to call PM runtime resume and put autosuspend. And we should assume
> > uart_update_mctrl() can sleep to resume the PM runtime suspended serial port.
> > 
> > For drivers, the callers of uport->ops->get/set_mctrl() should be updated
> > to use uart_update_mctrl() where possible. And the remaining ones that cannot
> > sleep should be fixed so they can sleep or have PM runtime disabled.
> > 
> > Anybody have better ideas?
> 
> I don't, but the above sounds like a plan. Is it a big task? I can help with
> something in that area, perhaps Ilpo also would be able to participate.

Not sure how much changes are involved. Maybe it's safer to set up a
runtime PM enabled wrapper for uart_update_mctrl() and then start updating
the uart_update_mctrl() and get/set_mctrl() callers one at a time to make
them runtime PM aware.

