Return-Path: <linux-mips+bounces-14480-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKmfLEkI+2mbVQMAu9opvQ
	(envelope-from <linux-mips+bounces-14480-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 11:22:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8814D88A5
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 372853002506
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 09:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB84E3DE455;
	Wed,  6 May 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/u0lYev"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC13DFC89;
	Wed,  6 May 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059240; cv=none; b=speausJmQG8Zxrhe3iEc059YvK3pZLLHrw9Zs6WMmzxYIKJc7Md88g1o8ladEyBn2geseElPiuMyQtyGaekEoAbnAz+Cv+rucsdjv9GBDBWsmeeLK0povGhky6orbLgDNyeEGZNRaLSc70Xphp/01zZyRZCghvKkalNDQm5S7BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059240; c=relaxed/simple;
	bh=2nmYkzEgFyquvOY/UOpIGlL98F95H2psHwqqIQ97t5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqy+WP8FUJVsqyYwkl3Z1oJB5tEiyN+bGR4a0YnKU/7iz3QGqoj8U/0aqUmBZPPUkfgvp3RTyIyrZuLlcOQ1zXpOZDCNwXrKnRO2B0/WuHoOK4cDz+EtZNwF0eBfvZ3X0gkscIVwTHtQEly2k4UN1acwB1agDGvAEuwo/2vSHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/u0lYev; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778059240; x=1809595240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2nmYkzEgFyquvOY/UOpIGlL98F95H2psHwqqIQ97t5k=;
  b=I/u0lYevI+5J7b3KDggGemglohn+PalwlEPrAJxC1TgxFFUBoT22ZTLW
   a9cSL+zn+T0HfNw7E/RG5OdEf2P/nbOLMnnnRVEY19FOwDPwjEStTo+xa
   giXmnKb8xGWJSw2hfJZWulYYdBl5eRySroNh6htU7OtyByN2k9QLYJx7f
   HPzM0iZ5Elwy59VE1FZHFcKHw8gjImWKJr4Qla4AhdnJDKs/2QqMIi4Pp
   ozl3swpVY2SfIG+gfyemf8I/IXU9zy+spcsL9FheMe2U2pBUDeajq3CrJ
   HkQgxUaJJYUD8Ae6cR7SMk6y5AlAIYWtjeJzcMSnJtieaFwaWur1kWuZ+
   Q==;
X-CSE-ConnectionGUID: VTGQQfsfTeGSewOy2/H+Ag==
X-CSE-MsgGUID: Q8JRS0KtSYax3M8U7xCPfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78698713"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78698713"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:20:32 -0700
X-CSE-ConnectionGUID: jZl8wJHNQmOEETf/0QqN3g==
X-CSE-MsgGUID: xagBFZ7kQsinAS8XrxaKNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="235079258"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:20:30 -0700
Date: Wed, 6 May 2026 12:20:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felipe Ribeiro de Souza <felipers@ime.usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
	nuno.sa@analog.com, paul@crapouillou.net, linux-iio@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 0/3] iio: adc: ingenic-adc: use guard()() to handle
 synchronisation and refactor lock-held helpers
Message-ID: <afsH24xuP1GF9jYz@ashevche-desk.local>
References: <20260506022454.128169-1-felipers@ime.usp.br>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506022454.128169-1-felipers@ime.usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: AA8814D88A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14480-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid]

On Tue, May 05, 2026 at 11:24:27PM -0300, Felipe Ribeiro de Souza wrote:
> In drivers/iio/adc/ingenic-adc.c:
> - Refactor ingenic_adc_read_chan_info_raw() and ingenic_adc_enable_unlocked()
> - Replace mutex_lock() and mutex_unlock() calls with guard()()

This version LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

In case you want to cook more cleanups, I provided a couple of side notes.

-- 
With Best Regards,
Andy Shevchenko



