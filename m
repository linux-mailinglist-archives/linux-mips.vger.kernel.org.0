Return-Path: <linux-mips+bounces-15105-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WsZYHEEaMWqlbgUAu9opvQ
	(envelope-from <linux-mips+bounces-15105-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 11:41:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6898468DA29
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 11:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fh6curBK;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15105-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15105-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F5AF300291B
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 09:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18BF3B5846;
	Tue, 16 Jun 2026 09:41:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2A535F180;
	Tue, 16 Jun 2026 09:41:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602875; cv=none; b=CpM0mFu7VHWbDvtYx09CXrH7J3JFbjs3nxdBV2kCfjtj80VA0qt9bu5VOZz9L/kwhaDwWC4rpoCBH3+YYHxbX4iELAS+4ZG4FQ6vQ4fhDHICd01kLISHOxd9UiRc57TOykpHdJrDE89J67b7CnZ0+dFtOnyPhTB4H5xmT9Ab7dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602875; c=relaxed/simple;
	bh=6rB2N++QnF7JTGORtVke61SAOuu1kszVTJ+rWarYgM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxxB1sCFCDuAgwJ0e8omFuPMAac8y7fcqSrgwUcvfyAtU7prSUhWClpjs/IN5cZNdSNgyO2Yrr9LXhrTkDWCvbUa/F7e3sFnAn+aqjTDYeNgugAVl/du6CYYnzwTfUg+w6ep3DLfaScPjMGOcgbnwuhx7vHcA3WqPn0ZhXhoY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fh6curBK; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781602874; x=1813138874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6rB2N++QnF7JTGORtVke61SAOuu1kszVTJ+rWarYgM8=;
  b=fh6curBKt3may/lCi//rvXkItEBagXFKYnE8NKobO8mkHNPvem5TjlP9
   LzhI7KszzeSYX8wWrV8Cy4jWTw8J3alD4S/9U9yC3zBSGLW5xEKre5tve
   +uG4meGAYqUN+t6fiJ8ybzYwNXTE7MnhUZHTLj2acvrX/ap/czQvCuOx0
   He49CRBOX4EsoaZJQPpct9zvPraICluc0ZRswjSfBChyBsQjhs14guwBM
   m+qgsD3w2A1EBr1tzx0e0tHudbkSWQeAqMCoyH+/Q4s5amd58kT+WXcR/
   hwZcIwpuMUmQmExkmNj/O/WV2XpjP8sK5ETzBxf/S5u1IaRJPR1dYqi/E
   g==;
X-CSE-ConnectionGUID: e4lZJbE4RriJdz/gCOg/AA==
X-CSE-MsgGUID: V5d9FVsxTqiDyMFnyAa1mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69908006"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="69908006"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:41:13 -0700
X-CSE-ConnectionGUID: pkkOvgdVRce1ymYq3o7KMQ==
X-CSE-MsgGUID: oY5xBo2hRTuZOA251fu1yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="251644854"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 16 Jun 2026 02:41:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id AD51695; Tue, 16 Jun 2026 11:41:08 +0200 (CEST)
Date: Tue, 16 Jun 2026 11:41:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Peter Chen <peter.chen@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 08/23] driver core: platform: provide
 platform_device_set_of_node_from_dev()
Message-ID: <ajEaNFhntZTS-w3e@black.igk.intel.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
 <20260521-pdev-fwnode-ref-v1-8-88c324a1b8d2@oss.qualcomm.com>
 <ah9O15bMlAYgSlHx@ashevche-desk.local>
 <aiK-EXwp_xhcbty9@hovoldconsulting.com>
 <aiLi0KZskrCyEYO5@ashevche-desk.local>
 <aiZpJkQBXg2pcczy@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiZpJkQBXg2pcczy@hovoldconsulting.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15105-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,linux.intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:
 b-liu@ti.com,m:p.zabel@pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[66];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6898468DA29

On Mon, Jun 08, 2026 at 09:03:02AM +0200, Johan Hovold wrote:
> On Fri, Jun 05, 2026 at 05:53:04PM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 05, 2026 at 02:16:17PM +0200, Johan Hovold wrote:
> > > On Wed, Jun 03, 2026 at 12:44:55AM +0300, Andy Shevchenko wrote:
> > > > On Thu, May 21, 2026 at 10:36:31AM +0200, Bartosz Golaszewski wrote:
> > > > > Provide a platform-specific variant of device_set_of_node_from_dev(). In
> > > > > addition to bumping the reference count of the OF node being assigned,
> > > > > it also assigns the fwnode of the platform device.
> > > > 
> > > > Can we rather investigate the way how to make that of node reuse thingy
> > > > (which is used solely by pin control) differently and then drop this confusing
> > > > device_set_of_node_from_dev() call altogether?
> > > 
> > > No, that call is needed. See commit 4e75e1d7dac9 ("driver core: add
> > > helper to reuse a device-tree node") for details.
> > 
> > Bart fixes the problem with the platform driver. At the result this will be
> > the only device_set_node() + 'reused = true'.  As for 'reused' flag, the need
> > is only for pinmux/pin control stuff.
> 
> And any other resource which may (eventually) be claimed by driver core
> or bus code.
> 
> > The question here is if there is a better
> > way to make that 'reused' be done automatically without need of setting some
> > flag explicitly.
> 
> That's not really relevant to the series at hand.

It's not, but it's relevant in a long-term for understanding how we can get
this done in a better way.

> If this is something we want to merge then you need to continue setting
> the flag in order not to cause regressions.

Yes, that's how it's now.

-- 
With Best Regards,
Andy Shevchenko



