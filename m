Return-Path: <linux-mips+bounces-14479-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLCIKawH+2mbVQMAu9opvQ
	(envelope-from <linux-mips+bounces-14479-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 11:19:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 460EB4D8819
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 11:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF4983005985
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 09:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD433D3335;
	Wed,  6 May 2026 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1+xgBiD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31563939A4;
	Wed,  6 May 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059177; cv=none; b=IWv2w0EB91+pouN5L2H97Uw5hxWSNNlbqKfVjSewVYp5AwRRM3Zbs8LnXMzpqgY6BdODU4tBoNrUq+IA4DT7NQTn1rlROYDJojj/nuitVotvjsKkie3BVLgzFBuR3q69YM5WofsZIChaZflQOzt8fXj8NOfnVWRQQ4RlKPL7QxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059177; c=relaxed/simple;
	bh=1ArkpAAU2TSJ71WyTkFjXp8NRqUze1bgxPwaYy6D+zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWb3KPwpcKA4xeiqYZ8YMJVSDtozGpylToWxqCx14GBR/Q0b/Ngq95ct8ZUDHwt66nQW0i6VbY0LUUs4K9w5lHsK2Lb38bMsAW7W5N1JwUPFPUWpJlEbsf9eMSr1QypEf/28I0b74jnmfmTuT6mZcjl8t8rrqQwYQGBPoRxISM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1+xgBiD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778059176; x=1809595176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1ArkpAAU2TSJ71WyTkFjXp8NRqUze1bgxPwaYy6D+zw=;
  b=i1+xgBiDHh8IsS6p06Myree7tDR2AGmzJ5lWPI80Wq4RoWCJpYrXUium
   l2fx8Gi+YOkifmo70BOJ3tpzNO+JYidQwRMnNsl89uDUfHZfcmfHCacex
   XMQtBpIytWmLLif/FMvniGq2rrl0IcmSCO+Etmwwo1VO8yRqcQxentLCR
   +pQwdtFH3GUoRTMZC1vI0F0lkwc5zMavdzuxYGQ5j5sq9FvpAqXcEPRe7
   TWFEr3WDkqUEiHut5CnFOWVCMw/lhMonouSQMpKN54diViXf2alpNTe0Y
   Lhm2UK0wPNnprT1jdijU5JTYXhzOvZ8hztCme97MKL4X7xf0kR4UNQC8F
   Q==;
X-CSE-ConnectionGUID: fOqNgW0aSo+NIwN8SSpZFA==
X-CSE-MsgGUID: UnqoEMUaR8qEjdchMTUDKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79091997"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="79091997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:19:35 -0700
X-CSE-ConnectionGUID: Owyl3fGDQ1K81nCaq87e/w==
X-CSE-MsgGUID: NkCt24JaRZ6ebqREYVk8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="233431397"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:19:33 -0700
Date: Wed, 6 May 2026 12:19:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felipe Ribeiro de Souza <felipers@ime.usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
	nuno.sa@analog.com, paul@crapouillou.net,
	Lucas Ivars Cadima Ciziks <lucas@ciziks.com>,
	linux-iio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 3/3] iio: adc: ingenic-adc: use guard()() and
 scoped_guard() to handle synchronisation
Message-ID: <afsHoq_lm9bhZ92r@ashevche-desk.local>
References: <20260506022454.128169-1-felipers@ime.usp.br>
 <20260506022454.128169-4-felipers@ime.usp.br>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506022454.128169-4-felipers@ime.usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 460EB4D8819
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
	TAGGED_FROM(0.00)[bounces-14479-lists,linux-mips=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]

On Tue, May 05, 2026 at 11:24:30PM -0300, Felipe Ribeiro de Souza wrote:
> Replace mutex_lock() and mutex_unlock() calls with guard()() in
> functions ingenic_adc_set_adcmd(), ingenic_adc_set_config(),
> ingenic_adc_enable(), ingenic_adc_capture(), and with scoped_guard()
> in function ingenic_adc_read_chan_info_raw().
> 
> This removes the need to call the unlock function, as the lock is
> automatically released when the function return or the scope exits
> for any other case.

...

>  static void ingenic_adc_set_config(struct ingenic_adc *adc,
>  {
>  	uint32_t cfg;

Side note: We use uXX types in the kernel (you can do a separate change
if you want to).

>  
> -	mutex_lock(&adc->lock);
> +	guard(mutex)(&adc->lock);
>  
>  	cfg = readl(adc->base + JZ_ADC_REG_CFG) & ~mask;
>  	cfg |= val;
>  	writel(cfg, adc->base + JZ_ADC_REG_CFG);

Side note (in case you want another patch): this is not so robust against
arbitrary values. The traditional pattern of custom FIELD_MODIFY() is this

	cfg = readl(adc->base + JZ_ADC_REG_CFG);
	cfg = (cfg & ~mask) | (val & mask);
	writel(cfg, adc->base + JZ_ADC_REG_CFG);

> -	mutex_unlock(&adc->lock);
>  }

-- 
With Best Regards,
Andy Shevchenko



