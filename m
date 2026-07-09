Return-Path: <linux-mips+bounces-15676-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bZsLF6VPT2q4eAIAu9opvQ
	(envelope-from <linux-mips+bounces-15676-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:37:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7A472DD05
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:37:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="Nizz2/0P";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15676-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15676-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C83930EAD89
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 07:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F323E6DC6;
	Thu,  9 Jul 2026 07:31:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DCB3E3148;
	Thu,  9 Jul 2026 07:31:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582283; cv=none; b=SevxZGuHBOYh/ccKvj2zokNAEqfS7z37QL6lIWo/uylzyzldFkB+lKjOv9Bdvg5u8/a42vwPkx55nk7T1KADjplEQiJ6aY2ANSuN9qcOJArwC0PKU6kQU6ehQDaTKwTkm4KgjD4ugDXEq+s7v7jUmJM/mgOeZL3HRfSaNRVzZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582283; c=relaxed/simple;
	bh=cjMXLnfC6g6dIxN+DHVrz3kfjIpPNwD3v2Vrk7OqkFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/yGN6Syq9hqIwT7Iwfl9Z8RaC67OancZQzmCXD16KEddaEKXrz6k2bReMxTq4bjCYTlGOfYSRtbODn/seXomFKkfh5WIPVXLA6uO2/Hn6/kJAYB/0Em9IVkJ+8Dm7lKDmwDYt/A5SDoQU+EhB05ND4zc1Q3uS9zCx6aLmk3c9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nizz2/0P; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783582281; x=1815118281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cjMXLnfC6g6dIxN+DHVrz3kfjIpPNwD3v2Vrk7OqkFQ=;
  b=Nizz2/0PBf3aedaBgxqwxsdMNU/2Y9Q05O+R52Br3rQBYKvmbtSocW70
   9cZu0wpDGGChdypm5AulaLyy8ku5Y+ohPZIMqMmjw6tMXZMnNy3aPMuln
   xgee1C6ugz5wnHaGb0gP9I5249hRYZeicOaMXmv+Ndny0PXs6u3mVZv80
   MPXZzarvIm9xMChRKtXbfUT3P5Z4e83jB8nCWMIZw7u73U14QVo9Y1yn5
   dPuIrLeJ65NqFjsILJEIHtbYWMmVPcduYrtZq4oLYYlUnN0iR46UHDZzO
   knJeNlKJUeTfd/nYr1Oi658QsuoGRudV/pd14/UlT+l30axtf7+8QVqc2
   w==;
X-CSE-ConnectionGUID: 7rpYzFpFReiPt5X/igFexQ==
X-CSE-MsgGUID: bEiFxh60QzOOWr5yzr7Zfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84356458"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84356458"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:31:18 -0700
X-CSE-ConnectionGUID: l77jRguWS0KUZDhOEz0AwA==
X-CSE-MsgGUID: c8A8Itj8SOiqwX6JveJBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277729305"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:31:10 -0700
Date: Thu, 9 Jul 2026 10:31:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Tony Lindgren <tony@atomide.com>,
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
Message-ID: <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15676-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,
 m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,intel.com:dkim,uart_ops.pm:url,ashevche-desk.local:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bitbucket.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB7A472DD05

On Thu, Jul 09, 2026 at 11:55:12AM +0530, Praveen Talari wrote:
> The uart_ops.pm callback has been declared void since its introduction,
> which means any error from a driver's power management implementation is
> silently discarded by uart_change_pm(). Beyond losing the error
> information, uart_change_pm() unconditionally updates state->pm_state
> even when the underlying hardware transition failed. This causes the
> serial core to track a power state that does not reflect reality:
> subsequent calls to uart_change_pm() see the stale cached state as
> matching the requested state and skip the callback entirely, leaving the
> hardware permanently stuck with no further recovery attempt.
> 
> On modern platforms where the .pm callback performs real work —
> enabling clock trees, interacting with runtime PM, asserting voltage
> regulators — this is a correctness gap. Failures are invisible to the
> PM framework, the port proceeds to call ops->startup() on potentially
> unpowered hardware, and suspend/resume errors are hidden from the core
> that needs to handle them.
> 
> This series fixes the problem in four steps:
> 
>   Patch 1 changes the uart_ops.pm callback signature from void to int,
>   updates uart_change_pm() to propagate errors and only commit
>   state->pm_state on success, and handles the return value at every
>   call site in serial_core.c with appropriate policy per context
>   (propagate, log, or skip-on-failure).
> 
>   Patch 2 updates the 8250 driver family: serial8250_do_pm() and
>   serial8250_pm() are updated to return int (with the exported symbol
>   declaration updated in serial_8250.h), and the 8250 sub-driver
>   pm callbacks are updated to return 0.
> 
>   Patch 3 updates the remaining non-8250 serial drivers. All .pm
>   implementations are updated to return 0. The sh-sci forward
>   declaration shared with rsci is also updated.
> 
>   Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
>   OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
>   MIPS/Alchemy (alchemy_8250_pm).
> 
> All existing .pm implementations return 0, so there is no functional
> change for any current driver. The series purely adds the infrastructure
> for drivers to report errors going forward, with the serial core ready
> to handle them correctly.

Just no, please just properly implement runtime PM. The .pm() must die completely.
I used to have the PoC for that long time ago [1], but due to lack of time and
other priorities it went abandoned. Also Atlassian made a brain damages move to
limit repository to 1Gb, so I haven't able to update it for a few years.

Note, that Tony (you have him in the Cc list) did a lot for some corner cases
with that and we still have them IIRC. Tony, do you know what is the state of
affairs with runtime PM for UART?

[1]: https://bitbucket.org/andy-shev/linux/branch/topic/uart/rpm-plus

-- 
With Best Regards,
Andy Shevchenko



