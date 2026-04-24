Return-Path: <linux-mips+bounces-14301-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOZlN40m62muJAAAu9opvQ
	(envelope-from <linux-mips+bounces-14301-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:15:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 071FE45B441
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EE993003376
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 08:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B31F386C24;
	Fri, 24 Apr 2026 08:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ3PI9rT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E0386429;
	Fri, 24 Apr 2026 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018507; cv=none; b=pU1pNAIH4RDgDMIsL0heYddoy0L3ah25DaGy9sGq5YW5yVNllVoLRIpXg6OCOgvO6s8vnWg6BkqMJg1/ZM4yy3/TKhIFILbbObUXCoiNqbSlirdSfj5CLOqpftPzb0e4yiQkKln491UbvdOQq1uOxgPq9QOod+HaQ4IBYQzAyOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018507; c=relaxed/simple;
	bh=3qpDOIT/bDaZ2jIE7rp8kP5NY3LTMyGiRGPn1ug71R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrVpS2pHwWpYXFhXrBL/hGTg6nX/mIfAgRFQLNJrDSm0cS021J1BiMZwjHCGgs/d0mPdtor7IOvYUFWpGgpnx3XeQ5YBKoNWK+ecmQcCyPonEqRivuXrBOd9ItElrgMly5siNwLqM8PX3JNRoFr8Jy5g9RAMSvnWYTawbNkT6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ3PI9rT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777018505; x=1808554505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3qpDOIT/bDaZ2jIE7rp8kP5NY3LTMyGiRGPn1ug71R8=;
  b=aJ3PI9rTP6b5RvuueX9qix68quFLO+YWj1RTbNqpKOtD0bOC1Pq4pRnb
   flnecl/0ysL+2ZeiljeAeiKxTsymBUXlrj4SduruU/nL77A18ffMoHY4S
   bXsNyY6dpthgJtJscKFufXfJqde+di4R9DNLXS+ASD0/ZTdapM/9gqVxS
   NX5hT/SaMsbcDnX28zUE8QQajJxTkYd5GM5KFNIixh/KL0NTFTnZVxP5f
   saIAKnux5Qykq2oCRzO695x5BrOoFVzHgtF9L0dxiSCiMAvFC2fGkTXtn
   otrPpDc3OSxN0Zc3ZA7YQoXTWmPV/+J01RKNqlEjIG3DcBXYcDrjnJ5IQ
   w==;
X-CSE-ConnectionGUID: mWw6D8IRRS2hUN5RLG6VqA==
X-CSE-MsgGUID: /GQnpEisR1OjwHkzfazPGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77981962"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77981962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:15:05 -0700
X-CSE-ConnectionGUID: 7xeierehQd64B9XNrKs4Sw==
X-CSE-MsgGUID: nKVMqeb2RSOAg67HHTIAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="228329410"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:15:03 -0700
Date: Fri, 24 Apr 2026 11:15:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felipe Ribeiro de Souza <felipers@ime.usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
	nuno.sa@analog.com, paul@crapouillou.net, linux-iio@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 0/2] use guard()() to handle synchronisation
Message-ID: <aesmhCADsVmJoSgQ@ashevche-desk.local>
References: <20260423012011.41001-1-felipers@ime.usp.br>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423012011.41001-1-felipers@ime.usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 071FE45B441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14301-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]

On Wed, Apr 22, 2026 at 10:18:29PM -0300, Felipe Ribeiro de Souza wrote:
> Refactor ingenic_adc_read_chan_info_raw() and replace mutex_lock()
> and mutex_unlock() calls with guard()() in drivers/iio/adc/ingenic-adc.c

Now LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

One side note in case you want to address it keep my tag for the existing
changes.

-- 
With Best Regards,
Andy Shevchenko



