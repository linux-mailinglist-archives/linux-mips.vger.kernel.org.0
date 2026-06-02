Return-Path: <linux-mips+bounces-14859-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3KfNCiNSH2pNkQAAu9opvQ
	(envelope-from <linux-mips+bounces-14859-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 23:58:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2763247D
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 23:58:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GJ5oML5+;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14859-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14859-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75119303D4D8
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jun 2026 21:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD24638AC72;
	Tue,  2 Jun 2026 21:53:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A453343886;
	Tue,  2 Jun 2026 21:53:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437190; cv=none; b=QM5DZ5mjOJ9FPi50MCAhbeMHVawp7ZHrVDt7B4jy+VwShO78eG0DJDQNgiC9CwAuaBu96KTdGW67vAiWQQYyfOi7+TTAXu/rfGmtQvNypKjFlGB+SzQmW4bBt+01+6gE5GjX4P7RFZ9yU09TMqDXv/x/UuAmx2R7JDZ7NCcKdW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437190; c=relaxed/simple;
	bh=U2Ci0y5zstQSqkf04hmNdjkbNsyqDpkboO1KnVKRMOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nISWfTEniBNSeBbD+lVkpc8BXuJW2TDuaacxIDmY25WGNiGxjctYr/O3JdZFERCHjx2TG/ChyZvXqlpjWhh+DH44/Ll7xfcCFAjCO3wBuHQMJwwf084YNjbaVerOL3qTQ/WMihWv9ZQK8W/KAt61t6nHz/vOP/UyNhz2e1oxrsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ5oML5+; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780437190; x=1811973190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U2Ci0y5zstQSqkf04hmNdjkbNsyqDpkboO1KnVKRMOs=;
  b=GJ5oML5+Ctf884JcW1blm6+nWVqkMp6/FtaDmKyQ/ybFUyx0PKyeAtEE
   ywaouyI5kVYEalzUFtMG8RsIFr+sdr2pbaJdQXKCNIYvMjqIwq+tOGPJM
   7zSGvPCj5rlvtQIq+4wLFIlC77g2aDXxSs1KJKHZx5kOmMiBnLsnGXcft
   4dXmPtDCR8aQtkb/5vbRellpC+6SL09v3fGXwrx6JUulu+leVpF5ikJjn
   2IlgQN+HVDH/n3Iz+mVyzMVeRopsnZwciC8hkOecW/6iMnBl1JiFU2dWz
   Ba0gfsl4gMkUfnYkVclcALbrIVfucMFAW/EcEwGxUMjFVWnKqbPsebAcG
   g==;
X-CSE-ConnectionGUID: HZtwcMcrQ4SDZe/sWmXtyw==
X-CSE-MsgGUID: PypeyUUwRPOkMvKP6HDmpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81139230"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81139230"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 14:53:09 -0700
X-CSE-ConnectionGUID: YYc13f2oRhu39dVGUvMdoA==
X-CSE-MsgGUID: IznHTBKXQ4W8nlCW1v1K1g==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 14:52:54 -0700
Date: Wed, 3 Jun 2026 00:52:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Subject: Re: [PATCH 22/23] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
Message-ID: <ah9QtExF2rUUTMNo@ashevche-desk.local>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
 <20260521-pdev-fwnode-ref-v1-22-88c324a1b8d2@oss.qualcomm.com>
 <6af284545729f03a60d06479339862a2f08c6b7e.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6af284545729f03a60d06479339862a2f08c6b7e.camel@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14859-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:bartosz.golaszewski@oss.qualcomm.com,m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.
 net,m:b-liu@ti.com,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,linux.intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_GT_50(0.00)[65];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:from_mime,vger.kernel.org:from_smtp,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2A2763247D

On Tue, Jun 02, 2026 at 10:24:41AM +0200, Philipp Zabel wrote:
> On Do, 2026-05-21 at 10:36 +0200, Bartosz Golaszewski wrote:
> > Ahead of reworking the reference counting logic for platform devices,
> > encapsulate the assignment of the OF node from another device for
> > dynamically allocated platform devices with the provided helper.

...

> > -	device_set_of_node_from_dev(&vdev->dev, dev);
> > +	platform_device_set_of_node_from_dev(vdev, dev);

Same Q here, why it uses inherited call? Cargo cult?

'reused' flag is solely pin control (provider!) thingy as far as I remember.

-- 
With Best Regards,
Andy Shevchenko



