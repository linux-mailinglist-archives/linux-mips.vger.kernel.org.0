Return-Path: <linux-mips+bounces-14225-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDkXIGB06GlCKgIAu9opvQ
	(envelope-from <linux-mips+bounces-14225-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 09:10:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F9C442C9D
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 09:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C64F4300E3DC
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 07:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC46936C0C3;
	Wed, 22 Apr 2026 07:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAjWEFK7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6D36B07B;
	Wed, 22 Apr 2026 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841750; cv=none; b=Fsri+isfKJ+vhOBOFsq+9AXTFLDrQ7hnCO3luTSa9d0HXx3krzchCTFgqRyCgDIY1MqHbNKm7xm27fQpu6/CrZZSUuWuFHC02C2TZImU1HKQuT61A3R7RGwMwNAE1Q4X6U66sm/qW3ZJ8XRmxP8kqAvAbKsajGH5XlnyAyzUCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841750; c=relaxed/simple;
	bh=Lh8pVmomFkOo4amu9fFZXflKJKs84bSrFxYYo4jSUvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS35DCmLUiWkNiBvL7VpASbZk4JUxYXrrHhC9P9H9us/0lRYr4xaaSHWR6s5iCqCvK95HFWCAQOTMJ7+lg89aIC3vw2+TliOyLKiQMaiLSRrLP49HiHxE9Qv1ZFk9GV6C4lC052F4heC5vI9OtKKkwTC6j56ParCDkQy7Pfyjcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAjWEFK7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776841748; x=1808377748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lh8pVmomFkOo4amu9fFZXflKJKs84bSrFxYYo4jSUvY=;
  b=DAjWEFK79OhPmQCmtyCpRD+xz+iYKLeRUxsn49jLGI9FBJrGLGSHlqcG
   silKH1PM7a3mp8jUQSyygG6EiaYowHQTjSddG5k1y46TA+jfMDAS3L6p9
   1YNB6PLDvmXAMyPW4qE+EeNgOpvkSWgDhlvPRsQMA/5P3xEIXb24YNbty
   EfTY5PV+23jFpus4jdLGMPukU69aEHdF8eYlEizRdbCbF+EnMv6akeeEs
   d7u4u95y3VB6Gp/ScVUR0lPNugYeuG/UUPQbVssbfCIKA0crxItPflYDm
   l855q4hs0KGocZJbMTg7ft8axausbPcSmJMS+7MByAdTCMNYXFXCpVTHn
   Q==;
X-CSE-ConnectionGUID: x/lfibuySdqTS2D0MpNRBg==
X-CSE-MsgGUID: 8eskCpziS2qpLSpdPrrIIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77664709"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77664709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:09:06 -0700
X-CSE-ConnectionGUID: fjM2gdKWR9eNgwZD5Z38eQ==
X-CSE-MsgGUID: LjAD8xsKRN6CT5YLUknGHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="225777795"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:08:59 -0700
Date: Wed, 22 Apr 2026 10:08:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, 3chas3@gmail.com,
	razor@blackwall.org, idosch@nvidia.com, jani.nikula@intel.com,
	mchehab+huawei@kernel.org, tytso@mit.edu,
	herbert@gondor.apana.org.au, geert@linux-m68k.org,
	ebiggers@kernel.org, johannes.berg@intel.com,
	jonathan.cameron@huawei.com, kees@kernel.org, kuniyu@google.com,
	fourier.thomas@gmail.com, rdunlap@infradead.org,
	akpm@linux-foundation.org, linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	bridge@lists.linux.dev, dwmw2@infradead.org
Subject: Re: [PATCH net-deletions v2] net: remove unused ATM protocols and
 legacy ATM device drivers
Message-ID: <aeh0CV3UQw1quCXv@ashevche-desk.local>
References: <20260422041846.2035118-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422041846.2035118-1-kuba@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,blackwall.org,nvidia.com,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,huawei.com,infradead.org,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-14225-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3F9C442C9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 09:18:44PM -0700, Jakub Kicinski wrote:
> Remove the ATM protocol modules and PCI/SBUS ATM device drivers
> that are no longer in active use.
> 
> The ATM core protocol stack, PPPoATM, BR2684, and USB DSL modem
> drivers (drivers/usb/atm/) are retained in-tree to maintain PPP
> over ATM (PPPoA) and PPPoE-over-BR2684 support for DSL connections.
> 
> Removed ATM protocol modules:
>  - net/atm/clip.c - Classical IP over ATM (RFC 2225)
>  - net/atm/lec.c - LAN Emulation Client (LANE)
>  - net/atm/mpc.c, mpoa_caches.c, mpoa_proc.c - Multi-Protocol Over ATM
> 
> Removed PCI/SBUS ATM device drivers (drivers/atm/):
>  - adummy, atmtcp - software/testing ATM devices
>  - eni - Efficient Networks ENI155P (OC-3, ~1995)
>  - fore200e - FORE Systems 200E PCI/SBUS (OC-3, ~1999)
>  - he - ForeRunner HE (OC-3/OC-12, ~2000)
>  - idt77105 - IDT 77105 25 Mbps ATM PHY
>  - idt77252 - IDT 77252 NICStAR II (OC-3, ~2000)
>  - iphase - Interphase ATM PCI (OC-3/DS3/E3)
>  - lanai - Efficient Networks Speedstream 3010
>  - nicstar - IDT 77201 NICStAR (155/25 Mbps, ~1999)
>  - solos-pci - Traverse Technologies ADSL2+ PCI
>  - suni - PMC S/UNI SONET PHY library
> 
> Also clean up references in:
>  - net/bridge/ - remove ATM LANE hook (br_fdb_test_addr_hook,
>    br_fdb_test_addr)
>  - net/core/dev.c - remove br_fdb_test_addr_hook export
>  - defconfig files - remove ATM driver config options
> 
> The removed code is moved to an out-of-tree module package (mod-orphan).
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2:
>  - keep BR2684
>  - correct the claim that Traverse Technologies is defunct,
>    I'm still deleting the solos driver, chances are nobody uses it.
>    Easy enough to revert back in since core is still around.
>    The guiding principle is to keep USB modems and delete
>    the rest as USB ADSL2+ CPEs were most popular historically.
> v1: https://lore.kernel.org/20260421021943.1295109-1-kuba@kernel.org
> 
> CC: corbet@lwn.net
> CC: skhan@linuxfoundation.org
> CC: linux@armlinux.org.uk
> CC: tsbogend@alpha.franken.de
> CC: maddy@linux.ibm.com
> CC: mpe@ellerman.id.au
> CC: npiggin@gmail.com
> CC: chleroy@kernel.org
> CC: 3chas3@gmail.com
> CC: razor@blackwall.org
> CC: idosch@nvidia.com
> CC: jani.nikula@intel.com
> CC: mchehab+huawei@kernel.org
> CC: tytso@mit.edu
> CC: herbert@gondor.apana.org.au
> CC: geert@linux-m68k.org
> CC: ebiggers@kernel.org
> CC: johannes.berg@intel.com
> CC: jonathan.cameron@huawei.com
> CC: kees@kernel.org
> CC: kuniyu@google.com
> CC: fourier.thomas@gmail.com
> CC: andriy.shevchenko@intel.com
> CC: rdunlap@infradead.org
> CC: akpm@linux-foundation.org
> CC: linux-doc@vger.kernel.org
> CC: linux-mips@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> CC: bridge@lists.linux.dev
> CC: dwmw2@infradead.org
> CC: herbert@gondor.apana.org.au

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

P.S.
Since it's almost removal and it will go via netdev tree (same tree you are
maintaining, I suppose) the -D would have a big help to review the changes
(and not see removals at all, as 32k lines of one email is too much).

-- 
With Best Regards,
Andy Shevchenko



